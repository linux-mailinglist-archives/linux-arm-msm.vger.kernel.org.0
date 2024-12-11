Return-Path: <linux-arm-msm+bounces-41405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9C79EC4F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 07:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3643A284513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 06:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7106DCE1;
	Wed, 11 Dec 2024 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6lNLLYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6B1C07F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899327; cv=none; b=pCHQjZcPrL7d3JC2eP7y8PiOSV8TVuHz6rkawvXXCyjBZQesqDymFH4eDxMp6jLqulg4BhV05FOFPVPazZ7UZeQBnGCMDXkX7JEFIBxmBBwTgK5buafRxKR+dErZ1LIZajrIsy7k3TuUZyAkqHm0RuvaOhB4OkXiCrZFKjBHTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899327; c=relaxed/simple;
	bh=fFveP77bj++EtRJvy3YCVpCGVLLJJ20B4rPICaCeOGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW7GYjRt/dOo0+ki2LbooM02Zn/BNJ9aQ2Q4NWrM3fLC14CH8e4o4hiHXGIcyQFGlsieqwEhN03aKSgtxnmY4yp09tmC+dK7jnAwKQu6YCc0Fbw4IeEGU04pnzpibTMlN2p3DFAOW45MSDK+hqy1RYlpNr96MIGLYc/gDeWZIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6lNLLYu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21628b3fe7dso37665255ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 22:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733899325; x=1734504125; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SH3wSIT4qOX2QKfL+TrwrsCejAN9yTnzSj4WW/yKpJg=;
        b=C6lNLLYuAi3iOkTWhHraGef9VKzoFa2fR73ZBzgK2WoDEYteR2UNmNFvBAdr0KjT96
         CJP1UcaTA1cT6eqPBdY8+mZbTMX01MGuYbfjbYCPM9ezwTLtg1btDEbnrbC14bM1zvz+
         YumdvNHhM0zhY2Qlo60fizSY7rl/xXowIwff9aF6dvwsxH6pcMICig24vNeo3Q2q+N89
         u9XI5Z9KZ2BtdgSZPUeKcltSutLBubeTxnKYVBn1H7V5U5yCou+/9XJoOoXIYYRq7wA/
         aQEVc2c6v3XiKvxYeflBAjubag1r/e9NXl/ps+W9XVKkHkhgaG18LIAkmCz0v4AuBTmB
         akLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733899325; x=1734504125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SH3wSIT4qOX2QKfL+TrwrsCejAN9yTnzSj4WW/yKpJg=;
        b=uxGFhF5A/UFgucjxCo7xwostnzBfMztEY7imWCNP0SH5b+ELzOqRixEMhFhZWjeD9r
         3ZJS0+x65lHR2WfWE1YWcjK2NcgZjdGNdXoZzlK5bgxwGjs0NQtrQUMGfWoE1Iv1P6fW
         ytkgV37a9ZJMMDBmJScfU5eVfzdEatgCR3qhVMJyB62Mz1h07AL3oQfkoUz5IdOjVdcC
         2KSBu1/du1ouQMKqYzKgB1hXumSKiImsOlk8IEvRBjUxWcQ28hDh+3iMb/GLuJjej4FM
         +g0+c/wOlIoerFkO5p2ubFUs5pshkVa00F/QMJdQS23pU+/IuJ4BhAYeKgBv3jnwT4sn
         loyA==
X-Forwarded-Encrypted: i=1; AJvYcCV5FXN0ls91AGxs6efXIPolaO/QhBmlRAWJPKiwog5JkBcuTcDm2PTJ8UNFyWtLcmjSgeJ41X48BRF8yFLn@vger.kernel.org
X-Gm-Message-State: AOJu0YycIQwMSQB83XGNjb2IoybDab4UfmpUCAqp/eHuDjKDW7ra5PaX
	OvMqzfKqF81FwH2wC3XjkR5sv+bKj4WdZfqDmeuiTd4A0NOsTDWk4LRD/Uz9vcyOIFtxqdvay0w
	=
X-Gm-Gg: ASbGncuPSqHELPA1K7esw+lZ1To7WubYYmZkPgSadNZnBvH3XGssN7RV4683fBuvcRF
	NFfISwyX0fOeQc+lAuVaTEssWTQskrkH0p8KVzNlUqNknFehFXDTh4YkryOnL6cPF46lU/SR6O1
	0peFbrtTmw7s4EKFW0x+1Lv4FN7D4ut4ZHNPBxsAvauTpHwZFmijH97B+94C5Sy9wqo474CHp1V
	oq4ehBMUyrCzJ0flNPzIA68gafK32uhs+9ZbrNyjKQA1wJBIxBPcQPxzEgLP5c=
X-Google-Smtp-Source: AGHT+IH9UlXRucX87GfmhnSoQKYdfmBeTDDM2mlEgeF1Kko5nxbNbCHi9DSPm8qDL6kLUq2gp73FUQ==
X-Received: by 2002:a17:903:32c3:b0:216:48f4:4f1a with SMTP id d9443c01a7336-2177851dc1fmr29082555ad.16.1733899324633;
        Tue, 10 Dec 2024 22:42:04 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21618d9beafsm82495805ad.6.2024.12.10.22.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:42:04 -0800 (PST)
Date: Wed, 11 Dec 2024 12:11:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: quic_krichai@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241211064155.gqlbi3leoaaz3w6b@thinkpad>
References: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>

On Mon, Dec 09, 2024 at 11:09:50AM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> servers by offloading CPUs from intensive 5G baseband functions.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
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
> index 07645ce2119a71c9277356e962252b840379cd81..dee9fa9e7ae441fbc9a86e53694568c0ba192002 100644
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

Can you first push this fw to linux-firmware? I haven't enforced this
requirement earlier, but that was my mistake.

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
> @@ -822,6 +874,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* NETPRISMA FCUN69 (SDX6X) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
>  		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },

Did you read the comment on top of mhi_pci_id_table[]?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

