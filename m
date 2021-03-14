Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8D533A33C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 07:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhCNFvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 00:51:18 -0500
Received: from z11.mailgun.us ([104.130.96.11]:17287 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhCNFvC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 00:51:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615701061; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wAThHURuQOx7nkPEUGK2dOThw52EswUwEWvEcNsQV88=; b=fbTw7qnK9EO/PjPsr5RplSLqOKo/A99vnTfuIyT/cVAUxrjE2KTGiR15D90Cavs1QwdhV3V7
 n+ltuJTn5HkxHNe/2+GnTmE39E5fQOQEmkjZYNJ+syhL76qtz2IM71mz9MrCwzpRymtwLtLO
 eNRsA0XhN7zp2eDMpj0je5IbhBE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 604da43ee2200c0a0d6e3819 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Mar 2021 05:50:53
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7BE7C433CA; Sun, 14 Mar 2021 05:50:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.152.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E882FC433CA;
        Sun, 14 Mar 2021 05:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E882FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for I2S driver
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <20210313054654.11693-1-srivasam@codeaurora.org>
 <20210313054654.11693-2-srivasam@codeaurora.org>
 <161566899554.1478170.1265435102634351195@swboyd.mtv.corp.google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <0f4bc153-edca-ca9d-a5ab-df765e992d7f@codeaurora.org>
Date:   Sun, 14 Mar 2021 11:20:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161566899554.1478170.1265435102634351195@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for Your Time and Inputs!!!

On 3/14/2021 2:26 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-03-12 21:46:53)
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Add dai link for supporting lpass I2S driver, which is used
>> for audio capture and playback.
>> Add lpass-cpu node with  pin controls and i2s primary
> Why two spaces before 'pin'?
>
>> and secondary dai-links
> Please end sentence with a period.
>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 58 ++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 436582279dad..3a24383247db 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -283,6 +284,42 @@ keyboard_backlight: keyboard-backlight {
>>                          max-brightness = <1023>;
>>                  };
>>          };
>> +
>> +       sound: sound {
>> +               compatible = "google,sc7180-trogdor";
>> +               model = "sc7180-rt5682-max98357a-1mic";
>> +
>> +               audio-routing =
>> +                       "Headphone Jack", "HPOL",
>> +                       "Headphone Jack", "HPOR";
>> +
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               dai-link@0 {
>> +                       link-name = "MultiMedia0";
>> +                       reg = <MI2S_PRIMARY>;
>> +                       cpu {
>> +                               sound-dai = <&lpass_cpu MI2S_PRIMARY>;
>> +                       };
>> +
>> +                       sound_multimedia0_codec: codec {
>> +                               sound-dai = <&alc5682 0 /*aif1*/>;
> Nitpick, add a space for comment
>
>                                 sound-dai = <&alc5682 0 /* aif1 */>;
Okay. Will re post with Fix.
>
>> +                       };
>> +               };
>> +
>> +               dai-link@1 {
>> +                       link-name = "MultiMedia1";
>> +                       reg = <MI2S_SECONDARY>;
>> +                       cpu {
>> +                               sound-dai = <&lpass_cpu MI2S_SECONDARY>;
>> +                       };
>> +
>> +                       sound_multimedia1_codec: codec {
>> +                               sound-dai = <&max98357a>;
>> +                       };
>> +               };
>> +       };
>>   };
>>   
>>   &qfprom {
>> @@ -720,6 +757,27 @@ &ipa {
>>          modem-init;
>>   };
>>   
>> +&lpass_cpu {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&sec_mi2s_active &pri_mi2s_active &pri_mi2s_mclk_active>;
> Super nitpick: I prefer this style
>
> 	pinctrl-0 = <&sec_mi2s_active>, <&pri_mi2s_active>, <&pri_mi2s_mclk_active>;
>
> It's effectively the same but the brackets help us see that these are
> the end of the phandle specifier instead of having to figure out that
> the first phandle isn't specifying the second phandle as an argument.
Okay. Will change accordingly.
>
>> +
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       mi2s-primary@0 {
> Should the node name just be mi2s instead of mi2s-primary? We have reg
> property so I think 'mi2s' should be sufficient to differentiate.
Okay. I will change it as mi2s@0 instead of mi2s-primary@0
>
>> +               reg = <MI2S_PRIMARY>;
>> +               qcom,playback-sd-lines = <1>;
>> +               qcom,capture-sd-lines = <0>;
>> +       };
>> +
>> +       mi2s-secondary@1 {
>> +               reg = <MI2S_SECONDARY>;
>> +               qcom,playback-sd-lines = <0>;
>> +       };
>> +};
>> +
>>   &mdp {
>>          status = "okay";
>>   };

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

