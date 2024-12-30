Return-Path: <linux-arm-msm+bounces-43648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C59FE70F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCC03A06C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4982E1AA1DC;
	Mon, 30 Dec 2024 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DB8EkwML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757DE25948F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569003; cv=none; b=HgLBaZyWIYmzd7I4f4FFmLOn6U17Fo7HW5GTI9iE/wEtn67rgu/Nk3DGFl/W1rcEgXfjiw0y+QojljRdMBESotvIh7TRfVG/elZqvinNnCM5gskifpsKuDArwP3ihMGMdo+hq7gsoUj2GxlVw8UxeLz45CXc+4BDnCCWJOCmt70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569003; c=relaxed/simple;
	bh=UE4fsZvTt7f4VebOeDgB4kVtd71ZQvlTu87U1Wpmvu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYBZ+REAfCRWms0gRk9/waVG5XmzV9RU/WOIer/zwOp2jU0beoHXB4JsQm17yw8NAwUXvxvPV7SP08B92+fR2IFpGguIHk+jduiS5UMmnDeQ+PbnuHNQ1y0LgBE3ocmXV36Ca7wxxxeakbPLpF8XYsaU6Y4ItiINVyOO2FUU7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DB8EkwML; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216728b1836so105211805ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735569001; x=1736173801; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gr+6F4gLA7qh//Q0DfXnG3ESNO2iZGoWvr/m5SsJW18=;
        b=DB8EkwMLWJtQ/4y9chO30Alfty5PapkzPiq5wa75KuYCLA+agz8HqYEG6gN5+JB/o9
         RhVGuXrAFxaLIqb+ZbNXnH33Dhyr/5Z9c6+LqIbeFSpl6MqdgAodmvRfcmtWkRwpuAKe
         F/UgvlXofwN8Kro20JC4xNeTcx2SzTJcIUkOx6rFEQT3WwWfBKeMNuQmghQB3eEUS/iv
         3B2alteZQmVJhKUyOCdawYhs2wZq/gdqPd+VqI4FNfwaaLst7IpwK24d5leAS0Or2aZI
         lzpMoX245IAWXGlDvXpGQ3fuQkVcJl9ParPzyIlto+BS0GkIDzQe3MTZ5OY8HT9gXma3
         s1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735569001; x=1736173801;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gr+6F4gLA7qh//Q0DfXnG3ESNO2iZGoWvr/m5SsJW18=;
        b=R9yDzpWjvENPyBwDsEtLJ6JkJLe952dcE27kiHzrCnvxRF7Ysm//egz8sxvevWU6Pc
         S6b+1JjKwnSsbI0nz/P0FaU6x4A0TxvQPFrqOH3Zj1G3ZL/HqqykldqF073slvmQi3pX
         yhJveTX69voApMWE6l03AGh4AWhfkFyQy0rmadVuYZ9GoT/M2bhvkKBigkSqu+JLbDQS
         wayPPtRR6cVtxlEzRE3n05eXpm6bMezLd7U3EN7oAcJ9yU2ShoUzfeVDBcJ7pBbLGWTL
         SEQTkeQZorMWJ5NS2kKqyasxUM5zeXjiJ9pafjE+ASI4k1DDC3fXkbXObZBpd7C9IXUE
         O6dg==
X-Forwarded-Encrypted: i=1; AJvYcCUrb8F9KBP7xyRcx7AK9xlHV/NTVxDKSHTc/Fme3rndWJ5LXJlhQ459jCVtIJ91UR/N3H14DXftM9cHUNqz@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/sKLV4uwVoC5Ip1rpUsl741T3gBo3REsBtFRnLUKhOe9Sk7T
	zJzmzKFOx56uRlhIH/P2wWPnD6kBVszR1PjLLQyrByeM+J1boVi1EB0NcuYUIw==
X-Gm-Gg: ASbGnctGmoWbB1g2nCSzcOQneF5UhF6N06e4vFhgBLRWm48yAZMV8k2SSOxk12jBkHG
	f56RxQfzEwzYHQxASHiJDYSb4LaSt6eMbtJjbUz+2njzMVlDNPHIi03MifbPpocP2mQSVqZW/Kw
	iqMCuY9DD88pGKsV9rXcC4qDqrn48nvG80pH4C9gt8a5RdST2Mvp7db7kmAwmXDbxDLDbepFHgB
	gQVtvGHF3Zkrs/3wdG7Rxuwhx4Dv2BqH9/773TAZCbo/Uq4Ur/w9Ikl4/GhOv2hIyIe
X-Google-Smtp-Source: AGHT+IGsq46BkX7nxKOFydqwfObryV4wmWqUsOnBEniobSQVWJ156otRrt9tvEz2hRpU8CR6ryDubg==
X-Received: by 2002:a17:902:e5c7:b0:216:393b:23e0 with SMTP id d9443c01a7336-219e6f2e9d4mr517247345ad.36.1735568999325;
        Mon, 30 Dec 2024 06:29:59 -0800 (PST)
Received: from thinkpad ([120.60.139.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97181fsm178470045ad.108.2024.12.30.06.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:29:58 -0800 (PST)
Date: Mon, 30 Dec 2024 19:59:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: quic_krichai@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241230142955.iqiwpyjrrtkijlg6@thinkpad>
References: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>

On Thu, Dec 12, 2024 at 05:27:27PM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> servers by offloading CPUs from intensive 5G baseband functions.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Applied to mhi-next!

- Mani

> ---
> changes from V4:
> - Updated QDU100 VID as per order in mhi_pci_id_table.
> - Link to v4: https://lore.kernel.org/r/20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com
> 
> changes from V3:
> - Removed IP_SW1 and IP_SW2 support currently, will add once
>   SW_IP1/2 channels support are added to mhi-net driver.
> - Removed qdu100 edl images, as EDL images are not needed.
> - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
> - QDU100 XBL FW images were pushed to linux-firmware git repo
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
> 
> changes from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
> 
> ---
>  drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a71c9277356e962252b840379cd81..aa5118dbe2e5de3f3d13a168ebe2d3d2d5930295 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
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
> +	.name = "qcom-qdu100",
> +	.fw = "qcom/qdu100/xbl_s.melf",
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
> @@ -742,6 +794,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
> 
> ---
> base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
> change-id: 20241127-qdu100_us-abd7d1613c8b
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

