Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7149E64162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 08:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfGJGa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 02:30:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46784 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbfGJGa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 02:30:29 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so665457plz.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2019 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L2UuFu7XqMvM2r1vOn9PSk+syiHes80VSZWRI0KeN7o=;
        b=csvKeo3AFSwF0zvXaa7Nb84I6Hp1Rnfm2HabCf4Q/r/5wo6bjIb9wsBIb5ooDOBTIK
         diX/esesvK4hjIMo90u1BW6YAVin333lMooqSuIgDYkAzIrMou7LtcJiWK2phGIYvDwL
         TR1Yyge867FIL67j2G34XWWRJ7rxO5zUk6ZTnPvQYe2XttLceLcHwn5RuK7W3HMzAlfs
         aScdN/JD0V6vAHfy5681hhYzhVbZx8mfR0eePYuhL+xHfeMgosR7nc9DRa1blCrJSz43
         Mu7zXf1IIGpdVvnrRWjHHiLja5rNXPJ2wXkhDRoyfSArqQq1Pe7TNZ1FHlmzsBPbA0he
         nQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L2UuFu7XqMvM2r1vOn9PSk+syiHes80VSZWRI0KeN7o=;
        b=bUxnwxgZI+8BvgIBQLgjbj7MtqncKm38osPTbnq95yued6QC81tV8iSKBj/K4L4+nw
         UXMKIYFx2dQ6HbKVbJxC3e9NtRgWTpEjl9Y19/9FJA6ktWlg3BcAO4ikwbcgLKDo1nzE
         BPtIZ+JedVG2e4zIk7IqZpFpIgGXVjg8j67ENEmzkgCoNQ1da8VMmdLs/gilCdoeYPkq
         IfEs+CuWdVwBYvKXXowBD+eEEPVzmct4x7NXMJYvAcDO99yauXNInqt61e0tUsvb+eUD
         v1p2zQ2IYoc3s61oaqaU7x+r/w+afBGAPsvM7BjUzm0unkARHVl2op113nhRIGcsVvjD
         9bIw==
X-Gm-Message-State: APjAAAUhdfuFY6K9hUcwGAFgZs/FUzlvGBEWlCX4VPllx/T7gK7ziTi/
        Y08DgKTjtdAdqmWaJvaCZhZw1A==
X-Google-Smtp-Source: APXvYqykauyIqhVaUB25f/INL57OtdOvUb7VF5uzrbYjjTM0qNLZZF8nHJGHW0OIfH2Lpbu3ikeBTg==
X-Received: by 2002:a17:902:b949:: with SMTP id h9mr28473553pls.120.1562740228543;
        Tue, 09 Jul 2019 23:30:28 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id p68sm1979337pfb.80.2019.07.09.23.30.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 23:30:27 -0700 (PDT)
Date:   Wed, 10 Jul 2019 12:00:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: qcom: Refactor the driver to make it
 easier to extend
Message-ID: <20190710063026.7yyoxjsqp2ck3z6n@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-5-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-5-niklas.cassel@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-07-19, 11:57, Niklas Cassel wrote:
> +	drv->opp_tables = kcalloc(num_possible_cpus(), sizeof(*drv->opp_tables),
> +				  GFP_KERNEL);
> +	if (!drv->opp_tables) {
> +		ret = -ENOMEM;
> +		goto free_drv;
> +	}
>  
>  	for_each_possible_cpu(cpu) {
>  		cpu_dev = get_cpu_device(cpu);
> @@ -166,19 +195,23 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  			goto free_opp;
>  		}
>  
> -		opp_tables[cpu] = dev_pm_opp_set_supported_hw(cpu_dev,
> -							      &versions, 1);
> -		if (IS_ERR(opp_tables[cpu])) {
> -			ret = PTR_ERR(opp_tables[cpu]);
> -			dev_err(cpu_dev, "Failed to set supported hardware\n");
> -			goto free_opp;
> +		if (drv->data->get_version) {

Why depend on get_version here ? The OPP table is already allocated
unconditionally.

> +			drv->opp_tables[cpu] =
> +				dev_pm_opp_set_supported_hw(cpu_dev,
> +							    &drv->versions, 1);
> +			if (IS_ERR(drv->opp_tables[cpu])) {
> +				ret = PTR_ERR(drv->opp_tables[cpu]);
> +				dev_err(cpu_dev,
> +					"Failed to set supported hardware\n");
> +				goto free_opp;
> +			}
>  		}
>  	}

-- 
viresh
