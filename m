Return-Path: <linux-arm-msm+bounces-66865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7484B13C17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93BDB3B1022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6205270571;
	Mon, 28 Jul 2025 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7lUtLSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B372701BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710705; cv=none; b=bgtekRkmtQYFxofbUzONvk2u5jhLBGsev7/NnMfF+G3ZHvCPgYr0BhskehPsEmSwllUHyz0t07cCsxSolatBXDTCAUz1cjfDSPZioOvZKR3S64suvt0VsZh8w1kJVxEyXKqs6j8V/YCPjhRmnWKScBcGzFWqaRMI1Q9Os2SQ7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710705; c=relaxed/simple;
	bh=fquhLiKEHj0fYtenvldhJ7/nlk2RToQq5x7ERru5FgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8R0YcW6ZPvvkZ40qVWJ2VYjpv+L3XVb6fXODOMYarA11dYyDTHLk28zEirPO7yA9lTihrLr0AaKeh7aylJyXNUIbF0Ln1uDMHTi/CjNRyHQBEahwmdo3WWKGF8Bna7PsqZrjGMDCyRiqGiP5vQQGXliQJzPunxPCnbCQUBpFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7lUtLSI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so1192931f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710701; x=1754315501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CENTF0ISHbmixWe0j83y9bNXImg/NoofqSDy9p7Nfjs=;
        b=d7lUtLSIUEuN89G9nQvJm3N1qm3U19o5Q+4t9kZNrFOXSX99b0LtGA8gv+Lq8VqSSV
         dPJezK10HzD/W+9TXYO9AsBbwbn6gIkIENpi1ka8/v7iLWhQ7Ne8Em98oWy/btSwijna
         2fPlbqRLTfsUvjO9DuyNUrH1+zJYS4WPNVJuC5buZYXnlGmUbrkUNentAmJTd7n7WisF
         yrFE4fG74ICRx09ab8e5IJbtyXnGktC1TcwI1IZEyLR1NuUns1/tbwPPSgaUmvlQF1w5
         fq2B1um9ZDVA/vGnx/570x3ocOWlTQAyFH9V5LKwTsSQh8hlmhEsxUncXq2xqoLKxnU5
         MxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710701; x=1754315501;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CENTF0ISHbmixWe0j83y9bNXImg/NoofqSDy9p7Nfjs=;
        b=uqB9nH+HGS74qvO8sChmMaRPiQzpahZziUAWnBNRxjqYcuyIxAjOy71aKVi04Lcq/i
         ElTtAlZ3/7MUEO6/RQdivDhjZQ8uS6cEExKDEt/ueneaZBEQxoZS50GF3LV0ayakUPGD
         l1Ep8LAXPcEYjOoCZ81jJykyQ3Cwiq8Wuyog94MurCEQ9sVyCvE+DNZmH+cFAsKen/Pb
         nSyzMKjIG+v/Sq0Vmev8KRzzNVo6KvJIavVPkZGI9gnakmRRm3GyTYHxg0MiPem4G10t
         cAmkCUmPYQF+lRIWG0Ibe4uEpS9HA+Ze4HiK814Xn9bm/FOYXVvLgQMeUNucznS8kuui
         RHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjQ7IBOWZphZFbm0T55UNjfT8PnsJnqrFSu+9CYQuIlLyK+I+4S3/WP5p9Cu4e0pTHEiFoqIaTf8+Efz0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvFCRa+w/H9DqCY3POZdF0S9tRXpaRYy6TMOzLxqG6wq99K8V
	LYGaco8cIM3INVV2TiFOdV4WHSuw+FrW7z8qspd5ZrgioSCA7kASLlKfKKPUhlfJcps=
X-Gm-Gg: ASbGnctLuB5lQEfkfp9eRiOJKo8xTFseqCUtNIcID6ykM4tjZf7usnVZd4QtrihkJsl
	NzsRTXFQa6AICPRGTZ2eIWC3IcDXRnf0PUzuiX8CVFL0HU054EXHrtSbTnc017fGK084g+fZD+c
	u6/UI7ZgiZvT3UeSaqTCQa586dGP2dj2zMYhEAZ/6jDEbQD+4Tt3agzIQkboF0FwwkMQYfFtRuz
	JHRrP1IUO4HsMW768jJeW6c4qlUKVWiq+21/nBFVXQzbCv8Q0Mq/PGw8HRoS30XZTnBMXOLkK38
	K6TSy20Z2sCOGmmO8csEFjAW75rAcdAJJubayzelTvQLCmFTsjsQYCqTLSqzFK5S0OEdvjXQAVI
	1SDz8mxYIPXgDmMQGdbHfrsKBYCMTzB4NbvWe7cendnkAMZ4R46EN1Mg7U1Dfp3E=
X-Google-Smtp-Source: AGHT+IGVdzWUOBBFfiYOEkrEFkxq518/+eZQSkut23M7mdFO6PCXHW/ZlaBVEVa5d8CeUSl1+EFZEA==
X-Received: by 2002:a05:6000:3113:b0:3b4:9721:2b16 with SMTP id ffacd0b85a97d-3b776644006mr7913012f8f.36.1753710700431;
        Mon, 28 Jul 2025 06:51:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe61fasm99002615e9.8.2025.07.28.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:51:39 -0700 (PDT)
Message-ID: <6feef32b-4d1f-428c-9759-2d3318b0f224@linaro.org>
Date: Mon, 28 Jul 2025 14:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] media: qcom: camss: Add support for CSIPHY 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Add support for CSIPHY found on SA8775P (Titan 690).
> This implementation is based on the titan 690 implementation.
> 
> Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 84 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.c  |  5 ++
>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>   drivers/media/platform/qcom/camss/camss.c     | 75 +++++++++++++++++
>   4 files changed, 165 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e..bb5ebaa13ec8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -64,6 +64,85 @@ struct csiphy_lane_regs {
>   	u32 csiphy_param_type;
>   };
>   
> +/* GEN2 1.3.0 2PH */

I'd be nice to include the process node number here. Its not a secret so 
please add for the edifcation of the reader.

> +static const struct
> +csiphy_lane_regs lane_regs_sa8775p[] = {
> +	{0x0724, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x070C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0024, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0224, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0424, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0624, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x005C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0060, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x025C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0260, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x045C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 1.0 2PH */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845[] = {
> @@ -749,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = true;
>   		break;
> @@ -848,6 +928,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>   		regs->offset = 0x1000;
>   		break;
> +	case CAMSS_8775P:
> +		regs->lane_regs = &lane_regs_sa8775p[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		break;
>   	default:
>   		WARN(1, "unknown csiphy version\n");
>   		return -ENODEV;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff..f6a2ac385953 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 = {
>   	.formats = formats_8x96
>   };
>   
> +const struct csiphy_formats csiphy_formats_sa8775p = {
> +	.nformats = ARRAY_SIZE(formats_sdm845),
> +	.formats = formats_sdm845
> +};
> +
>   const struct csiphy_formats csiphy_formats_sc7280 = {
>   	.nformats = ARRAY_SIZE(formats_sdm845),
>   	.formats = formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index ab91273303b9..842e72b74ce4 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -126,6 +126,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
> +extern const struct csiphy_formats csiphy_formats_sa8775p;
>   extern const struct csiphy_formats csiphy_formats_sc7280;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3122a29891c2..ebc3b296bb50 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,81 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_8775p[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
Drop the dead newline please.

> +		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +
> +		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer"},
> +		.clock_rate = {
> +			{ 400000000 },
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sa8775p
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
Assuming that's done:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

