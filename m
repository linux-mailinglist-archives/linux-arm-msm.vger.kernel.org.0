Return-Path: <linux-arm-msm+bounces-33846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F299843F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CE921C2151B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1881C1755;
	Thu, 10 Oct 2024 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlerYW/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BF29AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557826; cv=none; b=tbjYy7Ze2Qvna8GLH9e72UDYqNkIqd77mK0EvRqNpbr81MoFpIRGX/jxtvem/CAEqDTctTkvYB3aBR9wNdGYGcV3tkdLHi0ws26DtVK6OGzycpcqKOLkv2yPLMICQ8Ean+wQl1z9T8ie4fTuB711x+dGqz0s4VlnFDxig0STr+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557826; c=relaxed/simple;
	bh=d4HU0SLzlcKFVQeiO2JNDPW9qbPHKjFdAn3qjg617pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5l5qGcUgPjDLyH/3vkqYQIQWiTfJyo85Dl9Sj6eS8/M8XyWQVyrGdAvmlAFLvspAQGfUVilVClVNqoMSeCcp/lBLT876phD8V2HOag1Z4Hr6oHJngjDz8lavlHLOO7R2LFjuFkwLcZ+Q+Zpl2o2OzNtmLr1ISXtKzUI+EWMc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlerYW/4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso511651a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557824; x=1729162624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RT2TNTxcIr9d5WrKWzX+3XBsz0hui3Hv6T/2YvST6a8=;
        b=ZlerYW/4wxCfHZqFMNuRaX7Wz3xIsAWW5akgioOrTK8jtp6Ul4mFvgEiODRv5S5c5w
         0qhdV6qGLGWTf1BYE5sHPkxn4FbdsZY/gil0kldnCDg2RwXNw/k65uswgqeOAJ7EyULL
         lk/NAg4y57Q55LuJFEGXnVpWqz/tmQ7zbhS+QEODiCym1ZoFUuRRb4pMPt2rkcz4IgHE
         7QHyQFXmT3A4sjQmWAvpAWMHDy5bvTD6QL9k0xVWNLhWVrUaSqJW4NvFY1Bg3TjI6CRh
         WYzGVnXvLnM+8oiA2pSdDd9binHVP09CRLDRu6UdswCRuRPEdGZqxQFwY+9l1XqADWpu
         mB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557824; x=1729162624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RT2TNTxcIr9d5WrKWzX+3XBsz0hui3Hv6T/2YvST6a8=;
        b=ku9JbB3r+/Bt0i3ygja+JoDedOg96riWpU6//MOdJbk/jpObbb8CnhDOJPPw1qdTAV
         em898GRXeRQVneJXNqfXO6Lk+7ldYiNMR95gxNAUjw0i2tuPJwKh8aAxZeDCSY/n0EDi
         3yrbeStHcSyT9M11UGhqgXK+IWhecqJgdHwp6EIPkzOvEqaWfwvU2jrG69MgkrYdTHMQ
         Tl5RIKCKdmoW6lN0CNGALQgoYDSrljtBs7O8rE8RZGyDhM/ojcy64/iZS+fqHhWZClYy
         qvdqHDodRAVxtrFGnjURBD54AXwDYo69wFVYv9uKOWHnLbrJ+3u9xV6O+iATXN///PmD
         ua3g==
X-Forwarded-Encrypted: i=1; AJvYcCX/rKwP7BXSGotCq+URu16htRol4dtc7nK2SG/pbsbuKETYKdgdlvDrgOHIBrwCZF1hkR7/yROh+e2bK5Uz@vger.kernel.org
X-Gm-Message-State: AOJu0YzpN8kEtXFioxnrPlP4wM5xa/2/xHn95f0Jpfu0smh6Nf3Lx7Vw
	3iaht1zz2gOT5kZeqVUvZASE85hz97DXJrEnGmqA58QG395TgzkbAcmxGxFGKmc9zSduDOPGqPA
	=
X-Google-Smtp-Source: AGHT+IGu+kMq+uRASxcspqSsFqZQjDiE2MpxVF9EDhrlqDoOU3Ztf7Xx1Pk65uGaqBvkRjdyk6326A==
X-Received: by 2002:a17:90b:1803:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2e2c800c7a1mr4355972a91.4.1728557824211;
        Thu, 10 Oct 2024 03:57:04 -0700 (PDT)
Received: from thinkpad ([220.158.156.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5caa753sm3303473a91.54.2024.10.10.03.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:57:03 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:26:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, quic_vbadigan@quicinc.com,
	quic_krichai@quicinc.com, quic_skananth@quicinc.com,
	quic_mrana@quicinc.com, Slark Xiao <slark_xiao@163.com>,
	Mank Wang <mank.wang@netprisma.us>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	"open list:MHI BUS" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241010105658.mckqvumjrglu6236@thinkpad>
References: <20241007081543.3475027-1-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007081543.3475027-1-quic_vpernami@quicinc.com>

On Mon, Oct 07, 2024 at 01:45:41PM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> This Qualcomm QDU100 device is inline accelerator card
> which is an extension to QRU100 5G RAN platform.
> which is designed to simplify 5G deployments by offering
> a turnkey solution for ease of deployment with O-RAN
> fronthaul and 5G NR layer 1 High (L1 High) processing,
> and to accelerate operator and infrastructure vendor
> adoption of virtualized RAN platforms.
> 
> Currently IP_SW1/2 channel support is not present in
> mhi_net driver, will be supporting them in future.

I don't know what column width you are using, but please use 75 columns for
patch descriptions.

> 
> https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> ---
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*
> - Added more commit test for IP_SW1/2 channels.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
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

Please drop these unsupported IP_SW channels until you add support in mhi-net
driver.

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

I don't think you can use internal chip name in the drivers. Please use the
actual chip code like QDU100.

> +	.fw = "qcom/lassen/xbl_s.melf",
> +	.edl = "qcom/lassen/edl.mbn",

Could you please push these fw to linux-firmware repo? This is a requirement to
get this patch accepted. I should've imposed this at the start itself...

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

Spare after (kernel_ulong_t) and also sort the entries as per the comment above
mhi_pci_id_table[].

- Mani

-- 
மணிவண்ணன் சதாசிவம்

