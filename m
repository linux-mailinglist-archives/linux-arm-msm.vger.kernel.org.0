Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF055EF3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbiF1UWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbiF1UVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:37 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AFCDE6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:31 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id u9so18688267oiv.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6FamQGB9CD5dY+rNMN2KXZg8bPEzG8hfZukPK5OM8oE=;
        b=jGGCbx4lcSAgARVpp97pLkHzge2D+PqjTUCrv31cNsYclz07jjVtXiEpCXntnip7uC
         40ezDMWAYGtDGEkojRB+byXWtSJ0ufgvimKETa3abEWsePV7dt9NT5EI5xpjPqZdO/eM
         7cQ/y/c+l8RowWG2CnNNm+pprEJHFp4TFd+ECrCih9VPi5Gt/l1AJBiJ/fIvN081E++W
         vFK/WqrU3KcKx1KGxBdjOLI1Jeb8lkxoGG5v9EXm0L5HhOgcf4iU2ayuGQitecssndv0
         sTR/YeRhSfOGsVt/7+UpNZq2VEPOgBddbFwCS+SCROiuhDLllYBzbzYjVH2HLZPd7aIF
         MbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6FamQGB9CD5dY+rNMN2KXZg8bPEzG8hfZukPK5OM8oE=;
        b=FplbvBuUv2+d0nZKQOBB941SF1u8CrDaJJB/7/cDoFnt5wyInMxg7UO+nEK7mzBgQq
         GUo1/Ie/WQfsF3edUQKADCP7rXkj+KIYypGZNk4ZAlmjyC5XvOIGy2xrwapvO+xFTWFj
         dLimXkKBxRdccEadlFaqBgzPDeHP9/Okh5FCsGJMj0dqPwTsOjvCMsk+2tLewzigYth5
         sjz7/+H0uSeHDThac4V9zTuGcYIvmVREeYaFSy0LMA0smv9svI3tp/ZjfAUkppfdyx5h
         YfPvMCc+UTxcY9HE+dfknTj5Ozxbpo+VhXvNDI1Rr1+IWW6cf9ieSVkubru+m9js86WJ
         N8uw==
X-Gm-Message-State: AJIora9nH4mg1MIeQERsXN9M1S2FRS78amWOLdQZ77OXcAKN3IO4beIg
        DVF5Xytct3qOmoTqtIWdlOYRjA==
X-Google-Smtp-Source: AGRyM1t5AcsdLJuztGShNHBpJ7nQWZZlZTULXOarrtiGgxRCSZpFhRuiDuQgfbGayPzjOwyPku+9TA==
X-Received: by 2002:a05:6808:1385:b0:32f:729e:4869 with SMTP id c5-20020a056808138500b0032f729e4869mr942978oiw.5.1656447571474;
        Tue, 28 Jun 2022 13:19:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH 4/4] ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs
Date:   Tue, 28 Jun 2022 15:19:02 -0500
Message-Id: <165644753308.10525.5331559742461486598.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508135932.132378-5-krzysztof.kozlowski@linaro.org>
References: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org> <20220508135932.132378-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 8 May 2022 15:59:32 +0200, Krzysztof Kozlowski wrote:
> The new Qualcomm PMIC GPIO bindings require gpio-ranges property:
> 
>   qcom-sdx55-telit-fn980-tlb.dtb: gpio@c000: 'gpio-ranges' is a required property
> 
> 

Applied, thanks!

[4/4] ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      commit: eea939a0da869e00f40e41182edbcd911ee11fd4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
