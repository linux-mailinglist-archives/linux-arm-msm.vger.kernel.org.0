Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30426196C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiKDNBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbiKDNAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:00:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A4D2E9DB
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:00:54 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so7269691lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6rloIJwP71svjKZvMo3B6qaA3z3bKYNQ1mUUEYaGPc=;
        b=jdpai8aOpLROxrsp/eAhkrkkk2RXU3Eywu/ledyWit2ZN3nDw75BxVFjGUgh2ehY/U
         TNyTWyfjcR8bTPjVgcRy71KvUS1z1IwSlnqO1bkrP7gQ4ymu1XsDjm2b45zJ7V3u9LjZ
         Su2qq1aMPmlntM1c0qULGb2qhAbE7LXn/x5WoNN5YEAjO0TDZLAj2EgH+7418XDFWF6b
         H/bw+9UeFWqRRE1ZY9n2voHopDI7LGWP5nw5FbjczmqS0RCZnWmOVaZJDLf29Zcmdj7b
         UIN6pS2oipeT5dblgkUaoTf9bd93QomV4aAuFs+LjJgv6/1PfZAEZTcE6cZywzvI1VO1
         sRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6rloIJwP71svjKZvMo3B6qaA3z3bKYNQ1mUUEYaGPc=;
        b=OhEGhZVvIN2qB2qJNOGOgq7SNHRJqNSyY4RPjJumPB/+XjpSxl7kfhBZNcn4TUkBRJ
         db39ICQzjMRPsJehvLWcYArgO5uyuhWheAVf0bGyAfhlQFFDQpmNwfJo+DjgYKhgatHs
         m2tyfg109aUgymN6lrpQ5yeGmvLUmJllKZZESr8oHyZ1C+wsyIZ3Mkmb38eC2/zVhIum
         ClzpNftu/vF3F76RgVZAoRhN0nbXrsLgeRcttjLg6eGhFUjIi3+7KqqmjHv7QKAAJaUt
         9DsX5jrc2dH93W3RKcRFN3YF75ppq84E4sKe5pfR6ej1dtNVWH7XUsvSc2VTakdqd++R
         jviQ==
X-Gm-Message-State: ACrzQf0zsgQOKw9yA8MIooFjwPASxk/5YrZpHobcHLxvH7SWN8oWeqmm
        8mmhOIWPiuNUhhZm64WTSu3g3g==
X-Google-Smtp-Source: AMsMyM40MTTkRiU+UNYsjtgMhWwijK9A8ehsl+GQhkUM0Pe5fvYKFB+qjKwIrC133wCBifatOiH1qw==
X-Received: by 2002:ac2:5609:0:b0:4a2:734d:6cb0 with SMTP id v9-20020ac25609000000b004a2734d6cb0mr14333293lfd.611.1667566851832;
        Fri, 04 Nov 2022 06:00:51 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651236c900b004947f8b6266sm454152lfs.203.2022.11.04.06.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:00:51 -0700 (PDT)
Message-ID: <07e82a2f-ba17-bbac-6809-2312bc7cd4ed@linaro.org>
Date:   Fri, 4 Nov 2022 16:00:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
 <ee0880ad-0513-ffea-d80a-9eaac3a85c90@linaro.org>
 <9badb45b-5e90-6796-061d-4166bc80a564@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9badb45b-5e90-6796-061d-4166bc80a564@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 15:52, Krzysztof Kozlowski wrote:
