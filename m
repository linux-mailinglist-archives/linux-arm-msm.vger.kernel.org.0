Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094096671F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 13:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbjALMUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 07:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbjALMT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 07:19:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D9E4C722
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 04:17:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bq39so28196047lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Sb7uu+jqjd8cjTaj/ffaYsm4XqEOJ2LoE1vJYEHfEo=;
        b=UjWCpPmkX+Rgr/d4T1GVVzGIureVA53WtA0521/gGDnZKJfPlK3eEeEpUuhrIWDtPM
         HuFnWQa3UzbPEWq/uQJVKl2RzQvM4exGvpbwrWcWuXLaOJY4vPwhK3/5q1cON6LRyOMG
         7brn0fB+WaZFnJGNiDTDZ8Jr7QVFEnq74f3DmqyffoJ/+uHMxMlfGstpaM3XCAvSX/jg
         u08T89DjPQaXnkXi9fPtHd/muMQOlwdWZYZKQRp2YmwpzcdTbR1Mji9NbVIb+Iy5LrRV
         jyqQXxNNb//aw3uPLJ3qnxa/Z6aNJumNu8aZsW+eToJrUEv/LwGnxMDddSHwlBX2nXYI
         glkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Sb7uu+jqjd8cjTaj/ffaYsm4XqEOJ2LoE1vJYEHfEo=;
        b=T911hFr1SLbgrALFrdc7oGKMQciqJSdFXNA6F/DKGhkUVFWp1LwP3MNI7fCST+ZbRu
         USSpWwxjcJRdhHPuLhAG+Okohb0SVyvfVqY+bBF5My0I7fZoPj+DBAddyrKQSYVf6oBT
         rAmuezy8zScdT2vicHSecf5Cbt0BeUQz4zCNskZniIiJQgzMg2+ltTCQHg6k7sI+SDJ6
         f9Qy1MKvVZz2oPS0Li6NBJRKo/O541L2VL7WWRhoJH8T7UQ5S+5lgz5bOr1WBUAodLU2
         XHvn/LiK9+vOGFbRiWX2wV8eFivPRhqxCEQRoCjfacr2bA/ndgpmldbkDVPyk62b3gi9
         yZNA==
X-Gm-Message-State: AFqh2koNQ9quxxkzqO6u1Vv3pcmmBpn5cHtHatqQHm2O7bag8kBead4N
        aKtC3QL/ngAL32x8ST1O5ScgTA==
X-Google-Smtp-Source: AMrXdXvyRJPbsou+g+A9HURQgSe2/ts8e9e8635nHvGS9TVNXZu47PWi5EWLjMmMNeKrTmfpNDXJUg==
X-Received: by 2002:ac2:5181:0:b0:4b4:f9df:c6aa with SMTP id u1-20020ac25181000000b004b4f9dfc6aamr18255392lfi.34.1673525876790;
        Thu, 12 Jan 2023 04:17:56 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id bt35-20020a056512262300b0049ae3ed42e8sm3231814lfb.180.2023.01.12.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:17:56 -0800 (PST)
Message-ID: <034e741d-8a86-05ab-ca94-15be2463275f@linaro.org>
Date:   Thu, 12 Jan 2023 13:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/13] clk: qcom: cpu-8996: skip ACD init if the setup is
 valid
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-6-dmitry.baryshkov@linaro.org>
 <e3c3449c-dd20-05fd-fd7d-b863d9f66426@linaro.org>
 <38745a30-0502-3a1d-4376-9d10471cf780@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <38745a30-0502-3a1d-4376-9d10471cf780@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 22:55, Dmitry Baryshkov wrote:
> On 11/01/2023 23:00, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>>> Check whether L2 registers contain correct values and skip programming
>>> if they are valid. This follows the code present downstream.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Once again, my random local msm-3.18 doesn't do this, can you show
>> me the downstream source for this?
> 
> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L856
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cpu-8996.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index 0e0c00d44c6f..7e5246ca7e7f 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -472,10 +472,15 @@ static void __iomem *base;
>>>   static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
>>>   {
>>>       u64 hwid;
>>> +    u32 val;
>>>       unsigned long flags;
>>>         spin_lock_irqsave(&qcom_clk_acd_lock, flags);
>>>   +    val = kryo_l2_get_indirect_reg(L2ACDTD_REG);
>>> +    if (val == 0x00006a11)
>>> +        goto out;
>>> +
>>>       hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
>>>         kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>>> @@ -492,6 +497,7 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
>>>           writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
>>>       }
>>>   +out:
>>>       spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
>>>   }
>>>   
> 
