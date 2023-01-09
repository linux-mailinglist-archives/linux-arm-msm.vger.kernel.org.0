Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970C1662744
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbjAINh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237066AbjAINgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:36:54 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7041F3E841
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:34:58 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so9033825wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Kukoai+7dPesMj73NOB/0XiMbmQYiypYpyBD0Rmy94=;
        b=zOHtFB/xF7vcwYY/emTb5TpaZ/e879x3tN6lXF064jEw6Nce1R7CNOPUIdfoMLUDux
         /HkdOiAkBqdHcbB2z9kDCSLylnQoJ4q3mnQE2StRS3+qzF25tlO3v7hi1mTGtV0TJtK/
         Xy6LMY5+l/heC3fTHKGjAAVvO9ZL2MuCMw5tsq0dRDq1VFaODIZ8nGf42T9X1kgDKjea
         qWDNwCjQJ0k5LQB5cEeRHfndy8jQnjeoqTRx6f1xQCBOglu+sB25ZM8EW8VUdYYHwwZW
         6dz2KgDFnhJuP8Ln2bDfzTtie8kbO3h3hVCwGkCiZJ+bdXZY7v7M5pA8/cue+0nT2ZxP
         kRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kukoai+7dPesMj73NOB/0XiMbmQYiypYpyBD0Rmy94=;
        b=7snNzyXKVPtzicvm9TRJZSe5+pJ3EWDr+JhrfRUvwsHPcoqTJo2yoEbfJI/tv670Xg
         BA3K0uZL1mfFGRxVT++siEQg+tQ55TwX9U3pYWjvqPfacdQAktfuhysbm2bhSq2BBxrJ
         zEI5PUWGPWazXiu9q8siYhQ/4lJyp6u3N62nD6ddDAZfxbbBS8yLwt/KfC5tsDE03a1n
         kpfqEDQUD3ddYIqmTOvAEwecArkD/rj9Hk7ynPxCuSoJFWrTwk7sZlLkVmAvIni3DNTW
         JA8tCpFVJmaQNVwkChlMbdm6wMdrRKN1TGngjj9HxCDelKnLpNShDhVHXgnadU6zXD7f
         3mrQ==
X-Gm-Message-State: AFqh2koTjeAQWX7tjcNOXjjckFaDckZnyLyZ5D6rR5YAk2plQcCug0m3
        Hhc/ey2qAO2Vo2AVoz7i7VfnVQ==
X-Google-Smtp-Source: AMrXdXuuIbQxmJyr8sv7eqCDQEhNZuR1xlJjy+MALuch+4sirs3IilzzHrs+adelj6IveSWQjBSMsg==
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id bh18-20020a05600c3d1200b003d2392b3165mr46061791wmb.12.1673271266988;
        Mon, 09 Jan 2023 05:34:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm25333512wms.3.2023.01.09.05.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 05:34:26 -0800 (PST)
Message-ID: <b0f1f804-d0fc-8c1e-fc3d-fa9013bdf493@linaro.org>
Date:   Mon, 9 Jan 2023 14:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add
 input-enable and bias-bus-hold
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221222161420.172824-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdbMS7MNPhzi2Ty69TZddEsai-2tASVGJLCiiVktL34V5Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbMS7MNPhzi2Ty69TZddEsai-2tASVGJLCiiVktL34V5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 14:31, Linus Walleij wrote:
> On Thu, Dec 22, 2022 at 5:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Allow bias-bus-hold and input-enable properties (already used in SM8450):
>>
>>   sm8450-qrd.dtb: pinctrl@3440000: dmic02-default-state: 'oneOf' conditional failed, one must be fixed:
>>     'pins' is a required property
>>     'function' is a required property
>>     'clk-pins', 'data-pins' do not match any of the regexes: 'pinctrl-[0-9]+'
>>     'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Compact the properties which are just set to true for readability.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Looks good, is this something I should be applying directly or are
> you collecting some big qualcomm pull requests like last time?

I have just nine patches so far and it looks it is the end of
cleanups/work on Qualcomm pinctrl. Of course maybe something will pop-up
later.

It's up to you how would you prefer to take them. There are few patches
from other people (also adding new devices/bindings), but I did not
notice any conflicts with my sets.

Best regards,
Krzysztof

