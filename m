Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B552F57BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 04:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbhANCF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 21:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729310AbhAMW0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 17:26:06 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105B8C0617B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 14:24:53 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id a9so312253wrt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 14:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lRxYEjgHGRKQJGTWgD8P0bRQPkdIAl462MhbH6w8fIU=;
        b=BsekyHdH2erAZaQOFg5oBpvrJU4q3QQyWSK5EP8gAo2AV4ik5w+HeDmXXpY7i75Gbh
         u4ZCoF42VFFKoGxYA/XNZrm6CkUZktgIS0H7AtzJspWhR+A1rPaNGmGscVJcij5WCCRL
         +OyWhd0dbO2axwpBQsJWQ+aNs/iGnfoqNa5ufCHyRNAkCfa4+pXlFE3SxNMhMCvDo4We
         zw/hXeW+BWXDu8gcibTYkyLNt1lQR8vlMTPzW40yUypRvRxldtEj+TdvpeiLQ2Buukoz
         gCpnHoyezuNadre/90f69Em/DKdiRdGtMCcldNzkK2tP/25Kv2dHu/V+/sVV3RQ84Oh6
         ZsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lRxYEjgHGRKQJGTWgD8P0bRQPkdIAl462MhbH6w8fIU=;
        b=b+Lzm2A74RSciPW5ASVHk4ClzjyEe41qlfAQ3tLMPTDThxMF+PZtcGPAqrsCkeiClC
         kaW0WEARHmXsAplamGrLu2smXh1XPLbNj/nCe7AMKnXBTr5aQgsfefyaDVfXunpzJlUu
         2Z9R/evt5zdhlcjxTQd4M4r7MHsV3+bfu5KS2MRea7ertELqckhuT/ypfaW+NIQ3ERvY
         +tcqjkkFMkaixoOuPOGkN6FN9K3GsbK+ZO5uxNd7BVvANgs7DmLSlKXr+w1bpZn4SvQQ
         nriOEmi6u2KwP/vtQ9Up35jKyxnxHcgMmUIGK1pqwyejTzSMGQ1euq6NPrwQt9H97Its
         iPIA==
X-Gm-Message-State: AOAM532muPoSPmkQsJkk22cYBYvqLt6yao0Qu+UKgcpCU40ZF47H0NDw
        E4h1ec0fVqwZ7j2OyhbOLVmlCQ==
X-Google-Smtp-Source: ABdhPJxOzCfKgbthX8z87pSAA2z2oS1X3eWZiaMypRpcouk9CsbGHEdOnPnfUCuDJjCAwyPuoYVaJQ==
X-Received: by 2002:adf:fd42:: with SMTP id h2mr4695380wrs.142.1610576691623;
        Wed, 13 Jan 2021 14:24:51 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u26sm4694782wmm.24.2021.01.13.14.24.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jan 2021 14:24:50 -0800 (PST)
Subject: Re: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support
 audio over dp port
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
        agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, rohitkr@codeaurora.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
 <244e74f6-fa8c-692a-aa84-4677a0fd815b@linaro.org>
 <X/9TS6bQa3Zh+EXa@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4b34bd4f-e7bc-84f9-5e8a-b2348c17b7aa@linaro.org>
