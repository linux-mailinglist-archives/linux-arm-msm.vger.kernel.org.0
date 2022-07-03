Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F4F564469
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbiGCD5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiGCD5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:22 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBEDB7C9
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:19 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w83so8972947oiw.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qvtc3evjdXywd1+bYwsEUuvbPFmlQTeJCwb0c6S6pbg=;
        b=lCOB1Gx5aM4wOnGdEfoQn0on801xMW49zy6rbrQFivmrrRZl+xIkBInut0NKCjtYgw
         fXtC/QZPUUZ0PEsLGr5+1E8b8+ZREeHzGmO3dWXuz8/f+E5qSz/JlblLtHic8x01Q9Wc
         SzrmW+sCs8tfc+AKJHn67cNLgi/Vuq60jNCfYv2I/YL73iX4EBxhAnaYUgETxOStvs+O
         3ZEupVJ7FOkcuowoVeMMnKvQr9taqGSr56zukYxE+C2hmS6rT1k0+Q/QiwEFB9A9WNPI
         HW9d4ag0FXVk5GvyGF9lfu2L9G+WW9ZJ5o7nPn6UNXdsV/9ysLdh0EtsedLGDiMDPAhB
         ed2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qvtc3evjdXywd1+bYwsEUuvbPFmlQTeJCwb0c6S6pbg=;
        b=QJQMLmHBHGdoZbI2wVD1dVsN3qxbAmk8qCfn+7Gt6FFbnsIddfFOzAqGgB5dRcV5N1
         RZ6exmb0zekMKe3XrzVLDwYD5Dm6b0rZ/dBHp+DRxtwKsOx2yyLiAtpQxRXustLUaUre
         IrC9emnIWU4sIcFqPxrFh5f7l6EpQvDh+OZ7uG7AQAIKJwQUC8/JJ/47C8njil0ZWyPn
         j0K0rrN0rOXqSnBv52OYO/Acw9CPwEYQ/UCrVPdaykxN0s3tQ24en9cnGi2jjgYGyEj2
         1Q/ADcyGKQmUxw4JjUdRov7mL9yT1png71hidveUHeHftybb33dBlMoAyX+iH11XfRzA
         pCAg==
X-Gm-Message-State: AJIora9N118XLP6m6OZbq7PZeZH3p1wOFCiPP7ym0VdGtSuu2N+WqmYB
        fnG8srTXT1NJ9S6jiYEqIFsfDw==
X-Google-Smtp-Source: AGRyM1udXVgVYLWcop6yqx8/H6brhdBCTYaf7trFDpF7O5fruOsvT2mHxTInE+Buys7VtsRhhcqSqQ==
X-Received: by 2002:a05:6808:300f:b0:325:a942:fd64 with SMTP id ay15-20020a056808300f00b00325a942fd64mr12775631oib.41.1656820639060;
        Sat, 02 Jul 2022 20:57:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 01/10] ARM: dts: qcom: apq8060-dragonboard: add function and color to LED nodes
Date:   Sat,  2 Jul 2022 22:56:15 -0500
Message-Id: <165682055971.445910.6565319583738708962.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
References: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Jun 2022 12:29:22 +0200, Krzysztof Kozlowski wrote:
> Add common LED properties - the function and color - to LED nodes.
> 
> 

Applied, thanks!

[06/10] arm64: dts: qcom: apq8016-sbc: add function and color to LED nodes
        commit: a072128b881e24c3711a41143ef9866208da0fe1
[07/10] arm64: dts: qcom: qrb5165-rb5: add function and color to LED nodes
        commit: 984a8c90c158affd8cf3bb3b5666cad436e3ca7b
[08/10] arm64: dts: qcom: sc7180-trogdor: add function to LED node
        commit: 09143dd2cbd6d0b14fa18fcbabb12b8f78e88a1a
[09/10] arm64: dts: qcom: sc7280-herobrine: add function to LED node
        commit: b7428806b4345c5cce056756570ce68b4fdbcc57
[10/10] arm64: dts: qcom: sdm845-db845c: add function and color to LED nodes
        commit: 0cdfa122a5ee39dc7b979f3e224f9f2b71c94660

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
