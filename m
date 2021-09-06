Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0370B401C60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 15:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242552AbhIFNhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 09:37:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35965 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242559AbhIFNhI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 09:37:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630935363; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=VJqyOAQM63NCKoLXJVRl7+vm46IbeShVloXZfhv2BBg=; b=kJGFmdj6uWUMuOf6soTWvKm7lkF4wl1CniJj/1MRCJIAf3cwpxemgh9V3cMLtBjv1oQ94zLJ
 A8FT/QRqnn+ZLobxjb+Y65MOldXsFtmw8WKiS6YNy/iYoNLCh/sFsiNSqMvHoEV93zIG9J8l
 NYYAVwsr4ZfR3W8wys4FIa4EL+U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6136193b40d2129ac1dde34e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 13:35:55
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07E72C43618; Mon,  6 Sep 2021 13:35:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FC82C4338F;
        Mon,  6 Sep 2021 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3FC82C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <20210903100153.9137-1-srivasam@codeaurora.org>
 <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <587ed6fd-0203-cb7d-338f-185185d88f76@codeaurora.org>
Date:   Mon, 6 Sep 2021 19:05:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for Your time Stephen!!

On 9/4/2021 12:10 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-09-03 03:01:53)
>> Update interrupt clear register with reset value after addressing
>> all interrupts. This is to fix playback or capture hanging issue in
>> simultaneous playback and capture usecase.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
> Any Fixes tag?
Actually it's incremental change. I will add base commit of this function.
>
>>   sound/soc/qcom/lpass-platform.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index f9df76d37858..1a0a4b0b1a03 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>>                  }
>>          }
>>
>> +       rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>> +       if (rv) {
>> +               pr_err("error writing to irqstat reg: %d\n", rv);
>> +               return IRQ_NONE;
> I was thinking we should return IRQ_HANDLED still, but then I guess
> failing to clear the irq be treated as a spurious irq so that if we fail
> enough times we'll shut off the irq at the irqchip. Things are going bad
> if the write fails.
Here bit confusing. Could You please suggest How to go ahead on this?
>
>> +       }
>> +
>>          return IRQ_HANDLED;
>>   }
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

