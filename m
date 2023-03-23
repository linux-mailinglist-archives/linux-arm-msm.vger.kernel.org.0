Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D55E6C5FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 07:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCWGwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 02:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjCWGwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 02:52:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C69D2D162
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:52:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id i5so35412293eda.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 23:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679554328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnm4wZIIGBJUM5ou0VD6Sn8yNcOFEKHAZVQNv/SjS+k=;
        b=RmK1frKIkjVvuWGPZ1rgnEINhuP7jWE/E2Yo1zdF4Ki4xOVdBuPwNUbcABVkpRbBxD
         A947o0KEbWyUFEvJBG+sJ5zp2+fsx0rC4UrkiWBE136HG5JeLXxw8NAVUuG02E0iPEy/
         UhpyK4hsLgEgwm3K5iXWX3N0+zDjNYOQZNEg0lMvuy8OEcfBHnmHODG1kZyulo/tdOqx
         KirG3fRovG0O7iKdhDOM53lNWywb+Hay+D6MZxzwE1oeh7hpHUdH3fp7XhgIzQiETCTv
         go6i9dSMoaod35QVTzkQtMDvZadek/RhV9RTcRayxWoaZNI1LS7c/KIOHBwWmnUHV5Ko
         w9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554328;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnm4wZIIGBJUM5ou0VD6Sn8yNcOFEKHAZVQNv/SjS+k=;
        b=VJUfAqo5OosHsV7a+nZC7+Eg7O2L9pnekbfTUfcsQUu/TofRECDh8dG4bX6ukhy7d1
         C5KIvzaOVTXvGhFSj7TUGKQ6mkF7WAxc9EmsPtqr981eaQumwn5WqCCnwDkU2L8snjEu
         2qfLf5RLMm4Nph6JrE6XldF2fK2bPiDUAemmuLcITY5ztsKmqUmsuWyYADlVk3qZlBQw
         pwGxZttfVmsUcD3k50hz2u/hFXaSdF2Y2uYcujEuoCUM0vxffc3XAaih9Ur6yiEdT2J2
         wEqZB9eAXBCt0T0JUSyl9l7GXEjncDdX/262K73X5Yw7rB0f1S8Cb1LLY7bV2W+/UIiD
         O7LQ==
X-Gm-Message-State: AO0yUKWpD58fKi36v5R2knnEsUy5fogz8Dqfzr4JRXypP8LDij2NV66h
        //HWvHXNvrtfNO6bfe8c7hRoFg==
X-Google-Smtp-Source: AK7set8XhOPtFHczouViFH9gLeW8HlnzbmHouwapcy11GQ87D7fFlWevDg3qhu5r61dqh6Eu4ojnpw==
X-Received: by 2002:aa7:d486:0:b0:500:40f4:f8 with SMTP id b6-20020aa7d486000000b0050040f400f8mr8933178edr.0.1679554327799;
        Wed, 22 Mar 2023 23:52:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id u3-20020a50d503000000b004fcd78d1215sm8808439edi.36.2023.03.22.23.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:52:07 -0700 (PDT)
Message-ID: <ea980e5c-3dc8-0fd6-8635-8f58a0745ac5@linaro.org>
Date:   Thu, 23 Mar 2023 07:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: Split elish dts into common dtsi
 and elish-boe dts
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230323005925.23179-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323005925.23179-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 01:59, Jianhua Lu wrote:
> There are two panel variants of xiaomi-elish, BOE and CSOT panels.
> In order to support both panels, so split elish dts into common dtsi
> and elish-boe dts.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Remove sm8250-xiaomi-elish.dtb to avoid build failure.
> 
> Changes in v3:
>   - squash patch[3/4]

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

