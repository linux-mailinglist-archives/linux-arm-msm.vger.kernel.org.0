Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B918339278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 16:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhCLPyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 10:54:12 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:48705 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232506AbhCLPyG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 10:54:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615564446; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SR9ztMG5APmU84GNnULI+R1jSiJa1lfXUSNJ0K8XiEc=; b=Z4BXZ5Ae1zWkKAAUldG+gA0L1n77tiM5kik/RUm59BTR5NJSk+Xfk8jUZyQ87Ilr/1H07Z5R
 YyDsP84cTsEG2In8CdFab673+E56dIzXKGUDOfT6XDaW2rtFundkS8z8HRBpbfvQxCVmj77B
 Z3WQLIL5vJUgispDr6qIfuibPXI=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 604b8e926dc1045b7d16b25a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Mar 2021 15:53:54
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCC36C4346B; Fri, 12 Mar 2021 15:53:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.156.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CC35C4346B;
        Fri, 12 Mar 2021 15:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CC35C4346B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add sound node for
 sc7180-trogdor-coachz
To:     Doug Anderson <dianders@chromium.org>
Cc:     gross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
References: <20210311164815.14113-1-srivasam@codeaurora.org>
 <20210311164815.14113-3-srivasam@codeaurora.org>
 <CAD=FV=VZrfgZHXBFKD2f8uygQC32mPt1CQqMpUzio+yq_Era0A@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <ac6695e0-0628-4b05-bb55-db5abb577158@codeaurora.org>
Date:   Fri, 12 Mar 2021 21:23:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VZrfgZHXBFKD2f8uygQC32mPt1CQqMpUzio+yq_Era0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for time and valuable inputs!!!

On 3/12/2021 1:24 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Mar 11, 2021 at 8:48 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> This is a trgodor variant, required to have sound node variable
>> for coachz specific platform.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> index 4ad520f00485..7623a30a64c7 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
>> @@ -238,3 +238,21 @@ &tlmm {
>>                            "DP_HOT_PLUG_DET",
>>                            "EC_IN_RW_ODL";
>>   };
>> +
>> +&sound {
>> +       compatible = "google,sc7180-coachz";
> You're placing this in the wrong place. Pay attention to the section
> headings. Your patch is putting this in the section "PINCTRL -
> board-specific pinctrl". That's not right.
>
>
>> +       model = "sc7180-adau7002-max98357a";
>> +       audio-routing = "PDM_DAT", "DMIC";
>> +
>> +       dai-link@0 {
>> +               link-name = "MultiMedia0";
>> +               reg = <0>;
>> +               cpu {
>> +                       sound-dai = <&lpass_cpu 0>;
> Shouldn't the 0 above be "MI2S_PRIMARY" ?  ...and the "reg" as well?
Yes, It's required. Will change, and re-post.
>
>
>> +               };
>> +
>> +               codec {
>> +                       sound-dai = <&adau7002>;
>> +               };
>> +       };
> Some overall notes, though:
>
> 1. You don't actually need to duplicate everything that you have
> above. Whether you realize it or not the way devicetree works is that
> it _merges_ the node in the "coachz" devicetree with the one from the
> trogdor one (it doesn't replace it). So in trogdor you have:
>
> dai-link@0 {
>    link-name = "MultiMedia0";
>    reg = <MI2S_PRIMARY>;
>    cpu {
>      sound-dai = <&lpass_cpu MI2S_PRIMARY>;
>    };
>
>    codec {
>      sound-dai = <&alc5682 MI2S_PRIMARY>;
>    };
> };
>
> ...and in coachz you have:
>
> dai-link@0 {
>    link-name = "MultiMedia0";
>    reg = <MI2S_PRIMARY>;
>    cpu {
>      sound-dai = <&lpass_cpu MI2S_PRIMARY>;
>    };
>
>    codec {
>      sound-dai = <&adau7002>;
>    };
> };
>
> Almost all of that is duplication. It's best not to duplicate. Thus,
> one step better than what you have would be to just have this in
> coachz to override what you need:
>
> dai-link@0 {
>    codec {
>      sound-dai = <&adau7002>;
>    };
> };
>
>
> 2. In general it's discouraged (and error prone) to try to replicate
> hierarchies from your parent. So the best would be to change trogdor's
> device tree to something like this:
>
> dai-link@0 {
>    link-name = "MultiMedia0";
>    reg = <MI2S_PRIMARY>;
>    cpu {
>      sound-dai = <&lpass_cpu MI2S_PRIMARY>;
>    };
>
>    multimedia0_codec: codec {
>      sound-dai = <&alc5682 MI2S_PRIMARY>;
>    };
> };
>
> ...and then in coachz you override like:
>
> &multimedia0_codec {
>     sound-dai = <&alc5682 MI2S_PRIMARY>;
> };
Okay. Will change accordingly and re-post.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

