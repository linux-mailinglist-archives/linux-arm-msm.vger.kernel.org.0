Return-Path: <linux-arm-msm+bounces-48651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26096A3D6AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACDBD3B721C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190051F4E49;
	Thu, 20 Feb 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdFNPXZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB21F473A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047240; cv=none; b=bIYvu1aoSw8Let8xNQtARWfSRHVs8BMY/ppNqdA6gL5ZzO1di8JgpkZx0WqfZXG24fxUkKqZP6NYLvatOUooJo6/cJBJPzYQVnW5dakhORoYP4/XQTI/z3gmbhOmwUWCww/aHDwDuDJOeKMkUI2ksaISFKaPSoLCHSNcLL7kzwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047240; c=relaxed/simple;
	bh=1zTFVW3fByVcSQRLJcFT0xkTTUZKdD9/1/+Y39OcoXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLvDD43IkJcKE6yTLgMB0yFd8zdpByOEjPogubnTb5RnQMQIovoRlvDQ3AN1JgKrh/hxLU4V7dpHNF7ZliP+CzZh84BOpUFMSQ8MTDIENWybztU1iU5g8pQAFoblWUjLtnpjHLwaaEpMl1/XtZb0MSDqBNfEaW9Zk2X8Ho7frc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdFNPXZa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5439e331cceso848813e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047236; x=1740652036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdxLgmcTwfGNH3RIQhD6UV3lMFu/ahlDY5rbF2YgQg0=;
        b=pdFNPXZaK3slGkZ3gSmz1D2Os3YESnNXDUS1rqHEEWL4rpAuimxre9HDAZV+F9+hkT
         E+ov5V5SF0TdThwVW7+J93V5CeSJGvX2eRMN3FanntRTEq/qWefr3qqnuY976J3ughdg
         LqGQmXZyhFX4rdK/sfHH1HVkP80y3ryRjntbj0ramDWfjltG4fSL/QViwFK3WzWuHneH
         16Jjqgvc75J7WS9pv/d6f4wItjWFbd20q/U0Cxml8zEDRXdU3nV4i6ORK1b5hiESVLFa
         O+QjpAqz2JNZeBG0rBVG1meBd8Ze9fJcSORuYlQv57UN2Vybw08NXKKGqi1nf2FpT8Mp
         Q59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047236; x=1740652036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdxLgmcTwfGNH3RIQhD6UV3lMFu/ahlDY5rbF2YgQg0=;
        b=OIA2AtdsdwZ3DIUV6byMsiDAoOX73Y0e0tWH7zxSAJdqEj4O1CVzJDngIZPb3FS3dN
         dTuWimBmDyTcvG0NEgBsnu2vncpYzT/xwzLbw13EFQcA/BsggD7wLjRlHGDWHoa5txhR
         pygq0rpo7dnp2cIM6OUxlFKLNkZ3uUTFoB9JYEN87Id80ty8ZRiNfg1LVlrmHZ1VkTcV
         HkdMr8Jtwh7ce/fTlblHxDxpyG/abtjWdXiNIhE2jbZmq8ZPP6QGKMmB6F12htLzrigL
         ZQGzfuAN9a0yLX6r/LzXFRYtsLjJeYdDAn5hkJlL/ii3bJdoA1dwlTDKP7D9dIIYqv1t
         a/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv3Q4hkeIY8cZLvtkjq2JNXolQ1tXYAgueCYeAUNRp15UwAU8RFy1d/qTdMnr6Z+WXiCIh1RLLLDksDkA8@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQXY0cajY3mDbxCLY3o9ZPLoLidYfnp+2F+zAu1WxzS/4GBcA
	qX4Bo5mAZUIHviY7/OcVbDO5xT2yNPGur+uI1CxHYkRAtA7atiX6fw/5M5vY4jo=
X-Gm-Gg: ASbGncv7/tZx1EZ9A4OwYF2ZDFBfTl2E0B2fC5j+wStLDnc2mDE4V2uo3+aBOI0MCoP
	mrM6jzjePchIbfSwtd/5LOXXToEbZvzGDKCZ7FZ+sRX9zBgLEf+3vJb5qi5cjO8hRRmVGSXgz6X
	u1XfZjY6BIObN9aoDy5NpDkLluoNA/MYfUmivAtSi99WjiMA+qV6ysiT6RPJeK3BFje0ZJU3mvc
	KXCA4SkY8bkTvqj+PdmQa2U67g4iuF2g60xzHg4r/a1rVnTB+BTtv3CzGfRQy/wfqpjeWwvsMzb
	o0x4oJ6mkKscpmC+D1QnLuUnDSfM3TWoGzArW1CVpc9S6SmtWBsn/9yqFn+I82ALSmgJxwE=
X-Google-Smtp-Source: AGHT+IFxXTsuWO3zBx6wjf9aaYQ+YsWg92pnfU23W3wK7Kk8yl9H1m+r4C8uwTVQv/ExC2Dtx7Bzxg==
X-Received: by 2002:a05:6512:308e:b0:545:c7d:1796 with SMTP id 2adb3069b0e04-5462ef2015dmr3322754e87.43.1740047235908;
        Thu, 20 Feb 2025 02:27:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462f2a2811sm477328e87.191.2025.02.20.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:27:14 -0800 (PST)
Date: Thu, 20 Feb 2025 12:27:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
Message-ID: <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>

On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> This change originates from the Qualcomm Android Linux driver. It is
> essential to support a dual-DSI configuration with two panels in
> some circumstances per testing. As the name suggests, this modification
> may enhance the bandwidth robustness of a bus.

Please start by describing the problem and the result of the changes.
Otherwise it reads as it "may enhance or may worsen" the robustness.

> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>  	return ret;
>  }
>  
> +#define DSI_VBIF_CTRL			(0x01CC - 4)
> +#define DSI_VBIF_CTRL_PRIORITY		0x07
> +
>  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
>  				  u32 len)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	u32 reg;
>  
>  	dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
>  	dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> +	if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> +		reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> +		reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> +		dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> +	}
>  	dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
>  
>  	/* Make sure trigger happens */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

