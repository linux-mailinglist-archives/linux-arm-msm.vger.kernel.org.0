Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E572174EDCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbjGKMMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjGKMMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:12:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2051E55
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:12:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so8363006e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077541; x=1691669541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDy7dHlG8mw55snATaE8leDnJkkCCM8iB+BLX9zgGAo=;
        b=vxXq6OQnnHTv5UKvvxLeU7f2QQGWO+rhZ1z5BVxqZF/VvX7fdLcJg/K0QFEGXgeqc8
         sxac9dxirDwWLram7+y1DVzbGH4uf/gfxZkKm21kMHFTfyxE95Mnh9xgcHOyLbz6qYL1
         h0cBsLVpyhlXpveHMk4yk8N/17CCg/njTMGHorgbJguzoH+zqY0Edt7npHYHItmIOUna
         8l3/L0wIT5Quj6knBD1qENLpuCMPzK3wDOTnEt1sQpUlL3MUwPFCyBUneeeSOUcDdl9A
         M+puQiKyqSERt1GULiMOYwnKNgReUgWwslZo8GjmeSTi6s0swA0ZCgR/iiDvLhSuj54w
         6RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077541; x=1691669541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDy7dHlG8mw55snATaE8leDnJkkCCM8iB+BLX9zgGAo=;
        b=ailDbhtnUxjfOoXx8OonxR2Ub6za3Sdtt2GL0OCK2xmCtuK6KKLOmmqBygRvb3qGNI
         xpYsyJ88Maaxkz27pEzoaO4kbP4+OOmuFvwWsZmqdx58vQ2wbWpL9Jjy2n7bVhJuRBfs
         9aH+m3tl4EiamVXhtLkQXgaAlNM6LBwJaC/V5X/Lfn/6tWVioIVttVlT6RwHVyxcNqe9
         k7o/WBX+GjarggD5XQplpq8e5BY8uJJ7WhtGoSz2HJs5xEgp/2LNN1Xu8S0JNzW/plHh
         xMlX/0nZIyJ9UwLUUBBvI/QqlZo9ysdoqRnXb3K99DfoFwsk121j46t5UuWQCQa65v+e
         s0mQ==
X-Gm-Message-State: ABy/qLZ/FxslIZ28JjQQiQKPbF9/u//dXoRR8Oj9gnyUvbWiiolxW9oR
        cn3CZd4ozBL5l32RmOgtXpfRrA==
X-Google-Smtp-Source: APBJJlHQ0ExF60LDzFQpwimlhl+fdeOGdxysoQkuC6HFjjJ1PJS4V39IMHE5izdNyJkWsJxQIp39/A==
X-Received: by 2002:ac2:5f63:0:b0:4fa:fc12:2bdd with SMTP id c3-20020ac25f63000000b004fafc122bddmr12455413lfc.40.1689077540923;
        Tue, 11 Jul 2023 05:12:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b9-20020a056512024900b004fb738796casm299425lfo.40.2023.07.11.05.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 05:12:20 -0700 (PDT)
Message-ID: <e46c9cce-b4f0-cc56-13b3-7402fc0bdc81@linaro.org>
Date:   Tue, 11 Jul 2023 15:12:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: sc7180: switch USB+DP QMP PHY
 to new style of bindings
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
 <20230521202321.19778-6-dmitry.baryshkov@linaro.org>
 <2d5b28d3-83f9-15c4-84e0-e6edb3f3333d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2d5b28d3-83f9-15c4-84e0-e6edb3f3333d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/05/2023 11:41, Konrad Dybcio wrote:
