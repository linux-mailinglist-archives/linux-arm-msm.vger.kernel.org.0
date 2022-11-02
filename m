Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5429D6168B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 17:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbiKBQ1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 12:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiKBQ0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 12:26:52 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E48C2D76B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 09:21:47 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id x21so5864814qkj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BzdwyCqrWaOcYdqDsje/Pfj4rGdaFiKuTe+sRQfti2U=;
        b=ykj6NA9kOVg6B0dagTF8Ms+5sjHUjwMU6i1UOEbRl9jMsN5B6v93vKT1wz544nwy9P
         rGTkpVBuhCsIVfLjNb2INE/3rBcp27rmjRNATD923yOtt6W+/5Yq0e0o7+uZT7fJtm8V
         gvj2wf1r1lSZj1044EBLOaaBgb8Vh6f5ysJ/xjd0B1Ee2hms5SB+PWUKKeUbcVoBPGR2
         fP9Y3Ep4Ygjqiu8G7YUlL9UQIfBJsowwPjd6uBu/LwDhLjDOYRvZkkPGCtVXt2JcT/LR
         qIU0AunM4TFGfax36gptplY/pmWCoGgROL/gtGRC5MyF0wcfpslo5u4AthrTYATq3sx5
         lQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzdwyCqrWaOcYdqDsje/Pfj4rGdaFiKuTe+sRQfti2U=;
        b=251XC3XuigAvuQx3diahE/67YQsZEFf5kt0NbMDrrHPQ5POCtJLXGDKWkOVwQ6+iFT
         vO3EDcbULqk9qyYqrfZRLwXwnv69zmCNU+Por/EIKCBsdIOXq3SqMgl3npPg9cBP5v22
         gXNWJWykbF+DbOCDh6PLGPLcrnrdzYE/szzOr2+yIF+MYcGqkECUbcWxiyhJwUM8kYW1
         KzrBxB77b7BPmIAW5UhVpL3SbNCsqBSB/zMCVEZmtOMKZzPCHgu2KemKBdZwuPSSZqOP
         +LUFCFsQLkwokVSP7mpSg09PMfaoqrGBnCsaXW7PGFyP+sny8BhYaGzww9BfgJbj5aRF
         OsHg==
X-Gm-Message-State: ACrzQf3BjPT4pBSMJlqovlsoN+Pc+S1wezCocjKhROFcO9+h1/SnkLgf
        to5R1eY7RdEKrgxXW6s4QX5dag==
X-Google-Smtp-Source: AMsMyM68XM2j+qY6P1wbfbrvGxKf6ZdMXFmcBQMO7RkfWALHDlg8qZREQzzN1RoHrtr7EkQjnb+TFg==
X-Received: by 2002:a05:620a:bc3:b0:6ef:418:de91 with SMTP id s3-20020a05620a0bc300b006ef0418de91mr18251614qki.653.1667406106613;
        Wed, 02 Nov 2022 09:21:46 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id ay30-20020a05620a179e00b006ef1a8f1b81sm8823954qkb.5.2022.11.02.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 09:21:46 -0700 (PDT)
Message-ID: <6130bdbc-163a-c950-e2e1-07ef77124833@linaro.org>
Date:   Wed, 2 Nov 2022 12:21:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2}
 VADC channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johan+linaro@kernel.org, quic_jprakash@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-10-manivannan.sadhasivam@linaro.org>
 <5e66c095-898e-067e-1874-a3d2e5babf17@linaro.org>
 <20221029044831.GC5362@thinkpad> <20221030071659.GE5362@thinkpad>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221030071659.GE5362@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/10/2022 03:16, Manivannan Sadhasivam wrote:

>>>
>>>> +		reg = <PM8350_ADC7_DIE_TEMP(1)>;
>>>> +		label = "pm8280_1_die_temp";
>>>> +		qcom,pre-scaling = <1 1>;
>>>> +	};
>>>> +
>>>> +	sys-therm1@144 {
>>>
>>> I would say sys-therm@... why do we need the "1" suffix in node name?
>>>
>>
>> Suffix represents the index of the thermistor as per the schematics but I guess
>> it can be dropped.
>>
> 
> I was wrong. Suffix is necessary since IIO core registers the channel based on
> the node name, so it has to be unique.
> 

Makes sense then.

Best regards,
Krzysztof

