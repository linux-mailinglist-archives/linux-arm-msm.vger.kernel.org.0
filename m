Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5EC73DE23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 13:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbjFZLu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 07:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjFZLu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 07:50:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E14E4C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:50:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso2295637e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780221; x=1690372221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2tzRQVjfEFAkv6a+j4ihziY1pG0DDWMxsCERnHcVH8=;
        b=tbjOtW7FB7e8FeWkHRaoj/NHjxbiFpKhQKOgQschCLY8TRfKmEWNx2ni1WDugDN7Ph
         hysB2SIsETRdptxeYRB/0eyKKj+X/Z8kZ7BCsHC6Q82IzGBYdG4P93HOEc9EGRYu6mMk
         aN6ol+lTi6o763UGGMz/Sgs03C3cklMloedhCnkfaU6E84rqOyFXzfL9YQbZLuG94vj1
         vi3GAA3xZ4OPgKU3u4MSmDnu5sEl8wlCzi1tvv5woetyoyg1gLybkQJCGDacYZS0FXmT
         BjBeBnJjbRVe5RjjeDJ+cvat6x2g+q6cAmQaU9nRbnJzxCG6Fs0vJVP6bRqMjsIsaZL/
         kTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780221; x=1690372221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2tzRQVjfEFAkv6a+j4ihziY1pG0DDWMxsCERnHcVH8=;
        b=OxnpUAPkFK+X300mlCOcBQ0OwPW0yRc6EB2KQDuFKkAa0cH7oTtZba5Xw5Uyurqgvt
         loNN4xiBEpv3qykJwsCRq4NInl9/UHWq21etvDlOGSweXkd80JQuHQTrzo+JIUPlkEKy
         m/gkzaQ9Cuj07oAeQwqfWPDWWZUNrhNTJXdfyOc+6QKTaX5D7I9Um0eaws/WEopgFyd8
         8dZAu79yuzZ2x1FHxXjiAmWnphbS2NEdTMt+2dbOciuNAirUACqFm15pvk8xhjiWK7cI
         oYbgnF5gOOU/0bLzqJLff4AvqsXmlWpOjx5PFpDOQ/mh5igx+NpTzBSwWofF0XL2poeA
         b5KA==
X-Gm-Message-State: AC+VfDzkS7xXZgrWt1w5FFgp45B7FyDyOTHugXXdExt7Lbc62handtHu
        FrPMx41HCMS1eu/cIOAliPti6Q==
X-Google-Smtp-Source: ACHHUZ6SzzDTPj3jFJ8b3OFXFE7pFu2x//0Nma6gj243mMu++/bec0JH6RjfpXmv3M9TreAIJUuI6w==
X-Received: by 2002:a19:5e48:0:b0:4f6:29cf:c0dd with SMTP id z8-20020a195e48000000b004f629cfc0ddmr14949564lfi.8.1687780221013;
        Mon, 26 Jun 2023 04:50:21 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id d19-20020ac244d3000000b004f843872e08sm1070430lfm.143.2023.06.26.04.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:50:20 -0700 (PDT)
Message-ID: <a15a2564-3b48-4592-1e40-2187ee89af1c@linaro.org>
Date:   Mon, 26 Jun 2023 13:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 09/26] cpufreq: qcom-nvmem: create L2 cache device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> Scaling the frequencies on some of Qualcomm Krait platforms (e.g.
> APQ8064) also requires scaling of the L2 cache frequency. As the
> l2-cache device node is places under /cpus/ path, it is not created by
> default by the OF code. Create corresponding device here.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I think a generic solution (i.e. for each cpu node call
of_platform_populate in drivers/of/platform.c :
of_platform_default_populate_init) could be beneficial

Konrad
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index a88b6fe5db50..ab78ef1531d0 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -380,6 +380,7 @@ static int __init qcom_cpufreq_init(void)
>  {
>  	struct device_node *np = of_find_node_by_path("/");
>  	const struct of_device_id *match;
> +	unsigned int cpu;
>  	int ret;
>  
>  	if (!np)
> @@ -390,6 +391,25 @@ static int __init qcom_cpufreq_init(void)
>  	if (!match)
>  		return -ENODEV;
>  
> +	for_each_possible_cpu(cpu) {
> +		struct device *dev = get_cpu_device(cpu);
> +		struct device_node *cache;
> +		struct platform_device *pdev;
> +
> +		cache = of_find_next_cache_node(dev->of_node);
> +		if (!cache)
> +			continue;
> +
> +		if (of_device_is_compatible(cache, "qcom,krait-l2-cache")) {
> +			pdev = of_platform_device_create(cache, NULL, NULL);
> +			if (IS_ERR(pdev))
> +				pr_err("%s: %pe, failed to create L2 cache node\n", __func__, pdev);
> +			/* the error is not fatal */
> +		}
> +
> +		of_node_put(cache);
> +	}
> +
>  	ret = platform_driver_register(&qcom_cpufreq_driver);
>  	if (unlikely(ret < 0))
>  		return ret;
