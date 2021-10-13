Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9E42B54A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 07:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhJMFdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 01:33:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14512 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237660AbhJMFdE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 01:33:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634103062; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Knclx6wR1kvoxnA2zY3oGlpVlJCs7kumqLTKNns8fg0=;
 b=EGonT9laoR7/vT8F1nQj3UtDs6R+CBmQ9L551MBpCDTuf/bXLPqK5doannxTMcQDQhKqehjc
 ZLbj5weWLXP0bVijIFWWiCFVUTCICZC2sAyahpt4poXBxtPYTiziUe/ec79NNVxleRhtLP1i
 SsihKMP7rLl2B38cfIUuYzYDZJQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61666f0ca45ca7530706e46d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 05:30:52
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4EB1CC43617; Wed, 13 Oct 2021 05:30:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 938D0C4338F;
        Wed, 13 Oct 2021 05:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Oct 2021 11:00:50 +0530
From:   bgodavar@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, johan.hedberg@gmail.com,
        marcel@holtmann.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        pharish@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, saluvala@codeaurora.org,
        abhishekpandit@chromium.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
In-Reply-To: <CAE-0n52uUh5TrKpJq9-qkJTdWWU_EZFvoROWFeGEjuc1Ebc8xg@mail.gmail.com>
References: <1634043698-20256-1-git-send-email-bgodavar@codeaurora.org>
 <CAE-0n52uUh5TrKpJq9-qkJTdWWU_EZFvoROWFeGEjuc1Ebc8xg@mail.gmail.com>
Message-ID: <46cc793cf651822ef90c448682598a02@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen Boyd,

On 2021-10-12 22:54, Stephen Boyd wrote:
> Quoting Balakrishna Godavarthi (2021-10-12 06:01:38)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 272d5ca..09adc802 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -393,6 +393,23 @@
>>                                 <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>>         pinctrl-names = "default", "sleep";
>>         pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, 
>> <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> +
>> +       bluetooth: wcn6750-bt {
> 
> bluetooth: bluetooth {
> 
> Node names should be generic.
> 

[Bala]: will update in next patch.

>> +               compatible = "qcom,wcn6750-bt";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&bt_en_default>;
>> +               enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +               swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
> 
> Is there any pinctrl config for gpio 86?
> 
[Bala]: This is input GPIO to apps, BT SOC will handle configurations.

>> +               vddaon-supply = <&vreg_s7b_0p9>;
>> +               vddbtcxmx-supply = <&vreg_s7b_0p9>;
>> +               vddrfacmn-supply = <&vreg_s7b_0p9>;
>> +               vddrfa0p8-supply = <&vreg_s7b_0p9>;
>> +               vddrfa1p7-supply = <&vreg_s1b_1p8>;
>> +               vddrfa1p2-supply = <&vreg_s8b_1p2>;
>> +               vddrfa2p2-supply = <&vreg_s1c_2p2>;
>> +               vddasd-supply = <&vreg_l11c_2p8>;
>> +               max-speed = <3200000>;
>> +       };
>>  };
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> @@ -504,6 +521,14 @@
>>                  */
>>                 bias-pull-up;
>>         };
>> +
>> +       bt_en_default: bt_en_default {
> 
> bt_en: bt-en {
> 
> Node names shouldn't have underscores and 'default' is redundant.
> 
[Bala]: will update in next patch.

>> +               pins = "gpio85";
>> +               function = "gpio";
>> +               drive-strength = <2>;
>> +               output-low;
>> +               bias-pull-down;
> 
> Why is there a pull down on an output gpio? Shouldn't this be
> bias-disable?
> 

[Bala]: BT_EN pin is OP of apps and input to BT SoC.
by default we want the state of BT_EN to be low. so used pull down 
instead of bias-disable
as AFAIK bias-disable may trigger a tristate on BT_EN pin, which may 
trigger BT SoC enable
if it is not actually triggered.

>> +       };
>>  };
>> 
>>  &sdc1_on {
