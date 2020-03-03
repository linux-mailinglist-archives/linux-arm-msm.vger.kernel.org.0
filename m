Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC08176FC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 08:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgCCHJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 02:09:58 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:64275 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727580AbgCCHJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 02:09:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583219397; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=g1igezX6bhKy+1gVBsKMmqM1Yvay0uel4aitex+BcCs=; b=kStW3czO3ENsD6wy8bBYsYA7sJcjTnzqUfkV1tis9rlm3rwRNjlvacnVy7xuDwUFeVl4LUGN
 6mtIpotgMlOv37fdGFinJEyETISVMU1QynfC84c7tBGWaM2F7K8hDqJBBtRAAaz7q7q5tq0R
 TgGinA/mXRjqYKemYoIMKRubZQ0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5e02bd.7fee8e273538-smtp-out-n01;
 Tue, 03 Mar 2020 07:09:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D806BC43383; Tue,  3 Mar 2020 07:09:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB6BBC433A2;
        Tue,  3 Mar 2020 07:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB6BBC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sc7180: Enable soc sleep stats
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
 <1582274986-17490-4-git-send-email-mkshah@codeaurora.org>
 <20200228063444.GA857139@builder>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <aef0ea05-7941-0a9a-ab0f-875e5ebcb899@codeaurora.org>
Date:   Tue, 3 Mar 2020 12:39:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228063444.GA857139@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/28/2020 12:04 PM, Bjorn Andersson wrote:
> On Fri 21 Feb 00:49 PST 2020, Maulik Shah wrote:
>
>> SoC sleep stats provides various low power mode stats.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 8011c5f..eee6d92 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -745,6 +745,11 @@
>>   			};
>>   		};
>>   
>> +		rpmh_sleep_stats: soc-sleep-stats@c3f0000 {
> I don't see any reason to reference this node, so you should be able to
> omit the label(?)
Done. Will update in next revision.

Thanks,
Maulik
>
>> +			compatible = "qcom,rpmh-sleep-stats";
>> +			reg = <0 0xc3f0000 0 0x400>;
> Please pad the address to 8 digits and sort the nodes by address.
>
> Regards,
> Bjorn
Done. Will update in next revision.

Thanks,
Maulik
>
>> +		};
>> +
>>   		tcsr_mutex_regs: syscon@1f40000 {
>>   			compatible = "syscon";
>>   			reg = <0 0x01f40000 0 0x40000>;
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
