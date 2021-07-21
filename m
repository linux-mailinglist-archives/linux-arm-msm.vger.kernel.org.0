Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE3A3D0B40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 11:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbhGUIUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 04:20:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11374 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237482AbhGUIOl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 04:14:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626857716; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LXEcJaQAaG9kD6bf+iJKc6F7+3ikgC098NK15DTx/I4=; b=uOqACi6KfnMNt7p4MTsKwhAVtXiAOUUL+gO4ChldEddQDO1x9re0ASvOrHqufQyIa2/g/ipS
 K0KSK74BW6aqpSXKup9uIDlK1E36MPv7KWD7RzxCIff41RTEtOre2xPUY0/xX/kTLqSPFftr
 onlFKgdf6qsOO06niCbtw3tUhD4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60f7de5838fa9bfe9cc16274 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 08:44:08
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A945C43460; Wed, 21 Jul 2021 08:44:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DD36C433F1;
        Wed, 21 Jul 2021 08:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DD36C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
 <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51LVG1zZvuT4Cv-3nCRhPtC46OQCSeBmncwaH_3TXk8=w@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <63fa0059-04c3-f654-1327-fa1d583515e8@codeaurora.org>
Date:   Wed, 21 Jul 2021 14:14:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51LVG1zZvuT4Cv-3nCRhPtC46OQCSeBmncwaH_3TXk8=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen!!

Thanks for reminder.

On 7/21/2021 10:14 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2020-09-29 23:42:48)
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
>>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 5724982..850b43e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -231,6 +231,7 @@
>>
>>                  audio-jack = <&alc5682>;
>>
>> +               #sound-dai-cells = <0>;
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>>
>> @@ -257,6 +258,17 @@
>>                                  sound-dai = <&max98357a>;
>>                          };
>>                  };
>> +               dai-link@2 {
>> +                       link-name = "MultiMedia2";
>> +                       reg = <2>;
>> +                       cpu {
>> +                               sound-dai = <&lpass_cpu 2>;
>> +                       };
>> +
>> +                       codec {
>> +                               sound-dai = <&msm_dp>;
> I see qcom maintainers have picked up the dp node now. Can you resend?
> This would need to change to mdss_dp. Also incorporate my comments from
> January this year please.
Resent the patches. Please check V5 version of patches.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

