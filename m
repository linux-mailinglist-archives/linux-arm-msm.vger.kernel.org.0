Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582434263FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 07:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhJHFPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 01:15:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24727 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhJHFPc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 01:15:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633670017; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=M3oSCWJ7aQEJa+w9EA0EHaehA9KHiO9jYl3HRs7dc/I=; b=nBSiCHBsJZiUlCoO5EK2hu9rdfvDpD1cW334l0RzgYcZZ9xGlG6m308ty5LVhVYfqo4ZmjkC
 3uRWOdxj2pA3K+r6Vu+ffvhvCz1kzQJGyMqe9iw225z/4o0278FvzmqUfQzJdwSX5m440l+9
 YIS23c4CBVBhW+gnzr65IyXN6C0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 615fd370de4c4ed385156483 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 05:13:20
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2820C43616; Fri,  8 Oct 2021 05:13:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [157.48.163.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 871DCC4338F;
        Fri,  8 Oct 2021 05:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 871DCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
 <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <155b8dbf-8b2a-0484-ac38-1ec6e0a68537@codeaurora.org>
Date:   Fri, 8 Oct 2021 10:43:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for notification Srini!!!

On 10/7/2021 4:14 PM, Srinivas Kandagatla wrote:
> Hi Srinivasa,
>
>
> On 08/09/2021 15:03, Srinivasa Rao Mandadapu wrote:
>> Add header defining for lpass internal digital codecs rx,tx and va
>> dai node id's.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes since v1:
>>      -- Add missing dai node ID's
>>
>>   include/dt-bindings/sound/qcom,lpass.h | 31 
>> +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>
>
> Mark has already applied v1, 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/include/dt-bindings/sound/qcom,lpass.h?id=bfad37c53ae6168d03ab06868ea44e77995c43d5
>
> Can you please rebase on top of sound-next so that we endup with 
> correct defines.
Sure. will post v3 patch after rebase.
>
> --srini
>
>> diff --git a/include/dt-bindings/sound/qcom,lpass.h 
>> b/include/dt-bindings/sound/qcom,lpass.h
>> index 7b0b80b..a9404c3 100644
>> --- a/include/dt-bindings/sound/qcom,lpass.h
>> +++ b/include/dt-bindings/sound/qcom,lpass.h
>> @@ -10,6 +10,37 @@
>>     #define LPASS_DP_RX    5
>>   +#define LPASS_CDC_DMA_RX0 6
>> +#define LPASS_CDC_DMA_RX1 7
>> +#define LPASS_CDC_DMA_RX2 8
>> +#define LPASS_CDC_DMA_RX3 9
>> +#define LPASS_CDC_DMA_RX4 10
>> +#define LPASS_CDC_DMA_RX5 11
>> +#define LPASS_CDC_DMA_RX6 12
>> +#define LPASS_CDC_DMA_RX7 13
>> +#define LPASS_CDC_DMA_RX8 14
>> +#define LPASS_CDC_DMA_RX9 15
>> +
>> +#define LPASS_CDC_DMA_TX0 16
>> +#define LPASS_CDC_DMA_TX1 17
>> +#define LPASS_CDC_DMA_TX2 18
>> +#define LPASS_CDC_DMA_TX3 19
>> +#define LPASS_CDC_DMA_TX4 20
>> +#define LPASS_CDC_DMA_TX5 21
>> +#define LPASS_CDC_DMA_TX6 22
>> +#define LPASS_CDC_DMA_TX7 23
>> +#define LPASS_CDC_DMA_TX8 24
>> +
>> +#define LPASS_CDC_DMA_VA_TX0 25
>> +#define LPASS_CDC_DMA_VA_TX1 26
>> +#define LPASS_CDC_DMA_VA_TX2 27
>> +#define LPASS_CDC_DMA_VA_TX3 28
>> +#define LPASS_CDC_DMA_VA_TX4 29
>> +#define LPASS_CDC_DMA_VA_TX5 30
>> +#define LPASS_CDC_DMA_VA_TX6 31
>> +#define LPASS_CDC_DMA_VA_TX7 32
>> +#define LPASS_CDC_DMA_VA_TX8 33
>> +
>>   #define LPASS_MCLK0    0
>>     #endif /* __DT_QCOM_LPASS_H */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

