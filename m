Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4DB74FBB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 01:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjGKXFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 19:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjGKXFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 19:05:01 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA405B1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 16:04:59 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b71ae5fa2fso49191601fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689116698; x=1691708698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrPGRPC6HG0U2FML7Fsc9fdI4MG3WoxSDfYEpjLufj4=;
        b=hyk6BzvMm+cF73GKAxkljHynA3RbjXkc1rW5YudTd/1PQubEtGU7RFbes5TqouW+pO
         PJX7UaUQXG43XULLItyQw2ALn4u/scZ+32rJExJvDfG0NF2DBywIiErLkiZ5XoWqk3Y7
         OpqzA6Wz+IJ/5xG/SecPt2VcTuN+92k+QbyBlBAy2Hj/ac1u4V4rh/RgOjHsj7m7K+bz
         OI5CntiUFwnh/PQx1JJ56hNpKC6853HHS/kjAzBqotYh47YxREZTHRSugxDQgyRdqZ/R
         LhQNxKkp5QI5/Mp9LF2RYmmXecqqekoWGLj4QHC7in2b32STxJ/eQfL9eBaiCXHsnp1G
         TJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689116698; x=1691708698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrPGRPC6HG0U2FML7Fsc9fdI4MG3WoxSDfYEpjLufj4=;
        b=Q4ChQWmsKrG0AK1PUSfFivBenw1aqesUKRM9Rui/a/SI6MQonaUNxrkpIIRECQ/GTK
         sAqCZOz1FX5JL8ZfXQPPHTx3GYjNepvjGJpZQ6C1/eFBmkraTGF+v8VoPnEawJJFY8mM
         O4+c5TXREr7BgPk5ax8KEM/0f9Waie81u44Vm138bzZWlAXKCpEpVFHvU6Ejh63YxDGy
         K1r7uoawzrszaBj2veDuuRIoFnF9p/TNw7Z9BBBb573GkpOE/K9eqm7+NM5kLAI8S8Se
         BaWIH8NIwmDxlePojYsRMY/wCP4A+0ndbIPQoi5CM/saA0qdVNvOwiXivedTzJWrIfWL
         n5iA==
X-Gm-Message-State: ABy/qLatdvLpu5GHiUW++Eg2Z+xLq6CgtOAjkq04ELPkXbNNlN/BQPkS
        WlFxNDQ1b4RD8beYgXUbyOZK1w==
X-Google-Smtp-Source: APBJJlEg2hw+MBpZNNOeJN2GtjgzeJrhXA9r4AsOhwLh9cl0w2ck9Kf3KdlFd+1EhzlAggXvIfxSJQ==
X-Received: by 2002:a05:651c:201:b0:2b6:dbc5:5ca4 with SMTP id y1-20020a05651c020100b002b6dbc55ca4mr13049709ljn.16.1689116697997;
        Tue, 11 Jul 2023 16:04:57 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id u4-20020a2ea164000000b002b6e973f8cfsm648369ljl.36.2023.07.11.16.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 16:04:57 -0700 (PDT)
Message-ID: <2c9d4d18-48c8-12b0-a971-62138b318c5b@linaro.org>
Date:   Wed, 12 Jul 2023 01:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
 <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
 <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12.07.2023 01:01, Dmitry Baryshkov wrote:
> On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
>>> On 12/07/2023 00:36, Konrad Dybcio wrote:
>>>> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>>>>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>> [...]
>>>>
>>>>> +            port@1 {
>>>>> +                reg = <1>;
>>>>> +
>>>>> +                redriver_phy_con_ss: endpoint {
>>>>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>> +                    data-lanes = <0 1 2 3>;
>>>> That's USB+DP lines combined, or how does it work? I'm confused :/
>>>
>>> 4 generic purpose SS lanes, which can be purposed for USB or for DP.
>> Okay, so my gut did better than my brain.
>>
>> Other than that, I'm reading the bindings and it looks like ports 0 and
>> 1 may possibly be swapped?
> 
> Yes. But if I get schematics right, the lanes are not swapped in this case.
I'm not talking about the 0123-3210 swap, but rather in/out being swapped.
Unless I'm reading the bindings wrong (or they may be written in a
confusing way).

Konrad
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +
>>>>> +                redriver_usb_con_sbu: endpoint {
>>>>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>>   };
>>>>>     &mdss {
>>>>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>>>>   };
>>>>>     &usb_1_qmpphy_typec_mux_in {
>>>>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
>>>>> +    remote-endpoint = <&redriver_phy_con_ss>;
>>>>>   };
>>>>>     &usb_2 {
>>>>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>>>>               port@1 {
>>>>>                   reg = <1>;
>>>>>                   pm8150b_typec_mux_out: endpoint {
>>>>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>> +                    remote-endpoint = <&redriver_usb_con_ss>;
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +
>>>>> +                pm8150b_typec_sbu_out: endpoint {
>>>>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
>>>>>                   };
>>>>>               };
>>>>>           };
>>>
> 
> 
> 
