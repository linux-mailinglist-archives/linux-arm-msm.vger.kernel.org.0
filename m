Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525FA4AEA6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 07:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiBIGed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 01:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiBIGed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 01:34:33 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE70E066E1A
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 22:34:29 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d187so2570704pfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 22:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OwHnp+CBrpknipruebBheU1nuu6L2xS3iNwKkt5hzSc=;
        b=fHiYoWvoB+Gab19/vejvHtO0ZlTBEXUK3diJ0NhY8IXdVk/N0v+UGR+BlOtuSa9LMH
         fV8Q4OxIzP0WK57293UqNQiTScEFW4NU7YCmlHlVonAFBpC1IMUIq8FKpG+r/5uIKwP8
         iH+KcXAO1PZ9fOAgd6HRYvN+KAbfzC7vMFtfY/HGQtiNGDo/QlDrdsbnRufYiS4EA+r1
         D8t2lXa0zwhm5wi0J82hk0F5cWF2gsouXwoXDSo+HJTSTLfm9fM2t1BQYhtkvM1Oibs1
         Y+8F3ZcX3v/exjMqf5iK0xa7M4tY+kvbGNUiAAMP5pOzFFfo5CxVKcjZ72+T1k7lOuze
         jDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OwHnp+CBrpknipruebBheU1nuu6L2xS3iNwKkt5hzSc=;
        b=F6hWVcyKmii2udLWQPqWSGaxYAvQnjhUUlJK+HooRho9KDOuTm7n9BgJD+wigJNX/s
         tRJkUe9amjCB74ts1/Wl+bphQgQk+8pMjHx8Wl3XU/y8NIqjsv0xpjAMRNBfU9UG8m5O
         0V7N96cjzMkB3gK6WhUR4Pi4IspiBY/P3rhe1uWAaVKSe1WX3s4BjSyAIuKJlu6uc9Cd
         oExHFnH7xXOsT5FcRiAJX4IMrwKhRh3eZusvF8tr36foEIo/5ac5BMmNenT2zMzDSUzC
         T6eckVl7McDQR7TaRv1AstO1ezTVn5XucxAQVPYp+/0bAspTbXSoA/Q7FIp5RZPNRnW8
         FWcg==
X-Gm-Message-State: AOAM530dJfNWlxjVnR/O2CSRbBIUiMxj5fWeTO0BTqDNice1blKLo4Mx
        Z5YBKPJfyrIpdlxEQUVqlhrutw==
X-Google-Smtp-Source: ABdhPJx52+9Dw5Vu5Ayd4PAzN+hfjEFuihoosOnlAsFNrrdNMnMsovfyUzU9vYmhNYbMXE+jGAZnmQ==
X-Received: by 2002:a63:3d4f:: with SMTP id k76mr749057pga.389.1644388468680;
        Tue, 08 Feb 2022 22:34:28 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id il18sm4889019pjb.27.2022.02.08.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 22:34:28 -0800 (PST)
Date:   Wed, 9 Feb 2022 12:04:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-nvmem: fix reading of PVS Valid
 fuse
Message-ID: <20220209063426.ckefdtpfroj5zsad@vireshk-i7>
References: <20220130114535.1570634-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130114535.1570634-1-luca@z3ntu.xyz>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-01-22, 12:45, Luca Weiss wrote:
> The fuse consists of 64 bits, with this statement we're supposed to get
> the upper 32 bits but it actually read out of bounds and got 0 instead
> of the desired value which lead to the "PVS bin not set." codepath being
> run resetting our pvs value.
> 
> Fixes: a8811ec764f9 ("cpufreq: qcom: Add support for krait based socs")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index d1744b5d9619..6dfa86971a75 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -130,7 +130,7 @@ static void get_krait_bin_format_b(struct device *cpu_dev,
>  	}
>  
>  	/* Check PVS_BLOW_STATUS */
> -	pte_efuse = *(((u32 *)buf) + 4);
> +	pte_efuse = *(((u32 *)buf) + 1);
>  	pte_efuse &= BIT(21);
>  	if (pte_efuse) {
>  		dev_dbg(cpu_dev, "PVS bin: %d\n", *pvs);

Applied. Thanks.

-- 
viresh
