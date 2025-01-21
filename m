Return-Path: <linux-arm-msm+bounces-45644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E2A176E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 06:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 287A07A1665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 05:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6BE186294;
	Tue, 21 Jan 2025 05:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ddx4p6YT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E794158538
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737436594; cv=none; b=Nr3axYHJEO8AeXd9N9dmljlv9Ns/c6NDrCOwT8x3s93WyjsZpikEPvmagbeuCQO/vHLZyHs64cIrCurt1OOMP399q6IQeAiJXeH37/Z2GK5tlKCnAjv7dQ9qaxHJQlDg1E8wuABfjl7V8NnbdU5zYfSL9jCEa/LAByD8fja3tGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737436594; c=relaxed/simple;
	bh=YqfrYgihBjBXj0cOsmiT7j9yuNBgxAVKnbKiilYI+6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxuE522gMEnE1OUuLq8GyE3jRK4IUv3ufF7GpevmSKCyyzDk4z9OOVSP50UHFPKkE9YZiolCrH524AUQhyNVLeQOxwsbjP1yQE242K5lljQncBm4cqve+e3iQxRRpAnALUkG+WjbhF42I5P4KCQ0fBgofYiaC89pbMyTzL2QxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ddx4p6YT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216728b1836so87271915ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 21:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737436592; x=1738041392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BAke++1U5RWEwLy4C0asQPiSPopWRe55x+FydJix+Dk=;
        b=Ddx4p6YTJ7aGowZZ2EueSMdiA7JCOvu5W+qiwzfr+54gDzYDRiVvtdL+UnZ+OphY2D
         y7vzMbMiRE9pNsmCLSLW2R+VvEKCPWQn9LXpOhzTVfqwlJOPNWTy0kL4Ns42GKyo9P9+
         Luw1u1Cc9NF43J6I9wppQTD0XlhyLVptBMedvd45GTlu74A3eiKcqxosLOcsOXJgaujI
         3XLDbpoLjjVrURj1S/sPOXzBXBqRqgFhqF2RgRvqqlOYyQWJrTQ888P5GcSpQDCLuIB/
         X2/BsETJrLNGcXvvCArJGOtQdrkFFZWUMkU6LTc9AgqBgPsATAxdFd/XOi1NYc+KpV4x
         P/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737436592; x=1738041392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAke++1U5RWEwLy4C0asQPiSPopWRe55x+FydJix+Dk=;
        b=IugeiqJI5/8hPITREnVEOEVFZyiX3PPDn56WWVKErOTBdfGQ1ZgHH7sZrTPFhZQaDk
         txd3jvJNnOy/FBz1d++DCF8vZ24E5nWyx4Hb5bggyOBb40xTvVKAiIey5Zuo1btzXhLw
         2dTGaAG1IMxUQvF1pRmcOt49Se6KuoYn82QSrOBH029SvB9hoIBAL8gIauC6mB2wb5l5
         luDrdPy1IZr9w9X1Ywe/EbIV0FfBmR3V5ahVtNsRSy57Vq3AlhR0rTBYZGatTQHNa8Fz
         FGMbWM9RLdw2ycU2dhFBNRHib2ajRlGFhHAsWhfZX/v7d3Wv0esM2lXTX+XZiwhHJW+I
         r1RA==
X-Forwarded-Encrypted: i=1; AJvYcCVSRhrJn+OjO7Dmio4FBQdh+UKacTg8nM+tQZQVn1+HNhLlqFmdLznBrffHBry1H/+g8SKYUx9Ia3tRVjME@vger.kernel.org
X-Gm-Message-State: AOJu0YxNn0GdaJ2/hikG0UdE0na8PmLFjyyalGyRgu1+jDoFnFvHl63e
	+Xd7igI0mvvIEWlJP5Qw8U8T/ly1T6ym9QGr2m2+2TcDrXgoGhR7QiCVx5cShQ==
X-Gm-Gg: ASbGncsEXB2aHkewwK100Phb/6n9yeny17QtQn3bl4WNUYkaef2noW++LpL9amfAuRK
	2eXB3ukJ00EAJxq9Et/U+jgVqamVVfOVyixnSPZBIKoh6OGujW4mYLdALXH+mCTPRUB/rqrFCVY
	CLC6SS8kRdBraklSypgjar/SvkGzwK6pvmG145wWHQYPRE5BzmKxXhUudq1OkOo6AMPxYAZd0zv
	+FLstaJ+fxt2Uv3ftO2ReW+eoKz/ukBcOX9+fb5WGS+5IcikzAulPXz2xXRVm6+f56WuNhkC4+0
	5Yk4PHk=
