Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9191C76473D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 08:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbjG0Gwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 02:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjG0GwW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 02:52:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E72271C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:52:19 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99b78fda9a8so77956666b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690440737; x=1691045537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bM7PsNw99tLxMJh2X/l/N/uD5u2zjcrjmRWTgcWEpcg=;
        b=Hs4CUXQpCt/q6xCpoo7LupALtHEVyCLE3p/Z1bxltTre4lKWfrb8WV38L8rohkpysv
         dgmHCSZhKeJS8UMeLJoq29RZzXEh/VV+LskLBEQBHRGvc4Yzi/hBlfsYKGKahCUF/bIj
         gBqLfqpo4TcrYB0ZdLxSEFVfW/D1drTuGi9pI5t1sShzS9fYKGJEXUHu8TJggZ+/Rups
         YCn2XXODPLNBQ0Iv744T5E/wtw+YkD13aTgZJuMKNTB+b5t4VjEhKnMF4M4fogbRApMA
         DOoW9PHJ8AH1Gek1n1vO7mOfajG+GlULugaQIZ4sLc1vcCaWXnQIY4O4GaqhUPfOrKLF
         5HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440737; x=1691045537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bM7PsNw99tLxMJh2X/l/N/uD5u2zjcrjmRWTgcWEpcg=;
        b=OYMNjNjNyIrQIzRGygwWQ7BIrJLjhedt942YqPWmkBSDjTAHvc4K86XS6OkK0YPkLN
         ayXwM+vWukVU7hhg7YzWKc80ztVuUp09/p7i9ZDW2WwtfvFv3pyw67WX631IqBTrU0Xs
         TxCAuZ0UNKVHAhY9/9ELvOVB100vE7c+puhxiNnlPlH7rQgCy+qeQr2C74Q8SwTZGhAt
         DuH1nq72w3gMDKQUytUN3HIP90pZQPlUn9lQLe8GO0UZPxIOgevTEMlEaV4UasVnXU3N
         Q080fBh73uj0SHaXP/D+lQpWof4dUnJ+ZNgUsfrXMrKJAAGpMrmQYcDyF4jiopIqfIsU
         w6Zg==
X-Gm-Message-State: ABy/qLbXNGHUW4xqAXftcOTjtKqMjdCoXLCgp+EekG6XdntyDCIoo3a3
        pa68CXkEktHwIKh+btMJSMG31Q==
X-Google-Smtp-Source: APBJJlEi2B8nIclmstFXrZJ8NmRwPhTz9I4FbBz9QSmijqGRzJZ3pqlCPjSmnEoUwexNFYcn6KWhnA==
X-Received: by 2002:a17:907:2c6a:b0:99b:d549:834f with SMTP id ib10-20020a1709072c6a00b0099bd549834fmr1147608ejc.68.1690440737688;
        Wed, 26 Jul 2023 23:52:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm388964ejb.122.2023.07.26.23.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 23:52:17 -0700 (PDT)
Message-ID: <f8ddc4b6-32b4-81ec-09e5-468980c4944e@linaro.org>
Date:   Thu, 27 Jul 2023 08:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: qcom: Document SM4450 SoC and
 boards
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
 <20230727023508.18002-3-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727023508.18002-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 04:35, Tengfei Fan wrote:
> Document the SM4450 SoC binding and also the boards using it.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

