Return-Path: <linux-arm-msm+bounces-1105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BA7F0D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98401C21163
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1446FF519;
	Mon, 20 Nov 2023 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMmOiQtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA010F4EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 08:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCF3C433C7;
	Mon, 20 Nov 2023 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700469231;
	bh=tU2UJjlqk1vQaTQxeEVyYUCg/68DHf+RHTSnEAzmp30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMmOiQtDqsyX2qx/w3rA46nOXMSMvnjqG5phU3YtYOZ2YLebRcqXPID1lN4qDQS8l
	 R2ReKsdlGBapdPH9C9PkhLilqBqGhz2cH2A9xEDMak0zXCKfvTZVBKL99Fr4myfZdc
	 U2YzIdwsHsanLy+Cqj0lPDUngTA0izxoHjfRB/HX/eGM2JA+vStGuD5ZwwPB+o2wKT
	 91qx+9oUL8M6mae8O7nODkHTS1UWhGM/zKVw7GxldU4ZgR9IxENyiXkP8eIRtZ61HM
	 q7lj2lHs0s5iP7APHfq80VV6nHfvh9jdq5revRID+DVb1GC8ODnqedpC4pHrKRuDxZ
	 ryr8KSdsohzrw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r4zjD-0008NN-2v;
	Mon, 20 Nov 2023 09:33:59 +0100
Date: Mon, 20 Nov 2023 09:33:59 +0100
From: Johan Hovold <johan@kernel.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] PCI/ASPM: Add locked helper for enabling link state
Message-ID: <ZVsZ9-v3r-GPfFhF@hovoldconsulting.com>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-2-johan+linaro@kernel.org>
 <f2d1476199e974dd1d303b22c25594f066e85de5.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2d1476199e974dd1d303b22c25594f066e85de5.camel@linux.intel.com>

On Fri, Nov 17, 2023 at 04:00:46PM -0800, David E. Box wrote:
> On Tue, 2023-11-14 at 14:55 +0100, Johan Hovold wrote:
> > Add a helper for enabling link states that can be used in contexts where
> > a pci_bus_sem read lock is already held (e.g. from pci_walk_bus()).
> > 
> > This helper will be used to fix a couple of potential deadlocks where
> > the current helper is called with the lock already held, hence the CC
> > stable tag.

> This solution is similar to the original one I proposed [1]. It just creates a
> separate locked function rather than using a flag. While the API is consistent
> with pci_disable_link_state_locked(), its usage is not. The vmd driver calls
> pci_enable_link_state() from pci_walk_bus() which was problematic for Bjorn [2].
> I owed an attempt to implement this as a fixup. However, now
> qcom_pcie_enabled_aspm() is also using it from pci_walk_bus(). The fixup could
> make sense for VMD since there it's fixing missing BIOS settings, but I'm not
> sure about qcom. Bjorn, do you still see issues with the use in pci_bus_walk()?

We need this for Qualcomm platforms where the boot firmware does not
enable ASPM, and the hotplug inconsistency was also discussed with Bjorn
here:

	https://lore.kernel.org/linux-pci/20231018164731.GA1365588@bhelgaas/

> [1]
> https://lore.kernel.org/lkml/20230321233849.3408339-1-david.e.box@linux.intel.com/
> 
> [2] https://lore.kernel.org/lkml/20230322205702.GA2493123@bhelgaas/

Johan

