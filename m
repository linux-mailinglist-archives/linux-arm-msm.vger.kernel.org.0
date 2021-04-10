Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4732C35AB11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 07:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhDJFRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 01:17:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42502 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJFRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 01:17:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618031853; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MbkO+CCbuA9UR2abtVh1RmywDTJ5QCfxhgA6USUv4fg=; b=fqUtHwnIzyFJZtI6i6HribaRmKPpuyBlYLblU4LpZNi+1wD7A4FdT9N+bAsC5Q46MFIKIKar
 sK6uzrxx/CiTNl4wRM/gUW6iFUCOyx+V9wgLYW0rwpd/S80igpRKaR6j6Y+Pqa9ZnwsaRcKf
 91SeqG8bDjAKuh7DNQqsYgAWHYI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 607134da8807bcde1d6bb69a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Apr 2021 05:17:14
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4404EC43463; Sat, 10 Apr 2021 05:17:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.252.214.131] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB620C433C6;
        Sat, 10 Apr 2021 05:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB620C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Update iommu property for
 simultaneous playback
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        dianders@chromium.org, judyhsiao@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <20210406163330.11996-1-srivasam@codeaurora.org>
 <161798766423.3790633.3895809656191757415@swboyd.mtv.corp.google.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <b955dcbb-48b6-f236-ccbd-bc7d0de1df60@codeaurora.org>
Date:   Sat, 10 Apr 2021 10:47:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <161798766423.3790633.3895809656191757415@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen.

Thanks for your time!!!


On 4/9/2021 10:31 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-04-06 09:33:30)
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Update iommu property in lpass cpu node for supporting
>> simultaneous playback on headset and speaker.
>>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes since v1:
>>     -- Commit messge header change
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index a6da78d31fdd..6228ba2d8513 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -3566,7 +3566,8 @@ lpass_cpu: lpass@62f00000 {
>>                          reg = <0 0x62f00000 0 0x29000>;
>>                          reg-names = "lpass-lpaif";
>>   
>> -                       iommus = <&apps_smmu 0x1020 0>;
>> +                       iommus = <&apps_smmu 0x1020 0>,
>> +                               <&apps_smmu 0x1021 0>;
> The stream ID 0x1032 was also dropped in this version but there's no
> mention of that in the changelog. Why?
That is ID is for HDMI Stream, so as part of DP patches that will be added.
>
>>   
>>                          power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

