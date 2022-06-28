Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A36055DD96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243747AbiF1IKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 04:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243722AbiF1IKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 04:10:37 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E4F275E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 01:10:36 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q140so11467343pgq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kZkv6Jlrwh35MHTIjtOPv21sa2GMYWcCq7LHiDAT/h8=;
        b=hpnPePcefCJz0cdi2RTKQn4BpoC/SDqTqIneaIvP9repdx5B9vcyr9tlzMWyRY0jjO
         aYPSzovlqTQ+jhZn7IqAXfDPm81A9m5YRmmmTHslOcOchYuNLj07sD6HN/WKa76ib7bz
         U007F4anDG2sqM5Vjwe3bxzufOPTBO/J/iqbrflYggwmOemCzP4vts66ef4TPLcFI53z
         7zFGGvcH6UCF+UUnw70MjtHn8o7lpMgK2j+gB4kHf9HvAerDaQTisG0WrLoflHJhX/IS
         KxwijCunIWilVHeToKT5ytnCkE6ABnqDqFDNfrHBeKU4KZpoxq+U911c1a0YHZSA9b5m
         71CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kZkv6Jlrwh35MHTIjtOPv21sa2GMYWcCq7LHiDAT/h8=;
        b=mw4w8TSDccHJA5JxbZL+JV7f+cy3qhJGpLxJ/x1ughqKll7SBOxI4qttHGUOqiOJEz
         bYqZPMZsjH3EB1+Ev63WgoaR/wlcJTsi1RldLXUi+6cnhp5FeaNcjPYUi5UieridKJwE
         tZ0dTkVpN/um4eaI5qdubREM4yi5vJs93Tetka3gKxAZNLhSUIC7oNjCYMy0kO3xrSnI
         qcRSYAnFK6q6MHYx3uFVBLrX0hEXb6pzz5GoQq+8SHQQuCuh9GripDz5mZ+jwCqzbCc/
         fqvtFcun/AkXqqCqVhrGKhOrTLyJzq/S3/AdoGDA7YydnKZVxwSuQW+tUZe47to8kg3S
         YrMQ==
X-Gm-Message-State: AJIora9mJDzDsj0a4Bgn3vKkW55TkYSHTqyUyjT+HKU6aSHMGV+Jh0K/
        TmhCYJUP6siqW9560Asmp/sdew==
X-Google-Smtp-Source: AGRyM1vGlCZEwNwif5/zm1sdI7rWVOLoiPnoSYN8Wo98PvGwGetho2kj0PZBy9zgVAb54ELUjC35Sw==
X-Received: by 2002:a63:24e:0:b0:3fd:d5d8:9b91 with SMTP id 75-20020a63024e000000b003fdd5d89b91mr16483382pgc.458.1656403836265;
        Tue, 28 Jun 2022 01:10:36 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902820900b0016a11e839fcsm8574098pln.208.2022.06.28.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:10:35 -0700 (PDT)
Date:   Tue, 28 Jun 2022 13:40:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: use HZ_PER_KHZ macro in units.h
Message-ID: <20220628081034.bnqcxq2wndb42mrj@vireshk-i7>
References: <20220610075309.59608-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075309.59608-1-yangyicong@hisilicon.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-22, 15:53, Yicong Yang wrote:
> HZ macros has been centralized in units.h since [1]. Use it to avoid
> duplicated definition.
> 
> [1] commit e2c77032fcbe ("units: add the HZ macros")
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 0253731d6d25..7f118be969d3 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -15,6 +15,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/units.h>
>  
>  #define LUT_MAX_ENTRIES			40U
>  #define LUT_SRC				GENMASK(31, 30)
> @@ -26,8 +27,6 @@
>  
>  #define GT_IRQ_STATUS			BIT(2)
>  
> -#define HZ_PER_KHZ			1000
> -
>  struct qcom_cpufreq_soc_data {
>  	u32 reg_enable;
>  	u32 reg_domain_state;

Applied. Thanks.

-- 
viresh
