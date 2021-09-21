Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AB641306B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 10:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhIUIuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 04:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhIUIuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 04:50:04 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA727C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 01:48:36 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id dj4so15747793edb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pUh98EEgZG2+uO+vlZkUsJ82k9SQPEJS3egqtCoQfL4=;
        b=JidHcdbTA56g9QDi5/rHubK3yUC4vaq0Q1uH2W1sMozCl7XKea40FpA5+GO7W1pE27
         uo/UXYDxhtRzZrcBFQN6HIjpA9kdWR6CeUE+KBvO5ut2PCb1R8bbqlY89qitsK1OLzeG
         w2bFos4aXABG4zXHt6QDag0bPaCuZyUoRczIViiHIt/oqVWE9HM8q2YmdoRg7z2FyPLQ
         qpjdvgNnQnLlc19nqORxpUDlRBDuE2S8L9DmrZbn5FkZOdaaSNPx/TMMmIG+Baph5OsF
         h6k5gftIt1TCjCu66WfbKVtnd+BLzsBTunxdU5zsRKa/FSj1+nzkBqiA/oIKe0YZFAVs
         n+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pUh98EEgZG2+uO+vlZkUsJ82k9SQPEJS3egqtCoQfL4=;
        b=YFwcTCunyDjuEROCPkmoVRaLyZe15cKMP6f6M/LfneN2vauV3GJ2KXamfv9Rmfq55M
         lZN0nl0GaLC/GbG39KMOurDer4LirDsUH61vT8C1INYyXsPNtxS9ptZgE3YF9Z1uN8Tg
         JfF8ru3XAribXCA/hfuMcSaWWisWZh6L0V+mIXl5hIz+TkzsHyxUKnS/8RQTi/yHjQUC
         J+K4A2TdLNgRjXs33vCQUKHVq1xdh7m+dhYWO1Am3mNbM+TvmurUZFU3yP5mCxA9MXF4
         A+ChwMiiuskn4au2VVqwWaUGZRXjkY9iC3yAIlReXIQ0sgDYr+USaeVCeJCmLdoLoi8C
         OQqQ==
X-Gm-Message-State: AOAM532Sy4+yNrGeN8i5SaLiWEjGcibHBpZ4f4ML8xAAu1r2F/ae1uwo
        sA+TInjiM3CWf2+YRzFIKdbFtA==
X-Google-Smtp-Source: ABdhPJxrQxE9ACVMOX6Sh5MbXYcHLRld4KwTJA0+3Vfku8/s36x38h1VCVUeBEctj8vgBsGMB9oXdA==
X-Received: by 2002:a17:906:1945:: with SMTP id b5mr32587263eje.347.1632214115300;
        Tue, 21 Sep 2021 01:48:35 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o23sm8153195eds.75.2021.09.21.01.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 01:48:34 -0700 (PDT)
Subject: Re: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers
 to volatile
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
 <c1c7b1e8-98f5-99a3-1374-11d1d61535b4@linaro.org>
 <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
Date:   Tue, 21 Sep 2021 09:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/09/2021 08:30, Srinivasa Rao Mandadapu wrote:
> 
> On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
> Thanks for your time Srini!!
>>
>> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>>> Update amic and dmic related tx macro control registers to volatile
>>>
>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>> lpass tx macro)
>>>
>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>> ---
>>>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>> b/sound/soc/codecs/lpass-tx-macro.c
>>> index 9273724..e65b592 100644
>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct 
>>> device *dev, unsigned int reg)
>>>       case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>>>       case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>>>       case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
>>> +    case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
>>> +    case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
>>> +    case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
>>> +    case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
>>> +    case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
>>> +    case CDC_TX_TOP_CSR_SWR_CTRL:
>>> +    case CDC_TX0_TX_PATH_SEC7:
>>
>> Why are these marked as Volatile?
>> Can you provide some details on the issue that you are seeing?
>>
>> --srini
> 
> Without volatile these registers are not reflecting in Hardware and 
> playback and capture is not working.
> 
> Will do recheck and keep only required registers as volatile.

This sounds like a total hack to me,

this might be happening in your case:

The default values for this register are different to actual defaults.
Ex: CDC_TX_TOP_CSR_SWR_AMIC0_CTL default is 0x00
so writing 0x0 to this register will be no-op as there is no change in 
the register value as compared to default value as per regmap.

In you case make sure the hardware default values are correctly 
reflected in tx_defaults array.

Then setting the desired value should work.


--srini



> 
>>
>>
>>>           return true;
>>>       }
>>>       return false;
>>> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct 
>>> snd_soc_component *comp)
>>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>>>                         0x0A);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>>>         return 0;
>>>   }
>>>
