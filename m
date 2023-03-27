Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBAA6CA110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbjC0KTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbjC0KTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:19:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C4240E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:19:19 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id c29so10708992lfv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679912357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKPgWkriMZQQ65QWAVlZx70hrUakFDU29SbpbKwWfv4=;
        b=tRORhUhQNeeJOgPt2cdorHbLNUEXZ/mMn4uUjm9+czgkn4shCcf1ntJk3FFHeW+tNK
         eX2EfvcYdFZyIDEkfCSJs3dwuOmMYdVZgJDCAK34GEeusi37Ii5ZzOXz58IeZC3to+d4
         mRoHCyQHJOIoeU7qj/2oa4BZCwKBBT9G/uUotzlE7OW0/NI2JnoRjePWqFKZGegISqCB
         Mz+LyLZYk6piXwtUp2oQXuuj6CgfCFXRVefGcmaKl9eNUvAukekmz94F7kfnpplLTEFQ
         NUXh0/iKFfUkKYvdjtJl60qgbEeLurxC+5Jv5xePSn1XOnZqYZTiMkMw4YJIhrqMqssn
         oOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKPgWkriMZQQ65QWAVlZx70hrUakFDU29SbpbKwWfv4=;
        b=BUTBmkN9gV/OqTcgGIR8IC0tN9EpiqeT5/nhDfNlfIFw7If6MWhib7ihRFG9gZjzLG
         CNEawP6XGYbLpZUsRifsmamhH8XDsgk9110mZrcQT/Xi0i11RcyRdSXaQLKRa2tCiuFa
         /FAtbRfCDYLhNb9mWlpasvb3kk3gBYNDmS2qjlW9wVb6H6NZw3ItE6OXWA8lMlPDrHnW
         qqCaM1jX7DQOW+5jGom18nUqCTT23+hLBfwCjHTFW40UsB3DkyEZIXoR+VlhgCnC2E5h
         2IU9YbT3YzZYxMUA2Rpj/cWQGh0E+XBWlIX2KbA/KpekXZoQS2zIT9autSoY83aYRKLn
         3WWg==
X-Gm-Message-State: AAQBX9epzjD2T5diFHxxX/DLh/KXigBm1M7/6sIYyHFbKEnukDFee4jR
        SoLQ76jFYbRMpZzxmrgWnZjbVQ==
X-Google-Smtp-Source: AKy350b9fvh4H81BFWNssJ/rySs3BqalIGOFya3qtuZHeqt+1ff9x4kfPirhiK766w/ZYYPQ/a9z9g==
X-Received: by 2002:a19:ad02:0:b0:4e8:5e39:6238 with SMTP id t2-20020a19ad02000000b004e85e396238mr2956082lfc.42.1679912357601;
        Mon, 27 Mar 2023 03:19:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y8-20020ac24208000000b004d40e22c1eesm4616862lfh.252.2023.03.27.03.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:19:17 -0700 (PDT)
Message-ID: <3b5e627d-2ea4-aa66-c0d6-58bf0413b47f@linaro.org>
Date:   Mon, 27 Mar 2023 13:19:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to
 new style of bindings
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
 <20230326005733.2166354-7-dmitry.baryshkov@linaro.org>
 <be4af5a9-6c82-138d-28dc-73b485fa1a00@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <be4af5a9-6c82-138d-28dc-73b485fa1a00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 11:12, Neil Armstrong wrote:
