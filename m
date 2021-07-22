Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5245D3D262B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 16:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhGVOJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 10:09:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57701 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhGVOJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 10:09:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626965388; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=u/q7c+cVO5gYCXpDbcPZCDaOZmd778fxys5nKZEEHgA=; b=ZxkUAgToaK8xHfpfQNrd5yQU2Q13fWRhlwdyFPF5Yd8kcJ5OBVUZjw+cCMwRfoDUt7yxOfcc
 cxo6+lQVh2swqtBJ8t9PxuN7shOFXXzOAmSDIWKmpgx0Es8+dUx10Z+5pPs4wGFgrdBAQBDG
 ABHrJQJsv6kSEgPMrbtSi1v11To=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f9856ee31d882d189932c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 14:49:18
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 095F6C433F1; Thu, 22 Jul 2021 14:49:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.145.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D07FC433D3;
        Thu, 22 Jul 2021 14:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D07FC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
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
        Judy Hsiao <judyhsiao@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <20210721084126.14035-1-srivasam@codeaurora.org>
 <20210721084126.14035-3-srivasam@codeaurora.org>
 <CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <c26ac462-6253-3806-0739-7c5149beaaa3@codeaurora.org>
Date:   Thu, 22 Jul 2021 20:19:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your time Doug!!

On 7/21/2021 9:50 PM, Doug Anderson wrote:
> Hi,
>
> On Wed, Jul 21, 2021 at 1:42 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
>>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 31bf7c698b8f..a4cb9ee567ff 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -288,6 +288,7 @@ sound: sound {
>>                          "Headphone Jack", "HPOL",
>>                          "Headphone Jack", "HPOR";
>>
>> +               #sound-dai-cells = <0>;
> The `#sound-dai-cells` is not in the bindings. The bindings also say
> `additionalProperties: false`. So either your patch is wrong for
> including this or the bindings are wrong for omitting it. Which is it?
> I notice that downstream we don't have this.
>
Yes it's wrongly placed Here. Will remove it.
>> @@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
>>                                  sound-dai = <&max98357a>;
> Ideally you'll want to rebase to make context clean since the above
> got changed from `max98357a` to `max98360a`.
>
>
>>                          };
>>                  };
>> +
>> +               dai-link@2 {
>> +                       link-name = "MultiMedia2";
>> +                       reg = <2>;
> I am certainly not an expert, but I notice that downstream we have reg
> as <LPASS_DP_RX>, which makes the node name dai-link@5 instead of @2.
> Does that matter?
>
Yes,Here reg as <LPASS_DP_RX> is correct option. Will change 
accordingly.  But It seems dai-link@2 is appropriate as in this platform

we are using only 3 nodes. i.e. I2S primary, I2S secondary and DP node.

>> @@ -768,6 +781,10 @@ secondary_mi2s: mi2s@1 {
>>                  reg = <MI2S_SECONDARY>;
>>                  qcom,playback-sd-lines = <0>;
>>          };
>> +
>> +       hdmi-primary@0 {
>> +               reg = <LPASS_DP_RX>;
> Your node name and `reg` don't match. `LPASS_DP_RX` is 5 so the node
> name should include @5, not @0. I also notice that downstream the node
> name is called `hdmi`, not `hdmi-primary`. The downstream `hdmi` seems
> more parallel to the sibling nodes, like `mi2s@0` and `mi2s@1`.
Yes hdmi@2 is appropriate. will change accordingly.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

