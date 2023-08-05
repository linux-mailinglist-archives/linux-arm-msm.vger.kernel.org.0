Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE31771203
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 22:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjHEUMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 16:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjHEUL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 16:11:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F0C19B5
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 13:11:57 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b974031aeaso50258521fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691266316; x=1691871116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2ABq7soEfcbzHdPT9arw7cMpjAK4IN+Eyp4A0dUI/U=;
        b=HoR/nLDavuW0gB2idqwPMUgM1t1WzAMxrioNKmwuSyRcrmKwW9PNfnSJwGv3nyJnx7
         eZszcQTK/CRPTEkZr9PmqrZbJYmLsk08GE+1nouEDvOUruwvRAqikZTZswkfiQ0t+DTg
         i0D2VAPVMTw+5v6ZPztCJfyg3BAErRDV530yziAZNgzh4K5kbdjUaofQyRJr6Z3+oExs
         yctGRioQ5pvXfPZrpJtzeR2zxSdmhf6EOVvA3qcFSFsBpqyB5kWAacXpLYaKT+TwUPbv
         il8WIxY8pWIHaBxkQYq9l3XbS9myQd0eqJMUYheP72XHlDLUElHAJLrOhzFBBdZ39Aeg
         fjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691266316; x=1691871116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2ABq7soEfcbzHdPT9arw7cMpjAK4IN+Eyp4A0dUI/U=;
        b=LYiHgWhwyWBRAGI1FPg4JX/DrIRUEB/39QlkRue53bp8BmxeQOUGk/qdIUIWl9ghgW
         ERf6xatng6K5nkrBdg+cfGO9N8Q3tK/rFhiQJtN3IWPcUTxTw9Hr1wtJwlNM9jBJE8TA
         YNUv8eBGrLqdeWS+mb2eV39QT4kxQOUuct1HSW0uSxJOpq/OKw9nSiK9FP+2eKvMaVto
         OlL5dkbpjRegg6TnLoul+aZDXHw6rH5haXpQ21ibo+3fU7tk+ix9QQjfa9WFOOaicDBt
         7tI9kUbYzWtudJ4DHX7B7QniBV4HKVLSh+r14PhHbpHZkNl5qoyb5biqMNozbBpy6FI+
         VKbQ==
X-Gm-Message-State: AOJu0YwY8Yc9dN3U6lCvWxJUTQiACCqANUB6HOu5Smqr79B6mZoHfOsU
        rE8sIaeWoSP2THlV/xqt6Vcynw==
X-Google-Smtp-Source: AGHT+IGZBQamrq2g/vboZDdDwmt/aYwpvvbRQcmvT4wHhuH2EcX3D/i/qjrkbMJp+e/RZiMFgnA+LA==
X-Received: by 2002:a2e:7c15:0:b0:2b9:aa4d:3719 with SMTP id x21-20020a2e7c15000000b002b9aa4d3719mr4280750ljc.12.1691266315928;
        Sat, 05 Aug 2023 13:11:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709061c5a00b0099bc5e5742asm3082024ejg.70.2023.08.05.13.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:11:55 -0700 (PDT)
Message-ID: <3f3f7d1b-d850-7d93-6f92-f16797f5b081@linaro.org>
Date:   Sat, 5 Aug 2023 22:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add Xiaomi Mi 11 Ultra
Content-Language: en-US
To:     wuxilin123@gmail.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230806-xiaomi-star-v1-0-0c384e8b5737@gmail.com>
 <20230806-xiaomi-star-v1-2-0c384e8b5737@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230806-xiaomi-star-v1-2-0c384e8b5737@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2023 19:03, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add a compatible for Xiaomi Mi 11 Ultra (xiaomi,star).
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

