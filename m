Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4868284E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 10:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbjAaJLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 04:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbjAaJLa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 04:11:30 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C79146D7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:08:31 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mc11so17103080ejb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 01:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvZFGEb6ilNzMNhh9fv9IuXbqpfg3oT1c2jIZcF2xWM=;
        b=e4YvRLThIDW9v3B7U+tlfqyrqRGiLm7MG2HXLEFNLDpiTAcUFDAViKXBIBGw7jcwkb
         JfBWu2LxdK2tycGekl15QM0AHzRiO40LNHYzmhoudgsBXOoWK2UKVqfKeFWbZSJ4Lu9e
         2LKyedqhz9gesKVtlUFmBm1sH7qeJ7USTZuHqwn5XY7+Zp5SrfX9GwfIQbSLB0b+LVjC
         B7Ls/px9FoOf5F7NqS4cBgWBC9iqbzKCdusY8dg5oQdO7l4QgZmCFvSkhfscug8Pogmx
         UkDdXgJyqZgZLBGGPPv4riPbS8UkzDW6FKNDqxdxDv3Kd8FKnItHqQCaPH2kwWseiy2Z
         l8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvZFGEb6ilNzMNhh9fv9IuXbqpfg3oT1c2jIZcF2xWM=;
        b=e22dTC7GtaldOC/6EhpahdckAh2rF0AjKOpAlJutPna5jRajBh63YBd4GQBwYZ0QF4
         dcsWH+Rm0xrdSP2Ym0ic3x3zQ9Uw5ml9/m/E0C1NzsjEpaK40AAdR60rFSUBDVdWYmiN
         PuH238/KcLJlu5b5Zir+7hVv54KtjiRYay0IhayHs/3QSSIaJqK6IP2rg2cWMJaXxXkI
         RIItseNiuFUA19lSgIdj/HwyrXGwJS37w+V+A8GY+ZDDmd/W4qq2xtBu4aKPKRMF3t49
         o7A38lHSxQR6/SbAatHgbDh2NmPKFAfSaNeokn48rf6JPtb6PaVWVEk5Een9dihF4vtW
         9fbw==
X-Gm-Message-State: AO0yUKWtmjHXC5FzjTFYv76yJarduXQIZ1ksp6/hT2fEMJVtojgS8/j1
        Ib7BRQE8xUQ8lhFIHFjRwfXMtw==
X-Google-Smtp-Source: AK7set/fkCjMwPdeq3dbT7XzpDbaTpWYqO6zlWASza9z86yswhAQLidjpbkA5qSyCnhSfhfuixdc5g==
X-Received: by 2002:a17:906:9d18:b0:860:5723:a5e5 with SMTP id fn24-20020a1709069d1800b008605723a5e5mr13444218ejc.69.1675156026038;
        Tue, 31 Jan 2023 01:07:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c7-20020a170906d18700b00871f66bf354sm8000458ejz.204.2023.01.31.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:07:05 -0800 (PST)
Message-ID: <ad54c0b7-f228-ed4a-4a6b-33edb2af2c07@linaro.org>
Date:   Tue, 31 Jan 2023 11:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/8] clk: qcom: branch: Add SLEEP/WAKE fields
 definitions
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-3-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230130235926.2419776-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/01/2023 01:59, Konrad Dybcio wrote:
> HLOS-controlled branch clocks on non-ancient Qualcomm platforms
> feature SLEEP and WAKE fields which can be written to to configure
> how long the clock hardware should wait internally before being
> (un)gated. Some very sensitive clocks need to have these values
> programmed to prevent putting the hardware in a not-exactly-good
> state.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

(I think these fields should go to the same file as other CBCR_ defs go, 
so if you adapt the suggestion in patch#1, please move them too.)

> ---
>   drivers/clk/qcom/clk-branch.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index d8fc7b93ef6d..773f760a4590 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -41,6 +41,8 @@ struct clk_branch {
>   #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
>   #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
>   #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
> +#define CBCR_WAKEUP			GENMASK(11, 8)
> +#define CBCR_SLEEP			GENMASK(7, 4)
>   
>   static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
>   {

-- 
With best wishes
Dmitry