X-Google-Smtp-Source: AGHT+IGaI/RPreLjhhuind/TCwUpZY+YxPrRTkj36HP7T1seVjaQtPrzGdtX+VzPW62BORz2D5cyIQ==
X-Received: by 2002:a17:902:db10:b0:215:a2e2:53fe with SMTP id d9443c01a7336-21c355c7a3dmr250553465ad.40.1737436591419;
        Mon, 20 Jan 2025 21:16:31 -0800 (PST)
Received: from thinkpad ([117.213.102.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a913csm69871065ad.117.2025.01.20.21.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 21:16:31 -0800 (PST)
Date: Tue, 21 Jan 2025 10:46:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Message-ID: <20250121051624.nhest7s6iyh2ll4m@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-8-quic_jhugo@quicinc.com>

On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
> Add basic support for the new AIC200 product. The PCIe Device ID is
> 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> much of the existing driver.
> 
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One suggestion for future cleanup: Consider using the macro definitions for
channel and event config.

- Mani

> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
>  drivers/accel/qaic/mhi_controller.h |   2 +-
>  drivers/accel/qaic/qaic.h           |   1 +
>  drivers/accel/qaic/qaic_drv.c       |  11 +-
>  drivers/accel/qaic/sahara.c         |  39 ++-
>  5 files changed, 395 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 8ab82e78dd94..13a14c6c6168 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -20,6 +20,11 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
>  module_param(mhi_timeout_ms, uint, 0600);
>  MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
>  
> +static const char *fw_image_paths[FAMILY_MAX] = {
> +	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
> +	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
> +};
> +
>  static const struct mhi_channel_config aic100_channels[] = {
>  	{
>  		.name = "QAIC_LOOPBACK",
> @@ -439,6 +444,297 @@ static const struct mhi_channel_config aic100_channels[] = {
>  	},
>  };
>  
> +static const struct mhi_channel_config aic200_channels[] = {
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 0,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 1,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 2,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 3,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 6,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 7,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 10,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 11,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 12,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 13,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 14,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 15,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 16,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 17,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 22,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 23,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 24,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 25,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +		.wake_capable = false,
> +	},
> +};
> +
>  static struct mhi_event_config aic100_events[] = {
>  	{
>  		.num_elements = 32,
> @@ -454,16 +750,44 @@ static struct mhi_event_config aic100_events[] = {
>  	},
>  };
>  
> -static struct mhi_controller_config aic100_config = {
> -	.max_channels = 128,
> -	.timeout_ms = 0, /* controlled by mhi_timeout */
> -	.buf_len = 0,
> -	.num_channels = ARRAY_SIZE(aic100_channels),
> -	.ch_cfg = aic100_channels,
> -	.num_events = ARRAY_SIZE(aic100_events),
> -	.event_cfg = aic100_events,
> -	.use_bounce_buf = false,
> -	.m2_no_db = false,
> +static struct mhi_event_config aic200_events[] = {
> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 0,
> +		.channel = U32_MAX,
> +		.priority = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_CTRL,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +
> +static struct mhi_controller_config mhi_cntrl_configs[] = {
> +	[FAMILY_AIC100] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic100_channels),
> +		.ch_cfg = aic100_channels,
> +		.num_events = ARRAY_SIZE(aic100_events),
> +		.event_cfg = aic100_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
> +	[FAMILY_AIC200] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic200_channels),
> +		.ch_cfg = aic200_channels,
> +		.num_events = ARRAY_SIZE(aic200_events),
> +		.event_cfg = aic200_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
>  };
>  
>  static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
> @@ -545,8 +869,9 @@ static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  
>  struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi)
> +						    int mhi_irq, bool shared_msi, int family)
>  {
> +	struct mhi_controller_config mhi_config = mhi_cntrl_configs[family];
>  	struct mhi_controller *mhi_cntrl;
>  	int ret;
>  
> @@ -581,11 +906,18 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>  	if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
>  		mhi_cntrl->irq_flags = IRQF_SHARED;
>  
> -	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
> +	mhi_cntrl->fw_image = fw_image_paths[family];
> +
> +	if (family == FAMILY_AIC200) {
> +		mhi_cntrl->name = "AIC200";
> +		mhi_cntrl->seg_len = SZ_512K;
> +	} else {
> +		mhi_cntrl->name = "AIC100";
> +	}
>  
>  	/* use latest configured timeout */
> -	aic100_config.timeout_ms = mhi_timeout_ms;
> -	ret = mhi_register_controller(mhi_cntrl, &aic100_config);
> +	mhi_config.timeout_ms = mhi_timeout_ms;
> +	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
>  	if (ret) {
>  		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>  		return ERR_PTR(ret);
> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> index 500e7f4af2af..8939f6ae185e 100644
> --- a/drivers/accel/qaic/mhi_controller.h
> +++ b/drivers/accel/qaic/mhi_controller.h
> @@ -8,7 +8,7 @@
>  #define MHICONTROLLERQAIC_H_
>  
>  struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi);
> +						    int mhi_irq, bool shared_msi, int family);
>  void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
>  void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>  void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index cf97fd9a7e70..0dbb8e32e4b9 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -34,6 +34,7 @@
>  
>  enum aic_families {
>  	FAMILY_AIC100,
> +	FAMILY_AIC200,
>  	FAMILY_MAX,
>  };
>  
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 4e63e475b389..3b415e2c9431 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>  
>  #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
>  #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
> +#define PCI_DEVICE_ID_QCOM_AIC200	0xa110
>  #define QAIC_NAME			"qaic"
>  #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>  #define CNTL_MAJOR			5
> @@ -66,6 +67,13 @@ static const struct qaic_device_config aic100_config = {
>  	.dbc_bar_idx = 2,
>  };
>  
> +static const struct qaic_device_config aic200_config = {
> +	.family = FAMILY_AIC200,
> +	.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
> +	.mhi_bar_idx = 1,
> +	.dbc_bar_idx = 2,
> +};
> +
>  bool datapath_polling;
>  module_param(datapath_polling, bool, 0400);
>  MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
> @@ -568,7 +576,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		return ret;
>  
>  	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
> -						       qdev->single_msi);
> +						       qdev->single_msi, config->family);
>  	if (IS_ERR(qdev->mhi_cntrl)) {
>  		ret = PTR_ERR(qdev->mhi_cntrl);
>  		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
> @@ -637,6 +645,7 @@ static struct mhi_driver qaic_mhi_driver = {
>  static const struct pci_device_id qaic_ids[] = {
>  	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
>  	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
> +	{ PCI_DEVICE_DATA(QCOM, AIC200, (kernel_ulong_t)&aic200_config), },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, qaic_ids);
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 09c8b055aa81..3ebcc1f7ff58 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -188,6 +188,34 @@ static const char * const aic100_image_table[] = {
>  	[10] = "qcom/aic100/fw10.bin",
>  };
>  
> +static const char * const aic200_image_table[] = {
> +	[5]  = "qcom/aic200/uefi.elf",
> +	[12] = "qcom/aic200/aic200-nsp.bin",
> +	[23] = "qcom/aic200/aop.mbn",
> +	[32] = "qcom/aic200/tz.mbn",
> +	[33] = "qcom/aic200/hypvm.mbn",
> +	[39] = "qcom/aic200/aic200_abl.elf",
> +	[40] = "qcom/aic200/apdp.mbn",
> +	[41] = "qcom/aic200/devcfg.mbn",
> +	[42] = "qcom/aic200/sec.elf",
> +	[43] = "qcom/aic200/aic200-hlos.elf",
> +	[49] = "qcom/aic200/shrm.elf",
> +	[50] = "qcom/aic200/cpucp.elf",
> +	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[57] = "qcom/aic200/cpucp_dtbs.elf",
> +	[62] = "qcom/aic200/uefi_dtbs.elf",
> +	[63] = "qcom/aic200/xbl_ac_config.mbn",
> +	[64] = "qcom/aic200/tz_ac_config.mbn",
> +	[65] = "qcom/aic200/hyp_ac_config.mbn",
> +	[66] = "qcom/aic200/pdp.elf",
> +	[67] = "qcom/aic200/pdp_cdb.elf",
> +	[68] = "qcom/aic200/sdi.mbn",
> +	[69] = "qcom/aic200/dcd.mbn",
> +	[73] = "qcom/aic200/gearvm.mbn",
> +	[74] = "qcom/aic200/sti.bin",
> +	[75] = "qcom/aic200/pvs.bin",
> +};
> +
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> @@ -748,8 +776,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	context->mhi_dev = mhi_dev;
>  	INIT_WORK(&context->fw_work, sahara_processing);
>  	INIT_WORK(&context->dump_work, sahara_dump_processing);
> -	context->image_table = aic100_image_table;
> -	context->table_size = ARRAY_SIZE(aic100_image_table);
> +
> +	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
> +		context->image_table = aic200_image_table;
> +		context->table_size = ARRAY_SIZE(aic200_image_table);
> +	} else {
> +		context->image_table = aic100_image_table;
> +		context->table_size = ARRAY_SIZE(aic100_image_table);
> +	}
> +
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>  	dev_set_drvdata(&mhi_dev->dev, context);
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

