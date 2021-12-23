Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C3F47E624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 17:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbhLWQHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 11:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhLWQHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 11:07:10 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AD0C061401
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 08:07:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q16so12392832wrg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rxEjUb6Qn89280k+7Zt6OUH8U2OUYy41WKS8zsirLAw=;
        b=xHzHei9//fex7+/+Qz6aHz07Ww7cOM2vc58Z5Pf1EYzWIRS0j7iOcnwY7lwtXs42F1
         FmlFpHltlBJnpTCZEkWLGe3Q5XCtkgu+ULIWXacqzFR44NJ11kBh6NBJimgV8SkP0tk5
         ZqvYc+7VSxRaiM/zolxcgaxQP+D32f27TX/3eNPpthUNSBprijGMUEcnFACZQFJFk92D
         ahRamY+iKmok4CV1a4yKvOsvLF/X1bmjB83gUW2SQbJzLLco0xqclr4D2du3cVubAGp5
         5af7K3sdYjjd8iMBX8tJcLLdvq7x+M5J3eIZGu5z3JvNOU+INaLQeRu1rdOqoiPP9EXZ
         vgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rxEjUb6Qn89280k+7Zt6OUH8U2OUYy41WKS8zsirLAw=;
        b=KK0NLIUD9nhomKbB7Y/XNgl/KPLQrRSS9cDKZZT0RyvaPToU/4wM7GrWWfwDJ50JG/
         q80xvg7/0QRBar55UFc+GxWe6frcXPDOgWrkJmYZmQeE7HAXpU3RAvlH9CEDuf+6Vwvx
         jIK2XewjkBRFEflxoPtET+KMjhVcK6M0foWJ3CiqON9yYe7Urxu0eW53WbQ9pMimEche
         gWmfLCp5lk7DGjEv63Xpemyoprzq4yhq6FW2BwNyyO01O8gIL9dCfPosHoJC7iu11RXg
         Gej3G+h/k6eC5s9aRuEEf2i8rvTv0pSxgq3eQyIzSmB9nsrsyZrQ917JJMQsHEhZKNVC
         PW5w==
X-Gm-Message-State: AOAM533vGeNBAuhStc0lievr2SpWv5OWjaa8ft+qE6Dj/2t7mDvLO6w0
        j99Mcmeg4q1vnUX2Ob/Gr5WzMA==
X-Google-Smtp-Source: ABdhPJyR9gqTAbnDNPQKx+sj/ubsuJdQUSZjn0oVcB+nmCcbEWjt2suchfdEj4iRcglU7CXdDXz87g==
X-Received: by 2002:adf:fd83:: with SMTP id d3mr2058009wrr.600.1640275628530;
        Thu, 23 Dec 2021 08:07:08 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:34ca:f67b:b782:1949? ([2a01:e34:ed2f:f020:34ca:f67b:b782:1949])
        by smtp.googlemail.com with ESMTPSA id g6sm5367920wri.67.2021.12.23.08.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 08:07:07 -0800 (PST)
Subject: Re: [PATCH v3 1/4] cpuidle: qcom-spm: Check if any CPU is managed by
 SPM
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20211201130505.257379-1-stephan@gerhold.net>
 <20211201130505.257379-2-stephan@gerhold.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <227195e9-e5a4-31fb-9800-c8e9c0b0b555@linaro.org>
Date:   Thu, 23 Dec 2021 17:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211201130505.257379-2-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2021 14:05, Stephan Gerhold wrote:
> At the moment, the "qcom-spm-cpuidle" platform device is always created,
> even if none of the CPUs is actually managed by the SPM. On non-qcom
> platforms this will result in infinite probe-deferral due to the
> failing qcom_scm_is_available() call.
> 
> To avoid this, look through the CPU DT nodes and check if there is
> actually any CPU managed by a SPM (as indicated by the qcom,saw property).
> It should also be available because e.g. MSM8916 has qcom,saw defined
> but it's typically not enabled with ARM64/PSCI firmwares.
> 
> This is needed in preparation of a follow-up change that calls
> qcom_scm_set_warm_boot_addr() a single time before registering any
> cpuidle drivers. Otherwise this call might be made even on devices
> that have this driver enabled but actually make use of PSCI.
> 
> Fixes: 60f3692b5f0b ("cpuidle: qcom_spm: Detach state machine from main SPM handling")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://lore.kernel.org/r/86e3e09f-a8d7-3dff-3fc6-ddd7d30c5d78@samsung.com/
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Daniel, would be great if you could ack this patch and PATCH 3/4
> (the cpuidle part) if they look good to you. I think it's easiest if Bjorn
> takes them together with the qcom_scm changes through the qcom tree.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> Marek had an alternative fix for this [1], the difference in this patch is
> that it avoids creating the platform device entirely if no CPU is managed
> by a SPM.
> 
> [1]: https://lore.kernel.org/r/20211020120643.28231-1-m.szyprowski@samsung.com/
> ---
>  drivers/cpuidle/cpuidle-qcom-spm.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
> index 01e77913a414..5f27dcc6c110 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -155,6 +155,22 @@ static struct platform_driver spm_cpuidle_driver = {
>  	},
>  };
>  
> +static bool __init qcom_spm_find_any_cpu(void)
> +{
> +	struct device_node *cpu_node, *saw_node;
> +
> +	for_each_of_cpu_node(cpu_node) {
> +		saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
> +		if (of_device_is_available(saw_node)) {
> +			of_node_put(saw_node);
> +			of_node_put(cpu_node);
> +			return true;
> +		}
> +		of_node_put(saw_node);
> +	}
> +	return false;
> +}
> +
>  static int __init qcom_spm_cpuidle_init(void)
>  {
>  	struct platform_device *pdev;
> @@ -164,6 +180,10 @@ static int __init qcom_spm_cpuidle_init(void)
>  	if (ret)
>  		return ret;
>  
> +	/* Make sure there is actually any CPU managed by the SPM */
> +	if (!qcom_spm_find_any_cpu())
> +		return 0;
> +
>  	pdev = platform_device_register_simple("qcom-spm-cpuidle",
>  					       -1, NULL, 0);
>  	if (IS_ERR(pdev)) {
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
