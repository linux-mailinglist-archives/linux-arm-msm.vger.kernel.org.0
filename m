Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C453649ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiLLJKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiLLJKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:10:34 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5294C65A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:10:33 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 1so17476959lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkLGM2uwyItM8I+FnYvZzjred3GNg8nnUV4NP51/xSw=;
        b=Nc+CHtmO4lVvjhRna3lpri4/p0/cQlA79ZXaGi26sRNB+iQuMQqygHVjDB9FkpNPbp
         ziWXtBzt/auUZKTgkks0c2cIN4vd7aLdy6xD3YDrKiHMQvGaAiG5gLa6fU8S7GvhRSFL
         uyxyY887tuWtGwHiMWoWpwCSMPc2x++KCL7QWFf8U5eQ0ctIAN5mHi2/egEFOGAsI2/q
         GLOH0Og3kuULpSTAdJM3jsCraKs98vo5wfd9a//0vLL9orfhShmlVK72qTJKtU3W816p
         8D7HZqqN7ee+EMZGEOPsYdYWPq4mS09VTl1U5d5zAvGZzDNQkU8aQc6GfOkRmYCLhKJs
         /XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkLGM2uwyItM8I+FnYvZzjred3GNg8nnUV4NP51/xSw=;
        b=AuSfw2ekr236PsJKmRNOvJUZwDkXF2RgKi4jc0L0pQRNTrAZ+oavvImzm8UtGYGRlp
         tygTxELDffHrW6Brca/wxomlgnaKK8rNBud345VMp+M+zdRAlvJXYPjg8oNllKWvwTUn
         5w6FZbWbCtNSs5NAZN5F1YVL/4VP4eYXZqzbqyspra/z3a0y2tB6w16y33jMMc6Ef+e/
         Cnb+jJ758cCTRmSsl7kr45v12R94Oae4WK7ZmZmju5CLS9EZU0O+UGo/fozJuDhWYkrK
         mYEnuzvfyhloMiyHUlqMp+Nzs/Diasso+wCZF1dnBDZmv2WyUnMaKitFenEigVDMCLl7
         c1UQ==
X-Gm-Message-State: ANoB5pktpY3783eYwbMfG7yiDHUORkd7puoOUUm8ru2FSx8vFvCS7+If
        2eiXf1sOgVpU/bJXlLQZSnXRng==
X-Google-Smtp-Source: AA0mqf5UvtMmw1dxtkOV5ZOcQtFFm6PJDe4rX4HG0akxKqGJN5yUdovvDy+DmDzRZRiB3jt68VD1JA==
X-Received: by 2002:a05:6512:3d12:b0:4b5:8f03:a2bc with SMTP id d18-20020a0565123d1200b004b58f03a2bcmr6657357lfv.9.1670836231679;
        Mon, 12 Dec 2022 01:10:31 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id v2-20020a197402000000b004a4754c5db5sm1554962lfe.244.2022.12.12.01.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:10:31 -0800 (PST)
Message-ID: <b83fa4ab-6311-668a-fb73-c65053690bb1@linaro.org>
Date:   Mon, 12 Dec 2022 10:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix reading "reg" with
 address/size-cells != 2
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        patches@linaro.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221209150759.396255-1-konrad.dybcio@linaro.org>
 <20221212064437.pvk3ynghuahxort4@vireshk-i7>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221212064437.pvk3ynghuahxort4@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.12.2022 07:44, Viresh Kumar wrote:
> On 09-12-22, 16:07, Konrad Dybcio wrote:
>> Commit 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during
>> probe") assumed that every reg variable is 4*u32 wide (as most new qcom
> 
>                                                         corresponding ")" is missing.
> 
>> SoCs set #address- and #size-cells to <2>. That is not the case for all of
>> them though. Check the cells values dynamically to ensure the proper
>> region of the DTB is being read.
>>
>> Fixes: 054a3ef683a1 ("cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/cpufreq/qcom-cpufreq-hw.c | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
>> index 340fed35e45d..22f48f789557 100644
>> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
>> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
>> @@ -649,9 +649,10 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>>  {
>>  	struct clk_hw_onecell_data *clk_data;
>>  	struct device *dev = &pdev->dev;
>> +	struct device_node *soc_node;
>>  	struct device *cpu_dev;
>>  	struct clk *clk;
>> -	int ret, i, num_domains;
>> +	int ret, i, num_domains, reg_sz;
>>  
>>  	clk = clk_get(dev, "xo");
>>  	if (IS_ERR(clk))
>> @@ -679,7 +680,22 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>>  		return ret;
>>  
>>  	/* Allocate qcom_cpufreq_data based on the available frequency domains in DT */
>> -	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * 4);
>> +	soc_node = of_get_parent(dev->of_node);
> 
> This must be dropped on failures later ?
Right.

> 
>> +	if (!soc_node)
>> +		return -EINVAL;
>> +
>> +	ret = of_property_read_u32(soc_node, "#address-cells", &reg_sz);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Reuse 'i', as it's only used later in the loop */
> 
> This can be dropped in my opinion.
Sure.

> 
>> +	ret = of_property_read_u32(soc_node, "#size-cells", &i);
> 
> Should i be initialized ?
Why? If this call succeeds, i is never read before being assigned
a value, and if it fails, the probe function will exit with an
error.

Konrad
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	reg_sz += i;
>> +
>> +	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * reg_sz);
>>  	if (num_domains <= 0)
>>  		return num_domains;
>>  
>> -- 
>> 2.38.1
> 
