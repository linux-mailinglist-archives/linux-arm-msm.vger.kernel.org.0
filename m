Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C33B45B97D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 12:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241793AbhKXLwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 06:52:35 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:40826 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241756AbhKXLwY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 06:52:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637754554; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=b8/GdfKBYbdH1Nrmk6OOayCmRv1WUrLw5qRyD8w0my4=; b=UTUgpTYyQiCf2Sy2BzGrd/2Al9vaUvOOZ3c6mq3YgzBI9blQimROPW/h/EM7x1eLnYOpjTTi
 J2fcL7jiyBUwQs5zYWetkqvlSwUKb1/GuRrwsnyAlytpqeSDD38wDcYJLt6qA85SFzuA+27j
 sBLSCgMKznfPVamsXCReZiWh1KI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 619e26ba6bacc185a5a11089 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 11:49:14
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE341C4360D; Wed, 24 Nov 2021 11:49:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B8EAC4338F;
        Wed, 24 Nov 2021 11:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7B8EAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <ddbef224-b824-648b-ff33-f61e7bf8c345@codeaurora.org>
Date:   Wed, 24 Nov 2021 17:19:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7280-crd: Add Touchscreen and
 touchpad support
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, kgodara@codeaurora.org
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
 <1637650813-16654-5-git-send-email-rnayak@codeaurora.org>
 <YZ0rwiHuh0OeP0VD@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
In-Reply-To: <YZ0rwiHuh0OeP0VD@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/23/2021 11:28 PM, Matthias Kaehlcke wrote:
> On Tue, Nov 23, 2021 at 12:30:13PM +0530, Rajendra Nayak wrote:
>> From: Kshitiz Godara <kgodara@codeaurora.org>
>>
>> Add Touchscreen and touchpad hid-over-i2c node
> 
> to which board(s)?

will update

> 
>> Signed-off-by: Kshitiz Godara <kgodara@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280-crd.dts | 63 +++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> index 8c2aee6..bef3037 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
>> @@ -23,6 +23,47 @@
>>   	};
>>   };
>>   
>> +ap_tp_i2c: &i2c0 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +
>> +	trackpad: trackpad@15 {
>> +		compatible = "hid-over-i2c";
>> +		reg = <0x15>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&tp_int_odl>;
>> +
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		post-power-on-delay-ms = <20>;
>> +		hid-descr-addr = <0x0001>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +
>> +		wakeup-source;
>> +	};
>> +};
>> +
>> +ap_ts_pen_1v8: &i2c13 {
>> +	status = "okay";
>> +	clock-frequency = <400000>;
>> +
>> +	ap_ts: touchscreen@5c {
>> +		compatible = "hid-over-i2c";
>> +		reg = <0x5C>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
>> +
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <55 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		post-power-on-delay-ms = <500>;
>> +		hid-descr-addr = <0x0000>;
>> +
>> +		vdd-supply = <&vreg_l19b_1p8>;
>> +	};
>> +};
>> +
>>   &nvme_pwren {
>>   	pins = "gpio51";
>>   };
>> @@ -30,3 +71,25 @@
>>   &nvme_3v3_regulator {
>>   	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>>   };
>> +
>> +&tlmm {
>> +	tp_int_odl: tp-int-odl {
>> +		pins = "gpio7";
>> +		function = "gpio";
>> +		input-enable;
> 
> Not sure about this one, is the explicit 'input-enable' actually needed here?

Maybe not, will test it once after I remove it

> 
>> +		bias-disable;
>> +	};
>> +
>> +	ts_int_l: ts-int-l {
>> +		pins = "gpio55";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
>> +
>> +	ts_reset_l: ts-reset-l {
>> +		pins = "gpio54";
>> +		function = "gpio";
>> +		bias-disable;
>> +		drive-strength = <2>;
> 
> As per my comment on "[3/4] arm64: dts: qcom: sc7280: Define EC and H1 nodes" it
> seems setting the drive strength to 2 isn't necessary, since that's the default.

right I'll remove it, thanks

> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
