Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38DE764742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 08:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjG0Gx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 02:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjG0Gx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 02:53:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EFD2696
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:53:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe1344b707so1072358e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690440800; x=1691045600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBQJ2xH5reo70JQZjg7oy6V7SvIpXnYDMAduFmKIx4Y=;
        b=ORshOA2bsWLfMFmZTiwmr4D2aSp/1vRoDnFM3CqOxQFVKMq84Fnzn7lo35hcaXdlk5
         07uQzY1pJkutZFCNavhNlRLdkDlntZaVmVfLHt6uCWh8QKQJ7K0dMMmZTtMneS3P+M5l
         ivEyByLEBbfTawEy8K0COvsvxgUBY08A+rn9oh1aIapEkBfgqZPLEUy/pBATXyFU0+rI
         qkc6cAOR699d8XjLagF5hMc+kDojIvWFcrrtTIfeEgka66wSUJM+2981VAKe9LGG4ZcH
         fM85pNXxh+yFgNemP7jifaDs1kE9yYNZD2KpqXPCz/KBkZv+FIzI8spDjxW1pozQQoFI
         I3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440800; x=1691045600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBQJ2xH5reo70JQZjg7oy6V7SvIpXnYDMAduFmKIx4Y=;
        b=SeegVk/6TBWAnBMliG8j9W9e58IJVIgaBXSa7uxlIqwLJDbQWZdPZFwiluAygakit1
         9rLtBRGTKEqUJQlZMCTb0H2mHXdTZCPmBeFoRlnMO9LJCWgwmRndzuxbgZE+xK7RSs7w
         uo2qCCHzj9y5OATYgxr8EE5rybxjOceHQ31bjpf62DCOXTEzCWzwWZ1huawJtpjbKYU9
         8n58hXZwU8eY6NnnYTT04XTecMdAOGSrHLcyhlGYXW0lrvy8Pi5EdvyqxxuuIr/Xtiwu
         PS9us8W/4ANUSI/oyNIx5tXdTpKumKK0ycFyFCjXeD4F6wSdfzzpPVCKgXAy6pBENEpq
         vIaw==
X-Gm-Message-State: ABy/qLZY5Wvd1ZG7XqTvcptSAMZCqCVes+xgcVV9J68yFpRRLQdj+sJo
        ZMNrTI2S01SfJ+ma8nUyGxRecg==
X-Google-Smtp-Source: APBJJlGqvgzi/Pkbbsc5iV0FGe5yJLTuXuhxCTw8k+kvFPU6vmJQiJnRFFjK6u7sjigihStfJtm0Rg==
X-Received: by 2002:a05:6512:3145:b0:4fe:ecd:494f with SMTP id s5-20020a056512314500b004fe0ecd494fmr859147lfi.33.1690440799695;
        Wed, 26 Jul 2023 23:53:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c053000000b005222c6fb512sm288002edo.1.2023.07.26.23.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 23:53:19 -0700 (PDT)
Message-ID: <c2221520-26b7-3d39-e157-b464569be502@linaro.org>
Date:   Thu, 27 Jul 2023 08:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: Adds base SM4450 DTSI
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230727023508.18002-1-quic_tengfan@quicinc.com>
 <20230727023508.18002-4-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727023508.18002-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 04:35, Tengfei Fan wrote:
> This add based DTSI for SM4450 SoC and includes base description of

Nit, no need to resend, Please do not use "This commit/patch", but
imperative mood. See longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> CPUs and interrupt-controller which helps to boot to shell with dcc
> console on boards with this SoC.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 431 +++++++++++++++++++++++++++
>  1 file changed, 431 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm4450.dtsi
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