Date:   Wed, 13 Jan 2021 22:24:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X/9TS6bQa3Zh+EXa@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On 13/01/2021 20:08, Stephan Gerhold wrote:
> Hi Srinivas,
> 
> On Thu, Oct 08, 2020 at 06:37:40AM +0100, Srinivas Kandagatla wrote:
>> On 08/10/2020 06:16, Srinivasa Rao Mandadapu wrote:
>>> These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
>>> Asoc. It includes machine driver, cpu driver, platform driver updates for
>>> HDMI path support, device tree documention, lpass variant structure
>>> optimization and configuration changes.
>>> These patches depends on the DP patch series
>>> https://patchwork.kernel.org/project/dri-devel/list/?series=332029
>>> https://lore.kernel.org/patchwork/project/lkml/list/?series=464856
>>>
>>> changes since V10:
>>>       -- Moved hdmi regmap functions from lpass-hdmi.c to lpass-cpu.c
>>>       -- Moved QCOM_REGMAP_FIELD_ALLOC macro from lpass-hdmi.c to lpass.h
>>> changes since V9:
>>>       -- Removed unused structures lpass_hdmi.h
>>> changes since V8:
>>>       -- Removed redundant structure wrapper for reg map field memebrs
>>>       -- Updated lpass_hdmi_regmap_volatile API with appropriate registers as true
>>>          and others as false.
>>> changes since V7:
>>>       -- Fixed typo errors
>>>       -- Created Separate patch for buffer size change
>>> changes since V6:
>>>       -- Removed compile time define flag, which used for enabling
>>>        HDMI code, based on corresponding config param is included.
>>>       -- Updated reg map alloc API with reg map bulk API.
>>>       -- Removed unnecessary line splits
>>> changes since V5:
>>>       -- Removed unused struct regmap *map in lpass_platform_alloc_hdmidmactl_fields.
>>>       -- DMA alloc and free API signature change in lpass-apq8016.c, lpass-ipq806x.c
>>>       -- Keeping API "irqreturn_t lpass_platform_hdmiif_irq" under ifdef macro
>>> Changes Since v4:
>>>       -- Updated with single compatible node for both I2S and HDMI.
>>> Changes Since v3:
>>>       -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
>>> Changes Since v2:
>>>       -- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
>>> Changes Since v1:
>>>       -- Commit messages are updated
>>>       -- Addressed Rob Herring review comments
>>>
>>> V Sujith Kumar Reddy (7):
>>>     ASoC: Add sc7180-lpass binding header hdmi define
>>>     ASoC: dt-bindings: Add dt binding for lpass hdmi
>>>     Asoc:qcom:lpass-cpu:Update dts property read API
>>>     Asoc: qcom: lpass:Update lpaif_dmactl members order
>>>     ASoC: qcom: Add support for lpass hdmi driver
>>>     Asoc: qcom: lpass-platform : Increase buffer size
>>>     ASoC: qcom: sc7180: Add support for audio over DP
>>>
>>>    .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++--
>>>    include/dt-bindings/sound/sc7180-lpass.h           |   1 +
>>>    sound/soc/qcom/Kconfig                             |   5 +
>>>    sound/soc/qcom/Makefile                            |   2 +
>>>    sound/soc/qcom/lpass-apq8016.c                     |   4 +-
>>>    sound/soc/qcom/lpass-cpu.c                         | 249 ++++++++++++-
>>>    sound/soc/qcom/lpass-hdmi.c                        | 258 ++++++++++++++
>>>    sound/soc/qcom/lpass-hdmi.h                        | 102 ++++++
>>>    sound/soc/qcom/lpass-ipq806x.c                     |   4 +-
>>>    sound/soc/qcom/lpass-lpaif-reg.h                   |  49 ++-
>>>    sound/soc/qcom/lpass-platform.c                    | 395 +++++++++++++++++----
>>>    sound/soc/qcom/lpass-sc7180.c                      | 116 +++++-
>>>    sound/soc/qcom/lpass.h                             | 124 ++++++-
>>>    13 files changed, 1240 insertions(+), 143 deletions(-)
>>>    create mode 100644 sound/soc/qcom/lpass-hdmi.c
>>>    create mode 100644 sound/soc/qcom/lpass-hdmi.h
>>>
>>
>> Tested this series on DragonBoard 410c
>>
>> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> I spent quite some time today trying to track down another regression
> for MSM8916/DragonBoard 410c audio in 5.10 and identified this patch
> series as the cause. So I'm very surprised that you successfully tested
> this on DB410c.
> 
> Attempting to play HDMI audio results in:
> 
>    ADV7533: lpass_platform_pcmops_hw_params: invalid  interface: 3
>    ADV7533: lpass_platform_pcmops_trigger: invalid 3 interface
>    apq8016-lpass-cpu 7708000.audio-controller: ASoC: error at soc_component_trigger on 7708000.audio-controller: -22
> 
> Attempting to record analog audio results in:
> 
>    Unable to handle kernel NULL pointer dereference at virtual address 00000000000001e4
>    Internal error: Oops: 96000004 [#1] PREEMPT SMP
>    CPU: 1 PID: 1568 Comm: arecord Not tainted 5.11.0-rc3 #20
>    Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>    pc : regmap_write+0x14/0x80
>    lr : lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
>    Call trace:
>     regmap_write+0x14/0x80
>     lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
>     snd_soc_component_open+0x2c/0x94
>     ...
> 
> Looking at the changes in "ASoC: qcom: Add support for lpass hdmi driver"
> there is a quite obvious mistake there. lpass.h now contains
>

We did hit these two bugs recently while June was testing a platform 
based of 410c.

we had to these 2 fixes in his dev branch

https://paste.ubuntu.com/p/MCbpBgH7JV/

and a hack:
https://paste.ubuntu.com/p/GYDSDmJt7Y/

I got side tracked with other stuff, so I could not cleanup the lpass 
hack patch to send it!

With this two patches June was able to test all the usecases for 410c.

> #include <dt-bindings/sound/sc7180-lpass.h>
> 
> and then the SC7810 DAI IDs are hardcoded all over lpass-cpu.c and
> lpass-platform.c. But apq8016 and ipq806x have completely different
> DAI IDs so now MI2S_QUATERNARY (HDMI) is invalid and
> MI2S_TERTIARY (= LPASS_DP_RX in sc7180-lpass.h) is treated as HDMI port.
> 
Yes, this basically overwritten some of the defines. Specially 
MI2S_TERTIARY and MI2S_QUATERNARY

We should probably consolidate these defines to a single lpass.h file in 
include/dt-bindings/ and not split them into soc specific.

> Effectively LPASS is broken on all platforms except SC7810.
> 
> I have a patch prepared to fix this (will send it tomorrow),
> but I wonder how you have tested this successfully on DB410c. :)
My tests are pretty basic headset/speaker playback cases, this basically 
tests PRIMARY and SECONDARY MI2S and not MI2S_TERTIARY or QUAT MI2S.

June reported this to me some time during Christmas.

Look forward to review your patches!

--srini

> 
> Stephan
> 
