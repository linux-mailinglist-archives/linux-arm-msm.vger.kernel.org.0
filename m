Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD6344F4A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 19:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbhKMS4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 13:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbhKMS4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 13:56:15 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1A3C061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:53:22 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id o4so25039567oia.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rh7c+/1/CSnZX6IxhT7ftQzx0ERImx/7h2nk61oVkOc=;
        b=RpJcKtqt13lKT8fkNE4/gFWeOMS2/QMN74DWjHqLqB0hkkiAfO64wW7H5Ls7L3l3bn
         Yv5oSsQkhxd0kyL0jNvXk8rePr5RmyOCqAEwFRdOdLB8svlE+FCFRw4+87G16ddj2ks9
         y7Y7K07h/nD+wfzLGbWm4PD2qpZWjnA2VP/8Ikgz+MQLcINr38wvZ5kTo97JLJqSvUu7
         WARO36STeTwdF0qAZHfoex2Dn67cg1+JNutBnThhm4AKmwrn7gVApB60WP9sID4xshXY
         lE9xhFzw1jkAb+29HeNMJOtGTQoPBD65aslpNryfwKB70UN7YzQyXRWjKdrAUDl7YWbA
         CMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rh7c+/1/CSnZX6IxhT7ftQzx0ERImx/7h2nk61oVkOc=;
        b=SRyF5O4RA+yCINfmeSBhpxVlw+4mRplGALqZRvCUgXMdtkRMHnVZzYXi5i2PZv08Hg
         +7ji6IY40I4S67tUknkdm7duxLiGd6f7Ft1saACoZa/VHFdHJgytChVFY49jyOvSLLfT
         nevZOPZxrzdV5ZdJR940/ighsuwnRb16wwvJ4U5vkwiUfVhmIDviPGO2yW4ta7jnWreD
         fXAfiuk7DhRZ0ZICftJs1TR/AaAjm9dRiyuICCsBDqbmdm3aS+mE1YyFEEWDTquguedT
         f982eiD/ZiUZAaGhPYKkjbHxzAU2mJC+Yat9+ncQ3WY7zUXU8s+LGRe8fjVC9Cw9idip
         zghw==
X-Gm-Message-State: AOAM530Lhjff359ONJc1RPS9C5ZiqVhpkBFq3JU20qrJfADEbDZ48iYT
        KU2JhFjj53sprj5I/gwMi1Ax+Q==
X-Google-Smtp-Source: ABdhPJyBTh06eH3ZFoz+dIWfV4UIt/kCZKNabsD27X+vUEBneDniR+o2MMFlnUs3ixohLNoKxO52Hw==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr33839229oie.41.1636829602144;
        Sat, 13 Nov 2021 10:53:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o2sm1962387otk.39.2021.11.13.10.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 10:53:21 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:53:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH 1/3][RESEND] cpufreq: qcom-cpufreq-hw: Avoid stack buffer
 for IRQ name
Message-ID: <YZAJnVCoY+jLv5u1@builder.lan>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Nov 09:48 CST 2021, Vladimir Zapolskiy wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Registering an IRQ requires the string buffer containing the name to
> remain allocated, as the name is not copied into another buffer.
> 
> So let's add a irq_name field to the data struct instead, which is
> guaranteed to have the appropriate lifetime.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for reposting this Vladimir.

Regards,
Bjorn

> ---
> vzapolskiy: rebased, added all collected tags and resend the change from Ard
> 
>  drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index a2be0df7e174..3b5835336658 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -46,6 +46,7 @@ struct qcom_cpufreq_data {
>  	 */
>  	struct mutex throttle_lock;
>  	int throttle_irq;
> +	char irq_name[15];
>  	bool cancel_throttle;
>  	struct delayed_work throttle_work;
>  	struct cpufreq_policy *policy;
> @@ -375,7 +376,6 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>  {
>  	struct qcom_cpufreq_data *data = policy->driver_data;
>  	struct platform_device *pdev = cpufreq_get_driver_data();
> -	char irq_name[15];
>  	int ret;
>  
>  	/*
> @@ -392,11 +392,11 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
>  	mutex_init(&data->throttle_lock);
>  	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
>  
> -	snprintf(irq_name, sizeof(irq_name), "dcvsh-irq-%u", policy->cpu);
> +	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);
>  	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
> -				   IRQF_ONESHOT, irq_name, data);
> +				   IRQF_ONESHOT, data->irq_name, data);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Error registering %s: %d\n", irq_name, ret);
> +		dev_err(&pdev->dev, "Error registering %s: %d\n", data->irq_name, ret);
>  		return 0;
>  	}
>  
> -- 
> 2.32.0
> 
