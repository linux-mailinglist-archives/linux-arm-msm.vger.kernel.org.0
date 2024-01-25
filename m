Return-Path: <linux-arm-msm+bounces-8348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB783CF25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9067A1C20836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8857B13A26A;
	Thu, 25 Jan 2024 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hn8Y4Ww9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322A13664E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220435; cv=none; b=ua4vbh+L5oVVd5j6YucfTbwInD28AxujoGn+zZH9sKeaftdaXpHYTy7kjoeLVBzSBafdTN9zqjrzn/4tcZsFEYXBQVT9Btul6Woag6lgirrLM8FDtj4xa9p2/FRgEHpkwnWmtyDPcUXkSCWUd7td0fb/5bhiJip98bHa4sJ6w44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220435; c=relaxed/simple;
	bh=tjs5tQoImEvg+rr7BOronW/pSEQ0cYahnjzJMExgngs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKD86xIdjtiBlS9tWAl+rq6VPWA6pYXPDk5fWKO/79Jc/KJ8jR6Tec1LQ50Z9Nsk2WPaupu4xRkgLlRpDtWVNbLsf+jrYEx9Gi85IF80yzG3PmNZjLLkz2xjEHTlIjZOtLd19cJEzak/XbTP+PLxWekk9bltRfaz2wosrpW6eRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hn8Y4Ww9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso86743771fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220431; x=1706825231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QO88jOMuE3Qjg69JhvIkNpQbF05cgpQE5FedRs/dv08=;
        b=Hn8Y4Ww91j/CUnUz8cpS/vw++hNVsT5srgn9Ak0D8yTmxjjfCLjztizBsCiAxsY7gs
         dAWmDMqCbVSSJ2tj2Ty6B1CegxgFkXBWfyi1H4M4H6vESH6EMvgWNc3m/7/EWNrqRQl1
         mQY7X3DEM2dgShkv4vBcku1avgbTwvxLH4ArdbaKz7JPNcax1pRUK8lzWwZw3Fvhhifd
         ibvj7Q5Pj/tHkykkg222HmnqqCS73Rmrf8kjH8ZuQfxCotGpX+5ZvlGiDW3/hVUNPCnd
         bjYXGyGLVjEKsPuHUmO2FQBln5ZkeyXyQA2S55/KbDBmzlgTSub+s/S29kppv8EOsKcA
         0WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220431; x=1706825231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO88jOMuE3Qjg69JhvIkNpQbF05cgpQE5FedRs/dv08=;
        b=dM3PPpZf2Ai6TAVAl4N8dg2jssia438CZIGkYjKFjEJpTmE3gDWgMvjgJieEfwoxg+
         Ir5M3WK23d8UUkshW7XHB5cP8URf/Ja8hVcSXqbRGy+AuwDXS8Ex95NJJnfnzS/Gf28+
         so7f3qYk0EX7/ObjBVtd5683KebHBZNRKNM5a8+7mG8M9Xd8W1e0Q38vmkYADVxYAN0/
         gzgbOl3a+ooo5mTh7dpn8/0ZazHoE9gtn/S0FtR76G6Qo8k1SkcsFHDY58WvJLttYQE9
         EWhpck3MH7QfDBVvajaqiCQP1VEUgc87FvxuAfuQc0qKbX1osiIwgKWkx2merJu7ywgj
         spoA==
X-Gm-Message-State: AOJu0Yw64CaSi7vAy0fKTOaoz64BLEAX10UuliPbQGH1tTt6S37oQG0c
	twKoi5La9VGogYNnO+ydbXsiQhjZ8rI0DiiXo987wj/6ECwbXJ+IlsaPNBBpUFQ=
X-Google-Smtp-Source: AGHT+IEZyBfBO7A1AQ1M7bdq/YefFJySAWknvbo43E7Zh8Enih8yYh5SYbqXwJlCkNVKTrHkhK/qOA==
X-Received: by 2002:ac2:5f6b:0:b0:510:f3c:f1 with SMTP id c11-20020ac25f6b000000b005100f3c00f1mr209243lfc.116.1706220431664;
        Thu, 25 Jan 2024 14:07:11 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u17-20020ac248b1000000b005101e82ed80sm228054lfg.290.2024.01.25.14.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:07:11 -0800 (PST)
Message-ID: <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
Date: Fri, 26 Jan 2024 00:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-11-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-11-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Modify dp_catalog_hw_revision to make the major and minor version values
> known instead of outputting the entire hex value of the hardware version
> register in preparation of using it for VSC SDP programming.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5d84c089e520a..c025786170ba5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -24,6 +24,9 @@
>   #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
>   #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
>   
> +#define DP_HW_VERSION_MAJOR(reg)	FIELD_GET(GENMASK(31, 28), reg)
> +#define DP_HW_VERSION_MINOR(reg)	FIELD_GET(GENMASK(27, 16), reg)
> +
>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>   
>   #define DP_INTERRUPT_STATUS1 \
> @@ -531,15 +534,18 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
>    *
>    * @dp_catalog: DP catalog structure
>    *
> - * Return: DP controller hw revision
> + * Return: void
>    *
>    */
> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
>   {
>   	const struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
> +	u32 reg_dp_hw_version;
>   
> -	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +	reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +	*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
> +	*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);

After looking at the code, it might be easier to keep 
dp_catalog_hw_revision as is, add define for hw revision 1.2 and 
corepare to it directly.

>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 563903605b3a7..94c377ef90c35 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);

-- 
With best wishes
Dmitry


