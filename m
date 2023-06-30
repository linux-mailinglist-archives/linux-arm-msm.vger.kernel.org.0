Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A8B743AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 13:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbjF3L1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 07:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjF3L1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 07:27:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8B310C
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 04:27:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2961369e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688124465; x=1690716465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IH4WB8igR///M+GXHEkhomFD6VCjjkgbZFwLPUGXrXM=;
        b=mZYW/COxb/Sw02LlyLAJjhHRz+UuNVjde2PsH5iy+j7kBIQNkEma9vm6AZGzvL4LlC
         h15eEHHh2w/fIL2rxqxTJk9a8TpBygp0o/zhjyHRy48M8j6OVNEbTDJGO7QrsfNu6wIv
         PaIqdHgY5X2/sblPCVzz6YdOB/YDm/0rKMN7nNIBFHGovzVQrenobApAzYOSjbZzCZZM
         Jp2Wjtk5NRacI1kQjCUnv8LGiSLpJvPw/VuNfjooSbuKOnJOVRqTmlRIpfi1Em1xzX6t
         PLdJBtR8DYK5clRQU3+lflTdosC65pKrSKG0MpuM3SmvhwgZ0bO/NIz74GfYvZYWqtkn
         cmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688124465; x=1690716465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH4WB8igR///M+GXHEkhomFD6VCjjkgbZFwLPUGXrXM=;
        b=CBhZp/ozt/L+PBjxCw8B2rcuqavJfTR9PorLM+ES0O/o/pfo5755lLLh/0nYBw+h7t
         1uZ2ImYMfaO4VDUs/35eyc60n5beJQn3S0lviT3Bcw9ivQAy5TmJJibKa/5luuiN2t2U
         QixuDeSXfggmxDEmdf6Q+NyrvHCD28gRWd+PRqvim8WBOziJELe4tSDXMEW5zoF2l43Y
         QEpu19O6UAwARArt69828T3eQj/ntf6MSHmBWwYtvXYvZJgTfpTI/1ujMRO6pW+fjsFE
         CkQd0UMagHrt415iXkKN0eqRCUxWsFHcwk1ASf/+x4Qnlb8T8XQdaQdesZffTYM7yY4G
         POmA==
X-Gm-Message-State: ABy/qLZHL9jHDzqGArlVJB/tLtqEnH5aZLpnRmkjGRL0ovQQ074J1xZu
        vxIHnoxkp6DkhAKw0J8Q1gJA+fHF14eXCdCHZD24Rg==
X-Google-Smtp-Source: APBJJlFzCA/8y++vZW1x7Oqz2QYzhV8BKW4wDj2JZeQqHT/astuFYmBEaP8V1MI+2AYOXWfY+csn8A==
X-Received: by 2002:a05:6512:281e:b0:4fb:758c:74ed with SMTP id cf30-20020a056512281e00b004fb758c74edmr2151398lfb.35.1688124464726;
        Fri, 30 Jun 2023 04:27:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id y22-20020ac24476000000b004fb76751156sm1934823lfl.157.2023.06.30.04.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 04:27:44 -0700 (PDT)
Message-ID: <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org>
Date:   Fri, 30 Jun 2023 13:27:43 +0200
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
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

On 30.06.2023 12:07, Dmitry Baryshkov wrote:
> On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
>>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
>>> PMIC interface. This includes several onboard sensors and the XO thermal
>>> sensor.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>>
>>> +     channel@144 {
>>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
>> This define should be cleaned up.. Since it takes a sid argument,
>> it really is ADC7_AMUX_THM1_100K_PU(sid)
> 
> I don't think I understood your comment. The define itself is specific
> to PM8350, other PMICs might have different channel assignments.

include/dt-bindings/iio/qcom,spmi-vadc.h
263:#define ADC7_AMUX_THM1_100K_PU                      0x44

Konrad
> 
>>
>> Konrad
>>
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "skin_msm_temp";
>>> +     };
>>> +
>>> +     channel@145 {
>>> +             reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "camera_temp";
>>> +     };
>>> +
>>> +     channel@146 {
>>> +             reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "therm1_temp";
>>> +     };
>>> +
>>> +     channel@147 {
>>> +             reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "wide_rfc_temp";
>>> +     };
>>> +
>>> +     channel@148 {
>>> +             reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "rear_tof_temp";
>>> +     };
>>> +
>>> +     channel@14c {
>>> +             reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "therm2_temp";
>>> +     };
>>> +
>>>       channel@303 {
>>>               reg = <PM8350B_ADC7_DIE_TEMP>;
>>>               label = "pm8350b_die_temp";
>>>       };
>>>
>>> +     channel@348 {
>>> +             reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "usb_conn_temp";
>>> +     };
>>> +
>>>       channel@403 {
>>>               reg = <PMR735A_ADC7_DIE_TEMP>;
>>>               label = "pmr735a_die_temp";
>>>       };
>>> +
>>> +     channel@44a {
>>> +             reg = <PMR735A_ADC7_GPIO1_100K_PU>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "qtm_w_temp";
>>> +     };
>>> +
>>> +     channel@44b {
>>> +             reg = <PMR735A_ADC7_GPIO2_100K_PU>;
>>> +             qcom,hw-settle-time = <200>;
>>> +             qcom,ratiometric;
>>> +             label = "qtm_n_temp";
>>> +     };
>>>  };
>>>
>>>  &remoteproc_adsp {
> 
> 
> 
