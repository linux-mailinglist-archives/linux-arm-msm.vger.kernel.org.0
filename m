Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303AD55B192
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 13:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiFZLs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jun 2022 07:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiFZLs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jun 2022 07:48:58 -0400
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B2F11C10;
        Sun, 26 Jun 2022 04:48:57 -0700 (PDT)
Received: from newone.lan (_gateway [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id C7DC62007F;
        Sun, 26 Jun 2022 13:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1656244135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YndBNZ0lvr/m34EAnVpOYwY/mP5Uv37FbG+Xwh1ccJI=;
        b=2FJrNomMXgvJm37BBmW+DA6orjlOCG7vUIvaZjwtfC2SHOAJDzxiS5w/5UmHeZ9plMqe0W
        AKI1nS+CLfEj5OwR17tMNj7k4NWfdo78CwZqTi/chXklydDYSLyZPE6V1TzNBmtyB4IORH
        fSeS4A/p8DMhknQLjjlcevFHBUuNOsg=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: extend scm compatible strings
Date:   Sun, 26 Jun 2022 13:46:34 +0200
Message-Id: <20220626114634.90850-2-david@ixit.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220626114634.90850-1-david@ixit.cz>
References: <20220626114634.90850-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_DYNAMIC,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow scheme where device specific compatible is first,
then general compatible string.

Cc: Robert Marko <robimarko@gmail.com>
Cc: Guru Das Srinagesh <quic_gurus@quicinc.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 748575ed1490..19228e4f5313 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -125,7 +125,7 @@ opp-1800000000 {
 
 	firmware {
 		scm {
-			compatible = "qcom,scm";
+			compatible = "qcom,scm-ipq6018", "qcom,scm";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index ffc3ec2cd3bc..6fd361be0fe2 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -215,7 +215,7 @@ L2_1: l2-cache_1 {
 
 	firmware {
 		scm: scm {
-			compatible = "qcom,scm-msm8953";
+			compatible = "qcom,scm-msm8953", "qcom,scm";
 			clocks = <&gcc GCC_CRYPTO_CLK>,
 				 <&gcc GCC_CRYPTO_AXI_CLK>,
 				 <&gcc GCC_CRYPTO_AHB_CLK>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ab95ec4a7491..7c854c9c2517 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -357,7 +357,7 @@ opp-2150400000 {
 
 	firmware {
 		scm {
-			compatible = "qcom,scm-msm8996";
+			compatible = "qcom,scm-msm8996", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d0760e6ec942..fc4a490add48 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -628,7 +628,7 @@ cpu7_opp20: opp-2841600000 {
 
 	firmware {
 		scm: scm {
-			compatible = "qcom,scm";
+			compatible = "qcom,scm-sm8250", "qcom,scm";
 			#reset-cells = <1>;
 		};
 	};
-- 
2.35.1

