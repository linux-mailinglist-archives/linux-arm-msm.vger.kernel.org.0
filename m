Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB19F6F0699
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 15:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbjD0N1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 09:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjD0N1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 09:27:52 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF27D2D47
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 06:27:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-504e232fe47so15540804a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682602069; x=1685194069;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V7xnDUz2dODxnj/h8N5FrCM6kM8AWsyfS5hNS2c2bj4=;
        b=ysLRaQGPh0VUnYPwIlSR9xv4ak+KaD3s+6e+hZEHOEL8bwkuS9sy/uWmVRvibYwUK/
         4QbTGFCqZcsZeMzJwd/QzgIaWgFUA98fsLCgYuMceT1m9jNotOcAmsFjHzQMdujkGJMN
         spG99Guu9gdMbV1L0isYgvacMbgQ42HHMehqNYZPmWd8VBQWKZnPkBh6mzFDIPKgTca8
         1d5n77YicDvN7GbB2NIPD8sgHjfsgUeMIuwauDdxlhcz/GhjBKh1oIpSLR2rKQlHCgTI
         yCBUE8B9vaqU8s7JGPtSl13ENG52PsZ/BEktFbWxK7dYy14edj2UECcHrMy01j7OWQPU
         iYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682602069; x=1685194069;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7xnDUz2dODxnj/h8N5FrCM6kM8AWsyfS5hNS2c2bj4=;
        b=R4Wq1uGQEcTWgEUvgHR90Y3qATKv2MifbAjRlnoX1RZ7Vn7DOwU6DAY/EHU6SlJnYv
         3IaIsucUzkmpvBfejX70m9BD4cSm4Jx0tinIp135uRaAWcf1wzZZo5wgrtdTXRkoe4Gk
         l0wakG9hhxh/ZJ8aUoECYmUOWTGDR8PRo/+C0ckCJUI6GvHdRmGKU0UvhZninqpTGUF0
         2myzvNgwRDSIWkw2YTy1CGLZik3ztH0ZFlff4EfxyZ/yNeiAdn6tiXFowdqiJJXb6f6X
         LQQ8JVIxhdogiiL35SctIIc7bcw8vil0EO+bzr6MfCMFdCllvG+em8Az6w/xiJR2CBdL
         uFiA==
X-Gm-Message-State: AC+VfDw/0X/tGHtBhHpkmM8ZFNjAAKPKjr6GZt83P+83Vyma5VdGcP7u
        3QZa0s8doAK6Dx1wttLGpIJ+tA==
X-Google-Smtp-Source: ACHHUZ5Z/0Br9KzFA0FV3Z+N8MCgk4/6hbEyRiw2D64gbtF3sC+Dy1oXNCxQfJbmFt2pef7SAiEbmQ==
X-Received: by 2002:a05:6402:2:b0:504:9cec:8afb with SMTP id d2-20020a056402000200b005049cec8afbmr1773400edu.2.1682602069344;
        Thu, 27 Apr 2023 06:27:49 -0700 (PDT)
Received: from [172.23.2.82] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id n20-20020a05640206d400b00504b203c4f1sm8070176edy.40.2023.04.27.06.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 06:27:48 -0700 (PDT)
Message-ID: <fc414f61-34a8-acb0-29d4-971a873562e5@linaro.org>
Date:   Thu, 27 Apr 2023 15:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sc8280xp-crd: Add QMP to SuperSpeed
 graph
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230425034010.3789376-1-quic_bjorande@quicinc.com>
 <20230425034010.3789376-7-quic_bjorande@quicinc.com>
 <aa94b488-cb6e-bd74-0711-b7c4c7589f7a@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <aa94b488-cb6e-bd74-0711-b7c4c7589f7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2023 01:33, Konrad Dybcio wrote:
