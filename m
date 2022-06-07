Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E800B5404D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 19:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345779AbiFGRTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 13:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345714AbiFGRTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 13:19:10 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDB0104CBD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 10:19:03 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id me5so36027631ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKwByyPfxfr/n1cC+oLGoBG4NlLo51IgX3L05P+HJI8=;
        b=Dy8vTNOUCL6SeBYk2LMOat+XlBHFSivtmw8Z3inXucd2HorZz4R7Vb+zYOT5076sDQ
         eUmMt+Z96T//xNLlmqwLvPIz0d/ISgC1WQcJs1P1g3eS6Io+SdcH3AnFmuIyv45TxwkU
         a8TC5HBI9aG3CaPUv+zlkd/TKcL8wD1Fwtxw6BUDXawuhDWzE/qR0H+QIcUwajleND+X
         mZECitUnjhpVdyQAZ0AIVNw9VhpVMba40eBEU6O5sFcwOMAfFSJPu1HnOwjxDaH/WcwF
         z5U9aqSprPrs2eHBpCga2xQMWpU9YKXgKPBtc6zbgLcWcUM7JEV8LmiZpeEVRKWmYVPa
         xM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKwByyPfxfr/n1cC+oLGoBG4NlLo51IgX3L05P+HJI8=;
        b=A9MbrYqWiTwVn3Aa8H6GTrKcf0SoP4dsjePh2EmTHRuY6b35ZZ2KMPrL1N54aXhJVM
         UnuzNYcwgo5QwGl6uT0SHrxVMZoGoiVw4IFRfDrSbXA7WJyGPMACKS5Rv5q/JdwJCiBN
         AdrL9PgvmYYyLLrUUz2uAWEQkhY+l5uivyshXNHQrZTdnv8ljYeDTub3EIPwQoNkhzr/
         kdQd4buPgj0eCMHVuLe6BP8i3OeXuRbEaFgz4VjQ1kL9WhA8onfqC5r8gJ3BqUHtChqE
         SDJOuy0vu5XwAxhRZMIdYYRA/+IfRkWB9Ho3HnC3l1OmzgBVVlNeJWPxkBwIsN3FYDHF
         8KNw==
X-Gm-Message-State: AOAM530eLqRnM0HgEpHYPmtHg9vv6blViysfdDFVnBTVOaEF2jM2Vt70
        tt1rYxdTltZtwRYOBtDV9LF9rQ==
X-Google-Smtp-Source: ABdhPJzSL/dwq6r3E9jWuUXk3PD0vK74fSqk9KX+ypDiU5Yy6dbsNXhfI1NXAO7sDxCZ0lIAYdKNEg==
X-Received: by 2002:a17:907:9615:b0:708:a422:c9c2 with SMTP id gb21-20020a170907961500b00708a422c9c2mr28113240ejc.217.1654622343543;
        Tue, 07 Jun 2022 10:19:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm5876540ejp.96.2022.06.07.10.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:19:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/14] arm64: dts: qcom: sdm630: add dedicated IMEM and syscon compatibles
Date:   Tue,  7 Jun 2022 19:18:46 +0200
Message-Id: <20220607171848.535128-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
References: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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

Add proper compatibles to the IMEM device node:
1. syscon to allow accessing memory from other devices,
2. dedicated compatible as required for syscon and simple-mfd nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8d38c3d3c940..771f74dec826 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1830,7 +1830,7 @@ blsp_i2c8: i2c@c1b8000 {
 		};
 
 		sram@146bf000 {
-			compatible = "simple-mfd";
+			compatible = "qcom,sdm630-imem", "syscon", "simple-mfd";
 			reg = <0x146bf000 0x1000>;
 
 			#address-cells = <1>;
-- 
2.34.1

