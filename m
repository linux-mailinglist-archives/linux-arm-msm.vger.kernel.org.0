Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772C818B267
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 12:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgCSLgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 07:36:03 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:60517 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgCSLgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 07:36:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584617763; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uCSWClx9gSFWClnfgPeB6lqVwOSev3ID8/3KAaM1uuw=; b=FZDcJ94oR1Q1z0I2MFX910bU+shMTX2kAzA4Ez7/ngwWzIxWXtEVo31gYnFsqOTvVnht68zs
 GGl5aEYwUtu7OuaZoBJYQCboNaN2iKciHuzsLwJvf3T0ySY1FNw6vmfhF6kuV8pVZvW7acWu
 0aaiCx+Y78hAB6y1CmBXrbyxT0Y=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e735922.7f10041c5ea0-smtp-out-n03;
 Thu, 19 Mar 2020 11:36:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88B5EC433D2; Thu, 19 Mar 2020 11:36:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64B85C433CB;
        Thu, 19 Mar 2020 11:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64B85C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Introduce SoC sleep stats bindings
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org
References: <1584505758-21037-1-git-send-email-mkshah@codeaurora.org>
 <1584505758-21037-2-git-send-email-mkshah@codeaurora.org>
 <158456695397.152100.7669140417826227943@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ab6d61c8-010a-dbed-a9bb-69ee7f0022ea@codeaurora.org>
Date:   Thu, 19 Mar 2020 17:05:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158456695397.152100.7669140417826227943@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/19/2020 2:59 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-17 21:29:15)
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
>> SoC sleep stats driver. The driver is used for displaying SoC sleep
>> statistic maintained by Always On Processor or Resource Power Manager.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Thanks Stephen.
>
> Two nits below.
>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> new file mode 100644
>> index 0000000..d0c751d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
>> @@ -0,0 +1,46 @@
> [...]
>> +
>> +examples:
>> +  # Example of rpmh sleep stats
>> +  - |
>> +    rpmh-sleep-stats@c3f0000 {
> I would think 'memory' would be a more appropriate node name, but OK.
>
>> +      compatible = "qcom,rpmh-sleep-stats";
>> +      reg = <0 0xc3f0000 0 0x400>;
> Please add a leading 0 to the address to pad it out to 8 digits.
I will address this in v6.
>
>> +    };
Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
