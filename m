Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E98F45E6EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 05:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243350AbhKZEo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 23:44:56 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:36753 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343984AbhKZEm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 23:42:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637901584; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=+pUbjW7Z8WLps/cKoiWRu8LdT/rmntmlr+hAGcdaE8Y=; b=sr4sTVbHvOnvk0f2islkiKJ6mRNN3/rRKrrvXop/dlYawFpUrMxZssGS4Izm8pX5KVIdqTgp
 m/kxtg9nxBCkNioXQPRjx4e43H1+D+EAyfK3CzX8TVrPu/s7JOfhdFm1XwxILXyCvLw7E+wZ
 stSdd4JoXzJ/FopyOCK8wDpBXjw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 61a0650fdf12ba53c451f6a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 04:39:43
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1922C43619; Fri, 26 Nov 2021 04:39:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA7BAC4338F;
        Fri, 26 Nov 2021 04:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DA7BAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v5 00/10] Add support for audio on SC7280 based targets
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <5f750cfc-dace-59a7-2eb4-4831a313064c@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f8d17e44-c131-8ca5-6abd-baea44d72044@codeaurora.org>
Date:   Fri, 26 Nov 2021 10:09:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5f750cfc-dace-59a7-2eb4-4831a313064c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/23/2021 5:58 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
>
> On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
>> This patch set is to add support for Audio over wcd codec,
>> digital mics, through digital codecs and without ADSP.
>> This patch set depends on:
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
>
> Except this one, rest of the patches are already in sound-next.
> and the only dependency I see here is the final patch which adds 
> Kconfigs to the soundcard SND_SOC_SC7280.
> Why not just move those two lines in the patchset that adds the 
> soundcard?
>
>
>
> --srini
>
Okay. will move this dependency to corresponding patch.
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=559677
>
>>
>> Changes Since V4:
>>      -- Remove unused variable in lpass-sc7280 platform driver.
>> Changes Since V3:
>>      -- Remove redundant power domain controls. As power domains can 
>> be configured from dtsi.
>> Changes Since V2:
>>      -- Split lpass sc7280 cpu driver patch and create regmap config 
>> patch.
>>      -- Create patches based on latest kernel tip.
>>      -- Add helper function to get dma control and lpaif handle.
>>      -- Remove unused variables.
>> Changes Since V1:
>>      -- Typo errors fix
>>      -- CPU driver readable/writable apis optimization.
>>      -- Add Missing config patch
>>      -- Add Common api for repeated dmactl initialization.
>>
>> Srinivasa Rao Mandadapu (10):
>>    ASoC: qcom: Move lpass_pcm_data structure to lpass header
>>    ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
>>    ASoC: qcom: Add register definition for codec rddma and wrdma
>>    ASoC: qcom: Add lpass CPU driver for codec dma control
>>    ASoC: qcom: Add helper function to get dma control and lpaif handle
>>    ASoC: qcom: Add support for codec dma driver
>>    ASoC: qcom: Add regmap config support for codec dma driver
>>    ASoC: dt-bindings: Add SC7280 sound card bindings
>>    ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
>>    ASoC: qcom: SC7280: Update config for building codec dma drivers
>>
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
>>   sound/soc/qcom/Kconfig                             |  13 +
>>   sound/soc/qcom/Makefile                            |   4 +
>>   sound/soc/qcom/common.c                            |  39 ++
>>   sound/soc/qcom/common.h                            |   1 +
>>   sound/soc/qcom/lpass-cdc-dma.c                     | 195 ++++++++
>>   sound/soc/qcom/lpass-cpu.c                         | 245 +++++++++-
>>   sound/soc/qcom/lpass-lpaif-reg.h                   | 103 ++++-
>>   sound/soc/qcom/lpass-platform.c                    | 513 
>> ++++++++++++++++++---
>>   sound/soc/qcom/lpass-sc7280.c                      | 416 
>> +++++++++++++++++
>>   sound/soc/qcom/lpass.h                             | 150 ++++++
>>   11 files changed, 1669 insertions(+), 79 deletions(-)
>>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>>   create mode 100644 sound/soc/qcom/lpass-sc7280.c
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

