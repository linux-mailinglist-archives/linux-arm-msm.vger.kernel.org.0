Return-Path: <linux-arm-msm+bounces-8332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2E83CEAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D321F21012
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800681CFA8;
	Thu, 25 Jan 2024 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhG75JMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD371386AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706218382; cv=none; b=GvfF+kOUvRNE/D0K2/A9j5UecLnoNTjkSDGwwdSAeU4yXlPRupQvSOUvcA9f4vBoeM3fNRdYmmipa7Ct7oUQoX+DYzCphhpuWfmslxltkYjJDTpXyI+/emsoljTnpHhwCphViTi76cb+Rwy3rI8T8cX/XnoENdNlBRcaXx+cs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706218382; c=relaxed/simple;
	bh=Bwm9My/1BUofb3/wD5JCMJCFpoVPZHPxIbi9mxBxCgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkcvYmTnUT/3D/C3KZu2iB/+DRVnG1IFa5G3hcXIRKC+/MSHIj2mXZtNh7ZVnUM1JDciMm1WbEz3k3zTLNX626lKAjm/iKDG4R8Old3rv77eHAOiepa+IdzjzkV2RHFwAFAwjlPc55O6D1bYCdkkW13Ialxb7oTFHPrGXlxuoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhG75JMC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51021ba75edso876391e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706218378; x=1706823178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gC43oeEn6Z/dF88bOw97Mdza7qqFP/bsP45fUlFMHxc=;
        b=MhG75JMCZNDWZ3SVQqOamFE2AdHgMigILF1YnKXb6Kg3UCy3UwEphZ5A/Ve3ci9B/5
         P1Nqc/X99urYTwHt3NxlfImkX218TlL7+BZukQuSrOAjINIKtr9uWBW7ISUJJJ0ivO3v
         OJMcY+OnzUHwYd0S2qstkDVn0t/nRQPJaBxGHwkEadTNabDYCdsa43u0fV2BHvATkxfo
         4WyIiSif4cGevaA3yJr6XLzCROS1aDpEixT2C/bPNy2SkRekXv9LVGPMMSFWVGzIzata
         3laKBOxSQyQvgSeayxzncAA7DMgtYjhWsvLYV5YNQEq1i32iv0k4MbvB3U3QI52CV3RH
         ujgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706218378; x=1706823178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gC43oeEn6Z/dF88bOw97Mdza7qqFP/bsP45fUlFMHxc=;
        b=MpNYm2V4BEA2N7VLm3ctDpuBZY8ALvGq/xnP6PvB0meK91SuuSyup1etw7+iRCbQv/
         cqo0wBRK66aNH8EzRri4b0vf4wnPAPDlw1x7utT5su9cfILXkj+U6pijp3St+d7At7AX
         fPw/HJ3U7WKzhKDBByP2t0YSVu9eLBrlwOaNe3lIzRJFvmSOuuytnMWSiKuEaOkWK43S
         diY7pWFkeuVXznCQns5jv778Hcg9zxcAkZq1MoEQ1NygKJUfFA/17jdU7Hg1eLiTR/IS
         OExd7YBfIdVkfwuuNtVaYWcGyxIUl46cnLLvT69Y4M0vSYKa+fdOmxx8aoXxDYWaJTrn
         jD2g==
X-Gm-Message-State: AOJu0YxPfmhvjt615awW0s+9pTruFEUbTmHeFAqxvIsIZNaiwMMDIXQY
	jRwO4+9x7uOYi/YtyZXksQ6N1SA8xOVowuyD/qk03g1Y/1DtX1YG1z66r6vUshE=
X-Google-Smtp-Source: AGHT+IEzUaCrfBiRov5NqQhtatOele2FId5ABPYRFyVNlLIi7xYZNBZ1H4QCUh+xC4UXwx/Ct7PWxg==
X-Received: by 2002:ac2:4c02:0:b0:510:1a04:1e64 with SMTP id t2-20020ac24c02000000b005101a041e64mr229175lfq.25.1706218378350;
        Thu, 25 Jan 2024 13:32:58 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ecbfa6eeasm2962435lfs.305.2024.01.25.13.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:32:57 -0800 (PST)
Message-ID: <06f76827-bffb-4bc6-a0dd-bc272e4f6690@linaro.org>
Date: Thu, 25 Jan 2024 23:32:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/dp: move parity calculation to dp_catalog
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-10-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-10-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Parity calculation is necessary for VSC SDP implementation, therefore
> move it to dp_catalog so it usable by both SDP programming and
> dp_audio.c
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 100 ++++------------------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  72 ++++++++++++++++++++
>   2 files changed, 86 insertions(+), 86 deletions(-)

There is nothing catalog-uish in the parity calculation. Just add 
dp_utils.c. Another options is to push it to the drm/display/

