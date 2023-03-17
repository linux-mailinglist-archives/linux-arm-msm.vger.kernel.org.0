Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00F16BEB2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 15:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjCQO27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 10:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjCQO26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 10:28:58 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362E412F2A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 07:28:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id y14so4609629wrq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679063334;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tR0wQE8M8Ta7hlf9T/C518wbuU/k1dFHdTpiVCbCQdI=;
        b=HCaaMySfgkDU+bWp7bW2t9rdVrsQ8GHioDCTlMLMf+IjW9YDEPsuVCotEPWyrbXYTd
         4br89bZ1UzJv1aPgq0dvgItl5QG8RMJBynsBt6HACyz+qZeEXkBzqFAvT3dPJa0uQBEG
         aDH5KCDYVdMPmarak8pJ4iWTYDLGrciE2h2Yjz+PC3PvNYtsbzRARj8aX9I0KFj0QWDW
         PhcbFQjS7o5FjxP6zzQiXy//CpKR2j6Ah1KYAvE4cHiwLNB56qKgp79SZCX8BxD9X01C
         q9ZEmGUAmkylHO0zHr77aEZcEfR1vRYqv9gYSI38HVwfpt0AU7kAkfew7EjzqjKeatRX
         qIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679063334;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tR0wQE8M8Ta7hlf9T/C518wbuU/k1dFHdTpiVCbCQdI=;
        b=TFUBX7PVPnpjHCtlCt//a6QdctPx4DDwQUMxdlNuvaUsbEPkmbK2CvBLG7tGP2PhzZ
         PzRSrz3flfJLhMzbBdf13f+GhD3xGqFtkjeKLgN/nQqt/Ml6ODqWHj30cuCeIWv12/mo
         R1gAYBWJ6DrhlkN3HBgFn5jgPCBDVsRn8wqw5YL9pEu+4vUINzhIqJeOUs0MsuBHfHda
         zEIuxooS2A86X7KMn5azCQEj3qJwRB96wE79TTQN2XNYeg4mfS+rS77GAlYxjLueAfTv
         ObgGY4PYAT4FKw+7Xo9ggbJnVedrf3FCAmwuXBzZ/dQl0/4iutlhV1d+S/vGGdoCe5WI
         +gvA==
X-Gm-Message-State: AO0yUKUm4sh5aeKrynMJpgZeOEm4NerwzzaeUTrBCDIxJ+FYizBjz70b
        ZtJHirbjJL35MG0JEW6XEMGYXA==
X-Google-Smtp-Source: AK7set8AKYEIAth7Eh89Fp1MUe2n6Pd90pcAPWLJZ+SNTSiWn6+fUk1b6MLbrI5cbflwdqY3s2h0AA==
X-Received: by 2002:adf:f68b:0:b0:2cb:d8f1:1d2f with SMTP id v11-20020adff68b000000b002cbd8f11d2fmr7678165wrp.17.1679063334621;
        Fri, 17 Mar 2023 07:28:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9ed5:bad0:e925:7938? ([2a01:e0a:982:cbb0:9ed5:bad0:e925:7938])
        by smtp.gmail.com with ESMTPSA id e8-20020adffc48000000b002c8476dde7asm2057650wrs.114.2023.03.17.07.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 07:28:54 -0700 (PDT)
Message-ID: <77195576-34c1-d522-194c-85eba5d023fe@linaro.org>
Date:   Fri, 17 Mar 2023 15:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8450: switch to usb3/dp combo
 phy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v5-4-a27f1b26ebe8@linaro.org>
 <ab6391c4-ff38-8286-77ff-c781669f5aa0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ab6391c4-ff38-8286-77ff-c781669f5aa0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/03/2023 13:09, Dmitry Baryshkov wrote:
> On 17/03/2023 11:12, Neil Armstrong wrote:
>> The QMP PHY is a USB3/DP combo phy, switch to the newly
>> documented bindings and register the clocks to the GCC
>> and DISPCC controllers.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 +++++++++++++-----------------------
>>   1 file changed, 15 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 69695eb83897..0b5a151ce138 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -11,6 +11,7 @@
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/interconnect/qcom,sm8450.h>
>>   #include <dt-bindings/soc/qcom,gpr.h>
>> @@ -748,7 +749,7 @@ gcc: clock-controller@100000 {
>>                    <&ufs_mem_phy_lanes 0>,
>>                    <&ufs_mem_phy_lanes 1>,
>>                    <&ufs_mem_phy_lanes 2>,
>> -                 <0>;
>> +                 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>>               clock-names = "bi_tcxo",
>>                         "sleep_clk",
>>                         "pcie_0_pipe_clk",
>> @@ -2034,37 +2035,24 @@ usb_1_hsphy: phy@88e3000 {
>>               resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>>           };
>> -        usb_1_qmpphy: phy-wrapper@88e9000 {
>> -            compatible = "qcom,sm8450-qmp-usb3-phy";
>> -            reg = <0 0x088e9000 0 0x200>,
>> -                  <0 0x088e8000 0 0x20>;
>> -            status = "disabled";
>> -            #address-cells = <2>;
>> -            #size-cells = <2>;
>> -            ranges;
>> +        usb_1_qmpphy: phy@88e8000 {
>> +            compatible = "qcom,sm8450-qmp-usb3-dp-phy";
>> +            reg = <0 0x088e8000 0 0x4000>;
> 
> This should be 0x3000 too, like 8350

Ack thx for noticing

> 
>>               clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>                    <&rpmhcc RPMH_CXO_CLK>,
>> -                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>> -            clock-names = "aux", "ref_clk_src", "com_aux";
>> +                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +            clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>>               resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>                    <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>               reset-names = "phy", "common";
>> -            usb_1_ssphy: phy@88e9200 {
>> -                reg = <0 0x088e9200 0 0x200>,
>> -                      <0 0x088e9400 0 0x200>,
>> -                      <0 0x088e9c00 0 0x400>,
>> -                      <0 0x088e9600 0 0x200>,
>> -                      <0 0x088e9800 0 0x200>,
>> -                      <0 0x088e9a00 0 0x100>;
>> -                #phy-cells = <0>;
>> -                #clock-cells = <0>;
>> -                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> -                clock-names = "pipe0";
>> -                clock-output-names = "usb3_phy_pipe_clk_src";
>> -            };
>> +            #clock-cells = <1>;
>> +            #phy-cells = <1>;
>> +
>> +            status = "disabled";
>>           };
>>           remoteproc_slpi: remoteproc@2400000 {
>> @@ -2972,8 +2960,8 @@ dispcc: clock-controller@af00000 {
>>                    <&mdss_dsi0_phy 1>,
>>                    <&mdss_dsi1_phy 0>,
>>                    <&mdss_dsi1_phy 1>,
>> -                 <0>, /* dp0 */
>> -                 <0>,
>> +                 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +                 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>                    <0>, /* dp1 */
>>                    <0>,
>>                    <0>, /* dp2 */
>> @@ -4168,7 +4156,7 @@ usb_1_dwc3: usb@a600000 {
>>                   iommus = <&apps_smmu 0x0 0x0>;
>>                   snps,dis_u2_susphy_quirk;
>>                   snps,dis_enblslpm_quirk;
>> -                phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +                phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>>                   phy-names = "usb2-phy", "usb3-phy";
>>               };
>>           };
>>
> 

