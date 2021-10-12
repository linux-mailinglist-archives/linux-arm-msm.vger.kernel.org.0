Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1405E42A16E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 11:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhJLJ5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 05:57:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33497 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhJLJ5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 05:57:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634032533; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5qSQYtrGHjpBWl/ojCdJhEuYiM0d4NPaFPe3p9m6H/w=;
 b=Aqf/9lFmnt1sIUODnSWdosourSez/yRXRhla9PscFzwkyEYLiqVZl56rWHY52IR8qnXYTs/m
 L6vcIs9WxXzJvVmZmNOnT7ZsaEzj35njiwH8fMt1K7orQEFI3aysbB83ymbo/aRAvXf1teVV
 tKwD7iH6Fzt7tMhyHIsNfDUHHE4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61655b8103355859c84bb50c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 09:55:13
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F012AC4360C; Tue, 12 Oct 2021 09:55:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45EAEC4338F;
        Tue, 12 Oct 2021 09:55:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Oct 2021 15:25:11 +0530
From:   bgodavar@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, bjorn.andersson@linaro.org,
        johan.hedberg@gmail.com, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        pharish@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sc7280: Add bluetooth node on
 SC7280 IDP board
In-Reply-To: <YV3cVzI4aVeCjMt2@google.com>
References: <1633523403-32264-1-git-send-email-bgodavar@codeaurora.org>
 <YV3cVzI4aVeCjMt2@google.com>
Message-ID: <bac51fc71002bdd9c20b92571d3e1c7e@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2021-10-06 22:56, Matthias Kaehlcke wrote:
> On Wed, Oct 06, 2021 at 06:00:02PM +0530, Balakrishna Godavarthi wrote:
>> Add bluetooth SoC WCN6750 node for SC7280 IDP board.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  2 ++
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 
>> +++++++++++++++++++++++++++++++
>>  2 files changed, 33 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 64fc22a..d3f5393 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -17,6 +17,8 @@
>> 
>>  	aliases {
>>  		serial0 = &uart5;
>> +		bluetooth0 = &bluetooth;
>> +		hsuart0 = &uart7;
> 
> Sort aliases alphabetically.
> 
> Also 'hsuart' should not be used, as Dmitry already pointed out on
> patch 2/2. I suppose it should be 'serial1', as in 'second serial
> port of the board'.
> 
[Bala]: will update it.
>>  	};
>> 
>>  	chosen {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 272d5ca..05aa729 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -393,6 +393,24 @@
>>  				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, 
>> <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> +
>> +	bluetooth: wcn6750-bt {
>> +		compatible = "qcom,wcn6750-bt";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en_default>;
> 
> Do we also need a pinctrl entry for 'swctrl' ?
[Bala]: It is in input to APPS and op of BT SoC.
I don't think to set any configuration as BT SOC will take care of it.

> 
>> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>; /* BT_EN */
>> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>; /* SW_CTRL */
> 
> The comments aren't useful, the property names say the same.
> 
[Bala]: will remove them

>> +		vddio-supply = <&vreg_l19b_1p8>;
>> +		vddaon-supply = <&vreg_s7b_0p9>;
>> +		vddbtcxmx-supply = <&vreg_s7b_0p9>;
>> +		vddrfacmn-supply = <&vreg_s7b_0p9>;
>> +		vddrfa0p8-supply = <&vreg_s7b_0p9>;
>> +		vddrfa1p7-supply = <&vreg_s1b_1p8>;
>> +		vddrfa1p2-supply = <&vreg_s8b_1p2>;
>> +		vddrfa2p2-supply = <&vreg_s1c_2p2>;
>> +		vddasd-supply = <&vreg_l11c_2p8>;
>> +		max-speed = <3200000>;
>> +	};
>>  };
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> @@ -504,6 +522,19 @@
>>  		 */
>>  		bias-pull-up;
>>  	};
>> +
>> +	bt_en_default: bt_en_default {
> 
> 	bt_en: bt-en {
> 
>> +		pinmux {
>> +			pins = "gpio85";
>> +			function = "gpio";
>> +		};
>> +		pinconf {
>> +			pins = "gpio85";
>> +			drive-strength = <2>;
>> +			output-low;
>> +			bias-pull-down;
>> +		};
> 
> No pinmux & pinconf nodes, see configuration for other pins.
[Bala]: Thanks for pointing will update in next version


