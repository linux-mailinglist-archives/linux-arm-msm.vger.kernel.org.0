Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A3073E0C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 15:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjFZNgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 09:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjFZNgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 09:36:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9100AE7A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 06:36:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso1252464e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687786574; x=1690378574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUaOVbGrLmUdKtbdRSelS8yeyVs/S2d4eFpINDGmx+s=;
        b=VPdYu1/kNJQEDNNFz/pDyAWlF+Hr7rG/NFFgvctw1MMosXDz3aYEunah1cgAGYpS2o
         B5IDZ8/1WfrRmAfmXzrhnZuHOnwUyzKpenc6/S+u+H7Lvor8KbFZB1hfqYlF0xkA8OQ+
         QHf4luiEKgP3L5ZZ8h4PfynG30jXovv3483jWuENaTNJrzbjiKLdzQKCSFGG/w4kH4v0
         Y4ezLsQc1g5R5ZKg6mv6rHeH5p7f3So2PKOiF121+9CmTYVUBivuyqqObnWgk2Ask6fj
         Gq2RQM4MAILH676BIPG2POZwC8E4jfMG431pf8UMtmHRdzD3BthdGn2d4dw+UnWp5N4d
         jvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786574; x=1690378574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUaOVbGrLmUdKtbdRSelS8yeyVs/S2d4eFpINDGmx+s=;
        b=fzPhelRoJL0jl5jV8B3vnhW8zOmqYgmxmT+4DLi/bSzQ25Poi1beU7h2g/YOk75I0J
         APtiq9Yf6d9nWKA0L3VthRzEDxVHLLrWEELUxFrETH1QlFS0yRhf+5xSzkuUDdmkBU5q
         N/XPdqoFMTsJ8lBcsLPP47UpOtmqgXgNIt1u2ENbLi9S6fc2Jbi0AzprRXo/xwZexziL
         tdL/I1t2zUGi5YYBHNj4ay3GwmZr9HxQy6hUjIvyYAx1l4dKpCNVnLGAsMQyojl3Ch+I
         7YClpij7Ljgs1vzBAoK1lNp/29xr6MHGlKCXU+ctx1fiEO9oZoFxHG3fo+sG2Ytz9+hg
         w3YQ==
X-Gm-Message-State: AC+VfDwRPKx3Sf6JVwzU/n7lhVbOadgf7rkyiK5iSLPaVSUHFiGu70vZ
        gK0Ljp2W4uUtyqCw59wG/5B1ZA==
X-Google-Smtp-Source: ACHHUZ6+l1Qzmq7jLH9MIL0J4iG3m5HOKc0Yu2i2BkiHU3OsTZNqfFo17ZAAHXXbDuZnwOPaVZNzSw==
X-Received: by 2002:a19:434a:0:b0:4f8:6e1d:cf98 with SMTP id m10-20020a19434a000000b004f86e1dcf98mr12315894lfj.66.1687786573678;
        Mon, 26 Jun 2023 06:36:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u26-20020ac2519a000000b004f4b42e2d7dsm1109822lfi.230.2023.06.26.06.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:36:13 -0700 (PDT)
Message-ID: <ad2244a3-20b6-e126-c427-d535382d7d79@linaro.org>
Date:   Mon, 26 Jun 2023 16:36:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 09/26] cpufreq: qcom-nvmem: create L2 cache device
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <a15a2564-3b48-4592-1e40-2187ee89af1c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a15a2564-3b48-4592-1e40-2187ee89af1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/06/2023 14:50, Konrad Dybcio wrote:
> On 25.06.2023 22:25, Dmitry Baryshkov wrote:
>> Scaling the frequencies on some of Qualcomm Krait platforms (e.g.
>> APQ8064) also requires scaling of the L2 cache frequency. As the
>> l2-cache device node is places under /cpus/ path, it is not created by
>> default by the OF code. Create corresponding device here.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I think a generic solution (i.e. for each cpu node call
> of_platform_populate in drivers/of/platform.c :
> of_platform_default_populate_init) could be beneficial

Yep. I thought about it, but I saw no direct benefit for it. Note, that 
we do not instantiate cpu devices directly. But, maybe something like 
/devices/system/cache/foo would make sense.

> 
> Konrad
>>   drivers/cpufreq/qcom-cpufreq-nvmem.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> index a88b6fe5db50..ab78ef1531d0 100644
>> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> @@ -380,6 +380,7 @@ static int __init qcom_cpufreq_init(void)
>>   {
>>   	struct device_node *np = of_find_node_by_path("/");
>>   	const struct of_device_id *match;
>> +	unsigned int cpu;
>>   	int ret;
>>   
>>   	if (!np)
>> @@ -390,6 +391,25 @@ static int __init qcom_cpufreq_init(void)
>>   	if (!match)
>>   		return -ENODEV;
>>   
>> +	for_each_possible_cpu(cpu) {
>> +		struct device *dev = get_cpu_device(cpu);
>> +		struct device_node *cache;
>> +		struct platform_device *pdev;
>> +
>> +		cache = of_find_next_cache_node(dev->of_node);
>> +		if (!cache)
>> +			continue;
>> +
>> +		if (of_device_is_compatible(cache, "qcom,krait-l2-cache")) {
>> +			pdev = of_platform_device_create(cache, NULL, NULL);
>> +			if (IS_ERR(pdev))
>> +				pr_err("%s: %pe, failed to create L2 cache node\n", __func__, pdev);
>> +			/* the error is not fatal */
>> +		}
>> +
>> +		of_node_put(cache);
>> +	}
>> +
>>   	ret = platform_driver_register(&qcom_cpufreq_driver);
>>   	if (unlikely(ret < 0))
>>   		return ret;

-- 
With best wishes
Dmitry