> On 04/11/2022 08:34, Dmitry Baryshkov wrote:
>> On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
>>> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>>>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>>>> SM8450 platform.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>>>    .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>>>    2 files changed, 481 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>>    create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>> new file mode 100644
>>>> index 000000000000..b8c508c50bc5
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>> @@ -0,0 +1,132 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm SM8450 Display DPU
>>>> +
>>>> +maintainers:
>>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> +
>>>> +$ref: /schemas/display/msm/dpu-common.yaml#
>>>
>>> There is no such file and I could not fine any dependency mentioned in
>>> cover letter. I guess you miss link to your refactor series?
>>
>> Excuse me, yes. However the refactoring should be already a part of
>> linux-next, so I didn't think that I should especially point to it.
> 
> Not in yesterday's next.
> 
>>
>>> This also means bot won't be able to test it...
>>
>> How does bot detects the base commit? Should i use --base? Or does it
>> work on top of linux-next?
> 
> I think bot tests on rc1, so even next would not help here. Anyway
> that's just a remark that you won't get automated test email.
> 
>>
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,sm8450-dpu
>>>> +
>>>> +  reg:
>>>> +    items:
>>>> +      - description: Address offset and size for mdp register set
>>>> +      - description: Address offset and size for vbif register set
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: mdp
>>>> +      - const: vbif
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Display hf axi clock
>>>> +      - description: Display sf axi clock
>>>> +      - description: Display ahb clock
>>>> +      - description: Display lut clock
>>>> +      - description: Display core clock
>>>> +      - description: Display vsync clock
>>>
>>> Drop "clock", less typing.
>>
>> Ack
>>
>>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: bus
>>>> +      - const: nrt_bus
>>>> +      - const: iface
>>>> +      - const: lut
>>>> +      - const: core
>>>> +      - const: vsync
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
>>>> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
>>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>>> +
>>>> +    display-controller@ae01000 {
>>>> +        compatible = "qcom,sm8450-dpu";
>>>> +        reg = <0x0ae01000 0x8f000>,
>>>> +              <0x0aeb0000 0x2008>;
>>>> +        reg-names = "mdp", "vbif";
>>>> +
>>>> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>>>> +                <&gcc GCC_DISP_SF_AXI_CLK>,
>>>> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>>> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>>>> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>>> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>>> +        clock-names = "bus",
>>>> +                      "nrt_bus",
>>>> +                      "iface",
>>>> +                      "lut",
>>>> +                      "core",
>>>> +                      "vsync";
>>>> +
>>>> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>>> +        assigned-clock-rates = <19200000>;
>>>> +
>>>> +        operating-points-v2 = <&mdp_opp_table>;
>>>> +        power-domains = <&rpmhpd SM8450_MMCX>;
>>>> +
>>>> +        interrupt-parent = <&mdss>;
>>>> +        interrupts = <0>;
>>>> +
>>>> +        ports {
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            port@0 {
>>>> +                reg = <0>;
>>>> +                dpu_intf1_out: endpoint {
>>>> +                    remote-endpoint = <&dsi0_in>;
>>>> +                };
>>>> +            };
>>>> +
>>>> +            port@1 {
>>>> +                reg = <1>;
>>>> +                dpu_intf2_out: endpoint {
>>>> +                    remote-endpoint = <&dsi1_in>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +
>>>> +        mdp_opp_table: opp-table {
>>>> +            compatible = "operating-points-v2";
>>>> +
>>>> +            opp-172000000{
>>>> +                opp-hz = /bits/ 64 <172000000>;
>>>> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
>>>> +            };
>>>> +
>>>> +            opp-200000000 {
>>>> +                opp-hz = /bits/ 64 <200000000>;
>>>> +                required-opps = <&rpmhpd_opp_low_svs>;
>>>> +            };
>>>> +
>>>> +            opp-325000000 {
>>>> +                opp-hz = /bits/ 64 <325000000>;
>>>> +                required-opps = <&rpmhpd_opp_svs>;
>>>> +            };
>>>> +
>>>> +            opp-375000000 {
>>>> +                opp-hz = /bits/ 64 <375000000>;
>>>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>>>> +            };
>>>> +
>>>> +            opp-500000000 {
>>>> +                opp-hz = /bits/ 64 <500000000>;
>>>> +                required-opps = <&rpmhpd_opp_nom>;
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +...
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>> new file mode 100644
>>>> index 000000000000..05c606e6ada3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>> @@ -0,0 +1,349 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm SM8450 Display MDSS
>>>> +
>>>> +maintainers:
>>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> +
>>>> +description:
>>>> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>>>
>>> Drop "Device tree bindings for" and rewrite the sentence (e.g. drop "that").
>>>
>>>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>>>> +  bindings of MDSS are mentioned for SM8450 target.
>>>
>>> Drop last sentence.
>>>
>>>> +
>>>> +$ref: /schemas/display/msm/mdss-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>
>>> Drop items.
>>>
>>>> +      - const: qcom,sm8450-mdss
>>>
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Display AHB clock from gcc
>>>> +      - description: Display hf axi clock
>>>> +      - description: Display sf axi clock
>>>> +      - description: Display core clock
>>>
>>> Drop trailing "clocks" (the first "AHB clock" is ok)
>>
>> Hmm, not sure that I understand the difference, but fine with me.
> 
> Not much different, but for me AHB is a bus, so "Display AHB from gcc"
> suggests a bit gcc provides some bus, but you want bus clock. AXI is
> also a bus... so maybe drop clock everywhere.

Ack. Sounds logical. And the 'from gcc' too.

-- 
With best wishes
Dmitry