> 
> On 4/25/23 04:40, Bjorn Andersson wrote:
>> With support for the QMP combo phy to react to USB Type-C switch events,
>> introduce it as the next hop for the SuperSpeed lanes of the two USB
>> Type-C connectors, and connect the output of the DisplayPort controller
>> to the QMP combo phy.
>>
>> This allows the TCPM to perform orientation switching of both USB and
>> DisplayPort signals.
>>
>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 28 ++++++++++++++++---
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi    | 34 +++++++++++++++++++++++
>>   2 files changed, 58 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> index 547277924ea3..33c973661fa5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
>> @@ -64,7 +64,7 @@ port@1 {
>>                       reg = <1>;
>>                       pmic_glink_con0_ss: endpoint {
>> -                        remote-endpoint = <&mdss0_dp0_out>;
>> +                        remote-endpoint = <&usb_0_qmpphy_out>;
>>                       };
>>                   };
>> @@ -99,7 +99,7 @@ port@1 {
>>                       reg = <1>;
>>                       pmic_glink_con1_ss: endpoint {
>> -                        remote-endpoint = <&mdss0_dp1_out>;
>> +                        remote-endpoint = <&usb_1_qmpphy_out>;
>>                       };
>>                   };
>> @@ -412,7 +412,7 @@ &mdss0_dp0 {
>>   &mdss0_dp0_out {
>>       data-lanes = <0 1>;
>> -    remote-endpoint = <&pmic_glink_con0_ss>;
>> +    remote-endpoint = <&usb_0_qmpphy_dp_in>;
>>   };
>>   &mdss0_dp1 {
>> @@ -421,7 +421,7 @@ &mdss0_dp1 {
>>   &mdss0_dp1_out {
>>       data-lanes = <0 1>;
>> -    remote-endpoint = <&pmic_glink_con1_ss>;
>> +    remote-endpoint = <&usb_1_qmpphy_dp_in>;
>>   };
>>   &mdss0_dp3 {
>> @@ -670,9 +670,19 @@ &usb_0_qmpphy {
>>       vdda-phy-supply = <&vreg_l9d>;
>>       vdda-pll-supply = <&vreg_l4d>;
>> +    orientation-switch;
> 
> I believe this belongs in the SoC DTSI, as it's supported by
> the PHY block itself
> 
> 
> The rest seems to lgtm..
> 
> 
> On a note, why did we end up placing pmic_glink in device
> DTs? It's already assumed that we're using the full Qualcomm
> stack as we use PAS for remoteprocs so I *think* we can always
> assume pmic_glink would be there!

As we did on other board, I think because having pmic_glink depends
on the board firmware capabilities ? Boards without USB-C won't need/have
pmic_link right ?

Neil

> 
> Konrad
> 
>> +
>>       status = "okay";
>>   };
>> +&usb_0_qmpphy_dp_in {
>> +    remote-endpoint = <&mdss0_dp0_out>;
>> +};
>> +
>> +&usb_0_qmpphy_out {
>> +    remote-endpoint = <&pmic_glink_con0_ss>;
>> +};
>> +
>>   &usb_0_role_switch {
>>       remote-endpoint = <&pmic_glink_con0_hs>;
>>   };
>> @@ -697,9 +707,19 @@ &usb_1_qmpphy {
>>       vdda-phy-supply = <&vreg_l4b>;
>>       vdda-pll-supply = <&vreg_l3b>;
>> +    orientation-switch;
>> +
>>       status = "okay";
>>   };
>> +&usb_1_qmpphy_dp_in {
>> +    remote-endpoint = <&mdss0_dp1_out>;
>> +};
>> +
>> +&usb_1_qmpphy_out {
>> +    remote-endpoint = <&pmic_glink_con1_ss>;
>> +};
>> +
>>   &usb_1_role_switch {
>>       remote-endpoint = <&pmic_glink_con1_hs>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 0e691bb0120c..1eb3a295e8fa 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -3006,6 +3006,23 @@ usb_0_qmpphy: phy@88eb000 {
>>               #phy-cells = <1>;
>>               status = "disabled";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    usb_0_qmpphy_out: endpoint {};
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    usb_0_qmpphy_dp_in: endpoint {};
>> +                };
>> +            };
>>           };
>>           usb_1_hsphy: phy@8902000 {
>> @@ -3042,6 +3059,23 @@ usb_1_qmpphy: phy@8903000 {
>>               #phy-cells = <1>;
>>               status = "disabled";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    usb_1_qmpphy_out: endpoint {};
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +
>> +                    usb_1_qmpphy_dp_in: endpoint {};
>> +                };
>> +            };
>>           };
>>           mdss1_dp0_phy: phy@8909a00 {