> On 26/03/2023 01:57, Dmitry Baryshkov wrote:
>> Change the USB QMP PHY to use newer style of QMP PHY bindings (single
>> resource region, no per-PHY subnodes).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 57 +++++++++-------------------
>>   1 file changed, 18 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 5e6f9f441f1a..887c490bdd14 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -18,6 +18,7 @@
>>   #include <dt-bindings/interconnect/qcom,sc7280.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>>   #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>> @@ -3327,49 +3328,26 @@ usb_2_hsphy: phy@88e4000 {
>>               resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
>>           };
>> -        usb_1_qmpphy: phy-wrapper@88e9000 {
>> -            compatible = "qcom,sc7280-qmp-usb3-dp-phy",
>> -                     "qcom,sm8250-qmp-usb3-dp-phy";
>> -            reg = <0 0x088e9000 0 0x200>,
>> -                  <0 0x088e8000 0 0x40>,
>> -                  <0 0x088ea000 0 0x200>;
>> +        usb_1_qmpphy: phy@88e8000 {
>> +            compatible = "qcom,sc7280-qmp-usb3-dp-phy";
>> +            reg = <0 0x088e8000 0 0x3000>;
>>               status = "disabled";
>> -            #address-cells = <2>;
>> -            #size-cells = <2>;
>> -            ranges;
>>               clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>                    <&rpmhcc RPMH_CXO_CLK>,
>> -                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>> -            clock-names = "aux", "ref_clk_src", "com_aux";
>> +                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +            clock-names = "aux",
>> +                      "ref",
>> +                      "com_aux",
>> +                      "usb3_pipe";
>>               resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>                    <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>               reset-names = "phy", "common";
>> -            usb_1_ssphy: usb3-phy@88e9200 {
>> -                reg = <0 0x088e9200 0 0x200>,
>> -                      <0 0x088e9400 0 0x200>,
>> -                      <0 0x088e9c00 0 0x400>,
>> -                      <0 0x088e9600 0 0x200>,
>> -                      <0 0x088e9800 0 0x200>,
>> -                      <0 0x088e9a00 0 0x100>;
>> -                #clock-cells = <0>;
>> -                #phy-cells = <0>;
>> -                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> -                clock-names = "pipe0";
>> -                clock-output-names = "usb3_phy_pipe_clk_src";
>> -            };
>> -
>> -            dp_phy: dp-phy@88ea200 {
>> -                reg = <0 0x088ea200 0 0x200>,
>> -                      <0 0x088ea400 0 0x200>,
>> -                      <0 0x088eaa00 0 0x200>,
>> -                      <0 0x088ea600 0 0x200>,
>> -                      <0 0x088ea800 0 0x200>;
>> -                #phy-cells = <0>;
>> -                #clock-cells = <1>;
>> -            };
>> +            #clock-cells = <1>;
>> +            #phy-cells = <1>;
>>           };
>>           usb_2: usb@8cf8800 {
>> @@ -3694,7 +3672,7 @@ usb_1_dwc3: usb@a600000 {
>>                   iommus = <&apps_smmu 0xe0 0x0>;
>>                   snps,dis_u2_susphy_quirk;
>>                   snps,dis_enblslpm_quirk;
>> -                phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +                phys = <&usb_1_hsphy>, <&usb_1_qmpphy 
>> QMP_USB43DP_USB3_PHY>;
>>                   phy-names = "usb2-phy", "usb3-phy";
>>                   maximum-speed = "super-speed";
>>               };
>> @@ -3799,8 +3777,8 @@ dispcc: clock-controller@af00000 {
>>                    <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>>                    <&mdss_dsi_phy 0>,
>>                    <&mdss_dsi_phy 1>,
>> -                 <&dp_phy 0>,
>> -                 <&dp_phy 1>,
>> +                 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +                 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>                    <&mdss_edp_phy 0>,
>>                    <&mdss_edp_phy 1>;
> 
> The gcc usb3_phy_wrapper_gcc_usb30_pipe_clk entry is missing, it was 
> already missing with legacy bindings.

Point noted, it should probably go into a separate change.

> 
> Neil
> 
>>               clock-names = "bi_tcxo",
>> @@ -4138,8 +4116,9 @@ mdss_dp: displayport-controller@ae90000 {
>>                           "stream_pixel";
>>                   assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>>                             <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> -                assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>> -                phys = <&dp_phy>;
>> +                assigned-clock-parents = <&usb_1_qmpphy 
>> QMP_USB43DP_DP_LINK_CLK>,
>> +                             <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +                phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>>                   phy-names = "dp";
>>                   operating-points-v2 = <&dp_opp_table>;
> 

-- 
With best wishes
Dmitry

