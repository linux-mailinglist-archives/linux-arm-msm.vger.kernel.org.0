Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1436A743F87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 18:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjF3QPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 12:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjF3QPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 12:15:07 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DDD3AAD
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 09:15:04 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6c3921c8bso33339411fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688141703; x=1690733703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZDqX7gD/xgh/gMlqi1pNOxVe7oIaYP1fwQ1H/uNA38=;
        b=Lb2E59jds8kWXxb80EfeRVRYadhUQqINTHKAsGz4X8dLdshM531nkSYYsnw41EZiWT
         eO62G66XpyJrIeYCArNu3navf6zi4I+RIvdFRgeHnN332NKGZCZKq+BW4LcMOMCtn20r
         alag4tsAxSfIyKGrrW6QDkovCuZXfU0mkNpZRbJ56BAgLD0SDkCdOKC7pSbb3T33D/Lt
         h68nUJwB17Fd5OPHNVBw83KBZHmRMuivLJe5cJIfbBGiOe30iDtyJ1eFilMwxiHUcMNm
         eqOzdWO+x1uvTcYxB/PyXTd5kG99Ae8E1gZjcAC6XTTH+O//nqSasPC/JB0x1CytY13P
         f+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688141703; x=1690733703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZDqX7gD/xgh/gMlqi1pNOxVe7oIaYP1fwQ1H/uNA38=;
        b=IfhO7bLUC1udJXQdwF9pbJ/O3e1/k+fA968ZuD7AznmBxzvg4kSoniQMg5C/b7egT9
         V+/pWr76DYs8LeyJmOTEnmlXGeJ0bc+GyBk8nWhI+wl/u3fQ7Y5uF6rB7lstD5LqAT/R
         g1luKt6R0fPoEQo1eByS1j53obpTd/DPdDm694DUyzxXK9ZY6h8jTflzNWJNUZK0+io4
         Vq8XXmsIYE8D8HJG1q3DQo6xdcCzUsE4QhRJeTBtMFLBSnn8BvmEg6iQ937ogeJpYPAs
         QXeRgIAkSecfJCVtRKJGfg+6kgNG2RLEo0HYPL2Y/qEWs3WddoRaoVOtTy64fKvtVQQq
         gVwA==
X-Gm-Message-State: ABy/qLYPoQ46xIgFtI0Jlgx9p6AozKpOmjeibs7UDjXIUSP02uKE65ze
        tgKEuSqZrgtugeHohYeaETCtlK9Ds5T+DcRrNZQ0CA==
X-Google-Smtp-Source: APBJJlELQDN66X2VRxLxOBpWrJ/X1MvbFeMo/jTbubsgz3oc3onpltZIs0jBmuyijljKSNW5jGuQBQ==
X-Received: by 2002:a2e:9d4e:0:b0:2b6:d8cf:2f44 with SMTP id y14-20020a2e9d4e000000b002b6d8cf2f44mr178207ljj.13.1688141703043;
        Fri, 30 Jun 2023 09:15:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id t26-20020a2e781a000000b002b6cde9f325sm535204ljc.105.2023.06.30.09.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 09:15:02 -0700 (PDT)
Message-ID: <e2c6abdc-f586-be9c-b400-7bf57021d5fa@linaro.org>
Date:   Fri, 30 Jun 2023 18:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal
 zones
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org>
 <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
 <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
 <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org>
 <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2023 14:57, Dmitry Baryshkov wrote:
> On Fri, 30 Jun 2023 at 14:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.06.2023 12:07, Dmitry Baryshkov wrote:
>>> On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
>>>>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
>>>>> PMIC interface. This includes several onboard sensors and the XO thermal
>>>>> sensor.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>> [...]
>>>>>
>>>>> +     channel@144 {
>>>>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
>>>> This define should be cleaned up.. Since it takes a sid argument,
>>>> it really is ADC7_AMUX_THM1_100K_PU(sid)
>>>
>>> I don't think I understood your comment. The define itself is specific
>>> to PM8350, other PMICs might have different channel assignments.
>>
>> include/dt-bindings/iio/qcom,spmi-vadc.h
>> 263:#define ADC7_AMUX_THM1_100K_PU                      0x44
> 
> Do you want to define PM8350_ADC7_AMUX_THM1_100K_PU(sid) using
> ADC7_AMUX_THM1_100K_PU ?
> Or to make all users use ADC7_AMUX_THM1_100K_PU?


>Or add the SID
> argument to ADC7_AMUX_THM1_100K_PU and switch to it?
This.

Since we have a generic binding for it (not sure what sort of ABI-ish rules
apply here, probably not very many since it's just a dumb preprocessor define),
we should not redefine it for each PMIC, especially since the SIDs are variable
nowadays :/

Sorry for being too vague.

Konrad
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "skin_msm_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@145 {
>>>>> +             reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "camera_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@146 {
>>>>> +             reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "therm1_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@147 {
>>>>> +             reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "wide_rfc_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@148 {
>>>>> +             reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "rear_tof_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@14c {
>>>>> +             reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "therm2_temp";
>>>>> +     };
>>>>> +
>>>>>       channel@303 {
>>>>>               reg = <PM8350B_ADC7_DIE_TEMP>;
>>>>>               label = "pm8350b_die_temp";
>>>>>       };
>>>>>
>>>>> +     channel@348 {
>>>>> +             reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "usb_conn_temp";
>>>>> +     };
>>>>> +
>>>>>       channel@403 {
>>>>>               reg = <PMR735A_ADC7_DIE_TEMP>;
>>>>>               label = "pmr735a_die_temp";
>>>>>       };
>>>>> +
>>>>> +     channel@44a {
>>>>> +             reg = <PMR735A_ADC7_GPIO1_100K_PU>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "qtm_w_temp";
>>>>> +     };
>>>>> +
>>>>> +     channel@44b {
>>>>> +             reg = <PMR735A_ADC7_GPIO2_100K_PU>;
>>>>> +             qcom,hw-settle-time = <200>;
>>>>> +             qcom,ratiometric;
>>>>> +             label = "qtm_n_temp";
>>>>> +     };
>>>>>  };
>>>>>
>>>>>  &remoteproc_adsp {
>>>
>>>
>>>
> 
> 
> 
