Return-Path: <linux-arm-msm+bounces-4801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF0813884
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA3B28326A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBC265ED3;
	Thu, 14 Dec 2023 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSEj/glB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D103C46A;
	Thu, 14 Dec 2023 17:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9B0C433C9;
	Thu, 14 Dec 2023 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702574930;
	bh=P8WIww2274+m+ez0eGWOb23W8iwkilWxoapMNkXmSoI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XSEj/glB2zBkw6SiLPvUtM7upEYS6XnUikmteJZhAXnZflzbW9uW2qbKlLuj8JaR3
	 UhCXpC+lFeRGOw1IH9McsmcQIHs88KaO0Zm++1VMWO0glWqQbsdtsF9It0QV/TVoeK
	 tizuaDJFXwxG+GqeCFsx5zJVqjTyuJt7syIyQXYW+tgvVRDUw022BVmN4duObs3PK0
	 gx3rV4ogqff+iZhJ3WSTWwtSNdqoH8GuBE9oNeW9qYcb7dHFDqtBzlcgFPhTQOu9um
	 BUFF59MaswASLf/oCfWgvWtd1L4cH6+ERTkVa6W5wGNh642111BGBanJ0MsJQLXH4g
	 QX8Sj6bAewScw==
Date: Thu, 14 Dec 2023 11:28:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Johan Hovold <johan+linaro@kernel.org>,
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
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 1/6] PCI/ASPM: Add locked helper for enabling link
 state
Message-ID: <20231214172848.GA1095194@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb42db34f456c3a157cc574893fd73d877b85b75.camel@linux.intel.com>

On Wed, Dec 13, 2023 at 03:39:24PM -0800, David E. Box wrote:
> On Wed, 2023-12-13 at 14:45 -0600, Bjorn Helgaas wrote:
> ...

> > I'd be shocked if Windows treated the BIOS config as a "do not exceed
> > this" situation, so my secret hope is that some of these "broken"
> > devices are really caused by defects in the Linux ASPM support or the
> > driver, and that we can fix them if we find out about them.
> > 
> > But I have no details about any of these alleged broken devices, so
> > it's hard to make progress on them.  
> 
> I don't have a sense of the scope either. But I could see BIOS not
> enabling features that would provide no added power savings benefit.
> We use ASPM to manage package power. There are Intel devices that
> certainly don't require L1SS for the SoC to achieve the deepest
> power savings. L1 alone is fine for them. I don't know what the test
> coverage is for unenabled features. I've sent these questions to
> our BIOS folks.

Once upon a time there was a push to make it so firmware only had to
enumerate boot and console devices and it could skip enumeration and
configuration of other devices.  But I don't think we've made much
progress on that, at least for x86, possibly because Linux depends so
much on BIOS resource assignment.  IMO that's a Linux deficiency.

Bjorn