LGTM otherwise.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 4a2e479723a85..7aa785018155a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -16,13 +16,6 @@
>   #include "dp_panel.h"
>   #include "dp_display.h"
>   
> -#define HEADER_BYTE_2_BIT	 0
> -#define PARITY_BYTE_2_BIT	 8
> -#define HEADER_BYTE_1_BIT	16
> -#define PARITY_BYTE_1_BIT	24
> -#define HEADER_BYTE_3_BIT	16
> -#define PARITY_BYTE_3_BIT	24
> -
>   struct dp_audio_private {
>   	struct platform_device *audio_pdev;
>   	struct platform_device *pdev;
> @@ -36,71 +29,6 @@ struct dp_audio_private {
>   	struct dp_audio dp_audio;
>   };
>   
> -static u8 dp_audio_get_g0_value(u8 data)
> -{
> -	u8 c[4];
> -	u8 g[4];
> -	u8 ret_data = 0;
> -	u8 i;
> -
> -	for (i = 0; i < 4; i++)
> -		c[i] = (data >> i) & 0x01;
> -
> -	g[0] = c[3];
> -	g[1] = c[0] ^ c[3];
> -	g[2] = c[1];
> -	g[3] = c[2];
> -
> -	for (i = 0; i < 4; i++)
> -		ret_data = ((g[i] & 0x01) << i) | ret_data;
> -
> -	return ret_data;
> -}
> -
> -static u8 dp_audio_get_g1_value(u8 data)
> -{
> -	u8 c[4];
> -	u8 g[4];
> -	u8 ret_data = 0;
> -	u8 i;
> -
> -	for (i = 0; i < 4; i++)
> -		c[i] = (data >> i) & 0x01;
> -
> -	g[0] = c[0] ^ c[3];
> -	g[1] = c[0] ^ c[1] ^ c[3];
> -	g[2] = c[1] ^ c[2];
> -	g[3] = c[2] ^ c[3];
> -
> -	for (i = 0; i < 4; i++)
> -		ret_data = ((g[i] & 0x01) << i) | ret_data;
> -
> -	return ret_data;
> -}
> -
> -static u8 dp_audio_calculate_parity(u32 data)
> -{
> -	u8 x0 = 0;
> -	u8 x1 = 0;
> -	u8 ci = 0;
> -	u8 iData = 0;
> -	u8 i = 0;
> -	u8 parity_byte;
> -	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> -
> -	for (i = 0; i < num_byte; i++) {
> -		iData = (data >> i*4) & 0xF;
> -
> -		ci = iData ^ x1;
> -		x1 = x0 ^ dp_audio_get_g1_value(ci);
> -		x0 = dp_audio_get_g0_value(ci);
> -	}
> -
> -	parity_byte = x1 | (x0 << 4);
> -
> -	return parity_byte;
> -}
> -
>   static u32 dp_audio_get_header(struct dp_catalog *catalog,
>   		enum dp_catalog_audio_sdp_type sdp,
>   		enum dp_catalog_audio_header_type header)
> @@ -134,7 +62,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x02;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -147,7 +75,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   	value = dp_audio_get_header(catalog,
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
>   	new_value = value;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -162,7 +90,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = audio->channels - 1;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -184,7 +112,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x1;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -198,7 +126,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x17;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -212,7 +140,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -233,7 +161,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x84;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -247,7 +175,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x1b;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -261,7 +189,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -282,7 +210,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x05;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -296,7 +224,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x0F;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -310,7 +238,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = 0x0;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -331,7 +259,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x06;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -345,7 +273,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x0F;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6cb5e2a243de2..563903605b3a7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -45,6 +45,13 @@ enum dp_phy_aux_config_type {
>   	PHY_AUX_CFG_MAX,
>   };
>   
> +#define HEADER_BYTE_2_BIT	 0
> +#define PARITY_BYTE_2_BIT	 8
> +#define HEADER_BYTE_1_BIT	16
> +#define PARITY_BYTE_1_BIT	24
> +#define HEADER_BYTE_3_BIT	16
> +#define PARITY_BYTE_3_BIT	24
> +
>   enum dp_catalog_audio_sdp_type {
>   	DP_AUDIO_SDP_STREAM,
>   	DP_AUDIO_SDP_TIMESTAMP,
> @@ -73,6 +80,71 @@ struct dp_catalog {
>   	bool wide_bus_en;
>   };
>   
> +static inline u8 dp_catalog_get_g0_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[3];
> +	g[1] = c[0] ^ c[3];
> +	g[2] = c[1];
> +	g[3] = c[2];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_catalog_get_g1_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[0] ^ c[3];
> +	g[1] = c[0] ^ c[1] ^ c[3];
> +	g[2] = c[1] ^ c[2];
> +	g[3] = c[2] ^ c[3];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_catalog_calculate_parity(u32 data)
> +{
> +	u8 x0 = 0;
> +	u8 x1 = 0;
> +	u8 ci = 0;
> +	u8 iData = 0;
> +	u8 i = 0;
> +	u8 parity_byte;
> +	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> +
> +	for (i = 0; i < num_byte; i++) {
> +		iData = (data >> i * 4) & 0xF;
> +
> +		ci = iData ^ x1;
> +		x1 = x0 ^ dp_catalog_get_g1_value(ci);
> +		x0 = dp_catalog_get_g0_value(ci);
> +	}
> +
> +	parity_byte = x1 | (x0 << 4);
> +
> +	return parity_byte;
> +}
> +
>   /* Debug module */
>   void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
>   

-- 
With best wishes
Dmitry


