Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E338A27027D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgIRQqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 12:46:38 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:15319 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgIRQqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 12:46:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600447596; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aDUDmyWvcWkfN3QFAfQxmB92TzviMMAi90RnbNQlrIo=; b=Y4zzGT7mIN7qJ0I9bRLNrV1Bx3KRmZ/+B+03fSDR2SbgPpArku906IrPoMMhxXoBVsB+MJXn
 j0H7R0s6vbjeCuPFCMoo/Epeg9iPsho5T3OJ/5EtYblKOYmOmxRLwNDvSIJ83kaz4D32yTNc
 kxKndVb1CmIz7DGYc6XQLZLs9E8=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f64e464f1e3eb89c71cd391 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 16:46:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91307C433FF; Fri, 18 Sep 2020 16:46:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.131.172.121] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6DA4C433C8;
        Fri, 18 Sep 2020 16:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6DA4C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S
 driver
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600435026-1876-1-git-send-email-srivasam@codeaurora.org>
 <CAD=FV=WtSEB6-M8x564t=RuSEKHwH3YvcmuZ9VGpxY+5kcL7rA@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <c55995fa-5233-b1c9-7c4c-13b5cd8fe178@codeaurora.org>
Date:   Fri, 18 Sep 2020 22:16:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WtSEB6-M8x564t=RuSEKHwH3YvcmuZ9VGpxY+5kcL7rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mr. Doug for Review comments!!

On 9/18/2020 7:28 PM, Doug Anderson wrote:
> Hi,
>
> On Fri, Sep 18, 2020 at 6:18 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -1742,6 +1742,45 @@
>>                                  };
>>                          };
>>
>> +                       sec_mi2s_active: sec-mi2s-active {
>> +                               pinmux {
>> +                                       pins = "gpio49", "gpio50", "gpio51";
>> +                                       function = "mi2s_1";
>> +                               };
>> +
>> +                               pinconf {
>> +                                       pins = "gpio49", "gpio50", "gpio51";;
> There are still two ";" on the above line.
will fix this type error.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

