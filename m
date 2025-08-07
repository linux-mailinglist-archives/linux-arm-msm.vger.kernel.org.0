Return-Path: <linux-arm-msm+bounces-67974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18426B1D421
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21BAF18984C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 08:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073624BBE4;
	Thu,  7 Aug 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRmREYey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D46230BF6;
	Thu,  7 Aug 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554419; cv=none; b=clyCtH56t1CxSpnBu38Dl68d52x8vRSHCqJSonkFjGtVZr0DouDCMyY/Q4DOSqdQChVdWUodGG6dIIYRU9jNMBsg4jzKJBx+91sQn6nUoRx+ptG15F7FW9Ciz9XcgBSLA9jYKtOxwKr+f18wh3641qqrLI4yP+q9Q8URyidgisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554419; c=relaxed/simple;
	bh=+Yk8Uv86kmMnuO9jGP8i+tVuJCHQl8+S/L2YDuEhcbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAnMOWok9eQILDpSW9G0c1bgzzKw+TfdtQxI+zqGyPfaF4xvNzg4KJrYmuYzew7ziEiFiLOp2mu0lAFg4xRM4f7Ljg7QHFHD52OOHpFgVJJpyFgjoK8m3bnbAc+WfflMP9ZoKCUiwn+nMmWii8BY4R7RrI1s+gkXewLcf8AYjHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRmREYey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D980EC4CEEB;
	Thu,  7 Aug 2025 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754554418;
	bh=+Yk8Uv86kmMnuO9jGP8i+tVuJCHQl8+S/L2YDuEhcbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRmREYeyX2Dw/YxLAYuW6hDZsumaWUl7aun8zWo25iRfwGiIJxr3hQc2Oa/avmXXC
	 f13aXmi6f2E5Y/GmyOgOvj3hh9+qU5QPQhW2I7rjSwq/4nLqu1CFgnwaJZRYO0vF4G
	 fufNisxvQTKKRLuUARoSsKBHmZSY2SbLwukEoA6Qj4VqUI9EvqjfR+5BhINpkAcymv
	 3zmnQKvKVxWsbJvWhfhhR4owbjZ5fxvqzgZM5cSI7wgHpkceNLsmh7LPga4uRekBFA
	 hjNLuD+5CW/W/NOBD7T9MXyAQ4QP/TJSv62lts9AtMITaE1kOrvu+YEtEMJ+5AK5C8
	 HaqeJoP2OsDUw==
Date: Thu, 7 Aug 2025 13:43:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vivek.Pernamitta@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Message-ID: <tynmkh4isrbi473zh6t4kd5bswrthxy3garhgpzafq6n2wrmqk@rfanfjgciyqv>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
 <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
 <1c79cda0-2645-4f88-a05f-9082e305fad4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c79cda0-2645-4f88-a05f-9082e305fad4@oss.qualcomm.com>

On Thu, Aug 07, 2025 at 12:39:26PM GMT, Krishna Chaitanya Chundru wrote:
> 
> 
> On 8/6/2025 10:29 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jul 10, 2025 at 02:28:33PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> > > From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > > 
> > > In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
> > > when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
> > > SUBSYSTEM_VENDOR_ID to check if the device is active.
> > > 
> > > Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > > Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/host/pci_generic.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
> > >   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> > >   	u16 vendor = 0;
> > > -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> > > -		return false;
> > > +	if (pdev->is_virtfn)
> > > +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
> > > +	else
> > > +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
> > 
> > You should not read the sub Vendor ID for VF. PCIe spec suggests reading the PF
> > Vendor ID for VF. So you should just use pci_physfn() API as below:
> > 
> > 	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);
> > 
> > This will work for both PF and VF.
> > 
> This will defeat the purpose of having health check monitor for VF,
> as we are always reading PF vendor ID and will not know VF status at all.

Do we really have a usecase to perform health check for VFs? Health check is
supposed to happen for devices that can fail abruptly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

