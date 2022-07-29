Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79200584D81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 10:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiG2IkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jul 2022 04:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbiG2IkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jul 2022 04:40:08 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4501983F25
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 01:39:56 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id w8-20020a05600c014800b003a32e89bc4eso2155089wmm.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 01:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yXWIEmrCvPhMUD5deMCakmb6B16F9IWiC7sXOX1uSM8=;
        b=sGbkLN5+s6l3Qj93D53goWriKE+GOP/8Mh1PBv+98Sjbugr4jUOrSJvm/o7RPKnYC1
         DNJZ8/QaNC3Jl1Fq+R++CjrTLA4J9mb9KRMMbnlVYue+CEkxIHVvvOeJeXdyY9kKGZoa
         7SnhpN3XW+wqZHS1cIij4veMYgj0fePhXbN1Ba0t8mLgkHHTp2nK122u291EwxZ2uf/e
         xAcufWhebU0rGplUh3YoLCjxHCKY/CM5p3AS845x6x6xx6VUDKxiS3Kby+JQ/o22VP2Q
         tfysop5bbymKo7+BoHyTkcvNUZHWivdSgNgy4U7YBDSfMiHWcKvl6lkjB53dbJ822oSV
         N4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yXWIEmrCvPhMUD5deMCakmb6B16F9IWiC7sXOX1uSM8=;
        b=DyFUpd36q5GhvTgwPIyFcAD0WsHuQPF7eMS+eBpyWHAdW7tEXRFmdE5LGqQLC+HXk7
         QbxDNJCFMd/gEoJ5pr2ovUuXg6vDENcnlhJjdkR95vdnRkELT/2M3Iv0IV05v8dS1qyz
         Ip3oQhWBsbrGnp6a59LTC8pYJkSCUGD/KqXvodfF8W7CZzszOV0uKBs2oH/4VhjSHVpa
         nsjhBhI3yqGzheDy2j6durZs6DKW0h4vwfdb7afdhUUhqh9LS72MLr6PQf+zAMb6u0j4
         ixhIL0gjvZADRzVeHkKNiV6J5Lbfb1R9RYAK6IqodOpe0mXgXIUOGkTLzjhiRDi4kSTM
         /POQ==
X-Gm-Message-State: AJIora9HotABonJ1PkT18YzBm762u2RsH/lDvGDhrDJPWRQcTxhd6DZ5
        7QYYVvipcHUHtGBHVjIx1R+qzQ==
X-Google-Smtp-Source: AGRyM1sWhvkqR1vqTMAwyf4DEQkAyj+iXMIL4uNEYHGCSVKh5Qka07s8vTELMcAQhcmjrecOGJGj/A==
X-Received: by 2002:a05:600c:19c9:b0:3a3:469f:c1e7 with SMTP id u9-20020a05600c19c900b003a3469fc1e7mr1956536wmq.141.1659083994542;
        Fri, 29 Jul 2022 01:39:54 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id i3-20020a1c5403000000b003a02f957245sm7820574wmb.26.2022.07.29.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 01:39:53 -0700 (PDT)
Message-ID: <278edf67-834b-b673-8d71-88213130d4c8@linaro.org>
Date:   Fri, 29 Jul 2022 09:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
 <YuKbpXVOeGn2l2gd@sirena.org.uk>
 <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/07/2022 17:09, Srinivasa Rao Mandadapu wrote:
> 
> On 7/28/2022 7:52 PM, Mark Brown wrote:
> Thanks for your time Mark!!!
>> On Thu, Jul 28, 2022 at 07:29:49PM +0530, Srinivasa Rao Mandadapu wrote:
>>> Update SC7280 machine driver for enabling external dmic bias supply,
>>> which is required for villager evt boards.
>>> +++ b/sound/soc/qcom/sc7280.c
>>> @@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops = {
>>>   static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>>>       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>>       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>>> +    SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
>>>   };
>>>   static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> Don't you want to connect this to something?  This won't do anything
>> as-is.  I can't see any references to DMICVDD which might be failing to
>> resolve in the current sound/soc/qcom.
> 
> The connection is being done to "VA DMIC"through audio routing in board 
> specific dts file.
> 
> Will post the changes once the main dts patches are landed.
> 
> Ex:-
> 
> &sound {
>      DMICVDD-supply = <&pp1800_l2c>;
> 
>      audio-routing =
>              "IN1_HPHL", "HPHL_OUT",
>              "IN2_HPHR", "HPHR_OUT",
>              "AMIC1", "MIC BIAS1",
>              "AMIC2", "MIC BIAS2",
>              "VA DMIC0", "DMICVDD",
>              "VA DMIC1", "DMICVDD",
>              "VA DMIC2", "DMICVDD",
>              "VA DMIC3", "DMICVDD",

You should just use "vdd-micb" instead of DMICVDD.
There is already a SUPPLY DAPM in lpass-va-macro codec.

--srini
>              .....
> 
>              .....
> 
> };
> 
> 
