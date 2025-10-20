Return-Path: <linux-arm-msm+bounces-78062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFFBF374B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 22:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF6D24E1709
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52D82C15B0;
	Mon, 20 Oct 2025 20:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAZto7Ra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB229ACE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992331; cv=none; b=hhJ9/XdZ27JNNbWm/7m/6BUnYblSDeR8Z2zu4MsAp7UVVVNvyZDug9N+PwWvY2oxmr6NY8krkbTfSBGLEmMygAIjWxSLE7/ig7ZPE0romXuYqP7FpOsYIYhnwuN2FYUStfMrPX9T8pzPnFu6UfkIJdnQ9hOMXLEAX22CTO4vRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992331; c=relaxed/simple;
	bh=c7W7BdRslnUiINnTazMN+1bR68ND9emWP+ijC1QbHUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7sAv5Gh4XCPcF8GRG+tEIYOd7GeacHdpZMIkMT+qsRcgJi7i45W0/VjT3FoS5otzZD81vi9sTvlMybJTJ9fTW1uYuwpUpmh9Ck/EBJ18wfr42hTT8pjnq8635NY7IVVsEF3JDXCg7TdRbaeVqy+ToK0OAVvVAyCEOVgZoVaGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAZto7Ra; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711f156326so35077605e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760992328; x=1761597128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xV7aO91XA1EKltfEfLhh+WUtohK38h192UjKVGJnyJ8=;
        b=DAZto7Ra5LVhMDVJUtOePa+CHo4Fw9i+DiMXYMM5okH65ikjVud6QaGxhytpwpldZj
         pM2nOkcNu122J3yONuw955K3QVwhP1NwP3VHO39JOZtGkLyt9P3RL4mpIiofelnEMSAT
         Nm733M5WlhHK83ty3myzeDSwaaEF05i53JnMwhOAPl3ePFX8KQNCFGs7DEWcqaLcWPMl
         EDfh97eOAWdw9UqZVYe1BxqfYRYwo8hojFvHRB4vbUuNPZuXFO7CznDh1Cgh+zq2DxVY
         TBE5I6p2gg40X6n42qPpSO6IX1/QuCCtY0LKUUfmfrhlGqeWtKurZPgjF0uN4j57OwF4
         r46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760992328; x=1761597128;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xV7aO91XA1EKltfEfLhh+WUtohK38h192UjKVGJnyJ8=;
        b=PZFzEUEXGC7JZetWeB2yAw+N2inFns2Jnb4qSDQOiAeO/T4siDuUninlz+ZcpAGaEN
         5jBCsm8NhA5MW7BvSI8FdIo8EMfyGz9AAP7VvkFTZRpgaJIZhev+qZRCKJ9vsAFvZl5C
         r8nY0hc89zVijkBLNqsEnI2BR0KP++JB1EzerZi8OWumnc0CS8dQckEHTmXSYGYBH9hB
         AFl/WdReGuv03riXXGWn41MdLx5bVuqQKttMB8BVgKu39c6qqFjFZocjmZtVcDTGwS2a
         1FCC2LLoYLf/OfCZhwTPcR/xBbTJ0NtwVEGMiWASZHlwL78xwm6lzXkjlKQAJALEHedh
         RLoA==
X-Forwarded-Encrypted: i=1; AJvYcCVZG+5M1qtBdmUz6lQzSt4JyI2ajo6+qCEtlE2H8P5NYjJg37FflSn4k3HE/nuwZ2oAS8CJboXwHZJiIewi@vger.kernel.org
X-Gm-Message-State: AOJu0YywPQa+SXqnv+WnC9q3A1XLKAlu+311853kt9iUpSwy/Ep9akUc
	+kJW1plq7xf0TGExxlWCVcEvG1xNnizbgtw5O4akUxFeuPHfl/bdLhqHpDPECy79jbkl7aBKXoB
	wytok
X-Gm-Gg: ASbGncuYGmSJ/LiXxQQ9SPicTFUfBbDQXqDAvGTZKTLdCXRNpUec1SyrWNtO7zwxG3s
	nU5TQM3dj3TCdZnagja4zvQxoQbZuk2rX6KaPncx5/lvR2K7b933v6FzzT7tFFragN+rZXWJBKz
	b8sPFt8ZXcVR6tH8MXloPfQd2SM3/NCCdKrELf8XbTIQItA1+LqnP7E2D/wdVHx7/RY1e4xx9fy
	9gJe25lZ21IaqI1+PRs3GZzAnsqFabiyvJyRu9KaHlJu3zxwWu3Jjw2TncvC0SxW50tRnkJ0KbC
	Ux+7BqBs7d2OaiwN5J+xFUpAZoUjF+3lPKVmzokrqwYHlAf1PaL1cYigQ3+DR8OrcXofFTHedY9
	rdDWLqMSyzQJ1J2E8t+JeumCuhXeNUYgQTdMIoN0e+Re6ufQNnSWTO3d3Dwgdb9DgT1AukUbeSK
	STjo2//fO/K4yLhN+heIExbLch2WXDL3j1WBMBmegG5NKVvN00lfRepm+JBSDIoSKZ
X-Google-Smtp-Source: AGHT+IGI2eFhwjI+QH/KTsQ5wDZc9aBnGwoN0mcHqpwVZHLVrlHx8oEYO8R9GZvWc6oAOVbJGMhxkA==
X-Received: by 2002:a05:600c:470d:b0:471:a98:998d with SMTP id 5b1f17b1804b1-471178a4ac3mr96226545e9.12.1760992328169;
        Mon, 20 Oct 2025 13:32:08 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82b8sm247669905e9.15.2025.10.20.13.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:32:07 -0700 (PDT)
Message-ID: <44a3b5ff-f909-41bd-87c9-760b90d3496f@linaro.org>
Date: Mon, 20 Oct 2025 21:32:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Do not enable cpas fast ahb clock for
 SM8550 VFE lite
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2025 15:02, Vladimir Zapolskiy wrote:
> The clock is needed to stream images over a full VFE IP on SM8550 CAMSS,
> and it should not be enabled, when an image stream is routed over any of
> two lite VFE IPs on the SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..fc838b3d2203 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2561,12 +2561,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE3 lite */
>   	{
>   		.regulators = {},
> -		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
>   			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>   		.clock_rate = {	{ 0 },
>   				{ 80000000 },
>   				{ 300000000, 400000000 },
> -				{ 300000000, 400000000 },
>   				{ 400000000, 480000000 },
>   				{ 300000000, 400000000 },
>   				{ 300000000, 400000000 } },
> @@ -2583,12 +2582,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE4 lite */
>   	{
>   		.regulators = {},
> -		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
>   			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>   		.clock_rate = {	{ 0 },
>   				{ 80000000 },
>   				{ 300000000, 400000000 },
> -				{ 300000000, 400000000 },
>   				{ 400000000, 480000000 },
>   				{ 300000000, 400000000 },
>   				{ 300000000, 400000000 } },

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

