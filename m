Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10C45A79F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 11:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiHaJR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 05:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiHaJR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 05:17:57 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DC4C274E
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:17:54 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id m16so17369061wru.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SXvbV5rcvavP4Jcb2izxYcl7CbRhtBP4rr55k+HGuNU=;
        b=X3x24bF6e1FAOnPOGPbkcK7pFdN7G4u8EQYVcJVjQQXTgufSKLHtIl3ZQe0VghbytW
         Du2+8Ec7aNljPJv6ObaPdvyEkH1Wwam9fzUydUDgl66FRPgYmj1zGbjzK39Tuf6Nvoex
         yU3l9CTgYqLDJflN+BwpL2FhKgNDfukBBVgdY2sz5mqAxYWgQ2EvtLVEg8Bic6ADlQQp
         1HcbHQfR3pC4V/k6OPENbevkVZzFmrXidf/PJha0HUqPnuQDAH8rUW2S+/0JkOKdIie0
         9icy0P6voEfb3ahVNuQLxO8A9ZnSs6D5cTcBL6Jn+FutMrbvKSsELxqAeQgOlCPbBRFz
         wgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SXvbV5rcvavP4Jcb2izxYcl7CbRhtBP4rr55k+HGuNU=;
        b=zhSow9ddin94KRoQJWmk+/GxwNeWc+s201yMcMLExMB98UaNUZKS2R/6EZurjk/69+
         AJVwjciayhpz6PblXsTfPyY/sBMLLv1MYGamFLT1yU1wWEoVEWaBcXAFnhwHvL79uMVz
         RWkv0FD39BPmnIdBQ7iHHd17ai17yMnnZMaMJE9zf+A6c5tk01qxOCtlsV9jdjBgxb8n
         EtJmjkqDmxdEjc5xjdKRWezONhW+xUyXHveMbEUA+UvwKAkNBjB4HrrhsnDeSdqNwU94
         fEjIVSK56n8jF/64SSbAph/ySZWPX1m8KwwLmMBEj3CP2K4fk8u4zyp/2Oyb4Ny+tk5G
         oPxw==
X-Gm-Message-State: ACgBeo2yeKePBW/YqcbopMuR8hutI9S+X+Mjf/zbXP3yVI/1GH9V1h3d
        h+0jPnDMAj37GL/0E3U9RRxifg==
X-Google-Smtp-Source: AA6agR7mYp7d04nyA8tkM4i7/eoK54yX1PZ3lHZvWrDfNfkP3f5n/Q6nL+co9c5v4UI8d75UmPjhvA==
X-Received: by 2002:a5d:5143:0:b0:226:de76:be7b with SMTP id u3-20020a5d5143000000b00226de76be7bmr6469642wrt.308.1661937473326;
        Wed, 31 Aug 2022 02:17:53 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id l42-20020a05600c1d2a00b003a3170a7af9sm1659640wms.4.2022.08.31.02.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 02:17:52 -0700 (PDT)
Message-ID: <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
Date:   Wed, 31 Aug 2022 10:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220818171222.GG1978870-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 18/08/2022 18:12, Rob Herring wrote:
> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>> Add compatible for sm8450 and sc8280xp.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>> index 27da6c6c3c5a..f82c297ea3ab 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>   static const struct of_device_id wsa_macro_dt_match[] = {
>>   	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
> 
> Looks like these are backwards compatible with the existing versions,
> why not reflect that in the binding?
Backward compatibility is not always true, some of the registers and 
there defaults tend to change across SoCs. Having SoC specific 
compatible could help us deal with this and also make code more inline 
with other codec macros in LPASS IP.

--srini

> 
> Rob
