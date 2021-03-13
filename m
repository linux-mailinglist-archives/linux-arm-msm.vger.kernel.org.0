Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BEC339BF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 06:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhCMFJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 00:09:16 -0500
Received: from z11.mailgun.us ([104.130.96.11]:26201 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231392AbhCMFJD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 00:09:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615612143; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=jh77CoXgc/1rFZsKFmULjbKwYNO/P0sbgk6JzcrRH2U=; b=RL6M8xaSFkEUff0D6OXxwt+s13T7ba50fqaH+qo8/w3fGcRd3w0lv4q1I6uar3HdwNJuiiHu
 gaPdq5YmuVYpHbmx7dOQ7+A1j7fP+fdZUGKux2U6mBfbqZmglfUrO/4EMgnVSJSvJyyOUbpT
 MlhgG/KHuvh4El+dBGQBtPASLa4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 604c48e93f267701a46e33ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 13 Mar 2021 05:08:57
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16912C43463; Sat, 13 Mar 2021 05:08:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.154.253])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3535FC433CA;
        Sat, 13 Mar 2021 05:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3535FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add sound node for
 sc7180-trogdor-coachz
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
References: <20210312160622.24165-1-srivasam@codeaurora.org>
 <20210312160622.24165-3-srivasam@codeaurora.org>
 <CAD=FV=WN9vdU-cWLr4-AODGQ7E5crJkAmv1=D23j21=KHxUCkg@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <bc3d663b-3f85-cbc1-ac22-2c8260657f0e@codeaurora.org>
Date:   Sat, 13 Mar 2021 10:38:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WN9vdU-cWLr4-AODGQ7E5crJkAmv1=D23j21=KHxUCkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for your time and inputs!!!

On 3/13/2021 2:58 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, Mar 12, 2021 at 8:07 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> This is a trgodor variant, required to have sound node variable
>> for coachz specific platform.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> index 4ad520f00485..7eaad739b6f9 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> @@ -89,6 +89,16 @@ &sn65dsi86_out {
>>          data-lanes = <0 1 2 3>;
>>   };
>>
>> +&sound {
>> +       compatible = "google,sc7180-coachz";
>> +       model = "sc7180-adau7002-max98357a";
>> +       audio-routing = "PDM_DAT", "DMIC";
>> +};
>> +
>> +&multimedia0_codec {
>> +       sound-dai = <&adau7002>;
>> +};
>> +
> Much nicer! The last nit is that "multimedia0_codec" is now sorted
> incorrectly. It starts with "m" so it shouldn't come after "s". Yes, I
> know that this rule means that these two things are no longer next to
> each other, but that's the rule we have right now.
>
> If it's important for you for them to sort together, I suppose you
> could change the label to "sound_multimedia0_codec" though that's a
> bit of a mouthful. I'll leave it up to you whether to rename (and keep
> the current ordering) or keep the name (and move the node).
>
>
>
> -Doug

I feel it's good to keep them together by changing name as you suggested.

I will change accordingly and re post it.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

