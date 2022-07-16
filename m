Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0414B576FD0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbiGPPTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbiGPPTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:37 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6940E1F2E1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:24 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-f2a4c51c45so12811402fac.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UQMyqlnOl2ShQfxqO/F3cpteR/9EvTP4YzP6gZhE16Y=;
        b=UpGj6MMOpOqt27f839h3qVkzEniiwd1if/gzWBauVzKGY/e+vLRBDeEgp7daw7DTU+
         gT9TEAefkth7hBHefuQFpEG45OF7Studd6+ehMIDwEOQ1eoziEuWd9aB4bbfXIIxCpnr
         2jJ0jxnZwBF5uKS/Mq2efpLppEfiuHQ1ynlbIj0qLoCF3KNKQVX974vI6YLbKHRnswmC
         Bi23FIxMIO1Odcp3BJNsGgWgxG1DBRd0aaI/vEJ8YuWejmCjyFxKmZojVkKthQp+RuLB
         FQVWQPz7LJKNcs2dtc8ct4H08tn68k4v3FPqN4Mi34Ujz3CF66zhh8iYAgewrsWrSLyn
         5ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQMyqlnOl2ShQfxqO/F3cpteR/9EvTP4YzP6gZhE16Y=;
        b=XccGK0uvlcExhO5vZkVfc5PW0XyvdcN2KUTwIa5qMv4wPRGMkW4qMuORNm0bUoO/e6
         hvLjd3hjy/kJV/haxWVCwlIOuqWWWSsSXNXdC0wGlbrCTqeelSgf9TvSX4PCu3rpfb1m
         q7vA+zkFnCLJWSspZFTlIVle37iYDRIUu3mRUp5JpHU4jv3vaH6k5xAXw9Pv8a/YXciG
         /5CcFhtwZj5BBqOYFeJaZxX7KsXK83FAj1gO9j6tqK5ZmSQ4uQ0XYdGFsxRJaqOe70R9
         H08j1n8gjkxazgbM6GASCHfW5aJhxnjdI3jKBVV86M2Py9/g8TqEkSL/5UV2YrhoRZAF
         gZqw==
X-Gm-Message-State: AJIora8VZgjGAdldf/ESFo1fdm13vUYA3Aclfk8HrqkERAfeYlskwOxR
        G/CupN4uQw6SlZEf2p5C4us7Uw==
X-Google-Smtp-Source: AGRyM1uwLUc3Mp5ZYc1Fm9wocfJF1ddieqythIKz57AodEVi2SSycAN/W31rBeV0rkAisuHJTtv96Q==
X-Received: by 2002:a05:6870:b3a0:b0:10b:760b:c4c9 with SMTP id w32-20020a056870b3a000b0010b760bc4c9mr13729166oap.84.1657984763899;
        Sat, 16 Jul 2022 08:19:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org, agross@kernel.org
Subject: Re: (subset) [PATCH v6 4/4] arm64: dts: ipq8074: add APCS node
Date:   Sat, 16 Jul 2022 10:19:06 -0500
Message-Id: <165798474063.1679948.3824406237045424067.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707173733.404947-4-robimarko@gmail.com>
References: <20220707173733.404947-1-robimarko@gmail.com> <20220707173733.404947-4-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jul 2022 19:37:33 +0200, Robert Marko wrote:
> APCS now has support for providing the APSS clocks as the child device
> for IPQ8074.
> 
> So, add the required DT node for it as it will later be used as the CPU
> clocksource.
> 
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: ipq8074: add APCS node
      commit: 50ed9fffec3aed88bc1ffed277d291f81153bd5d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
