Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CEF5BF799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiIUHZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiIUHZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:25:04 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247B843623
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:25:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so1326880pjk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1v5EPGQat5Z+jf2gG8XAit2s3FgVQMVuinEhzqXFGSo=;
        b=cmH7YSyEUbBgIUgBiCNYZKqsx/QPe1rJJYtGbrSLSvu1pqW4RIlhtkJ+ocl2NUPx8A
         Lsifq9X5SyOQ75HFeY6XsRayQgR8vXEfPPl0QhAvp2GXhB2vvNGGB5UYvJzCbgn1Qfu2
         rgp2hDJYGrQ5DKnX37yUZIx3Nopa4ixdfmPMEhpRLdyIvbetxf2XIMJP+JEY96wbuxMW
         IcZg1ylIANMlzPgS8A8/rQbulCJf3gXejGFY4H8mLTNocMsYSXIEJ9YN0OYUaltCdvPy
         NTjM9RsBxKhluBkTIt5iXj1GCCVt3P/cmhV6XJZ7nQ32eHO8xRQYDaTVfCmc4/K/rCmR
         8q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1v5EPGQat5Z+jf2gG8XAit2s3FgVQMVuinEhzqXFGSo=;
        b=WgagEJLkjCXrEHuvoLumcUodfE/OM6LtF16IA/1afSOFWM+CPWeHp/rRsAIjG/Cwea
         99h/XaryGysX+HiLzcoAoK61TPv1QzNULLQsndRU0nIzuS/czwe+qd2PqQDrbiaMT9hz
         Tm9YOG1ZtVxT9xvJDvsifjHdBob13JBdXULbscRKDl5pb/H2i+jjvfvevLbeygSpZ4Eq
         yQw1N64YGToMS5bs/9RvYiNjfxwQEb/I96qB9jdllVrVLcjUXJk7WKPWnqlIAH20RpmK
         oa557dpfxcBjjwE3R/dBuBsfnS11Ik4Un+8MefpacO/NoI8ZqjdRnARHprMkD2sCCM67
         S09w==
X-Gm-Message-State: ACrzQf2GvUBMnaqSLa2mELkVjNL9R1VOIOAd2nhi+167p5WXrO3y6zS6
        RIAzPs/4uvhNCbgqRcyzJAWMGg==
X-Google-Smtp-Source: AMsMyM7teaAK3gjGJS1o3OsMo9NQFi1LT7D6LKMJ5hZX6cYLXk3NyjpOZLfJxXcs02GwP9IMEOm6uQ==
X-Received: by 2002:a17:90a:d3c2:b0:202:acc2:1686 with SMTP id d2-20020a17090ad3c200b00202acc21686mr7991353pjw.126.1663745102521;
        Wed, 21 Sep 2022 00:25:02 -0700 (PDT)
Received: from localhost ([122.171.20.238])
        by smtp.gmail.com with ESMTPSA id f9-20020a63f749000000b00434e57bfc6csm1174367pgk.56.2022.09.21.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:25:01 -0700 (PDT)
Date:   Wed, 21 Sep 2022 12:54:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Xuewen Yan <xuewen.yan@unisoc.com>, mani@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     agross@kernel.org, konrad.dybcio@somainline.org, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, di.shen@unisoc.com
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Add cpufreq qos for LMh
Message-ID: <20220921072459.tkjxjil6okkcpl2g@vireshk-i7>
References: <20220915090515.1660-1-xuewen.yan@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915090515.1660-1-xuewen.yan@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Can someone familiar with the code please review this ?

On 15-09-22, 17:05, Xuewen Yan wrote:
> Before update thermal pressure, the max cpufreq should be limited.
> Add QOS control for Lmh throttle cpufreq.
> 
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index d5ef3c66c762..deb1219435a5 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/units.h>
> @@ -56,6 +57,8 @@ struct qcom_cpufreq_data {
>  	struct cpufreq_policy *policy;
>  
>  	bool per_core_dcvs;
> +
> +	struct freq_qos_request throttle_freq_req;
>  };
>  
>  static unsigned long cpu_hw_rate, xo_rate;
> @@ -318,6 +321,8 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
>  	} else {
>  		throttled_freq = freq_hz / HZ_PER_KHZ;
>  
> +		freq_qos_update_request(&data->throttle_freq_req, throttled_freq);
> +
>  		/* Update thermal pressure (the boost frequencies are accepted) */
>  		arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
>  
> @@ -413,6 +418,14 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>  	if (data->throttle_irq < 0)
>  		return data->throttle_irq;
>  
> +	ret = freq_qos_add_request(&policy->constraints,
> +				   &data->throttle_freq_req, FREQ_QOS_MAX,
> +				   FREQ_QOS_MAX_DEFAULT_VALUE);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to add freq constraint (%d)\n", ret);
> +		return ret;
> +	}
> +
>  	data->cancel_throttle = false;
>  	data->policy = policy;
>  
> @@ -479,6 +492,7 @@ static void qcom_cpufreq_hw_lmh_exit(struct qcom_cpufreq_data *data)
>  	if (data->throttle_irq <= 0)
>  		return;
>  
> +	freq_qos_remove_request(&data->throttle_freq_req);
>  	free_irq(data->throttle_irq, data);
>  }

-- 
viresh
