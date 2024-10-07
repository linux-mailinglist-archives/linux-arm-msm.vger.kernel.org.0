Return-Path: <linux-arm-msm+bounces-33378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BA992E07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F115B1C21313
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007A818BB98;
	Mon,  7 Oct 2024 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FILTEH8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2551D4176
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309555; cv=none; b=TpFA618AF7eYu/AZhBllVi+3KRrSD+ueOFRb54i3IsIK127uQUrDk+1s8yVEyqkXW8OATImmZoTiM+nTHOWXVi8O3UH2BNdSkp/Ht+Wo3s6/pAT5UAntpZserFFGhh2l2AQysSHV4UTx/KkHfSSWWxBD+KJgc9yqP2xSr5SvcJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309555; c=relaxed/simple;
	bh=n4oG5LTAxLA3y2xDimyibVs2v/zqS3TxXWLrkbSEufY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r56Y5K00/y7qRMRhsRLu8EmjVtlQNFsNGAGq9P9cL5GUhJNmsgGwlQhVo4BntfGqRWIXjVfWumh4TtR/Q6fK1EYqPYsIgYvF+ZFf2TSF9QkScUMGTgfwLYOFYUHbM9xHItYk9DV3ZYB0WdASYLaSwzD67m7mg4+8PY9UAgBY60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FILTEH8L; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso48009361fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309552; x=1728914352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uBnw43piXXI7n4DTLKHOMAEK5UpUIcRTL2fHxKrp9w=;
        b=FILTEH8LPbb4STNWT7CFXKXtPIRbS+Gn2hjkTcNRgw1QN8PZnXwbbynpchmzob3tbI
         9n0DNJvRhkQshocgo+WkJxzqgAcwR8shQcXydsjVGxhUWHdK5SS5eqQf5ebKImpCExln
         tNRNup+ug8UJUxaV3YE4OEgNvJumCdVvOuo7OPc18rcSkjSFO2IiKQD5ngBLcUA7TsMz
         bXYdZPCejyT6IpR9ijnI+exv7B7jfxZTid/8slDBHmsru+yv1ulyBywuJq/u1DrTTgRp
         tQL8cWi/JCc9KmU3RK9EAc/XeTN/NRsUfOSrMbjB5mnmBQmBk/KDMx4MBR9GG6AJRG+E
         EhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309552; x=1728914352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uBnw43piXXI7n4DTLKHOMAEK5UpUIcRTL2fHxKrp9w=;
        b=bEJUn0XPDAI+HWl9cBJ720JZR4IYjcy3KcjTrqhmDxnvULOQCxRyfYsf6154SrSao/
         Vumb6fFCaRxwo1QxlA+oq+3Af6yxUZZuuaC2LzaJtUmSsrmNK/PhEXRWYd0kCSOF5Q7e
         1/edCUv00BT38MpBJTYOnIbxUl25Lj5pky5W7BCuzvJk3KnmglrGRGnMVIZqXYuuZTf5
         irD58Z0Mr2XA2M+rk4kLgeYAi1sAqeooas+czR/+UsocTHfZXap1d/uv0/yoPlWrH7xu
         ogMDlw4JXA+8v49I91zmjS52i77VsOPd9HTlr8hQdqmq6TjlHQEpWAs/bcVqkSA7q0HJ
         PE4w==
X-Forwarded-Encrypted: i=1; AJvYcCVGyN8RmXDPcw9y0b56s50IWkEp2Wa9a4oNX8QIhxW+gPiT94LIsZUhXxUAjJdO5IocYsINJGSN9T9DJksD@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVKar52y2hms7Vy0/A1lbBXRd5jkfOw18N0bqfUFyxmAWMZJj
	VMG6oX/WusguX9jfALsRIwDTtnz459X43FC9SKSi+2AtDOlmeuMTmiFAqrlz0sc=
X-Google-Smtp-Source: AGHT+IFYsE5/TCR+Rx1O7DTrCu76UULZ5EhjsnIt4QmOaZn1KvQoOZfaRPVgfvAAqetrCt3ywPY3Rg==
X-Received: by 2002:a2e:bc21:0:b0:2fa:d534:3ee7 with SMTP id 38308e7fff4ca-2faf3d724dfmr57178661fa.35.1728309552125;
        Mon, 07 Oct 2024 06:59:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9adcdd3sm7887201fa.69.2024.10.07.06.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:59:10 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com, quic_krichai@quicinc.com, 
	quic_skananth@quicinc.com, quic_mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>, 
	Mank Wang <mank.wang@netprisma.us>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Fabio Porcedda <fabio.porcedda@gmail.com>, "open list:MHI BUS" <linux-arm-msm@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <kukqsg4dpvfa2i53fssqsdihud3qy3w6le5srf2a7yiiwsbmob@se44vnmgbbye>
References: <20241007091622.3497928-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007091622.3497928-1-quic_vpernami@quicinc.com>

On Mon, Oct 07, 2024 at 02:46:20PM GMT, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device
> 
> The Qualcomm X100 5G RAN Accelerator Card is designed to
> enhance Open vRAN servers by offloading CPUs from intensive
> 5G baseband functions.
> 
> Currently IP_SW1/2 channel support is not present in
> mhi_net driver, will be supporting them in future.

When? Can we get corresponding support as a part of the same patch
series?

> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 

No empty lines between tags.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> ---
> changs from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 60 ++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9938bb034c1c..b9b7dd8d9411 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,63 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
> +	MHI_CHANNEL_CONFIG_UL(50, "IP_SW2", 256, 7),
> +	MHI_CHANNEL_CONFIG_DL(51, "IP_SW2", 256, 7),
> +};
> +
> +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
> +	/* SAHARA dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
> +	/* Software channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
> +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
> +	/* Software IP channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
> +};
> +
> +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 120000,
> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
> +	.ch_cfg = mhi_qcom_qdu100_channels,
> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
> +	.event_cfg = mhi_qcom_qdu100_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> +	.name = "qcom-lassen",
> +	.fw = "qcom/lassen/xbl_s.melf",
> +	.edl = "qcom/lassen/edl.mbn",
> +	.edl_trigger = true,
> +	.config = &mhi_qcom_qdu100_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> @@ -822,6 +879,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* NETPRISMA FCUN69 (SDX6X) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
>  		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t)&mhi_qcom_qdu100_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

