Return-Path: <linux-arm-msm+bounces-48393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA05A3A1A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 271517A2BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA3426AABB;
	Tue, 18 Feb 2025 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYcnuSx4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D393199239
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893580; cv=none; b=EuOU1BRerxOqCDPY2S6lkhmsJAWodTfiUrbIKuYPT5u2+b3CSEdXBgV7E7JiMCskyy53KLh/aW6ObtmiL9PRgY1+dI54hGUmC8ZP8EeCS+drNCVru6/9X81wuu0dmH3UqghcJ0jg/wH/P1aXcrRuZLOPA8cMArTiJQ8UytIVXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893580; c=relaxed/simple;
	bh=natQqwqvpTM4A8Kit7p6e55YJWa67GNvNJc5yP+W5xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNQrkOaR4UOxXwXTPrIKn/ENrUyoHyUaCmuWibPZesD1zpTAgaog3WjSDtJXTV93EE1Tki1fV1EeSRCuBOuMJOApGcWBlnmUO8Yy5bigZ6Bem/Rz6um/gt9dopvBCzO8O2zuwN8/Qu9wMVMo3nTMtmYdVBDUtUWHEsurt+GY5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYcnuSx4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43996e95114so5185825e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739893577; x=1740498377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzXPNVEIO0ktgw6x8v211u9KQdCOQpvJxEt97diBw0c=;
        b=jYcnuSx4Fx6djgpcR16YuqSPbz4DCFvhXtqBgl0h8hsIG4zZnZqnuzYvVb0c+0m0oj
         mz/h1WEtYQyrEmsj6zEV5RnzMD9V/33csitKZe7C9zaOBfCDpaVFXEAa2TZji3DOMHsC
         rNxLIVWZOeDCPO5T1qYjLxsqaGKqLo2mAT3Y1aBl6PBt9UHJNp0z/r3TSaIZZzNccaX4
         kF/bBCK5rd6tmPvvKOTe0ne+Vywi4xT4NHPMxSKAnEXl5YSN7G0zTLSmJwixakp2A1eT
         ZO0MB8AnAwkXD6aar0uaIVnl/M7t7aZg33R+GSGueSiHR3BrVcNQkOBc+VQEsB8WYEfm
         5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893577; x=1740498377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzXPNVEIO0ktgw6x8v211u9KQdCOQpvJxEt97diBw0c=;
        b=YN05h6KDZnBdKqRvwvB6fIiT6Dk+DUTixVBNAR6g+5JTguAl2BdzyNIJCY5qa32Bz0
         swnZ52LDOEebSdK3AdwBUhzyXYxzeMu9k8EAGoCqqR7k96EByYIty0/+Eo+CDvymRAOE
         VaOMy4fzQMmoSy1YYHYwjR/E3W7vDSXfwW4xRSbDjXem2WpF6lRZe3cpS7LSIVlZ0lKS
         PMNBDEajTLH2O9tOz9/DLMIkNKjYvniYs+QbKjgxsAML1MuvwmrKiqbYGL/jPWiGOsyN
         BGJUSzNGsMDWZd8Q1yjwpFhnYkmWtwjEtGNv2lx2eQPZ6GiuFG8GuuRjAeM3+6j97xRA
         1UVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMrDz+v1mfS2fZ4VIcg3LQj2yVupungAbQgeizV35LJfcNocH9NWlBFpnRLFauI2WSQU+PuOop+cs6fbzN@vger.kernel.org
X-Gm-Message-State: AOJu0YxYU2c2iTvIwujtMXUSbeMhrrziec8krM6zU9wQW6C+CGG/84K2
	uqvsSnmugnO8G71hs6tia9BTPdNKXLUoNy1nFcgnQhNk0Gk2EB4iZw3LeV9pGIo=
X-Gm-Gg: ASbGncthYGOsEqD78Gt0jOrQn5X4LsSONF+JmAiC1YKGJQKGGI+n2RP1Kr5xj8gwVHz
	6Ynd8HvYswWpS6GrGx5hr/AEwyimhQXntcCiz8WsYQfZGf5EfNzBNTnu6n6gSJccjlJbi2D/PGd
	YDnsuplQdo0JLUciXTKkqThDqDTDpuf0EmxllK2v2M2RHC3SvpMkrlV7rboh4jt3vMPNUkW1Ezn
	C3+2ubYB7u7uIin5Nwyuqk6s05piFYaRYIzxAdWBwQeZVn75bXhtP6lVdGeaI/6fMxNJ7TJvNn7
	gwHMLO0iql1qJGS0G/nSw5U+vvzjV/96pinKomWVlXTHnEcOE+t3Mvyf
X-Google-Smtp-Source: AGHT+IElh5d3sTutspymotVQAtk9NGNlV45zvDe426ZYEjVuuh1cgCu7k0Gx3xBQRtNoHXBzuxtrCQ==
X-Received: by 2002:a5d:5f4d:0:b0:38f:31b5:b33e with SMTP id ffacd0b85a97d-38f33f43726mr15149054f8f.35.1739893577459;
        Tue, 18 Feb 2025 07:46:17 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7fe6sm15067537f8f.86.2025.02.18.07.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:46:17 -0800 (PST)
Message-ID: <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
Date: Tue, 18 Feb 2025 15:46:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 14:26, Jagadeesh Kona wrote:
> During boot-up, the PLL configuration might be missed even after
> calling pll_configure() from the clock controller probe. This can
> happen because the PLL is connected to one or more rails that are
> turned off, and the current clock controller code cannot enable
> multiple rails during probe. Consequently, the PLL may be activated
> with suboptimal settings, causing functional issues.
> 
> To properly configure the video PLLs in the probe on SM8450, SM8475,
> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
> Therefore, add support to attach multiple power domains to videocc on
> these platforms.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>   drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
> --- a/drivers/clk/qcom/videocc-sm8450.c
> +++ b/drivers/clk/qcom/videocc-sm8450.c
> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>   	struct regmap *regmap;
>   	int ret;
>   
> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
> +	if (ret)
> +		return ret;
> +
>   	ret = devm_pm_runtime_enable(&pdev->dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>   	int ret;
>   	u32 sleep_clk_offset = 0x8140;
>   
> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
> +	if (ret)
> +		return ret;
> +
>   	ret = devm_pm_runtime_enable(&pdev->dev);
>   	if (ret)
>   		return ret;
> 

What's the difference between doing the attach here or doing it in 
really_probe() ?

There doesn't seem to be any difference except that we will have an 
additional delay introduced.

Are you describing a race condition ?

I don't see _logic_ here to moving the call into the controller's higher 
level probe.

Can you describe some more ?

---
bod

