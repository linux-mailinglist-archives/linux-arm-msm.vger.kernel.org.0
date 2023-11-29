Return-Path: <linux-arm-msm+bounces-2583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0F7FE162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36858B20C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 20:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829060EF6;
	Wed, 29 Nov 2023 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="kQpQoQWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A03D67
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 12:54:00 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b4a8db331so1544765e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1701291239; x=1701896039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKjbNQgXkGMeMvnSiazATvW5vc83bVG6h9HitL94um8=;
        b=kQpQoQWE3JvI6Sk1pwSmnEZjXE1b7nAjtCMMx0yuLuAL06QFPkhCoHrBGfj0cB69YL
         meYqE+W9sSmk79So2o4ueAM9W+h9hsbItFY4H3K0FmYbAehzaFqu8Nf3k5UCbuvukxZ7
         HL83XVh35lAlesmW93PkgcVUYIJqCfSUPgHyecXwzt41McLuB+uH5Pj8zCRJUXy/DqKl
         7Lyfmeqz9e8OencVfsU01vZFBg/k6RuYbyDtRbXYLic+hVupiisctJ/DpNFMexUvTW8R
         kttwpW4bKf0PrDv3/5d/+nAG6zKKgotHlgahLgWBxc64hZGoYB9x+mGtWl1eSzkw7hv3
         k5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701291239; x=1701896039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKjbNQgXkGMeMvnSiazATvW5vc83bVG6h9HitL94um8=;
        b=e2uotBLDcBwn9xK/7/kN1+i4dW2w9/BbCSCIuq4IJbNUd8ToVWE3N1Bwa61OsFHfk+
         lDIe9QrzmOLK4u/iiAFjvbROVzKYqoGq6eKCk/t/T3UySWbB+cWrzI8TU8uWJAsBuFJP
         qWWebjOvq9e5q0ahaWalV/RI9/+VW6HMcUZgUCMPXTQD2tk9C7EPeF68NFhUOMJm+Zth
         STMvKCSAEVT83G+4zbKEJvNgm/TEZdX+dGB34Qs2J5mm+BBeU4gxu2HvsBsCXxSB15Sd
         Qm3KNq05vsQxLSnKGvcY0Y7K37jDajc7nTPp1EfS1SVmhAtDG/J2OXhH4BEUv+CpNVVG
         ddGg==
X-Gm-Message-State: AOJu0Yw3jG1pgrgTXouTJWZ9YIMLHLN7mnzaE46CR977T3TEJAhoEXJB
	1pFQNcmHnuo8tYc/Q4Mgob6wsg==
X-Google-Smtp-Source: AGHT+IFJnxs03uHyKsQvS/eeVLg4bLJCJWU+N3Z26xmaV36HJAdD6+44jAtYpt4zRuMooN+P4N+XzA==
X-Received: by 2002:a05:600c:4ed3:b0:408:3c10:ad47 with SMTP id g19-20020a05600c4ed300b004083c10ad47mr12917112wmq.40.1701291238941;
        Wed, 29 Nov 2023 12:53:58 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b0040b2976eb02sm3351905wms.10.2023.11.29.12.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 12:53:58 -0800 (PST)
Message-ID: <cc8b9eea-ea4c-4943-a0f2-c2a791903440@nexus-software.ie>
Date: Wed, 29 Nov 2023 20:53:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] clk: qcom: branch: Add a helper for setting the
 enable bit
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
 <20230717-topic-branch_aon_cleanup-v2-1-2a583460ef26@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-1-2a583460ef26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 18:59, Konrad Dybcio wrote:
> We hardcode some clocks to be always-on, as they're essential to the
> functioning of the SoC / some peripherals. Add a helper to do so
> to make the writes less magic.
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-branch.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index 0cf800b9d08d..155818cc8d49 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -47,6 +47,7 @@ struct clk_branch {
>   #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
>   #define CBCR_WAKEUP			GENMASK(11, 8)
>   #define CBCR_SLEEP			GENMASK(7, 4)
> +#define CBCR_CLOCK_ENABLE		BIT(0)
>   
>   static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
>   						  struct clk_branch clk, bool on)
> @@ -81,6 +82,12 @@ static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branc
>   			   FIELD_PREP(CBCR_SLEEP, val));
>   }
>   
> +static inline void qcom_branch_set_clk_en(struct regmap *regmap, u32 cbcr)
> +{
> +	regmap_update_bits(regmap, cbcr, CBCR_CLOCK_ENABLE,
> +			   CBCR_CLOCK_ENABLE);
> +}
> +
>   extern const struct clk_ops clk_branch_ops;
>   extern const struct clk_ops clk_branch2_ops;
>   extern const struct clk_ops clk_branch_simple_ops;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

