Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FD4F1272
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 10:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbfKFJhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 04:37:34 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55630 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFJhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 04:37:34 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BF01C603A3; Wed,  6 Nov 2019 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573033052;
        bh=ycIX0l1aMiAP93a1tcCFC0XAdaWIEMXrTnW0xQuIuNY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PC4GAtFYpooG8AhjsnWbJ+gg8IRwLL44Sb3kRv9AC/8eqZpR5yaqglCImJ7n4wdmI
         L5ZZl3oUR8yixkg0BsaNxa98TqnKIecRsh9rbMlFBUQ6yMrJS0BTZjRI5mV0jGRWOz
         g3uBhzbJRY9kGQ7KGFdBV4KnEUk88Q9gWk2EWkEA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.25.219] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75EE960B69;
        Wed,  6 Nov 2019 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573033051;
        bh=ycIX0l1aMiAP93a1tcCFC0XAdaWIEMXrTnW0xQuIuNY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ffz02pN5IqZ6XN5Lj1BMWFP/EDQIKq/fG/xi6IHNVHZ2wSiaixHaCVbQ2wP6qgcJ/
         GZNwLMXwyxPvULL72ox96sBDqcV9TCGgcGQRAi/352vEkUE+WY3UQXHs8ZCCXt8kQK
         av9MLAV82j6aEa1gCMmB98SLx3UgQUhQ+BQAhHro=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75EE960B69
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1572529762-31256-1-git-send-email-sanm@codeaurora.org>
 <1572529762-31256-2-git-send-email-sanm@codeaurora.org>
 <5dc0c729.1c69fb81.4575.3392@mx.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <3aa0e1a5-9dd6-fdb5-057d-70af88218fb4@codeaurora.org>
Date:   Wed, 6 Nov 2019 15:07:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <5dc0c729.1c69fb81.4575.3392@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/5/2019 6:19 AM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2019-10-31 06:49:22)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 189254f..aecc994 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -400,3 +400,28 @@
>>                          bias-pull-up;
>>                  };
>>   };
>> +
>> +&usb_1 {
>> +       status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +       dr_mode = "host";
>> +};
>> +
>> +&usb_1_hsphy {
>> +       status = "okay";
>> +       vdd-supply = <&vreg_l4a_0p8>;
>> +       vdda-pll-supply = <&vreg_l11a_1p8>;
>> +       vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
>> +       qcom,imp-res-offset-value = <8>;
>> +       qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
>> +       qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
>> +       qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
>> +};
>> +
>> +&usb_1_qmpphy {
>> +       status = "okay";
>> +       vdda-phy-supply = <&vreg_l3c_1p2>;
>> +       vdda-pll-supply = <&vreg_l4a_0p8>;
>> +};
>> \ No newline at end of file
> Why is there no newline at end of file?
Will correct in next version.
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index cb623b7..7ee068f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -9,6 +9,7 @@
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qusb2.h>
> Sort includes?
Will correct in next version.
>>   
>>   / {
>>          interrupt-parent = <&intc>;
>> @@ -184,6 +185,17 @@
>>                          #power-domain-cells = <1>;
>>                  };
>>   
>> +               qfprom@784000 {
>> +                       compatible = "qcom,qfprom";
>> +                       reg = <0 0x00784000 0 0x8ff>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +
>> +                       qusb2p_hstx_trim: hstx-trim-primary@25b {
>> +                               reg = <0x25b 0x1>;
>> +                               bits = <1 3>;
>> +                       };
>> +               };
> Add newline here?
Will correct in next version.
>
>>                  pdc: interrupt-controller@b220000 {
>>                          compatible = "qcom,sdm845-pdc";
>>                          reg = <0 0xb220000 0 0x30000>;
>> @@ -913,6 +925,98 @@
>>                          status = "disabled";
>>                  };
>>   
>> +               usb_1_hsphy: phy@88e3000 {
>> +                       compatible = "qcom,sc7180-qusb2-phy";
>> +                       reg = <0 0x088e3000 0 0x400>;
>> +                       status = "disabled";
>> +                       #phy-cells = <0>;
>> +                       clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                       <&rpmhcc RPMH_CXO_CLK>;
> Nitpick: Can you indent this to align with clocks above?
Will correct in next version.
>
>> +                       clock-names = "cfg_ahb","ref";
>> +                       resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> +
>> +                       nvmem-cells = <&qusb2p_hstx_trim>;
>> +               };
>> +
>> +               usb_1_qmpphy: phy@88e9000 {
>> +                       compatible = "qcom,sc7180-qmp-usb3-phy";
>> +                       reg = <0 0x088e9000 0 0x18c>,
>> +                             <0 0x088e8000 0 0x38>;
>> +                       reg-names = "reg-base", "dp_com";
>> +                       status = "disabled";
>> +                       #clock-cells = <1>;
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +
>> +                       clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>> +                                <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> +                                <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>> +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>> +                       clock-names = "aux", "cfg_ahb", "ref", "com_aux";
>> +
>> +                       resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>> +                                <&gcc GCC_USB3_PHY_PRIM_BCR>;
>> +                       reset-names = "phy", "common";
>> +
>> +                       usb_1_ssphy: lanes@88e9200 {
>> +                               reg = <0 0x088e9200 0 0x128>,
>> +                                     <0 0x088e9400 0 0x200>,
>> +                                     <0 0x088e9c00 0 0x218>,
>> +                                     <0 0x088e9600 0 0x128>,
>> +                                     <0 0x088e9800 0 0x200>,
>> +                                     <0 0x088e9a00 0 0x18>;
>> +                               #phy-cells = <0>;
>> +                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +                               clock-names = "pipe0";
>> +                               clock-output-names = "usb3_phy_pipe_clk_src";
> Does this clock go somewhere? Like GCC?
Yes this clock will go to GCC.
>> +                       };
>> +               };
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

