Return-Path: <linux-arm-msm+bounces-69497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C4B29BA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79777B3C43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493D286D45;
	Mon, 18 Aug 2025 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPhpTAKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF393176F1;
	Mon, 18 Aug 2025 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504446; cv=none; b=OWHyP714Usny0y8P7aAJRzSoPF1TPDofjsXFPzupfPEydS9u6NHyiY7bd6Z54U1OkmsQS+hxCazTj14TRxb06oRk5KsAWWcNMLNG0leZw/F5aRwKfkg5a0/Fqt5nEkduUQeJ9g6F12UX/BihoUPx38PuBfvry4xSS/X3cMOwq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504446; c=relaxed/simple;
	bh=+UIWXzkYxdbdxcSYrPsSNlqwf8U996k9R1GoP8bGy9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA5SgsQ7HJ1jXl3RWurdBg+4NQmXMgJ/xVzTCShqzc9s7AUrWUUnxhM3qdEholzdIrATofqRft+U4w4/yfgWOdTMuP6TwECOvSSBjx7t33PUeclgQpymsnk7HAckwilhzspWWgvwav1JpzOtXZHpE/AvaAM004izT+1cKU1sQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPhpTAKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A47EC4CEEB;
	Mon, 18 Aug 2025 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755504445;
	bh=+UIWXzkYxdbdxcSYrPsSNlqwf8U996k9R1GoP8bGy9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPhpTAKabV10h8Um8Tb811rOSrI2QLq1WyJ3/HOuYBZzkUsyPR3dl9YzfZZPgtAtg
	 KL6xJ8iL1Zl+l67U6hVkv4Hp1EWLiDpDCP89EZtwu5+bieNw3BW3956UjaKFaHwOxf
	 GHwjaTN4wjNtsmBD8eP2ZfA3vukXx8QhmFZxhAxwxHiaZEAN1/l+SM/IdDfA+GzNPq
	 gnvqkPr+y3EMA0YypNljavIKaswjJ9TPZt+V1IMXhbtsN48vWVEcuQDLbdgHDS+NZ0
	 VyARkvwweqtF3xbG/a65zni8u5GaIe5LpqTF850k2VFQSelkJR1SJC9PhZi/6OFqN+
	 w40WYiubnMUvA==
Date: Mon, 18 Aug 2025 13:37:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Duke Xin =?utf-8?B?KOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>, Chris Webb <chris@arachsys.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: add support for Quectel
 RM520N-GL 0x5201 variant
Message-ID: <ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo>
References: <20250512112631.2477075-1-ynezz@true.cz>
 <aJ7SMWSWw5l8rS4I@meh.true.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ7SMWSWw5l8rS4I@meh.true.cz>

On Fri, Aug 15, 2025 at 06:22:41AM GMT, Petr Štetiar wrote:
> Hi, gentle ping :-) Thanks! Cheers, Petr
> 
> Petr Štetiar <ynezz@true.cz> [2025-05-12 11:26:31]:
> 
> > From: Chris Webb <chris@arachsys.com>
> > 
> > I have a router board with a Quectel RM520N-GL 5G module that speaks
> > either USB or PCIe. When switched to PCIe mode, the modem present itself
> > on PCI bus with following IDs:
> > 
> >   0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device [17cb:0308]
> >     Subsystem: Qualcomm Technologies, Inc Device [17cb:5201]
> > 
> > and is currently being wrongly detected by the kernel as:
> > 
> >   mhi-pci-generic 0000:01:00.0: MHI PCI device found: qcom-sdx65m
> > 
> > which results into wrong modem configuration and thus missing wwanX
> > netdev. So lets fix it by adding a new device entry for this 0x5201 variant.
> > 

All Quectel modems have the vendor ID of 0x1eac. But here, both Vendor and
Sub-vendor IDs are QCOM. This usually happens if the modem doesn't properly
reset and we end up seeing the default QCOM IDs and not the ones programmed by
the vendor. Or the vendor deliberately didn't program the Vendor ID for some
reason.

We saw a similar issue with another Quectel modem [1], but we didn't get any
response from Quectel (Duke Xin). I believe both are related.

But unfortunately, we cannot use 'mhi_quectel_rm5xx_info' for these IDs as the
IDs belong to QCOM and the config belongs to Quectel.

@Duke Xin: Could you please let us know why the Quectel modems are using the
QCOM Vendor IDs?

- Mani

[1] https://lore.kernel.org/mhi/CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com

> > Link: https://lore.kernel.org/mhi/ZqllDCWfiKravZAo@arachsys.com/T/#u
> > Fixes: 1cad976a1be9 ("bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem")
> > Signed-off-by: Chris Webb <chris@arachsys.com>
> > Signed-off-by: Petr Štetiar <ynezz@true.cz>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 03aa88795209..0db9543a7edc 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -818,6 +818,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> >  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> > +	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
> > +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
> > +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
> >  	/* Telit FN990 */
> >  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
> >  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> 
> -- 
> ynezz

-- 
மணிவண்ணன் சதாசிவம்

