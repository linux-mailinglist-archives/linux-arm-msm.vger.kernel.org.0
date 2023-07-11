Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9491374FB90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 00:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjGKW7w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 18:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjGKW7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 18:59:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291A510D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 15:59:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7589b187so10176084e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 15:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689116383; x=1691708383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mm75wKDIUdBS2VUhTp5I1uDUXxinpRPW1TwuOx6R0IA=;
        b=Z3DiMVPpiR8mgFyfsuUM2RofZOJe9rGu2QrLkoQyhPCQ8V3dJMZOXKNZWQArcwRgZC
         MaKrSnfd2+lmvITy2/2C5QYob0P32ai+Bsbbq5STO8qrdGrzD3q/K2PI7xKMsesYUMhx
         ma0CgGx9j94sS1UQ9hN/yTiIaI8m1akeU8Jo0UDlgEmVB9himedBmpx76coGRvnk7ZMN
         RwjHQYaa4vLT1w3l2k7QTwSgsS0i2Qdi/RWAeoPmqOVWjrJZ/iy+MVzK/71XnLaeAsvl
         EfsVRWA1XXPC4VPDBaIm0gwSk6xz71tfbSDq8+lwZqRQUwmzJ67TQyEhbtOr6pCk+Shv
         hA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689116383; x=1691708383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm75wKDIUdBS2VUhTp5I1uDUXxinpRPW1TwuOx6R0IA=;
        b=jTv6dFSq+yjEpVQsM6+j8EgkJwOzhkjBazDJOIAWAXQB54k3Hxdqap5RMHsfAGF0NU
         K788S0dm116/B1MsgO2K0xohNNrbeNuVcORjIfbTWtUakQXh7DF539+iExNNwU7uYDM0
         eUegwtKVqfDPYwjo0RB7JkwY1IowiKYJQxlcYLdr4MwlOZIqss5RbXKN1FBJGsh7srCn
         GcItb3+45mqOOeMIFSQJkpz8ZSTTNDl9YMpWpD11TDzUvpYa9ihwCd45hH3bs/wvm84r
         ycMTaTd6WzpwlJnN10u/U0SgcRxzP2FJtSPUe/B2MLqjsH7bnNMoU6GaOqyxa83AvwcC
         ZGPw==
X-Gm-Message-State: ABy/qLb/Saa4owVoc2+8Kb2HHYVqfo5UnSU4zT2wPsoqv8rGseunxmUp
        T7UEtOaDR6RoYekjEPYk+qlkcw==
X-Google-Smtp-Source: APBJJlEEEvO0W4GtZ+OwmpjQRUVrpuxICL5bSKnNmDkUAeQW0aAAQeejJ5OHrYQJWNGXjY/QfkSXEw==
X-Received: by 2002:a05:6512:3b4:b0:4fb:82d8:994d with SMTP id v20-20020a05651203b400b004fb82d8994dmr12377798lfp.42.1689116383347;
        Tue, 11 Jul 2023 15:59:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d10-20020ac244ca000000b004fbb424c362sm473909lfm.150.2023.07.11.15.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 15:59:42 -0700 (PDT)
Message-ID: <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
Date:   Wed, 12 Jul 2023 00:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12.07.2023 00:39, Dmitry Baryshkov wrote:
> On 12/07/2023 00:36, Konrad Dybcio wrote:
>> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>
>>> +            port@1 {
>>> +                reg = <1>;
>>> +
>>> +                redriver_phy_con_ss: endpoint {
>>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>> +                    data-lanes = <0 1 2 3>;
>> That's USB+DP lines combined, or how does it work? I'm confused :/
> 
> 4 generic purpose SS lanes, which can be purposed for USB or for DP.
Okay, so my gut did better than my brain.

Other than that, I'm reading the bindings and it looks like ports 0 and
1 may possibly be swapped?

Konrad
> 
>>
>> Konrad
>>> +                };
>>> +            };
>>> +
>>> +            port@2 {
>>> +                reg = <2>;
>>> +
>>> +                redriver_usb_con_sbu: endpoint {
>>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>>   };
>>>     &mdss {
>>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>>   };
>>>     &usb_1_qmpphy_typec_mux_in {
>>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
>>> +    remote-endpoint = <&redriver_phy_con_ss>;
>>>   };
>>>     &usb_2 {
>>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>>               port@1 {
>>>                   reg = <1>;
>>>                   pm8150b_typec_mux_out: endpoint {
>>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>> +                    remote-endpoint = <&redriver_usb_con_ss>;
>>> +                };
>>> +            };
>>> +
>>> +            port@2 {
>>> +                reg = <2>;
>>> +
>>> +                pm8150b_typec_sbu_out: endpoint {
>>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
>>>                   };
>>>               };
>>>           };
> 
