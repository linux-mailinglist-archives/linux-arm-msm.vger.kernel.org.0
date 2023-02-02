Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C3968790E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 10:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjBBJio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 04:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjBBJim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 04:38:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEEC8304E
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 01:38:38 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o18so1120983wrj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 01:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SVU6QigYfI43kWNTeLwwoyCrnQDbgOxVnxRJ80sFMw=;
        b=DGkg38jlZDUTz15Z4tOwAS3Anphznwxrli3xvDOZRnNl6r8/CayV5FrtmrR4Vsxpa0
         gyFTfObawwlIt4jLoiZ6LsIvFzwWiOfRcKyIEv3Xy3382u8K23U2B0SmXVJUgNogx3xX
         HdKFBy1X57O5dDcYNnIgd8qxJndlpOq7wNV15Uq2pDwKOrDZD/VawfOzCQQYr4rtq+bz
         xxczjZGFR3JwzXOxGDY7g/TiwZk5m8ZSWIbd2bCE9i6GXtDZNZfkys7nxW9lcCka+8hP
         cSsG78iW1elHk6WSThjlAbw3CG4HwHfOf/IShBlWETBYNkFXP+3c/oXVC7yI+Xzz450g
         4JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SVU6QigYfI43kWNTeLwwoyCrnQDbgOxVnxRJ80sFMw=;
        b=w4AzME2aGSeHnaK0iY6kapdQE+z0cGms5ZcC+rLxkwvmt3ct8tH3OGmO5zreSKVSke
         k3vVbYsz64/mvMJxe6DDAnUOiPCRsi832P/2oL0eBzBg3uUlaERHlZ3Y1a9AfENpvjfn
         XhmA10VrsYgWY9NHk+ue4vBkvCoBcAxNljI7Kz2lUzpM3XPJSxWDN7iIR7M1BQzYFt3W
         qAvuSFU+OD9jxYFjO8rz/EI6BzxDJ9I7DW5bXWiWrqP3JeasFPHPsF+Qqmex/3XculrJ
         C1SSzxcsd7uP4n7CRwdcQxjtnbJyUiib+lehBuEIFzKS5E4RibtS6ZHXoadKWyl4rxUH
         SALQ==
X-Gm-Message-State: AO0yUKUkQ40Nz5eE41qblzBrk/Em0tHu0CnfO+MJCzQtuj8EuivLOB+4
        GvOLAbAPJHdwF1u29tZQK4nD8w==
X-Google-Smtp-Source: AK7set/YtuHJ/gLfQ7R747dzj3cK1k46TG7Tyv3bSIJY4mF9pBcvOhfX3zWGEcm+q27k7hoJOBQ0uA==
X-Received: by 2002:a05:6000:184a:b0:2bf:bc75:1730 with SMTP id c10-20020a056000184a00b002bfbc751730mr5852303wri.70.1675330716631;
        Thu, 02 Feb 2023 01:38:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d6189000000b002c285b4d2b5sm6437113wru.101.2023.02.02.01.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:38:36 -0800 (PST)
Message-ID: <176bf263-a12d-2cb3-d67c-3d7c3a0c7c31@linaro.org>
Date:   Thu, 2 Feb 2023 10:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
 <20230201153019.269718-7-krzysztof.kozlowski@linaro.org>
 <Y9qORcPIuq4IZcL1@gerhold.net> <Y9qT3vNTcuT+njIR@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9qT3vNTcuT+njIR@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 17:31, Stephan Gerhold wrote:
> On Wed, Feb 01, 2023 at 05:07:40PM +0100, Stephan Gerhold wrote:
>> On Wed, Feb 01, 2023 at 04:30:19PM +0100, Krzysztof Kozlowski wrote:
>>> Correct the number of GPIOs in gpio-ranges to match reality.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> AFAICT the current gpio-ranges do match the number of GPIOs (ngpios) in
>> the pinctrl drivers for all/most of the platforms you update below. It
>> looks like the special UFS_RESET pins are also exported as GPIOs in
>> addition to the real GPIOs. I'm not sure if this is intended or a
>> mistake.
>>
> 
> It looks like this is on purpose:
> 
> ---
> From 53a5372ce326116f3e3d3f1d701113b2542509f4 Mon Sep 17 00:00:00 2001
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Date: Tue, 4 Jun 2019 00:19:59 -0700
> Subject: [PATCH] pinctrl: qcom: sdm845: Expose ufs_reset as gpio
> 
> The ufs_reset pin is expected to be wired to the reset pin of the
> primary UFS memory but is pretty much just a general purpose output pinr
> 
> Reorder the pins and expose it as gpio 150, so that the UFS driver can
> toggle it.
> ---
> 
> And it's used in sdm845-mtp.dts:
> 
> &ufs_mem_hc {
> 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> };
> 
> So I think this patch (together with the DT ones you sent) should be
> dropped because it would prevent using the UFS_RESET as GPIO since it's
> no longer included in gpio-ranges.

Thanks, but then we need to fix few others which miss the UFS reset pin.

Best regards,
Krzysztof

