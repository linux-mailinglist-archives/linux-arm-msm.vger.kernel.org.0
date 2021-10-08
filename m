Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F44426C67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbhJHOKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:10:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54264 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233614AbhJHOKP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:10:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633702100; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=equpnyXxO6M8Wb6SpXs+6Qvj0ruPUeEgbV+8v4YWSc4=; b=kRiuLcjbYdSR8Sok8ZxDJsSIwsaS29EbEw7MtAjj/AKdilVlK4ItMn1Ak3/0WwR3xNzCpv74
 TRJgce8sb39X37JPZ8Vs9ktYvYVwJNLdJsMkQJV1k6AB7KFgWhMvXk7FbVEgjMWqvtALAj03
 pvMebUtIWrXM9e3GWzL0pVnxVDg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 616050d3446c6db0cbf6399d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:08:19
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1B1EC43460; Fri,  8 Oct 2021 14:08:18 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E927FC4338F;
        Fri,  8 Oct 2021 14:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E927FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 3/5] ASoC: codecs: tx-macro: Enable tx top soundwire
 mic clock
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-4-git-send-email-srivasam@codeaurora.org>
 <1e176dd1-fc8b-09dc-eb73-35b7d268e89a@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <61ac21e5-da1b-58d2-7c9c-403277e7dd30@codeaurora.org>
Date:   Fri, 8 Oct 2021 19:38:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1e176dd1-fc8b-09dc-eb73-35b7d268e89a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/27/2021 5:51 PM, Srinivas Kandagatla wrote:
>
>
> On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
>> Enable tx path soundwire mic0 and mic1 clock.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-tx-macro.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>> b/sound/soc/codecs/lpass-tx-macro.c
>> index 5dcae73..e980b2e 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -1674,6 +1674,8 @@ static int tx_macro_component_probe(struct 
>> snd_soc_component *comp)
>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>>                         0x0A);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>
> This needs a comment for more clarity to readers.
Okay. will add comment.
>
> --srini
>>         return 0;
>>   }
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

