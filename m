Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE543AA0E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 18:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhFPQKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 12:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbhFPQKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 12:10:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBDEC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 09:07:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id d2so4565180ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UN+MCy79+aiReyg4GmhXPJbyl4AxyQ+BCC6wVSMU3qs=;
        b=Xh67aMJn1kR5JF657nNTe4s9thtnLQHLX2MfVEslORURhsfZ1yBwTFI3FqmhNgPUB3
         JN1MaODmmYAE8L98FSFRYGOWKER02v7vjZQC0qTuudjXgff/PXkLctkRclqygeS8Q7Rz
         yQeMFgaXhDbEJu7iaC52+B1OpDj5w6suBbq8LjFoK5OMy9pNVBaNMJ3wzXB05IypkZpW
         AeAY60BSUeUoINW657ynzPcEj0tVdrHvArY5kUiKwE1FFgYbEP8tr30BLLyutfPJN1VH
         vrmruNLQEQyQeP++m/P7/OalSWRiGGfBZaxXwo6/DCGDmzBWH+Ajh+RHRGCTT42POUgS
         dJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UN+MCy79+aiReyg4GmhXPJbyl4AxyQ+BCC6wVSMU3qs=;
        b=F2zEJ6AxxcY6QgjeLtS2fxxosa3H9lt9OAKFg48BORHABdy6XXqJ0apjdPBnMcRkjl
         USbbQtDv2jHKp8VSeWJvEslYrFeqn4A6/+oK/hgbTNseLi6QQAmqn0sirN8sgPyEh6VH
         Kk5NxzNdaEaxLpZTao12XbmeMfnVp43oPqE6dL+4PlIeUoCki0Cl4hqQiIjRComHcPM+
         q16jtk+N9D/vRkk8MViLzmBuePmvVpiZcPtlvKx5y7z1hEF7BWdgyQFIsPIu2A+HNjz8
         JtNzff8YWN+gioulaNtjaAjvxBzkzpnjzQ7Lf9pM5ZJfTPrqNCdSX7BZIJk8gK3ZssnW
         +P5A==
X-Gm-Message-State: AOAM5334IDW8k4Tuos7knYBk4qumONKK9BjqbuJiG8Uu7H7tII/I062L
        hB7RGd2CpmH9FYgzL3sSvYcnQA==
X-Google-Smtp-Source: ABdhPJzR34d+/RTML7o8n2wnjNOlwYw3iPMzGh7qB07Op+cC0dHOoqVD/2S+NbcLjfJHYKF8CnUy3A==
X-Received: by 2002:a2e:858a:: with SMTP id b10mr465673lji.445.1623859673557;
        Wed, 16 Jun 2021 09:07:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x25sm286248lfc.305.2021.06.16.09.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:07:53 -0700 (PDT)
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b48198ff-a954-4941-32d6-65c992b345e7@linaro.org>
Date:   Wed, 16 Jun 2021 19:07:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616141107.291430-3-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2021 17:10, Robert Foss wrote:
> These changes are ported from the downstream driver, and are used on SM8350
> for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/clk-rcg.h  | 4 ++++
>   drivers/clk/qcom/clk-rcg2.c | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 99efcc7f8d88..a1f05281d950 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -149,6 +149,10 @@ struct clk_rcg2 {
>   	const struct freq_tbl	*freq_tbl;
>   	struct clk_regmap	clkr;
>   	u8			cfg_off;
> +	u8			flags;
> +#define FORCE_ENABLE_RCG	BIT(0)
> +#define HW_CLK_CTRL_MODE	BIT(1)

Downstream also has these flags for 8250, but the upstream driver ended 
up not using them for the dispcc clocks. Could you please check that you 
realy need HW_CLK_CTRL for dispcc clocks?

> +#define DFS_SUPPORT		BIT(2)
>   };
>   
>   #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 42f13a2d1cc1..ed2c9b6659cc 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>   	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>   	if (rcg->mnd_width && f->n && (f->m != f->n))
>   		cfg |= CFG_MODE_DUAL_EDGE;
> +	if (rcg->flags & HW_CLK_CTRL_MODE)
> +		cfg |= CFG_HW_CLK_CTRL_MASK;
> +
>   	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
>   					mask, cfg);
>   }
> 


-- 
With best wishes
Dmitry
