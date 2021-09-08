Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FA3403A51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 15:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhIHNHS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 09:07:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43017 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238371AbhIHNHS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 09:07:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631106370; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=vw2aL2Cthy/tQZoFWOmfPqpnMlONA1rEbkDkuPgSY3E=; b=sQlzBufHa+U0AjM8JwhMSxTppLTbtQrW4dHofVHJ9U1lmQEdL5tHsyKIFyNa6XzHRQr11wvu
 qzvl7wOVUIHLBZGl3EnS0hN/JkPuFBjXzT9CwwMZFdRHKRWvQXy6HSuxaaObKvxjwPZqCO3/
 NjZ7Pvxj2ZsnYky+g1NZ40tUAJA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6138b50f6fc2cf7ad95c0d56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 13:05:19
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9FF8CC4360D; Wed,  8 Sep 2021 13:05:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.137.170] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C46CC43460;
        Wed,  8 Sep 2021 13:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0C46CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <4a513810-ab33-006d-4bce-5e35702a51e0@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <689316cf-7de7-6702-6e82-ee52d786a602@codeaurora.org>
Date:   Wed, 8 Sep 2021 18:35:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4a513810-ab33-006d-4bce-5e35702a51e0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your time and valuable suggestions Srini!!

On 9/8/2021 3:11 PM, Srinivas Kandagatla wrote:
>
>
> On 06/09/2021 14:27, Srinivasa Rao Mandadapu wrote:
>> +#define LPASS_CDC_DMA_RX0 6
>
> You are only adding RX0, what happens to RX1.. RX7
>
> TBH, skipping other entries for ex CDC_DMA_RX will end up with sparse 
> numbering.
>
> Please add all the entries for CDC_DMA_RX and other ports as well.
>
> Like:
>
> #define LPASS_CDC_DMA_RX0    6
> #define LPASS_CDC_DMA_RX1    7
> #define LPASS_CDC_DMA_RX2    8
> #define LPASS_CDC_DMA_RX3    9
> #define LPASS_CDC_DMA_RX4    10
> #define LPASS_CDC_DMA_RX5    11
> #define LPASS_CDC_DMA_RX6    12
> #define LPASS_CDC_DMA_RX7    13
>
>
Okay. Will add and Share new patch.
>> +#define LPASS_CDC_DMA_TX3 7
>> +#define LPASS_CDC_DMA_VA0 8
> You mean VA_TX0?
>
Yes. Will change accordingly.
>
>> +#define LPASS_MAX_PORTS 9
> We really do not need this in bindings.
> You could add this is some of the driver header files instead.
>
Okay Will remove.
> --srini
>> +

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

