Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416CD4679C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 15:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381539AbhLCO4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 09:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbhLCO4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 09:56:11 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2E0C061751
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 06:52:47 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso5079281wml.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZzxNp6Li+FKh8VvPAtYb8iH3DgmCIwi+B4XCv18Ihrw=;
        b=gFEvJUI6PFMXsFJ7uLT5BVQJiOz8A7SS95aSDeq1SRZZYq38l5C3axsjPvjHdwZBZ8
         FYXMQ1MyTudZptCqXAl4/pwMiPFW9COIbQbyJs8/cRH+edwYdTl/9DWWZlDUgZEvpLEP
         2SrD2pHd0EEpE4n1sF+dpvAjSWzRwovTlhyCxIpqcKp3P/xQxS1LFZVQ1tsjSrTeItpj
         ym3w2UHxJys/mf/bHR3b84Wo+si0wGRHrOwqVstp6Maip0W8ZFSrRzkquhc8WwtOkM6O
         /nKOpbD5UcnIJtoCtrqoNp60Rmwi7b4QdK67Ay1atAHu9E5PkshCpWIDptT5uDdxTGE+
         +MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZzxNp6Li+FKh8VvPAtYb8iH3DgmCIwi+B4XCv18Ihrw=;
        b=C5pkVPndS0YX1jFB6IaapMx4WxIRukbNR0d35qH+IOCHmvXsPDUj0ARM4qDTiflm4U
         yLUCPUKkcweKYQuEywpFvqE6+nmDAz3ABO+lXLqWA+j1SgQElL9Jh0zqjjsOavHi0yus
         llOdErHGOIVjoHHSwaVwYJaQy4vsR2HPuUanKLkUiTaIJCKQYWzb6puL+ImoL6+gavVQ
         uBN+PKoRLwNuiCl3Ztn1DKUk0Phdf/sL0GXjKMnAxMDYUhf4i9U5KisE2pdpmMrf9QK9
         lK1LsincTv2ai6ZRI69guj1Q/4CwWaSKXbzojGvUJ/xelJR7DwIYG9r5/mmQAAHUvmVl
         5QUA==
X-Gm-Message-State: AOAM533b+tx5ItyKUVJol9WVOwV0836y/4gCuf8Wl2AssL9wW0wpEmnZ
        NFb+9dTV78bRfMR3f/g8yDcFtw==
X-Google-Smtp-Source: ABdhPJwu9Pnd/AqfRPNY1G/4y6KC9psu4pYQK112fEaGBoHDw26MLpCIvnoiT5+JvBoREHAI/jIyww==
X-Received: by 2002:a1c:9d03:: with SMTP id g3mr15052408wme.143.1638543165676;
        Fri, 03 Dec 2021 06:52:45 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id m14sm4273040wrp.28.2021.12.03.06.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 06:52:44 -0800 (PST)
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
 <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
 <YaorZnQTwvXo6vrO@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5c6607cc-ad2a-6f90-e087-78ef3bd39e80@linaro.org>
Date:   Fri, 3 Dec 2021 14:52:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaorZnQTwvXo6vrO@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2021 14:36, Stephan Gerhold wrote:
> Hi Srinivas,
> 
> Thanks for your review!
> 
> On Fri, Dec 03, 2021 at 10:35:08AM +0000, Srinivas Kandagatla wrote:
>> I have tested DB410c this use case in the past using similar patch [1].
>>
> 
> Did you use a different modem DSP firmware? (An older one maybe?)

It was very old which came with some Android release I guess.


> In my tests the newer ones seem to have QDSP6 audio completely broken,
> my DB410c simply rebooted when I tried it.
> 
>> On 02/12/2021 14:55, Stephan Gerhold wrote:
>>> The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
>>> (bypassing the combined audio/modem DSP in MSM8916/APQ8016).
>>> Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.
>>>
>>> This only requires adding some additional hooks that set up the DPCM
>>> backends correctly. Similar code is already used in drivers for newer
>>> SoCs such as apq8096.c, sdm845.c and sm8250.c.
>>>
>>> A slightly different initialization sequence is used for the apq8016-sbc
>>> and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
>>> function as device match data.
>>
>> Other alternative is to reuse card->name populated from "qcom,model"
>> property to differentiate between both of these.
>>
>> This should also help in differentiating UCM configs.
>>
> 
> I have "qdsp6" in card->components to differentiate the setups in UCM
> configs. I think this is a more flexible approach than adding it to the
> card model. It can be checked in UCM using ${CardComponents}.
> 
> In my setup the card "model" identifies the device in use (e.g.
> smartphone X with a stereo speaker setup). This device might use the
> DSP bypass (apq8016-sbc-sndcard) or QDSP6 (msm8916-qdsp6-sndcard),
> depending on user preference. In UCM this is detected by checking
> if ${CardComponents} contains "qdsp6" or not.

That is other way to do it too.


> 
> The reason for supporting both setups is that they both have their
> advantages and disadvantages. The DSP must be used when the modem is
> needed, but otherwise the LPASS driver tends to give more easy control
> about sample rate, latency etc.
> 
>>
>>>
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>
>> Few minor nits, other than that it LGTM,
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>>> ---
>>>    sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
>>>    1 file changed, 129 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
>>> index ba2a98268ee4..f9d69375320e 100644
>>> --- a/sound/soc/qcom/apq8016_sbc.c
>>> +++ b/sound/soc/qcom/apq8016_sbc.c
>>> [...]
>>> +static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>>> +{
>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +	struct snd_soc_card *card = rtd->card;
>>> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
>>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>>> +	int mi2s, ret;
>>> +
>>> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
>>> +	if (mi2s < 0)
>>> +		return mi2s;
>>> +
>>> +	if (++data->mi2s_clk_count[mi2s] > 1)
>>> +		return 0;
>>> +
>>
>> Am assuming that as you are not setting any DIGITAL CDC clock here you might
>> be using an external codec.
>>
> 
> For apq8016-sbc the digital clock is controlled by msm8916-wcd-digital
> through the reference in the device tree (<&gcc GCC_CODEC_DIGCODEC_CLK>).
> It must be carefully managed, because it is needed for register access
> in that driver.
> 
> Since QDSP6 also allows controlling this clock though LPAIF_DIG_CLK
> it is a bit of a hack to bypass it using the GCC driver. However, I kept
> the same setup for simplicity and it has been working just fine so far.

Nice!

> 
> AFAICT in your commit you simply turn on the clock twice, once directly
> using GCC and once indirectly via LPAIF_DIG_CLK in QDSP6. :-)

Yes, that was bit of test code TBH.

> 
>>> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
>>> +	if (ret)
>>> +		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>>> +	return ret;
>>> +}
>>> +
>>> [...]
>>> @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>>>    static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>>>    {
>>> +	void (*add_ops)(struct snd_soc_card *card);
>>>    	struct device *dev = &pdev->dev;
>>>    	struct snd_soc_card *card;
>>>    	struct apq8016_sbc_data *data;
>>>    	int ret;
>>> +	add_ops = device_get_match_data(&pdev->dev);
>>> +	if (!add_ops)
>>> +		return -EINVAL;
>>
>> We will never hit the error case here because without a match we can not
>> even enter the probe function.
>>
> 
> Theoretically it's possible to create platform devices through other
> ways than the device tree (think of old board C files for example).
> I agree that nobody should do that, but having this check here
> at least avoids a NULL pointer dereference in this unlikely scenario.
> 
> Please let me know if I should remove it anyway, that's fine for me!

TBH, I don't have very strong opinion on this.


--srini
> 
> Thanks,
> Stephan
> 
