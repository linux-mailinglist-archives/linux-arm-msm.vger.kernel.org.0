Return-Path: <linux-arm-msm+bounces-63307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB22AF07AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 03:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEE897A66D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 01:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C075725761;
	Wed,  2 Jul 2025 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfwI7noM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCF20311;
	Wed,  2 Jul 2025 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418231; cv=none; b=QDFW52KUb+XgiapJUXmaP+w5YC1rl92Kvwnj4ATlNIq5eia6eoo/1yx+fKvseHZznOo++coFfgiqB+PXY5mK+BZoy4i4U2QvuXQqMqqZbYH+GPFZgEbqNZk3rtrWAuaRiRn/h7vVAgcZ7KBgyAY1n+QRBTjsS3Yh8MB853nbrk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418231; c=relaxed/simple;
	bh=2y6feaZkEBj50zzPAoHzbU/fiJaJPVZKtdm0UtSiPBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdSt0yfNnMVZA9KsWQ0TfXnAbrfCRtTfW+BUBhG8ylOt2+xIELpH/xB6M6XmjYBhhioLEMjeWaLcnN5CMRelSHfP4aW9ySVwhuq/1WVdf5YvHYa6NjCn+lkGw3BJnwk41CqWqCTf3IJx0zRhW9NltgjwhRZmvYKK27Uk4PexvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfwI7noM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6100C4CEEB;
	Wed,  2 Jul 2025 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751418231;
	bh=2y6feaZkEBj50zzPAoHzbU/fiJaJPVZKtdm0UtSiPBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfwI7noM1KywEpx1xkvANlMdvQn8cn5G93S3UlILtYKQoSTLYMMhQoRZVS/ardHim
	 2hjdQLcEy+Aj4qf0id3aQJio48UvXeQ/HdFARPWDXgJspQk6eNgiaGS9EaflCnc14j
	 T6ntvKuwfq28GAxzSpdLtzyWZwO4S5yyiLWy+SEXhsZYXxMWsCWZDVlnVFZOsXI4eg
	 fWcJfgrOzheKYl5Up/dYwXhxAyH1OP4Ow7A0WW5Qc4S+TtAi4t9+ZhlIa6OdsNg6if
	 EztZj4CnDJkYNjk7QWpzWH+5eyqp4Tf+AOFFRDAFFmOi8beHq3EG6WaS362QUBoRVV
	 Up5rNrA4jehuQ==
Date: Wed, 2 Jul 2025 06:33:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Adam Xue <zxue@semtech.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, 
	Aleksander Morgado <aleksander@aleksander.es>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "slark_xiao@163.com" <slark_xiao@163.com>, 
	"johan+linaro@kernel.org" <johan+linaro@kernel.org>, "quic_vpernami@quicinc.com" <quic_vpernami@quicinc.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>, 
	"quic_msarkar@quicinc.com" <quic_msarkar@quicinc.com>, "mhi@lists.linux.dev" <mhi@lists.linux.dev>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Iulian Mocanu <imocanu@semtech.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
Message-ID: <sbs5tvq2qul5fchzq7mchanaqd6o6ax7fwtdjilsdl2z7xlwch@3fppqszbzwg4>
References: <20250528175943.12739-1-zxue@semtech.com>
 <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
 <CY5PR20MB4867E63E4B5107728904826EC678A@CY5PR20MB4867.namprd20.prod.outlook.com>
 <CY5PR20MB48671EEF395AC1824F16E0D9C67AA@CY5PR20MB4867.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR20MB48671EEF395AC1824F16E0D9C67AA@CY5PR20MB4867.namprd20.prod.outlook.com>

On Thu, Jun 26, 2025 at 07:58:49PM +0000, Adam Xue wrote:
> Any update on this?
> 

Since there seems to be no easy way to test the patch on EM919X, I went ahead
and applied the patch.

- Mani

> Thanks, 
> 
> Adam
> 
> -----Original Message-----
> From: Adam Xue <zxue@semtech.com> 
> Sent: June 24, 2025 9:57 AM
> To: Manivannan Sadhasivam <mani@kernel.org>; Thomas Perrot <thomas.perrot@bootlin.com>; Aleksander Morgado <aleksander@aleksander.es>
> Cc: manivannan.sadhasivam@linaro.org; slark_xiao@163.com; johan+linaro@kernel.org; quic_vpernami@quicinc.com; tglx@linutronix.de; fabio.porcedda@gmail.com; quic_msarkar@quicinc.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; linux-kernel@vger.kernel.org; Iulian Mocanu <imocanu@semtech.com>
> Subject: RE: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
> 
> Hi Mani and Aleksander, 
> 
> I may collect the logs if required. Or we can ship an EM91 module for you to validate?
> 
> Thanks, 
> 
> Adam
> 
> -----Original Message-----
> From: Manivannan Sadhasivam <mani@kernel.org>
> Sent: June 17, 2025 2:27 AM
> To: Adam Xue <zxue@semtech.com>; Thomas Perrot <thomas.perrot@bootlin.com>; Aleksander Morgado <aleksander@aleksander.es>
> Cc: manivannan.sadhasivam@linaro.org; slark_xiao@163.com; johan+linaro@kernel.org; quic_vpernami@quicinc.com; tglx@linutronix.de; fabio.porcedda@gmail.com; quic_msarkar@quicinc.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; linux-kernel@vger.kernel.org; Iulian Mocanu <imocanu@semtech.com>
> Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
> 
> Caution: This email originated outside of Semtech.
> 
> 
> On Wed, May 28, 2025 at 10:59:43AM -0700, Adam Xue wrote:
> 
> + Thomas and Aleksander (for EM919X related question)
> 
> > Add MHI controller config for EM929x. It uses the same configuration 
> > as EM919x. Also set the MRU to 32768 to improve downlink throughput.
> >
> 
> This also affects the EM919X modem. So I want either Thomas or Aleksander to confirm that it doesn't cause any regression.
> 
> Rest looks good to me.
> 
> - Mani
> 
> > 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
> >       Subsystem: Device 18d7:0301
> >
> > Signed-off-by: Adam Xue <zxue@semtech.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > b/drivers/bus/mhi/host/pci_generic.c
> > index 03aa88795209..9bf8e7991745 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
> >       .config = &modem_sierra_em919x_config,
> >       .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >       .dma_data_width = 32,
> > +     .mru_default = 32768,
> >       .sideband_wake = false,
> >  };
> >
> > @@ -813,6 +814,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >       /* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
> >       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
> >               .driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info 
> > },
> > +     /* EM929x (sdx65), use the same configuration as EM919x */
> > +     { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
> > +             .driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info 
> > + },
> >       /* Telit FN980 hardware revision v1 */
> >       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
> >               .driver_data = (kernel_ulong_t) 
> > &mhi_telit_fn980_hw_v1_info },
> > --
> > 2.45.2
> >
> >
> > To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
> 
> --
> மணிவண்ணன் சதாசிவம்
> 
> To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

-- 
மணிவண்ணன் சதாசிவம்

