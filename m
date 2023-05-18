Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C36F707AB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 09:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjERHTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 03:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjERHTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 03:19:22 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC01C2113
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 00:19:20 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510d8d7f8eeso2395012a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394359; x=1686986359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2R24sEC0W33Mf9qm1SpwZ1d3GiqGsY8ClHuqi0XUiA=;
        b=z2WBa9j0C6X4og/mxGPlheLdRHsKgrt9kHamOwkAaWEJk5+mx+MEKBkTnXnsC+5av0
         21kim62ZD+Ooiotdz7uwZloB7Ct8D2ahAYPFRjjTHxweq606k+5PDOocTYdsNppuIIc3
         DLBqO5/IXWUVZCYydAcwFXBmh7HN7dSbSTfQ6x9mN6YXqGdRUeRVOV5QXDn6rWVKQOLo
         7ie3vt+BNrXx3mbeWFrk5PP7zJOmP5+UU9knvZgDfnROrCUz13UjxmgS1JmxLeuVR8LH
         +xJj53PBs36ZfOhMbfcK1yFqGSI851EASPvSxanzpjwvpazImoXZ0bxn3Lp55pJYdZ/g
         GluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394359; x=1686986359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2R24sEC0W33Mf9qm1SpwZ1d3GiqGsY8ClHuqi0XUiA=;
        b=V86p9QeQFXt2ItbfQ2c/xS+giqdoN2YQ9mnuuQcUcmxI2xdNx+PoXtpfteXhJfggAe
         flRFn6vnCR6k19hRw5NTycsv0koHfqPYc01O/uJErTDkt2dYnG9lh50cXAxchRstKQst
         AmuzqWKDTdnqG6pqti6fT9ERh1PCSJWqmSj3fLE15nuHtHW1SEan7J7t+zwqQ4Y8sy0+
         lEgn72dRMQVumM4cLcxYkItFo7GvLnRvvGynNU0bDnR+X9zqWiU5Jy/phGE7WyvpBhgY
         uCEA1iwOlEUNGnoeibHcjeyKhQiuafJWdZ9uqg7jCNj4/cBiq1nnmlpPwPi0mTwh2PiW
         0qhg==
X-Gm-Message-State: AC+VfDwcx6nB3YEt6Z1F28eN+nt0cxbc2G3tIfDCLrQQ4TxWaemNV0hP
        fGDfmodgOWhkXheiKDp3s92RKw==
X-Google-Smtp-Source: ACHHUZ6/Gyx2keZVGcv8yEreT2Te6mSvWDCDXT1Y80tbsvnTAMhRQ9I/dziOJk7KJt1+GZDpDerY2A==
X-Received: by 2002:a17:907:a408:b0:96a:90bb:a2fa with SMTP id sg8-20020a170907a40800b0096a90bba2famr21528556ejc.51.1684394359300;
        Thu, 18 May 2023 00:19:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id a25-20020a17090680d900b00966265be7adsm589435ejx.22.2023.05.18.00.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:19:18 -0700 (PDT)
Message-ID: <8ba2ea99-01ca-5edb-c9ab-4f10a3983f24@linaro.org>
Date:   Thu, 18 May 2023 09:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: qcom,spmi-flash-led: add
 PMI8998
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com
References: <20230518061328.146847-1-me@dylanvanassche.be>
 <20230518061328.146847-2-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230518061328.146847-2-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 08:13, Dylan Van Assche wrote:
> Document compatible for PMI8998 Torch and Flash LED controller.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

