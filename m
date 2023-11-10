Return-Path: <linux-arm-msm+bounces-454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FA7E7BBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 12:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72CD1C20863
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEB514F70;
	Fri, 10 Nov 2023 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwfP/TyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04414AA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 11:16:37 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181AE93D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 03:16:35 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso23929921fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699614993; x=1700219793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxkmO6IiYGO72UiX4UQ3V4i7IbbmznqMUd9OJsl5lng=;
        b=JwfP/TyNeSgQdlypAM+fHzwg8aFfvIPw8JDJszmWNtKt0J58mO0pekWEu8SBSZkcMm
         52OoNyEuh4610urXjKf+CYpZKAXfKHJ2uBug+rqix8sw0ZGaVwuSXiGDq/HRtiC4Slmj
         Z+4pNmgQrlGAIhglGkse2eivYkmbp8hNWHE7D0nLza9Rc3dT5TR3PtSBRjRySt1Cw7KN
         qJwGNsoAEH/7MYymG+4k0LvEDUs7QGSyz9+cv5w4aww2Y5WP8SS56+K6hXxVbp8wxloo
         +Ov1NGjHwkx+YD1bPdGiasDkTA+rXeN+/hYaPOZj0mjC5oEYLfy0b9F3yvAfPHgBJu9E
         vI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699614993; x=1700219793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxkmO6IiYGO72UiX4UQ3V4i7IbbmznqMUd9OJsl5lng=;
        b=QBhAYhAS7UEtCCkv7Yc8Fhp0vBN7vb1isFb6AvNYXAc8x30QBTgnaZrVH3hUKX/8xR
         9n5Az8Zq3MeqJ/8rfiZrnwfiEvnfsuw83okt+XY2vnCQ+mTxzSs0jJ1l17ydnBFDbsM4
         LmTkHb2cQ+TEXnXLEN4lhHvRAGDYUOEiLNTFRF7n9CWNNE4Q6ySsRVIfB/LpcoK7Bkk0
         XkDytSNq4t4yWz7WXxDzPnRNEvuO8ABTRM6oPmlXh4S/FzZwrY+57r7d0rIKEvZ+yjJr
         pgRuoEJoMpgTHYnrrWaYmcp/aIJC1rjog+SRklx5AnV6pEQ0HrWlYQe9oXO50F2aVr8H
         4nEQ==
X-Gm-Message-State: AOJu0Yz+md8FJasI4ONHwUhPJBE/oKFFKj4g2qVkiSxlbmyBjHdRiXOL
	9nfpwcbizoGdU+u4gHoaiP3o7w==
X-Google-Smtp-Source: AGHT+IHXTskzoQbtZ1PX/JfXAerX3f0kEvVd3Cs31EwwuZUMwgpO6YJA4nLPMZyYekHnMs37CNs3yQ==
X-Received: by 2002:a2e:8793:0:b0:2c5:5926:de4c with SMTP id n19-20020a2e8793000000b002c55926de4cmr6089246lji.32.1699614993290;
        Fri, 10 Nov 2023 03:16:33 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id gy15-20020a05600c880f00b004064741f855sm4759808wmb.47.2023.11.10.03.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:16:32 -0800 (PST)
Message-ID: <8457b113-bef2-47e4-a138-0f92a4f5798a@linaro.org>
Date: Fri, 10 Nov 2023 11:16:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: videocc-sm8150: Update the
 video_pll0_config
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-4-quic_skakitap@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231110065029.2117212-4-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 06:50, Satya Priya Kakitapalli wrote:
> Update the video_pll0_config to configure the test_ctl_hi and
> test_ctl_hi1 values.
> 
> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8150.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index 6a5f89f53da8..ddfe784fb9e1 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -33,6 +33,8 @@ static struct alpha_pll_config video_pll0_config = {
>   	.config_ctl_val = 0x20485699,
>   	.config_ctl_hi_val = 0x00002267,
>   	.config_ctl_hi1_val = 0x00000024,
> +	.test_ctl_hi_val = 0x00000002,
> +	.test_ctl_hi1_val = 0x00000020,
>   	.user_ctl_val = 0x00000000,
>   	.user_ctl_hi_val = 0x00000805,
>   	.user_ctl_hi1_val = 0x000000D0,

It would be nice to get a better description of this change.

Reading this - I can see it does an update but, the commit log should 
contain what it is updating and why plus what effect the update will have.

Please update the commit log to capture that data and +cc me on the V2.

---
bod

