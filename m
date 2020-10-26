Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3C72991CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 17:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774601AbgJZQFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 12:05:15 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:10640 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1784902AbgJZQFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 12:05:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603728311; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gENqlM/pPw1+/3BMakG5icMgcmU6s9phV5kM80xNKFU=; b=TV7DbrxGBV1W7CBZBfeDBz2afkS19h3J+zTj+rxsmVH5kRaHiSvxqOEafHr66O+AaTiAG6Xx
 JEmhEgoGhT3my30BTqEGjq4QFjzyWhppASWr7emCESGMjy3mTBGFLOriPBqoE8W6IqvLHPBW
 kRhTMT+pP+RCCOXdtgjtYPLAtTw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f96f3993ecd8ffc948de9de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 16:04:41
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F812C433B6; Mon, 26 Oct 2020 16:04:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.139.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E802BC433FF;
        Mon, 26 Oct 2020 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E802BC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
 <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <242284b2-ca3f-fbe0-af97-c0e8e5fe640d@codeaurora.org>
Date:   Mon, 26 Oct 2020 21:34:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your time srinivas!!!

On 10/26/2020 8:31 PM, Srinivas Kandagatla wrote:
>
>
> On 22/10/2020 14:26, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Update SC7180 lpass_variant structure with proper I2S bitwidth
>> field bit positions, as bitwidth denotes 0 to 1 bits,
>> but previously used only 0 bit.
>>
>> Fixes: commit cba62c8b49bead ("Merge series "ASoC: qcom: Add support 
>> for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:")
> this should be 12 chars long, for this particular fix it should be!
>
> Fixes: 24caf8d9eb108 ("ASoC: qcom: lpass-sc7180: Add platform driver 
> for lpass audio")
>>
>
> No empty line after Fixes tag!
>
> Will coorect it in next patch.

>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-sc7180.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/lpass-sc7180.c 
>> b/sound/soc/qcom/lpass-sc7180.c
>> index c6292f9e..bc998d5 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -188,7 +188,7 @@ static struct lpass_variant sc7180_data = {
>>       .micmode        = REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
>>       .micmono        = REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
>>       .wssrc            = REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
>> -    .bitwidth        = REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
>> +    .bitwidth        = REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
>>         .rdma_dyncclk        = REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
>>       .rdma_bursten        = REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
>>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

