Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50515A79FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiHaJT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 05:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbiHaJTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 05:19:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8957DCCE15
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:19:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br21so13302951lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+pwFDg0e0j+yXSWZO1QdYOdmfRiXIedB2SifAAmn8XI=;
        b=l/XeKVh2yJtrLsYPx4G5AdOSXv4Uyh0J3MSLro6syYpwPvq4Bw46hy3wZ1Ilkv5dIF
         LSrnQ8tjtKNc3SxxPH9lKvuWdhPfJWFUJecLJDYORyahIXTErnRyW3KvzdLT6dWyTS22
         LfHjdoH9FWpyguDshL/AnL4NhAZInG/YKh7uk/OgCF2cFCbslvKn/CpTS4jApAS0SctR
         6yWLpZClaTeXOwjlUxJcMexUH/xsdqd5XvWOl54wSjlSJBxPYUlWq/5f0EEPMoZxQaht
         Pl9RzmQ4ZrU9r4j58FNmeP0pK1WLGmry0jC2QaO+4hG6HChazS+CDQ5ATVb4RSAJ4Mzc
         sw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+pwFDg0e0j+yXSWZO1QdYOdmfRiXIedB2SifAAmn8XI=;
        b=Ms6FzkbF4GF4qSQUqg/VY5zPQ/SSlE8Kab+NxCMS8JnGxJxD1iiPJT38MiBa09b3pq
         dTqO7t0DDCK7sHbqbCshbSkt1ooyd4GLXEO9Pa51QthVUxXdsJwMdDG1vFN/7DFdkTwC
         hb+RkSN8HADinLUjrU/Zav/BLJMRHeOnlwwIYwpHJ1UlvWlTFR31LuaGXBHG0vEgkyG4
         /JzpLINz57UUDA9VDb9oSnoqtLYEqUf1tsoSZ6diVBb7UGWdhlA4sCNy/wPS1+FPr6Zo
         7CmSwRF3SE4Khd91qMnXPDG+itzS3D5N2gboxlNSsfUZcFHLk1MNQywXvKa+DT1eV31W
         gGMw==
X-Gm-Message-State: ACgBeo15DUx8/X081DRzMttSoeu2r5Sneqd34DWVkesb2fhXqIhVG71/
        X/vSWWR3eE0AzCI/dEB4M5SLKUglQO5cuw==
X-Google-Smtp-Source: AA6agR4uihFpaG8nK8poPhUm9j3r98rElE4l/J0Vn5UOIDcFiGql16aEPEIcKVvDvdd4p7q8DsLUng==
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id i16-20020ac25b50000000b004945ec21ea5mr6367241lfp.276.1661937552410;
        Wed, 31 Aug 2022 02:19:12 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e8e27000000b0025dd8b42c64sm1108430ljk.79.2022.08.31.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 02:19:11 -0700 (PDT)
Message-ID: <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
Date:   Wed, 31 Aug 2022 12:19:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
 <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2022 12:17, Srinivas Kandagatla wrote:
> 
> 
> On 18/08/2022 18:12, Rob Herring wrote:
>> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>>> Add compatible for sm8450 and sc8280xp.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>>> index 27da6c6c3c5a..f82c297ea3ab 100644
>>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>>   static const struct of_device_id wsa_macro_dt_match[] = {
>>>   	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
>>
>> Looks like these are backwards compatible with the existing versions,
>> why not reflect that in the binding?
> Backward compatibility is not always true, some of the registers and 
> there defaults tend to change across SoCs. Having SoC specific 
> compatible could help us deal with this and also make code more inline 
> with other codec macros in LPASS IP.

I am not saying that there should be no SoC specific compatible. This
one is a must, but the question why duplicating the entries and not
using fallback?

Best regards,
Krzysztof
