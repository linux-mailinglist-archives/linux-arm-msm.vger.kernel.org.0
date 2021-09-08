Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD381403364
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 06:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhIHEju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 00:39:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32638 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhIHEjt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 00:39:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631075922; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=c5x+uUqMqR66/gj4PnVIfY2Dh/QpVRbiSLzGC5KpnCQ=; b=EhClbBNFduegScSetkdT1XeKHMmgYQ5BztdqoreijW235oSY3oVDEQT3NRH0J8pGj9pSr6Es
 HqoxdHOvUVxVgewO0RAWfRPb0Q0pWO2RsdaAeMgjjW+lzrMdX2NNEgjhQAr4u/K/W9MEBNNH
 BuRYIZOdkIpTaf5gx/cG+78aF30=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61383e51096d475c7cbcf2f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 04:38:41
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58FDDC43617; Wed,  8 Sep 2021 04:38:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C112C4338F;
        Wed,  8 Sep 2021 04:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8C112C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <755e99d3-4d72-3292-a5da-ad3d6045038e@codeaurora.org>
Date:   Wed, 8 Sep 2021 10:08:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks For Review Stephen!!!

On 9/8/2021 1:54 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-09-06 06:27:34)
>> Add header defining for lpass internal digital codecs rx,tx and va
>> dai node id's.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   include/dt-bindings/sound/qcom,lpass.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
>> index 7b0b80b..187af45 100644
>> --- a/include/dt-bindings/sound/qcom,lpass.h
>> +++ b/include/dt-bindings/sound/qcom,lpass.h
>> @@ -10,6 +10,11 @@
>>
>>   #define LPASS_DP_RX    5
>>
>> +#define LPASS_CDC_DMA_RX0 6
>> +#define LPASS_CDC_DMA_TX3 7
>> +#define LPASS_CDC_DMA_VA0 8
>> +#define LPASS_MAX_PORTS 9
> Do we need LPASS_MAX_PORTS in the binding?
Yes.  based on this creating array of streams in machine driver. So to 
make upper limit introduced this macro.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

