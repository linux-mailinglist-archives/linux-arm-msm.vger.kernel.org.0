Return-Path: <linux-arm-msm+bounces-6895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC78298E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2291C25A9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D5A4A99C;
	Wed, 10 Jan 2024 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9DiH4xV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1E4A99E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e72e3d435so3979559e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 03:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704885718; x=1705490518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9b2yiBXwtkSRZmmY/3LYcaTb30ZNQHsA4BF97X5Y9EU=;
        b=V9DiH4xVUmdGFTjUxRwdYaM3PFtddGoX5OI9W7vqFP2cur8Jmy9Qt4UnUYogLa3W29
         qJ4sIDWIhlvDmhX+6SQJO2URIqWbGM2V7SgRWdMj8/g0mO+75+cEtsPZpMoXg44JhXjE
         K/5b1DtlGxiJdZBJxkuGhAQspToeRMBkq0ipTRUx11fZQ4WTc4ApEENomA7S1hnXod9J
         iT1w3h+l4dQJmar7IgIbzY10SWtCVkGNZW4842Gfl3RDPUa4HEfEvLNex9S7jD+8gdd4
         /Hg96wTEsqdcwEjgHDEbja4C5ckiHyxdp3sX660SfaEcdOeDJBwm0ur+suthFllR5cDK
         beDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885718; x=1705490518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9b2yiBXwtkSRZmmY/3LYcaTb30ZNQHsA4BF97X5Y9EU=;
        b=RnNlfE9YQwcQ3SOKiEqCZsyMEP6amU6+VuUUMKDpsVFH0zTQd0AYd0OFFiE2MvMKqa
         P0usFqHfWhsb6MGaoSRa0OJjw1u1PoigbdGMo5hwOsPdBg1WzGxXDeVT/pD3DPrQekn6
         Jrt0zKFUN6/YJLMm3JpVn5LJnju+5dzOp4GnUkIZqKG+DfSlcHco/eXEQUvkDxrLIxiM
         FMxDruakBkUGIm7KvvV3KlHEh9C7IM1OlxDw6zLgOlqKEZCMpfbBf06KoZzzKfuZXqjN
         YH3Sv4ahS4dWaNaGO3/r980Sa7MiIALsoWHY48LDZMQ3l2ly+JByvUB+cRAKyxbgmzVX
         ILsw==
X-Gm-Message-State: AOJu0YzRy1/3x6r+0IqbWotri4Rsmhb3lKCpHDT3ji0plP6Wzi9fl5MO
	qXzzeOsmUXvT6QLZpw2xZusZ4/xksfRUbg==
X-Google-Smtp-Source: AGHT+IHcGQyjXBPiarp8rWr+YJ/jevRS1XGqhac+QJ+UkCjR2HI0HnemR4vGs+V5ztmdi+RTq+ANlw==
X-Received: by 2002:ac2:4432:0:b0:50e:7dbe:eba9 with SMTP id w18-20020ac24432000000b0050e7dbeeba9mr199607lfl.68.1704885718139;
        Wed, 10 Jan 2024 03:21:58 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y3-20020a197503000000b0050e7e19b692sm627836lfe.154.2024.01.10.03.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:21:57 -0800 (PST)
Message-ID: <e6f2590f-7753-49e2-b51b-2edf30a66dde@linaro.org>
Date: Wed, 10 Jan 2024 12:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] drm/msm/dp: move all IO handling to dp_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-12-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-12-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> Rather than parsing the I/O addresses from dp_parser and then passing
> them via a struct pointer to dp_catalog, handle I/O region parsing in
> dp_catalog and drop it from dp_parser.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index b28052e87101..1e2ca4efb029 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -14,37 +14,16 @@
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> -struct dss_io_region {
> -	size_t len;
> -	void __iomem *base;
> -};
> -
> -struct dss_io_data {
> -	struct dss_io_region ahb;
> -	struct dss_io_region aux;
> -	struct dss_io_region link;
> -	struct dss_io_region p0;
> -};
> -
> -/**
> - * struct dp_ctrl_resource - controller's IO related data
> - *
> - * @dp_controller: Display Port controller mapped memory address
> - * @phy_io: phy's mapped memory address
> - */
> -struct dp_io {
> -	struct dss_io_data dp_controller;
> -	struct phy *phy;
> -};
> -
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
>    *
>    * @pdev: platform data of the client
> + * @io: Display Port controller mapped memory address

Should be removed instead

Konrad
> + * @phy: PHY handle
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> -	struct dp_io io;
> +	struct phy *phy;
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
> 

