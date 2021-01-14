Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B039E2F64B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 16:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbhANPdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 10:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729210AbhANPdo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 10:33:44 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF3AC061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 07:33:04 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id i6so5529283otr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CN9yyasN1oxiJuUILssDAKyt/f3/POyBWjHsMKxopUE=;
        b=haLehNxceNh0sZMnqyZ9Xs8INXb/FJbxtSizLpM+DEwdcF+HnASr+8VxC/SOFGCDHj
         gNr1tjqKKJJE7Iai4bvvkqNL0YshUPr72SgP7jpVjf2twHGSpFCLIEwu2UYLLZ4EhzH5
         3BAXf3PA+oy5JrmuKtkhkmkKYkY82f7SXcJZ5qDE0yhxhaH7dBMlmXM+vzBxH1AD1igF
         OP8uLbTVUq30eI4thlFdbO9Cyc7FZMB4HOaAnNUOCYBQqjgoEsibnsA2JrxUf1+/HefS
         FdKnK/9bgklMMzavMIkHkGjWLQ8yP9aQea8F4DVpv1HzGjmGky5m7Qo7g6Lp+fRchdzM
         K+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CN9yyasN1oxiJuUILssDAKyt/f3/POyBWjHsMKxopUE=;
        b=ksh3vOenCKsywpO3jnBbKPBVqCQTwU+g2iDO5PyIVr+leqfhj0/pAwuWScSCDTCMd0
         k0tnwnGAkqX1g0xdqIQxIjrAxyG9fyGCcNF1ToR2SO6v5SquucOa45P6nTwAEDdsBHsS
         KKKFiTKXpnZdS+UYAUcBaco60chzZecZE7UlNDjfwBFKlfaZC9LOvIizWqUf2uapEzul
         I5ZzXZKoqAjMJQqMOwIt9vyXTeMwKrYFw5ts/MdWZJoJeXurun0E6ALctG7nmnQrgR8E
         OEeNSXLm4SQJyQr/juXSP2FLgHzHoFjxVf7LwQ2ZnaNg3UpOy0ajq7vkahmPSstyGoFt
         1o7A==
X-Gm-Message-State: AOAM5312Al33H3O6GNNtM5obIoa3OrPjCu66qFafqPrfzEU3rMmHaTA3
        KQccQh0taamGxHLGwc1T6FFub5FH/ej4B6j3
X-Google-Smtp-Source: ABdhPJyUWxaztSGJAxUr/fYy2F1FrMg130a/TvQCsFZQyVEmeB9AGou56kWg67yR5hoki7h8lxyYXA==
X-Received: by 2002:a9d:3e2:: with SMTP id f89mr4963458otf.278.1610638383352;
        Thu, 14 Jan 2021 07:33:03 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id p28sm1119207ota.14.2021.01.14.07.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 07:33:02 -0800 (PST)
Subject: Re: [PATCH] cpufreq: qcom-hw: enable boost support
To:     Shawn Guo <shawn.guo@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210113065241.23829-1-shawn.guo@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <020d9f4c-d1bd-a2c9-60e5-97f3ed770ad7@kali.org>
Date:   Thu, 14 Jan 2021 09:33:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113065241.23829-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/13/21 12:52 AM, Shawn Guo wrote:
> At least on sdm850, the 2956800 khz is detected as a boost frequency in
> function qcom_cpufreq_hw_read_lut().  Let's enable boost support by
> calling cpufreq_enable_boost_support(), so that we can get the boost
> frequency by switching it on via 'boost' sysfs entry like below.
>
>  $ echo 1 > /sys/devices/system/cpu/cpufreq/boost
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 315ee987d2d3..6eb88463a24e 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -351,6 +351,12 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  
>  	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
>  
> +	if (policy_has_boost_freq(policy)) {
> +		ret = cpufreq_enable_boost_support();
> +		if (ret)
> +			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
> +	}
> +
>  	return 0;
>  error:
>  	devm_iounmap(dev, base);
Tested-by: Steev Klimaszewski <steev@kali.org>
