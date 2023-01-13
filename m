Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4395669037
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjAMINt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240221AbjAMINH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:13:07 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA8D6B1AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:11:28 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m6so32001456lfj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEJhgr96OjUhNUOMZ8epomwf58coghZC2G6Ls6wpmxw=;
        b=oXqsThDc2ggzQ08OZiDaCOE/ulACWi9Vm7rZIKlHA2bgRmJ+Qf3J7vRzEOU4jIphc1
         Th2trV1Stt7Mjgrmbcq4DxmwCcFIRSv9gnt3ypmHBjG9Evg+BLufOhKVAZ7N+XVREvbc
         BMGxl6pTXc2HktJrQsxvkxB39md9k22A5IALJ8hPybGa8M/ZRVUgMrSus+FR1hDnw9ql
         4GKT8P6V2pwiCK9yMdPxM31PP+AA0wZcI0wdPi2zLq15YQS+/zI5fyyookWwRHKRysQh
         Uc5HmTk9325F8wr/W+2/q24oLM34M1z2jTjrvZ0N9rUJAktYIUMphxF5PFV1W9FCtNPQ
         AUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEJhgr96OjUhNUOMZ8epomwf58coghZC2G6Ls6wpmxw=;
        b=mlOyU3FXJmM6MqSlxlowdz4Ghn7axO/RamIGi/YdcPqmEWf2egSSpAIrIuiJb2hyz1
         P72njCjb8/tOIdLi+uoPGVJFmZXPMdih9y22zjwfghvMipYcNxIiYmHw6RuOjmsRnZpa
         zvxhwNiSRg2VlV3rlN6X73nhpYLL6sn97NvCvZufleVhel7AgoCiGKH1Y+AvUPhXe6RT
         wHQUACWpFGn49wJe2CkyI/AV5/hWdzhBJgl7n2L9cl2GnRH9Anng0qRAgAa9YVgjE3sH
         LmjjpWUDdkNbdbUfpf3xoaQOALsTvuZoh8Yn0OjKneBqFi+UR1nf5Tvzo+9mX6fZil3J
         SsEA==
X-Gm-Message-State: AFqh2kpxXMx9fom5W/8pQ9XqnPPMEVKnteJp/7HrUvYrJ3hfklMelufS
        Dn+GqBsBcqGwkSRz71xdC+KIUQ==
X-Google-Smtp-Source: AMrXdXtb0Gb+cB6bSgqO0q/wA6znyb539VOV6vT2ir08hkLscrRVMISFcShEGBk3avDMfxQghrdpJw==
X-Received: by 2002:a05:6512:39cd:b0:4cc:53e3:771d with SMTP id k13-20020a05651239cd00b004cc53e3771dmr10486219lfu.64.1673597486819;
        Fri, 13 Jan 2023 00:11:26 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id u6-20020a05651220c600b004cc865fdfdfsm2334386lfr.89.2023.01.13.00.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:11:26 -0800 (PST)
Message-ID: <742800ee-34d9-3455-06d9-d2e15c44e176@linaro.org>
Date:   Fri, 13 Jan 2023 10:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: add display port audio
Content-Language: en-GB
To:     Judy Hsiao <judyhsiao@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221221071734.2887901-1-judyhsiao@chromium.org>
 <afd7851b-0846-c21f-a769-10fb920c7c80@linaro.org>
 <CAJXt+b8eez8KTocoAi0WP8qC3YdA9bfOTPbY8ZGfXNb-MNaT-Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAJXt+b8eez8KTocoAi0WP8qC3YdA9bfOTPbY8ZGfXNb-MNaT-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 03:24, Judy Hsiao wrote:
>> Why do you change link@1 from DP to ALC?
> Because I want make the order to be consistent with the 3 mic version. Thanks!
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi

This should be explained in the commit message. And as Krzysztof wrote, 
it should be explained, rather than mentioning some other platform.

>>
>> Best regards,
>> Krzysztof
>>

-- 
With best wishes
Dmitry

