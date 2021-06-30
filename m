Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AEA3B7B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 04:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhF3C3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 22:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbhF3C3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 22:29:44 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3B1C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 19:27:14 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id x6so341100qvx.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 19:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tLMSH/BMB3uEymS7rzii/Xh6++aPv9O2DmjWt+eI77Q=;
        b=KKXjfX0zS+iZy8XOsNmPc2qONgDAEiLTLfA8c67gfaRXHxQr3aFCEcqUV3Iroa2tZu
         TCjA+HqRkgJy3daRNGTYdXJWQliVQYh7co/IyGPs0U2na35YoS8hGKmFZwBFqZcveoGL
         BjTvAg8VloasqDEwEhayNZBi3aZnO95wLkAAWItzAta+KlJEQLaikw9BJ9awnBNMQUYm
         1zX6rKLbGls5aCKBMeUI5/BUpV0MgLi1Xt0NkJcdR4RB+QhiTIFuGPUX5PkPl5dpbURJ
         9eZ6y7So/3JRn0Eib4mMtdmqDdOXqgf0LEBx7JO4X7EAcd4XgYSxVmCekmsQ4ND6YlCX
         50jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tLMSH/BMB3uEymS7rzii/Xh6++aPv9O2DmjWt+eI77Q=;
        b=cpCS/XNLOv4G2A83ICV0s9MnK8h2bVztivC3MX/l+oYALhErXJcwoxVZCpeOhJoaTR
         7ubPSXRXI6qyefNPR3NgzTXe4kwSOidIlOT1GSjybYPh1IM8sjV20SkNOhssDJC2EmdK
         PvaBhoYypzid+OJ8ETMxMws4/Q7+yxhmTBPfMpYlTtOT5x0UDLQou/TmsfRFz7Esl6k7
         OPC/0ovC4aGIXLMEK8u0CwM0O/SqAJ0h2eIQwGAwEez7f2cSi6s6jRyv0srl08amswgP
         et7Iw8esOg69xG/N9Mb9YtxnIzt/7WoayqscC8aFUCbn3auYWirXWD4SJEEIcephT+ZA
         93+g==
X-Gm-Message-State: AOAM531V+dLZNze55HRA6+WKAwshTJM6zMr8edqvDPocJaAbI4r4QRSi
        xDYH+6EY86DwOOUn+BWxL3uiEg==
X-Google-Smtp-Source: ABdhPJzrYhtmAlan5l1egUye4D6sjkG2tBt15IOpdEQlyL3tVN+CuPS33sx6P++iHlDtqd/j66Q/Zw==
X-Received: by 2002:ad4:4245:: with SMTP id l5mr31231802qvq.45.1625020033191;
        Tue, 29 Jun 2021 19:27:13 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id k138sm2548006qke.71.2021.06.29.19.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 19:27:12 -0700 (PDT)
Subject: Re: [Patch v2 3/5] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
To:     Taniya Das <tdas@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210624115813.3613290-1-thara.gopinath@linaro.org>
 <20210624115813.3613290-4-thara.gopinath@linaro.org>
 <34542481-09b0-ae3b-25f1-77565bf47755@codeaurora.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <d911a44f-37df-65c1-d38f-55f13e630540@linaro.org>
Date:   Tue, 29 Jun 2021 22:27:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <34542481-09b0-ae3b-25f1-77565bf47755@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/28/21 10:50 PM, Taniya Das wrote:
> 
> 
> On 6/24/2021 5:28 PM, Thara Gopinath wrote:
>> Add interrupt support to notify the kernel of h/w initiated frequency
>> throttling by LMh. Convey this to scheduler via thermal presssure
>> interface.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>
>> v1->v2:
>>     - Introduced qcom_cpufreq_hw_lmh_init to consolidate LMh related 
>> initializations
>>       as per Viresh's review comment.
>>     - Moved the piece of code restarting polling/re-enabling LMh 
>> interrupt to
>>       qcom_lmh_dcvs_notify therby simplifying isr and timer callback 
>> as per Viresh's
>>       suggestion.
>>     - Droped cpus from qcom_cpufreq_data and instead using cpus from 
>> cpufreq_policy in
>>       qcom_lmh_dcvs_notify as per Viresh's review comment.
>>     - Dropped dt property qcom,support-lmh as per Bjorn's suggestion.
>>     - Other minor/cosmetic fixes
>>
>>   drivers/cpufreq/qcom-cpufreq-hw.c | 103 ++++++++++++++++++++++++++++++
>>   1 file changed, 103 insertions(+)
>>
>> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c 
>> b/drivers/cpufreq/qcom-cpufreq-hw.c
>> index f86859bf76f1..241f6f2b441f 100644
>> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
>> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c

[snip]

>>   static const struct qcom_cpufreq_soc_data qcom_soc_data = {
>>       .reg_enable = 0x0,
>>       .reg_freq_lut = 0x110,
>>       .reg_volt_lut = 0x114,
>> +    .reg_current_vote = 0x704,
>>       .reg_perf_state = 0x920,
>>       .lut_row_size = 32,
>>   };
>> @@ -274,6 +350,23 @@ static const struct of_device_id 
>> qcom_cpufreq_hw_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);
>> +static void qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy)
>> +{
>> +    struct qcom_cpufreq_data *data = policy->driver_data;
>> +    struct platform_device *pdev = cpufreq_get_driver_data();
>> +    struct device *dev = &pdev->dev;
>> +    int ret;
>> +
>> +    ret = devm_request_irq(dev, data->lmh_dcvs_irq, 
>> qcom_lmh_dcvs_handle_irq,
>> +                   0, "dcvsh-irq", data);
> 
> 
> It is better if you tag the CPU id while registering the IRQ.
> "dcvsh-irq-x" (0/4/7)

Sure. Will fix it.

> 
>> +    if (ret) {
>> +        dev_err(dev, "Error %d registering irq %x\n", ret, 
>> data->lmh_dcvs_irq);
>> +        return;
>> +    }
>> +    data->policy = policy;
>> +    INIT_DEFERRABLE_WORK(&data->lmh_dcvs_poll_work, qcom_lmh_dcvs_poll);
>> +}
>> +
>>   static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>>   {
>>       struct platform_device *pdev = cpufreq_get_driver_data();
>> @@ -370,6 +463,16 @@ static int qcom_cpufreq_hw_cpu_init(struct 
>> cpufreq_policy *policy)
>>               dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
>>       }
>> +    /* Look for LMh interrupt. If no interrupt line is specified /
>> +     * if there is an error, allow cpufreq to be enabled as usual.
>> +     */
>> +    data->lmh_dcvs_irq = platform_get_irq(pdev, index);
>> +    if (data->lmh_dcvs_irq > 0) {
>> +        qcom_cpufreq_hw_lmh_init(policy);
>> +    } else if (data->lmh_dcvs_irq != -ENXIO) {
>> +        ret = data->lmh_dcvs_irq;
>> +        goto error;
>> +    }
>>       return 0;
>>   error:
>>       kfree(data);
>>
> 

-- 
Warm Regards
Thara (She/Her/Hers)
