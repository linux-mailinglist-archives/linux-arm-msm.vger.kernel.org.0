Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1DC41E6C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 06:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239994AbhJAEb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 00:31:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36813 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237578AbhJAEb0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 00:31:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633062582; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hMlYsnEpNAjIGcGeBS4W4NAj6nd6tI3JefAIl+pq0PI=;
 b=PSHkEBLEGG/GtIEaZnZwGp/ixtl6mqFU8fOZ0qxXoX0xKHRWVRFpCgJ+OT21m3C9V79OXrwF
 /d7f7RhC2atTQqqTWtV2/h0BfJ511NgMKbKMTFCHeMDuyj/Wg846O4/62L3ksFtxzQZ+z/UV
 nJF6A9gD9cvhVm9Z6XKGOqaHL9c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61568eb447d64efb6d1f2c50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 04:29:40
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE5D0C43460; Fri,  1 Oct 2021 04:29:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AE4FC4338F;
        Fri,  1 Oct 2021 04:29:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 Oct 2021 09:59:39 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP
 board
In-Reply-To: <CAE-0n52G7=PFrPGr5Zwq43q55CWBSkaEm7HpC+C4r2+Gjv3JQg@mail.gmail.com>
References: <1632837350-12100-1-git-send-email-pmaliset@codeaurora.org>
 <1632837350-12100-4-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n52G7=PFrPGr5Zwq43q55CWBSkaEm7HpC+C4r2+Gjv3JQg@mail.gmail.com>
Message-ID: <d009c9c26e8ea7058509e96d2e0cd282@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-29 02:22, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-09-28 06:55:49)
>> Enable PCIe controller and PHY for sc7280 IDP board.
>> Add specific NVMe GPIO entries for SKU1 and SKU2 support.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  9 ++++++
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 54 
>> ++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 ++++++
>>  3 files changed, 72 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 64fc22a..1562386 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -61,6 +61,15 @@
>>         modem-init;
>>  };
>> 
>> +&nvme_pwren_pin {
>> +       pins = "gpio19";
>> +};
> 
> This should move to the bottom in the "pinctrl" section.
> 
Hi Stephen,

There is no pinctrl section in this file. we defined nvme_pwren_pin in 
common IDP file(sc7280-idp.dtsi) and using the nvme_pwren_pin reference 
to define SKU specific gpio pin for SKU1 and SKU2 support.

Thanks
-Prasad
>> +
>> +&nvme_3v3_regulators {
>> +       gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
>> +       enable-active-high;
> 
> The enable-active-high can be in the idp.dtsi file? That doesn't seem 
> to
> change.
> 
>> +};
>> +
>>  &pmk8350_vadc {
>>         pmr735a_die_temp {
>>                 reg = <PMR735A_ADC7_DIE_TEMP>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index def22ff..5b5505f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -31,6 +31,17 @@
>>                         linux,can-disable;
>>                 };
>>         };
>> +
>> +       nvme_3v3_regulators: nvme-3v3-regulators {
> 
> Why plural? Isn't it a single regulator?
> 
Sure, I will update in next version

Thanks
-Prasad
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "VLDO_3V3";
>> +
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&nvme_pwren_pin>;
>> +       };
>>  };
>> 
>>  &apps_rsc {
>> @@ -220,6 +231,42 @@
>>         modem-init;
>>  };
>> 
>> +&pcie1 {
>> +       status = "okay";
>> +       perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +
>> +       vddpe-3v3-supply = <&nvme_3v3_regulators>;
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pcie1_default_state>;
>> +};
>> +
>> +&pcie1_phy {
>> +       status = "okay";
>> +
>> +       vdda-phy-supply = <&vreg_l10c_0p8>;
>> +       vdda-pll-supply = <&vreg_l6b_1p2>;
>> +};
>> +
>> +&pcie1_default_state {
> 
> I thought the node would be split into a reset config node and a wake
> config node. Is that not being done for some reason? The pinctrl-0 
> would
> look like
> 
Agree, I will incorporate the changes in next version.

> 	pinctrl-0 = <&pcie1_default_state>, <&pcie1_reset_n>, <&pcie1_wake_n>;
> 
>> +       reset-n {
>> +               pins = "gpio2";
>> +               function = "gpio";
>> +
>> +               drive-strength = <16>;
>> +               output-low;
>> +               bias-disable;
>> +       };
>> +
>> +       wake-n {
>> +               pins = "gpio3";
>> +               function = "gpio";
>> +
>> +               drive-strength = <2>;
>> +               bias-pull-up;
>> +       };
>> +};
>> +
>>  &pmk8350_vadc {
>>         pmk8350_die_temp {
>>                 reg = <PMK8350_ADC7_DIE_TEMP>;
>> @@ -489,3 +536,10 @@
>>                 bias-pull-up;
>>         };
>>  };
>> +
>> +&tlmm {
>> +       nvme_pwren_pin: nvme-pwren-pin {
>> +               function = "gpio";
>> +               bias-pull-up;
>> +       };
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> index 1fc2add..0548cb6 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> @@ -21,3 +21,12 @@
>>                 stdout-path = "serial0:115200n8";
>>         };
>>  };
>> +
>> +&nvme_pwren_pin {
>> +       pins = "gpio51";
>> +};
> 
> The pin config can go to a pinctrl section at the bottom of this file?
> 
Same as a like SKU1 (sc7280-idp.dts)
>> +
>> +&nvme_3v3_regulators {
>> +       gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>> +       enable-active-high;
>> +};
