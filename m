Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271BA25D737
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 13:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgIDL15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 07:27:57 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:59802
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730222AbgIDL1f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 07:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599218470;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=8pVmz0o3OoIQ5HbXtj/1WjtjF6Iyr+tVEffv2fUGSQw=;
        b=MKhx5Hg2kBORH4kbkr3AautNFhaPdMKOu1ESqMHf8gGHHP3XVeBXFfpQ+qalUtGM
        0nWrqMG/+hcXNGXd8h2cEt5XLDLWSRYYE8k44jzH3Ly65D2jhpJbMkEbTDerr+kYo2T
        2lytctJh8XIyVhOjKRJGVLYWdWoXm/ru9FCwr4B8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599218470;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=8pVmz0o3OoIQ5HbXtj/1WjtjF6Iyr+tVEffv2fUGSQw=;
        b=fYgadC23dQbOG6YB0sdDWU/kzIxlVOKiVX/nqyHopK3taf0OKOe8C0pg0w9X5GSu
        +cflE86b2ZcUizmj/1OFIkqLS0fI6gjv2r0AhZzkdjTFytLf/HOpmvuWmcwRhSFpylw
        g/g+rw/BU4GqdAEUcZkc/4Cu3eQF4IqPY8cqf4JI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D58BDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <0101017458d94ca3-9d12e985-1ae2-4a39-ae17-996abd0cf79f-000000@us-west-2.amazonses.com>
Date:   Fri, 4 Sep 2020 11:21:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.04-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Srinivas For Review!!!

On 9/4/2020 4:11 PM, Srinivas Kandagatla wrote:
>
>
> On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Upadate lpass cpu and platform driver to support audio over dp.
>> Also add lpass-hdmi.c and lpass-hdmi.h.
>>
>> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> ---
>>   sound/soc/qcom/Kconfig           |   5 +
>>   sound/soc/qcom/Makefile          |   2 +
>>   sound/soc/qcom/lpass-apq8016.c   |   1 +
>>   sound/soc/qcom/lpass-cpu.c       |  64 ++--
>>   sound/soc/qcom/lpass-hdmi.c      | 684 
>> +++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass-hdmi.h      | 129 ++++++++
>>   sound/soc/qcom/lpass-ipq806x.c   |   1 +
>>   sound/soc/qcom/lpass-lpaif-reg.h |  48 ++-
>>   sound/soc/qcom/lpass-platform.c  | 287 ++++++++++++----
>>   sound/soc/qcom/lpass.h           |  88 ++++-
>>   10 files changed, 1225 insertions(+), 84 deletions(-)
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
>>
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index a607ace..509584c 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
>>       tristate
>>       select REGMAP_MMIO
>>   +config SND_SOC_LPASS_HDMI
>> +    tristate
>> +    select REGMAP_MMIO
>> +
>>   config SND_SOC_LPASS_PLATFORM
>>       tristate
>>       select REGMAP_MMIO
>> @@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
>>       tristate
>>       select SND_SOC_LPASS_CPU
>>       select SND_SOC_LPASS_PLATFORM
>> +    select SND_SOC_LPASS_HDMI
>>     config SND_SOC_STORM
>>       tristate "ASoC I2S support for Storm boards"
>> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
>> index 7972c94..0bd90d7 100644
>> --- a/sound/soc/qcom/Makefile
>> +++ b/sound/soc/qcom/Makefile
>> @@ -1,12 +1,14 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   # Platform
>>   snd-soc-lpass-cpu-objs := lpass-cpu.o
>> +snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>>   snd-soc-lpass-platform-objs := lpass-platform.o
>>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
>>     obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
>> +obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
>> diff --git a/sound/soc/qcom/lpass-apq8016.c 
>> b/sound/soc/qcom/lpass-apq8016.c
>> index 5c8ae22..a1bc7e2 100644
>> --- a/sound/soc/qcom/lpass-apq8016.c
>> +++ b/sound/soc/qcom/lpass-apq8016.c
>> @@ -289,6 +289,7 @@ static struct lpass_variant apq8016_data = {
>>       .exit            = apq8016_lpass_exit,
>>       .alloc_dma_channel    = apq8016_lpass_alloc_dma_channel,
>>       .free_dma_channel    = apq8016_lpass_free_dma_channel,
>> +    .id            = I2S_INTERFACE,
>
> Before going into detail review, I see real issue in the overall 
> approach here to add new interface to exiting lpass!!
>
> Intention of struct lpass_variant is to address differences between 
> SoCs or different lpass versions. But you should not duplicate this 
> and use it for addressing differences between each lpass interfaces!
> All the dai related register offsets should still go in to this 
> structure and driver should be able to know which dai its talking to 
> based on snd_soc_dai_driver id and select correct register offset.
>
Do You suggest to use separate structure like struct 
lpass_hdmi_interface in lpass_data?
> Also on the other note, can you please split the patch if possible so 
> that it will be easy for review. Specially I would like to see header 
> file changes specific to adding new interface to be separate then 
> followed by the actual interface implementation  and then the user.
Okay, will split the patch.
>
> I also see some unrelated changes like changing buffer sizes, which 
> should go into different patch!
Okay we will separate the patch.
>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

