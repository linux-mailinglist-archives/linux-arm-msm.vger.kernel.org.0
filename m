Return-Path: <linux-arm-msm+bounces-913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE097EF045
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC7A1C20318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A7A18E28;
	Fri, 17 Nov 2023 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsgrErCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F718AFB;
	Fri, 17 Nov 2023 10:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C94C433C8;
	Fri, 17 Nov 2023 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700216853;
	bh=ji1627U40qRm86ia0liZUcuU5aE0fVlG99CCELmMFGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsgrErCR1IsvEaWW8MLG+SMZSB577k4HFfxlmB4hPOJ9/9ok3ktcOVEGx11cdm+O/
	 fqjsAimQeElJsazhuNx+dD0t+gfcS+ldvGvkHQRF+ekleahXv7adpNoGbuQPXYK9pX
	 EWrbhU4bTReKWWPTmlRET0aia7cYkYPubwav2RjuKfIpgdHS3tEscgsexbMiar7roI
	 Ip9kkcZsoCtvSdV4Kyk5pHqzBw2oe696n0rsvdIAfZ8sLpmrcjbZEb7pF8zLa5XNhR
	 2a/b1FtZwvvRQNEw+KA/VQuBJebNq2LgMNYVnFOXQnOsfrv7qXFRw2yOgnhbHzY1Nv
	 jJUFk6tk2h+jA==
Date: Fri, 17 Nov 2023 15:57:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michael Bottini <michael.a.bottini@linux.intel.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 1/6] PCI/ASPM: Add locked helper for enabling link state
Message-ID: <20231117102724.GI250770@thinkpad>
References: <20231114135553.32301-2-johan+linaro@kernel.org>
 <202311152225.ZdVv0ufT-lkp@intel.com>
 <ZVTsf9A05HQ9UYT-@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVTsf9A05HQ9UYT-@hovoldconsulting.com>

On Wed, Nov 15, 2023 at 05:06:23PM +0100, Johan Hovold wrote:
> On Wed, Nov 15, 2023 at 10:26:40PM +0800, kernel test robot wrote:
>  
> > >> drivers/pci/pcie/aspm.c:1186: warning: expecting prototype for pci_enable_link_state(). Prototype was for pci_enable_link_state_locked() instead
> > 
> > 
> > vim +1186 drivers/pci/pcie/aspm.c
> > 
> >   1172	
> >   1173	/**
> >   1174	 * pci_enable_link_state - Clear and set the default device link state so that
> 
> I apparently forgot to update the name here to
> 
> 	pci_enable_link_state_locked
> 

While fixing the name, please add locking information in description as well.

- Mani

> [ ... ]
> 
> >   1184	 */
> >   1185	int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
> 
> Perhaps this can be fixed up when applying, or otherwise I'll respin.
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்

