Return-Path: <linux-arm-msm+bounces-8339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2683CEE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E0F1C225BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439F813A256;
	Thu, 25 Jan 2024 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oobpKp+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539731CA89
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219457; cv=none; b=soff9HQxbVbzgVJLcg79bHeM175t3hfsyykla1yJQRtS3zlKYKC5M0hfnKU2+vXfkBi9NHCSgBwYUiRJsLXfJQLM8WIczzDRQhfIDyRyQ/N35lCxTXRLKrR0JI4jmAIFvASFsrYbfuCJ6Mwbp0R+LZ/XyUOoXsfh8CtJNdDDmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219457; c=relaxed/simple;
	bh=c1eBTfBGpbJ4bNKA5HFnXrrhWgBuN1Z6KCQSeVmzh1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taSNScx9RfCYxoh2kQ/MTcx/70o8tXmnOecIad9kZ8wYcrArnTXidclgLPwZtn0W1Djt4l76lXOU60zic60LXaHxx3W7SlvIy8ppRdTKbqkLL4KRjk8dG39XP0UBn2hGT5U+RN9Va/5uUylbxUEOPcx2oHIKrmjSuyV7I1f84vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oobpKp+f; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51005675963so5705918e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706219453; x=1706824253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T54fsLBTRmT4jgVEtxyLn6mAS33agnyvi4UEMgBVoWQ=;
        b=oobpKp+f+dNWQmCz4Ww+Q3KzN+LeRAhKYn8rF4ZVQCgFP0d0gFq7G7NsC1ch32+xfi
         QbaHLsqa4/G9wnXogENYm8UGwoYli4J7Nvw9iUr20AhVtHI/PpL1MgPU5Ko6WBSkSpc0
         1QL2N0woyOtIy0qmv8aAhHSA8XhwRrP1dAbdIzwdpgB9sdyb9OCYg+oDSN5t5pUQiVWz
         A4jN8TC4Zg5PXSuok8mqhaPeY1db8moFVYzzmed6tZHixfmhphSjLke8anpBWfdhoPW7
         nODk3N9FDKvhTCviXAPTumypQdOoIPAsf1hpMVafqPpRCc55+nNjPNaC2I7NgcnFg4oX
         frMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706219453; x=1706824253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T54fsLBTRmT4jgVEtxyLn6mAS33agnyvi4UEMgBVoWQ=;
        b=aIhI7CGklH02l4OLgkBNlKhhqqYXyMMAx39yO3/BOjXcglTzQW1VaZ51yasgB2t9XJ
         PdXbdpgQGjV7GTO9ywXlqIh8D9pPp+UIhQgen+sDqK+ZtTCK6/ZsxHEDh8gwWzHT7gnn
         BQ9VqyYRsiW6oNjva1vf+ExFzlW5hy+Nw0c/olEMMgkaLidhXCaGnJEnHXBUAEzmNi8J
         YiVnxAsdJF47G/N16khFaOODpu2mn5rqKAarZX2Br6TbvH95RWYF25yvXDTcTr8qiMss
         0sKZ6MojjpqaeQu4zc2U9k00NOS0kNfnM218+DFzvV5PJ+CHcqiP4dPwOwc/6OSxC1CC
         JAAg==
X-Gm-Message-State: AOJu0YxHfH+H1aEBTmQCmFds4A3FmtDD6+Sm0/qEcqSE0abyaW3mtLdS
	ZUH/qK0DQuW0tjYhQVDxPlV82gr0uKinj82jm3VRDqkq+p/fSfKCeCzR8z1eypI=
X-Google-Smtp-Source: AGHT+IFCdBHp2PBFHOeepK/hfxpQeySTG1iUcHe72e+6UbKprHQdajEkeHG41o05AtpkYezNWRUIMQ==
X-Received: by 2002:ac2:48ba:0:b0:50f:13f8:3879 with SMTP id u26-20020ac248ba000000b0050f13f83879mr144675lfg.75.1706219453369;
        Thu, 25 Jan 2024 13:50:53 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651232cc00b0050f0dce126bsm2942118lfg.214.2024.01.25.13.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:50:52 -0800 (PST)
Message-ID: <64c9c8ee-6ae3-4db5-8952-b8b1fff71d8b@linaro.org>
Date: Thu, 25 Jan 2024 23:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] drm/msm/dp: enable SDP and SDE periph flush update
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-14-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-14-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
> 
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> 
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>   4 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7e4c68be23e56..b43083b9c2df6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -446,6 +446,24 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>   }
>   
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +	u32 mainlink_ctrl;
> +	u16 major = 0, minor = 0;
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +	dp_catalog_hw_revision(dp_catalog, &major, &minor);
> +	if (major >= 1 && minor >= 2)

if (major > 1 || (major == 1 && minor >= 2))

As a check, which of the values should be written for maj.min = 2.1?

> +		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +	else
> +		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   					u32 rate, u32 stream_rate_khz,
>   					bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6b757249c0698..1d57988aa6689 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -169,6 +169,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ddd92a63d5a67..c375b36f53ce1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   
>   	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +	dp_catalog_setup_peripheral_flush(ctrl->catalog);
>   
>   	dp_ctrl_config_ctrl(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 756ddf85b1e81..05a1009d2f678 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -102,6 +102,8 @@
>   #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
>   #define DP_MAINLINK_CTRL_RESET			(0x00000002)
>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	(0x00800000)
> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	(0x01800000)
>   #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
>   
>   #define REG_DP_STATE_CTRL			(0x00000004)

-- 
With best wishes
Dmitry