> 
> 
> On 21.05.2023 22:23, Dmitry Baryshkov wrote:
>> Change the USB QMP PHY to use newer style of QMP PHY bindings (single
>> resource region, no per-PHY subnodes).
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++------------------
>>   1 file changed, 19 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index ea1ffade1aa1..b07a49e6829a 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -14,6 +14,7 @@
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>   #include <dt-bindings/interconnect/qcom,sc7180.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>   #include <dt-bindings/phy/phy-qcom-qusb2.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>> @@ -2718,49 +2719,28 @@ usb_1_hsphy: phy@88e3000 {
>>   			nvmem-cells = <&qusb2p_hstx_trim>;
>>   		};
>>   
>> -		usb_1_qmpphy: phy-wrapper@88e9000 {
>> +		usb_1_qmpphy: phy@88e8000 {
>>   			compatible = "qcom,sc7180-qmp-usb3-dp-phy";
>> -			reg = <0 0x088e9000 0 0x18c>,
>> -			      <0 0x088e8000 0 0x3c>,
>> -			      <0 0x088ea000 0 0x18c>;
>> +			reg = <0 0x088e8000 0 0x3000>;
>>   			status = "disabled";
>> -			#address-cells = <2>;
>> -			#size-cells = <2>;
>> -			ranges;
>>   
>>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>> -				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>>   				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>> -			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
>> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
>> +				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>;
> These are unaligned
> 
> Other than that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Ugh. It seems I missed this comment (and your r-b tag) when sending v4. 
Please excuse me. I'll send v5 in a few days to reduce the simultaneous 
spam.

> 
> Konrad
>> +			clock-names = "aux",
>> +				      "ref",
>> +				      "com_aux",
>> +				      "usb3_pipe",
>> +				      "cfg_ahb";
>>   
>>   			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
>>   				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>>   			reset-names = "phy", "common";
>>   
>> -			usb_1_ssphy: usb3-phy@88e9200 {
>> -				reg = <0 0x088e9200 0 0x128>,
>> -				      <0 0x088e9400 0 0x200>,
>> -				      <0 0x088e9c00 0 0x218>,
>> -				      <0 0x088e9600 0 0x128>,
>> -				      <0 0x088e9800 0 0x200>,
>> -				      <0 0x088e9a00 0 0x18>;
>> -				#clock-cells = <0>;
>> -				#phy-cells = <0>;
>> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> -				clock-names = "pipe0";
>> -				clock-output-names = "usb3_phy_pipe_clk_src";
>> -			};
>> -
>> -			dp_phy: dp-phy@88ea200 {
>> -				reg = <0 0x088ea200 0 0x200>,
>> -				      <0 0x088ea400 0 0x200>,
>> -				      <0 0x088eaa00 0 0x200>,
>> -				      <0 0x088ea600 0 0x200>,
>> -				      <0 0x088ea800 0 0x200>;
>> -				#clock-cells = <1>;
>> -				#phy-cells = <0>;
>> -			};
>> +			#clock-cells = <1>;
>> +			#phy-cells = <1>;
>>   		};
>>   
>>   		dc_noc: interconnect@9160000 {
>> @@ -2840,7 +2820,7 @@ usb_1_dwc3: usb@a600000 {
>>   				iommus = <&apps_smmu 0x540 0>;
>>   				snps,dis_u2_susphy_quirk;
>>   				snps,dis_enblslpm_quirk;
>> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>>   				phy-names = "usb2-phy", "usb3-phy";
>>   				maximum-speed = "super-speed";
>>   			};
>> @@ -3148,8 +3128,9 @@ mdss_dp: displayport-controller@ae90000 {
>>   					      "ctrl_link_iface", "stream_pixel";
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>>   						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> -				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>> -				phys = <&dp_phy>;
>> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>>   				phy-names = "dp";
>>   
>>   				operating-points-v2 = <&dp_opp_table>;
>> @@ -3206,8 +3187,8 @@ dispcc: clock-controller@af00000 {
>>   				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>>   				 <&dsi_phy 0>,
>>   				 <&dsi_phy 1>,
>> -				 <&dp_phy 0>,
>> -				 <&dp_phy 1>;
>> +				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   			clock-names = "bi_tcxo",
>>   				      "gcc_disp_gpll0_clk_src",
>>   				      "dsi0_phy_pll_out_byteclk",

-- 
With best wishes
Dmitry

