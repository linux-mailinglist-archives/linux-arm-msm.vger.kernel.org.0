Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84C3762DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 09:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbjGZHgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 03:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjGZHfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 03:35:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4DD30ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:34:19 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52227142a27so4625907a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690356857; x=1690961657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+2Iliu7olik+NE8AfcvBGi3cE5KanWV2uC3MeiDPS0=;
        b=KlbDSOyYOBAThy3vB3vgl/3WnwAqdpLGHR77DAe4G0S14mkuzuFvWUPp9oZx7cx/OT
         P0lMKSm380e+eVPZjLbuFlR+a9eyRKKPUwtPMw9MsKE8ljq4ElNQhrSbLEGO0jTNxKrw
         ZnRGBCi6omqYmQyhFU0VuJ7VwgrlCaYvSWi9gKwAgVmKvFDNMtEtnGeVvN04827uwu4q
         Ho1fQQJv4ucUZoc6ZUXFLXHyBBGw5zIAj6PmafAN/HMBtTVrRysoS9JSYaYCU1vAmHNc
         x7bj43PSH4rTLxRfkyxaLSvxHVwthO6XswOuLLxw1eZTk3HhexY+Si+DRP7d4XZJnXOd
         lpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690356857; x=1690961657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+2Iliu7olik+NE8AfcvBGi3cE5KanWV2uC3MeiDPS0=;
        b=H/76l/TbHpv4GU1PjRYIWVVlmNEQkXp9jaHBKZqcIcE/OP8q850otdlQJG+5xPylVV
         NdT7icnbFJXdojbD1yfmXXZEzw9+wvQAxZ+PsLGrTQNxWvI0BK3P7CR6sSO40Z2w29+F
         j8mccJV5Am28/1VFDm6xdMO0cIM8Bj/4Thgx0tVmXqXNTMy6fwYkWL0chhN+VNpKTy0t
         T40zo5uyoA8ylhzahS/67BZFAAmt/JGg45px+f25gsc4cYo2fugc/pS4NjAknczfUwuK
         GeVl47EahH3SLV4uzcoc5/h98H2I/9LfR0OoX9zghxlaUM1SIYQ7Ags6ASp6pqoKDf8z
         29dg==
X-Gm-Message-State: ABy/qLYuxTt+9fDwZEGTeZsi+uBF5A+tBCPDguD750uxhlwQ6l1ky9Oa
        hhHrG6AEa1XUXnwh9Q90hMaIS9Ep+BdJO1GagFs=
X-Google-Smtp-Source: APBJJlGR74zoKSYMwGskCgm5We2h4GhUdIEQdlH5TbM9FGnhgnA8mXhCNaiYrij4RkXzRuiIheq8iQ==
X-Received: by 2002:aa7:da0b:0:b0:522:2111:1063 with SMTP id r11-20020aa7da0b000000b0052221111063mr815433eds.18.1690356857657;
        Wed, 26 Jul 2023 00:34:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d14-20020aa7d5ce000000b00521cb435d54sm8575934eds.37.2023.07.26.00.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 00:34:17 -0700 (PDT)
Message-ID: <d9cb0908-4074-2f01-efaf-cdd863a039f2@linaro.org>
Date:   Wed, 26 Jul 2023 09:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add BQ Aquaris M5
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724-bq_m5-v1-0-17a0870a73be@apitzsch.eu>
 <20230724-bq_m5-v1-1-17a0870a73be@apitzsch.eu>
 <877c6d2c-430f-b1fb-4267-18be5d7256dc@linaro.org>
 <d51dee67-02f4-1256-877f-61629c04b08f@linaro.org>
 <a90461fa-8319-5b87-397f-53ba169a3d31@linaro.org>
 <1717ccb1-46b3-8ac3-2c09-9558bd12cc40@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1717ccb1-46b3-8ac3-2c09-9558bd12cc40@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 12:03, Konrad Dybcio wrote:
> On 25.07.2023 11:43, Krzysztof Kozlowski wrote:
>> On 25/07/2023 10:13, Konrad Dybcio wrote:
>>> On 25.07.2023 07:46, Krzysztof Kozlowski wrote:
>>>> On 24/07/2023 22:52, André Apitzsch wrote:
>>>>> Add a compatible for BQ Aquaris M5 (Longcheer L9100).
>>>>>
>>>>> Signed-off-by: André Apitzsch <git@apitzsch.eu>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>>
>>>> ---
>>>>
>>>> This is an automated instruction, just in case, because many review tags
>>>> are being ignored. If you do not know the process, here is a short
>>>> explanation:
>>>>
>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>>>> versions, under or above your Signed-off-by tag. Tag is "received", when
>>>> provided in a message replied to you on the mailing list. Tools like b4
>>>> can help here. However, there's no need to repost patches *only* to add
>>>> the tags. The upstream maintainer will do that for acks received on the
>>>> version they apply.
>>>>
>>>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
>>> Krzysztof, update your bot to paste this link with s/v5.17/latest/g
>>
>> Is there any difference? :) I would need to update links in all my
>> templates and re-check the links...
> Don't know, but the keyword "latest" in the link always points to the..
> latest available release

And how do you update the line marker in "latest" version, so it points
to exact line I want? I could switch to latest kernel doc and point to
chapters, but then not to specific lines.

Best regards,
Krzysztof

