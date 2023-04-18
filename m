Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383976E5E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 11:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjDRJ6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 05:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjDRJ6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 05:58:00 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B0683E7
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:57:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dm2so71756385ejc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811856; x=1684403856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3pxl4lPryH2E2sQaHaQ+oIDeHX2pw5OTpWOzTlbljQ=;
        b=jx9qal3Xonx3dBZORhZeoNu8RxWsT/zLcnvKy0mOexdy1QmZJ/21bUIWiTD7bZCtzP
         /0XiIgYBhLZFcvKzxCwMLY+OBu49V22IV30GbDPhZIrtFfJIFBomMY8cjj2BbARtMorC
         didVaQ0CL6SikxhgLNX2EMhkuCwCr5YPdNlLZhL7CXeYlWwtUZ3lot/fRieknjgOa4ki
         0b1ZiOJQMIeBubSeXyTVMRuXpKyQgv9hiuhs0a79iDDBY3+KgQJUVVOYYmxrS1mhyJ5T
         07wizhGwwjwrEJNjnuRq+vRn6L8Q8fCHPmCrnLiA7Zw51IDeoNzkbwNypMxQXZKRZ0d7
         A2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811856; x=1684403856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3pxl4lPryH2E2sQaHaQ+oIDeHX2pw5OTpWOzTlbljQ=;
        b=A87Jjcyve/Hf5OHnUiCQIHh1KsHP23vFL+xvvh6TXFNtOU67ZrNLum/bIrQceY2GXW
         Rvqqg8bVXeUuYeJh6PYIejst2nROlsUCgOsei0CgiTW+j1nkVWQKm3c4jP7nYAAGt+Up
         eytGTSWIR3naxLd8KycQH5JQiCFIrzFuHnNwC6Q5gxCe6FlH3QVOxbYpjo+B8a6rbUiL
         Wi+MSu4NCvQw7CRAS8pDN2vtrah7EYEpoC65bocBNQVtNueH6k/yNYHGYUTmoq/oNBub
         l+CsaJ411hbVKLUw8ot/WJMWJoPepoDK6uhnKk3r+YEQLmWP2EQXBRUlybyi99Vz/Dxj
         O+fQ==
X-Gm-Message-State: AAQBX9dKEXJXMLI7lEMQchIYS8kCFhD4uEnzWqL55fI6zEcENgYdd8Gw
        DS1vRFnppjpNm2jWTSXsoLnNuA==
X-Google-Smtp-Source: AKy350aNJ460Zklk00yf1a38jkPEMVgyZ4M5eIyVTm+sWG7SoroLsIiwALBTyWu9AdHEyCSjZwH0Mg==
X-Received: by 2002:a17:906:e118:b0:94a:6c0a:63e7 with SMTP id gj24-20020a170906e11800b0094a6c0a63e7mr8955475ejb.54.1681811856673;
        Tue, 18 Apr 2023 02:57:36 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id vt2-20020a170907a60200b0094f257e3e05sm4632321ejc.168.2023.04.18.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:57:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: use uint16 for Soundwire interval
Date:   Tue, 18 Apr 2023 11:57:34 +0200
Message-Id: <20230418095734.669858-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Soundwire bindings changed during review, after the SM8550 DTS
Soundwire nodes were merged.  Switch to uint16 for Soundwire
qcom,ports-sinterval property, to match with current bindings.

Fixes: 61b006389bb7 ("arm64: dts: qcom: sm8550: add Soundwire controllers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for v6.4-rc1.

Bindings v3 (with uint16):
https://lore.kernel.org/linux-arm-msm/20230418095447.577001-1-krzysztof.kozlowski@linaro.org/T/#md34302ec02eebdbe3e4defef79a40b32a7e621b8
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6e9bad8f6f33..80a01ff3ee30 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2022,7 +2022,7 @@ swr3: soundwire-controller@6ab0000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
-			qcom,ports-sinterval =		<0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
 			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
@@ -2068,7 +2068,7 @@ swr1: soundwire-controller@6ad0000 {
 			qcom,din-ports = <0>;
 			qcom,dout-ports = <10>;
 
-			qcom,ports-sinterval =		<0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff>;
 			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff>;
@@ -2133,7 +2133,7 @@ swr0: soundwire-controller@6b10000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
-			qcom,ports-sinterval =		<0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
 			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
-- 
2.34.1

