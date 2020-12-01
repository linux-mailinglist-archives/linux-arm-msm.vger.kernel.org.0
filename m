Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BDD2C961C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 04:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgLADxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 22:53:37 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:54932 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727812AbgLADxe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 22:53:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606794793; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V2UGkaBqDPucsjeZLnmfHo44w9g/CfPcOzdSqBMZI7E=; b=w5X9/JcsfzQ6r7UOobX2lWQjEwqEBT3byKErTienPAMqsS8mJoYBPmBU6xxsYciJNUvpZycl
 n6xVea7pZNFwF4cGWatsgU02TULfjI2Mmep6MrLhBVcpo/pZXt4nM++vPYNaggWMvBxmTYz6
 VFk8I/XNRWY8TRNM08sPb+eARqM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fc5be0f4a918fcc077329e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 03:52:47
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B264C43461; Tue,  1 Dec 2020 03:52:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.158.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B781C433ED;
        Tue,  1 Dec 2020 03:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B781C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for
 I2S driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600440678-2137-1-git-send-email-srivasam@codeaurora.org>
 <X8UjShseQ0F7itZe@builder.lan>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <838489a9-22df-0d1c-9b8c-30f9c35e8442@codeaurora.org>
Date:   Tue, 1 Dec 2020 09:22:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X8UjShseQ0F7itZe@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Bjorn For your comments!!!

On 11/30/2020 10:22 PM, Bjorn Andersson wrote:
> On Fri 18 Sep 09:51 CDT 2020, Srinivasa Rao Mandadapu wrote:
>
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Add dai link for supporting lpass I2S driver, which is used
>> for audio capture and playback.
>> Add lpass-cpu node with  pin controls and i2s primary
>> and secondary dai-links
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Ajit needs to certify the origin of the patch, with his signed-off-by
> and as you are the last to touch it your signed-off-by should be last.
>
> Also, please advice on the dependencies of this patch, because the tree
> doesn't build after applying this patch.
>
> Regards,
> Bjorn

After this patch v2 patch is posted.

https://lore.kernel.org/patchwork/patch/1317796/

>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 59 ++++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index bf87558..5724982 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -220,6 +220,44 @@
>>   			max-brightness = <1023>;
>>   		};
>>   	};
>> +
>> +	sound {
>> +		compatible = "qcom,sc7180-sndcard";
>> +		model = "sc7180-snd-card";
>> +
>> +		audio-routing =
>> +			"Headphone Jack", "HPOL",
>> +			"Headphone Jack", "HPOR";
>> +
>> +		audio-jack = <&alc5682>;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		dai-link@0 {
>> +			link-name = "MultiMedia0";
>> +			reg = <0>;
>> +			cpu {
>> +				sound-dai = <&lpass_cpu 0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&alc5682 0>;
>> +			};
>> +		};
>> +
>> +		dai-link@1 {
>> +			link-name = "MultiMedia1";
>> +			reg = <1>;
>> +			cpu {
>> +				sound-dai = <&lpass_cpu 1>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&max98357a>;
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &qfprom {
>> @@ -725,6 +763,27 @@ hp_i2c: &i2c9 {
>>   	modem-init;
>>   };
>>   
>> +&lpass_cpu {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&sec_mi2s_active &pri_mi2s_active &pri_mi2s_mclk_active>;
>> +
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	mi2s-primary@0 {
>> +		reg = <MI2S_PRIMARY>;
>> +		qcom,playback-sd-lines = <1>;
>> +		qcom,capture-sd-lines = <0>;
>> +	};
>> +
>> +	mi2s-secondary@1 {
>> +		reg = <MI2S_SECONDARY>;
>> +		qcom,playback-sd-lines = <0>;
>> +	};
>> +};
>> +
>>   &mdp {
>>   	status = "okay";
>>   };
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

