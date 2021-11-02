Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09821442BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 11:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhKBLBn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 07:01:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13156 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhKBLBm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 07:01:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635850748; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=bisdeD3X1MxFxI1OCeAyuj8O9/LL4EAudrvUEowmfCw=; b=czSqJsq3rrRDdzCKnb0FAvGyd49MeYPngc187zEZ6GvUcGb90Mjks0zrPzcHu3DXcqwujWlM
 QGMYwpKcfeWgGRr1vCXou4249e/6UTGPlBquuni5mKyMn9gZU6fpVHsR6ED4RZk5o3He5XUf
 c9e1AmQj5ozymqHlRPGyW26dmFg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 618119ea2e144ac4d3f2d958 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 10:58:50
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5F8AC43619; Tue,  2 Nov 2021 10:58:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3002FC4338F;
        Tue,  2 Nov 2021 10:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3002FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To:     Randy Dunlap <rdunlap@infradead.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
 <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <25b2a191-ff9e-25e0-1d46-bc37a92e1ff1@codeaurora.org>
Date:   Tue, 2 Nov 2021 16:28:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/30/2021 5:04 AM, Randy Dunlap wrote:
Thanks for your time Randy!!!
> On 10/29/21 8:04 AM, Srinivasa Rao Mandadapu wrote:
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index cc7c1de..d9ffcb7 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>>         SC7180 SoC-based systems.
>>         Say Y if you want to use audio device on this SoCs.
>>   +config SND_SOC_SC7280
>> +    tristate "SoC Machine driver for SC7280 boards"
>> +    depends on I2C && SOUNDWIRE
>> +    select SND_SOC_QCOM_COMMON
>> +    select SND_SOC_MAX98357A
>> +    select SND_SOC_LPASS_RX_MACRO
>> +    select SND_SOC_LPASS_TX_MACRO
>> +    help
>> +      To add support for audio on Qualcomm Technologies Inc.
>> +      SC7280 SoC-based systems.
>> +      Say Y if you want to use audio device on this SoCs.
>
>       Say Y or M if you want to use audio devices on this SoC.
>
Okay. Will change accordingly.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

