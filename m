Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99B46787BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 21:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjAWU2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 15:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjAWU2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 15:28:25 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C385B88
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:28:24 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v10so16029863edi.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDBvtTwmNjrhK6lLug0V+Hi7SYRB+PFPx4pB07r9nZA=;
        b=PqyGw6DxB7zjILHaD4PLOzE+EwTLYl3bkjqt9t4dPQnPTT+dxjlSB5r1j+5jqcfbg/
         2c5PReRMGtUHRrKWjEguB0xXTNb6RQzdukQxmfk9ruHR1ceBrQrFq0oFbydHe3APVdZP
         tswjbr85JZynAVzOL4c5AIptKEJ5rJIK4BAxFZukCkdvygfFiVx/ZVYDwvF47q+Yq7Mu
         VrS9ESFY34CvVwabVpd21X9JLCSoVaEhdeB7f4AqPFypmvQXrE7IdYi5wHianIYW3wqc
         nnDmRXpnEq9O7HOuib/xkEAWY3iD4q18Surbso3p5hvfd5E5Q1NENoLaYBD4/BvAxMSU
         04Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDBvtTwmNjrhK6lLug0V+Hi7SYRB+PFPx4pB07r9nZA=;
        b=zxh17lM/LPcWauN7qxaiR3X5D6Zc08UQZKB+RNwsTh3D36NJoRMip9tJ7XwMABa1hY
         PsUdcv/2f2+pFVBB+woTDUwStah0MDedNaMjvELF0YTHX39yj6KBvEBkP4FAc7uULoRz
         S4JlJzQ9N0rCUtr5MuzemmgZP6pYhm8hSVMcycZreXBfU55DtFofDFgv1GodVoZ3tEe5
         wHSK4Q7ABY3tQwtTqEJXKZwcPpqfkyX3XNx1la0MUddbqSvsk+KIZ3DhKP/Rzk2EcF6Z
         4uP41N2datur63GdFxU7undCwXRdyoOOrcifI1cedNkQEuiohgnxqe4AsD1S/u4lJtjU
         S5zg==
X-Gm-Message-State: AFqh2krTPe1e2clmtU4CKCw9ScLSlUM45bOiM009qA5QpUr4EzP001dh
        1plu63qaIEsx5zNV+GQjOByjnA==
X-Google-Smtp-Source: AMrXdXt+s9H65FrH4rXwFlX0dSme/wEf8z8RVcTn3ETUYvEJ5nzPiIfK3709z0ycUV/UYjavuXhVDw==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id ef11-20020a05640228cb00b0049edb431722mr12581368edb.18.1674505703277;
        Mon, 23 Jan 2023 12:28:23 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id b4-20020aa7cd04000000b00487fc51c532sm166081edw.33.2023.01.23.12.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 12:28:22 -0800 (PST)
Message-ID: <e20498a2-15b8-4211-0607-32b62b0c0a62@linaro.org>
Date:   Mon, 23 Jan 2023 21:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] clk: qcom: cpu-8996: add missing cputype include
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 21:18, Krzysztof Kozlowski wrote:
> Include asm/cputype.h to fix ARMv7 compile test error:
> 
>   drivers/clk/qcom/clk-cpu-8996.c: In function ‘qcom_cpu_clk_msm8996_acd_init’:
>   drivers/clk/qcom/clk-cpu-8996.c:468:16: error: implicit declaration of function ‘read_cpuid_mpidr’ [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index ee76ef958d31..40c4dabc20a7 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -49,6 +49,7 @@
>   * detect voltage droops.
>   */
>  
> +#include <asm/cputype.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
