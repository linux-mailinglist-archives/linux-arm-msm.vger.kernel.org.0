Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DBF6F303D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjEAKg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEAKg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:36:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C611A5
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:36:54 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94ef0a8546fso383627066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682937413; x=1685529413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHALUjCtnEMebQxBUmSaAJTr7mEbJkj/kbPGwqk3ZZg=;
        b=BDIICBm7dg5zZ02KeQ09+LejVVhB63VlEz7G2ULLWZB8E7GnkfzWBcubrsOpPPM3HU
         V1Utb+tZ1vKqWzkzqQ3MT53X0/e9v0QK2CXzt1DWGWbbuSyR6FLpOUFtw2+41goOBxqq
         pVb7O/pxNFU2cJco74REnnCLmd9Gd6KE5huuDAb0PVhyU8svjaehSzYo0GhHTjxLNTtB
         AglHc7blgqtrU7lAq4YaDanqZxO9LsofYrh/X+/PutMFLu6kxbvbsfasqaIXbA+SHBdQ
         e9Z6BfdJETcPnYcta2p6O4dNlNqQu1jlzo6qpKHzL9KlcgS7EMnBL/iI6AF3i1d6YJ70
         /tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937413; x=1685529413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHALUjCtnEMebQxBUmSaAJTr7mEbJkj/kbPGwqk3ZZg=;
        b=H3QITSOkdwdVpu29dnJgoHb/nlJq6U76fPKUN/CkTgaCPWBS+s13wihC91yH5zfVAo
         0chbo6Mv9cN2o/07hl+R3ouK4m3FIq9v+k0uEztN/51kOQmW8amyxL76cUVJC5HD7NNC
         mCCJ4rFNXXnRHC0hRUlAGvaeJNIbAMWD0lEdmPfafDfRTa32FG3zJ+2Reazsrl2homzF
         HF8Kem33XJTqNkgIKKYI3tl539iX4t35HlE5LHpo6IHAhpaB5HvMZQf8ecpithSszB1e
         dJWvRMP/jSbt3H45vGLlbK6xdHVp3s3vSvUtRGlivpOgeOgii6UmvooIMjrXysmXYD/U
         lIkg==
X-Gm-Message-State: AC+VfDzlUV89pJ/HjX5aXq5gRfY6f1cAyr1i8ACjmsv01YqPntdIKnuJ
        untJNc0KiXJuuN+SdqWwju7u4A==
X-Google-Smtp-Source: ACHHUZ4Jrryxy5mHDl/bbz2nosaifll7Bop3NvNhlvikcZRsDaHfx4zf7a+SdL5DDJDfqYXWun41sQ==
X-Received: by 2002:a17:907:360b:b0:960:ce5:20c0 with SMTP id bk11-20020a170907360b00b009600ce520c0mr11934677ejc.20.1682937413305;
        Mon, 01 May 2023 03:36:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id o13-20020a1709062e8d00b0094ea3a32694sm14524777eji.190.2023.05.01.03.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 03:36:52 -0700 (PDT)
Message-ID: <6a37f442-3448-93d0-99dd-705f2727f80a@linaro.org>
Date:   Mon, 1 May 2023 12:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
 & fix CD gpio
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20230501102035.1180701-1-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501102035.1180701-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 12:20, Bhupesh Sharma wrote:
> Add the default and sleep pinctrl states for SDHC1 & 2 controllers
> on QRB4210 RB2 board.
> 
> While at it also fix the Card-Detect (CD) gpio for SDHC2 which
> allows the uSD card to be detected on the board.

Separate commit is needed for the fix with Fixes tag.

> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Best regards,
Krzysztof

