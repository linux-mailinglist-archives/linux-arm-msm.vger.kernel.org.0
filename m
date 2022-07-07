Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DBB569853
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbiGGCqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234655AbiGGCqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:46:08 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DBD2E9C2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:46:07 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10be0d7476aso16817497fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSHQWkovr83QuNDZMnV0Uka1kuFVRZuDsMTfWh9lJ2Y=;
        b=tuQoN6u9YrZctKw257A+8+huZEKUkRHbB/ZNuWPgKot44jR1nkVLR7jLgZs+7CUeU1
         90R8Tmk+I3T3d9wMEY97BgwFXWSBnnzo4OzAuMXNuPxY2We3P8APGT5GzFVhEcV+4Zo0
         shdWX2KUTUk8WS5sW8F9SzWlxjvKviZx+Uh11WqfJPkLB1mFt29a66XUC1pblwp9psGN
         xoyHukYAD+JwgB7WvtKvaTh94kbYNEbcJCZQwDE8u6nIE7t/vD4MUn2SNq0Eo465iaMg
         chnrXpqHz65N1nxdBFcZ+o/ge5cO/dJfIyauHYUQl/UGHPQbPGo+A/77VU6t2ORZNiRp
         n+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSHQWkovr83QuNDZMnV0Uka1kuFVRZuDsMTfWh9lJ2Y=;
        b=08jOwVvDy3OWVueeKaqq9V6FiH8UR/gAzXH0vahd/6TCxoceaDupKRx8vIpF8yYQ+Q
         V8I0uQp+PlQGlnPprKF3DDp+eQ3aqaAd3ga1DZimiM4gKfOgMwwiYO83luabcW5GoilW
         cFX572FBboXMtnXJuPB4WQuTqOGU+qr7ExOuoelmV+uRzlTZkjLYNMi1PmZxMkWly3vH
         IKzPEfSNh0cn01ZQhjM4FgyxFwtD542bnMtT4I+/QDWq5Plx1adMnW3bj/BgVObgZFkx
         xH8Kno/NDFXvj+H6kplBvnXFe7YzV+FRCMEwOYfDSe1dz3MlUq0jBmEFN+ZHTIR/gzZp
         a+CA==
X-Gm-Message-State: AJIora9LDkBY7hjIJa9x9MHidZDrjvfP3EZmwJ8NEEU2Ivx9yyogsNhg
        MI0qujXjsNZ2LeHLGlO7NEYf7g==
X-Google-Smtp-Source: AGRyM1uOHdRlfRwW7UE6JgQ2/iUk746TxWu0nBI+IMaIMBvcmiy6MQqTjTlpq1uIIXwhippN7/qWTw==
X-Received: by 2002:a05:6870:ac14:b0:10c:1d60:d4d2 with SMTP id kw20-20020a056870ac1400b0010c1d60d4d2mr1257153oab.58.1657161966982;
        Wed, 06 Jul 2022 19:46:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r6-20020a056870580600b001089aef1815sm16450814oap.20.2022.07.06.19.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:46:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/14] arm64: dts: qcom: QMP PHY fixes
Date:   Wed,  6 Jul 2022 21:46:04 -0500
Message-Id: <165716195971.869883.8845615807571040314.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220705114032.22787-1-johan+linaro@kernel.org>
References: <20220705114032.22787-1-johan+linaro@kernel.org>
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

On Tue, 5 Jul 2022 13:40:18 +0200, Johan Hovold wrote:
> Here's a bunch of fixes for PHY related DT issues found while amending
> the current QMP PHY schema:
> 
> 	https://lore.kernel.org/r/20220705094239.17174-1-johan+linaro@kernel.org
> 
> Included are also some cleanups of the MS8996 PCIe PHY node which make
> the node match the new binding example.
> 
> [...]

Applied, thanks!

[01/14] arm64: dts: qcom: sc7280: drop PCIe PHY clock index
        commit: 531c738fb36069d60aff267a0b25533a35d59fd0
[02/14] arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
        commit: d9fd162ce764c227fcfd4242f6c1639895a9481f
[03/14] arm64: dts: qcom: ipq6018: drop USB PHY clock index
        commit: 9215a64a0776c4797ed08520655fba7e85530156
[04/14] arm64: dts: qcom: ipq8074: drop USB PHY clock index
        commit: de9e7f77d8694ed6f5064fe865711b5f8321c09d
[05/14] arm64: dts: qcom: msm8996: drop USB PHY clock index
        (no commit info)
[06/14] arm64: dts: qcom: msm8998: drop USB PHY clock index
        commit: ed9cbbcb8c6a1925db7995214602c6a8983ff870
[07/14] arm64: dts: qcom: sm8350: drop USB PHY clock index
        commit: af5515543b9b5999d547f4f2afcad95f0aff5b1d
[08/14] arm64: dts: qcom: sm8450: drop USB PHY clock index
        commit: 0aaa0a9a4745ff4b4ffeed80ce3463c9c8c0f693
[09/14] arm64: dts: qcom: sc8280xp: drop UFS PHY clock-cells
        commit: 119feff14672af57cc62d2e1350a34e4aa3c5f10
[10/14] arm64: dts: qcom: sm8250: drop UFS PHY clock-cells
        commit: be18bc7bd9e82e2d08095d9ed0d9978dcb707e7c
[11/14] arm64: dts: qcom: sm8450: drop UFS PHY clock-cells
        commit: e30d9f1e58c0f860b8a740c63527106146f0f3fd
[12/14] arm64: dts: qcom: msm8996: add missing PCIe PHY clock-cells
        (no commit info)
[13/14] arm64: dts: qcom: msm8996: use non-empty ranges for PCIe PHYs
        commit: 3a5da59af38d77088aa5226208cca0beb9125485
[14/14] arm64: dts: qcom: msm8996: clean up PCIe PHY node
        commit: 02d99d4cfe0984ea05edfbcbae2c9660a05f7b11

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
