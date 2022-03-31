Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BB34EE060
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 20:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiCaS3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 14:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbiCaS3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 14:29:00 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB8F13EA9
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 11:27:12 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id x8-20020a9d6288000000b005b22c373759so464418otk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 11:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ltc+KGlVJEt0ntKZaop9IdeQ3yCdm7349yM+jp+RRuo=;
        b=cc+ZVXQP7FDY5KQDGdKQs+rcUfhwNU0gAcxLBBu5/sff+pe5JZFIpnr6Vy3VnUuvMv
         MOWn+v9u9VxnGt9eHTUKDdznj6/gfE/pMTtKJFaKiCxa38VDUpEtEDjKYwSHZP+McZ5l
         ln4dlqg2Szf4TZzSRGgj35cBZI5oXiGkcBjWSmRI8jVtc5QBBd/gv5Zq26u8m6zv6hCU
         gRiN7olb58jRgBIeNF+3GlUftQrE7bFcbki3ohVi1kD/7U8QI0whJgPBzDHDa7Ei2iLA
         gJTNZ6z2nCDik7EYRMbfsznzKNhxYLmtEbN4iqfr2gGXC2Hgc0JWIm97MWRZS32kFOwP
         Rhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ltc+KGlVJEt0ntKZaop9IdeQ3yCdm7349yM+jp+RRuo=;
        b=4MxTejo71GlnlHziZsZX6t067fJKL9AQIh1StUsdYcugcW9H6Koy0Zo04sl8GG606j
         ks/+rOu5OaQfeFFlJ7PF77xb+lkKJ8UFcCAHbXF93zSfodezhiZbgPLPSm11gFrll2d8
         cskUWh+yaHjMSTkQ43Z65SnAOsNaGGo1EfVOwBHrbVDE6L6oZCQGzXALvR48K0WZ55dI
         9h5Tzl/xyiE4gf+Zd5+tzUVoZqdm35zvcU+J/vGwbHKc0C7y13/WgBeDt1McX51x8nij
         snk8OBx57QqskhBLgkJ4zib9g3jViHlwpVMq/mFecgI9sLxfWB00aX7/KVnZForxx6u6
         cZDA==
X-Gm-Message-State: AOAM531Jprq3A8b+gwiRZWdhWYJTutbGMLT1lbvp8c3jCcQhXMB0OvRI
        zTwHINJJyL4Vu4icUYc8DB0hqg==
X-Google-Smtp-Source: ABdhPJxmPd6T+iUYe3N8/CWnkB5yv5mWnv0+Jkw8c0FJ7oHe8wR49ZXLNETemi0tJ5n3zoO2dRDFrQ==
X-Received: by 2002:a05:6830:3112:b0:5cd:b92b:22ea with SMTP id b18-20020a056830311200b005cdb92b22eamr6228593ots.262.1648751232102;
        Thu, 31 Mar 2022 11:27:12 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l1-20020a056830268100b005c93e625b9dsm193004otu.46.2022.03.31.11.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 11:27:10 -0700 (PDT)
Date:   Thu, 31 Mar 2022 11:29:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
Message-ID: <YkXzFLqPHybqAXJ0@ripper>
References: <20220328112836.2464486-1-vladimir.zapolskiy@linaro.org>
 <20220328112836.2464486-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328112836.2464486-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Mar 04:28 PDT 2022, Vladimir Zapolskiy wrote:

> It's noted that dcvs interrupts are not self-clearing, thus an interrupt
> handler runs constantly, which leads to a severe regression in runtime.
> To fix the problem an explicit write to clear interrupt register is
> required.
> 
> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index f9d593ff4718..53954e5086e0 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -24,6 +24,8 @@
>  #define CLK_HW_DIV			2
>  #define LUT_TURBO_IND			1
>  
> +#define GT_IRQ_STATUS			BIT(2)
> +
>  #define HZ_PER_KHZ			1000
>  
>  struct qcom_cpufreq_soc_data {
> @@ -31,6 +33,7 @@ struct qcom_cpufreq_soc_data {
>  	u32 reg_dcvs_ctrl;
>  	u32 reg_freq_lut;
>  	u32 reg_volt_lut;
> +	u32 reg_intr_clr;
>  	u32 reg_current_vote;
>  	u32 reg_perf_state;
>  	u8 lut_row_size;
> @@ -350,6 +353,9 @@ static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
>  	disable_irq_nosync(c_data->throttle_irq);
>  	schedule_delayed_work(&c_data->throttle_work, 0);
>  

This should only be done if reg_intr_clr != 0 (as it is for OSM).

Other than that, I think looks good.

Regards,
Bjorn

> +	writel_relaxed(GT_IRQ_STATUS,
> +		       c_data->base + c_data->soc_data->reg_intr_clr);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -368,6 +374,7 @@ static const struct qcom_cpufreq_soc_data epss_soc_data = {
>  	.reg_dcvs_ctrl = 0xb0,
>  	.reg_freq_lut = 0x100,
>  	.reg_volt_lut = 0x200,
> +	.reg_intr_clr = 0x308,
>  	.reg_perf_state = 0x320,
>  	.lut_row_size = 4,
>  };
> -- 
> 2.33.0
> 
