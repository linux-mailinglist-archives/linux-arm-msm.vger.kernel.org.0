Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D01596F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239551AbiHQNEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239548AbiHQNED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3407E32073
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w5so18925026lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7xLpyvjcjxtFjBdq2TnMTpFX2axCPt8X9rBvt8vK73g=;
        b=PjUVTMLZrPosGW6XmepHlPO6eBG33wbigvyDIhLQxGCe0t0HNYb7qqhQRzDUb6WSUd
         8Ix9XRC/u8xSK0VB2AfHrZNUZHgAdte+McfWQyJ+xGlUDAbzhIJqfxQgAOoDufNrsvGG
         lo3x89xgK1BBxmfSYHfrCNe/byq3/pfDGz3MH5mG2jHsd/zD6vMbeg6ljVZnzE23unAa
         67DtmM3ZT+/PA7L/5Y5fXlcsT9JWh28VvfIwpSGdJm1/iUlX+mW0PidIsjXTl1pZV7Ys
         vLNq56vARazX3rlDUN3+hf4VqRjQV2kFkRKG09tIQrjmB4ag9j/J9rj/E6M03fUzbvee
         K0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7xLpyvjcjxtFjBdq2TnMTpFX2axCPt8X9rBvt8vK73g=;
        b=1L7RspAXxd/LYqGA5YUa0xIoI6Wf4wPGqcu1Js81mQuneMFkQmieF8pLzBgU8tDyCe
         1CjcAK2bvJEjAo8kqAO6FXMs+O5HzSo13E8SGXV8XM35nFunzK6J+UQqFuF8yEA9+mEM
         6QCxl7q6dufV2vCsSwZQJW7PGE01lJz6SNFKB5uhmMZBztuuyZ43xXsf821U/z9XeIKp
         8jIATyLPEu1r0W+vNKFve5knj8+jmbqxGL6BavLIR/3EXdYrTOJbhRgtPS6zxNsgQTAA
         6U5kOScEVUVEvyK5+RW2t5Gz98A11hiM+fXs5b2QlZJtNvoGoFKaJpw6L7jVr1iuC05X
         M78g==
X-Gm-Message-State: ACgBeo3PN1U/4p/wW33Veq4/AG6v9VX+BF8HDb3RUrLTJ20qL+4vHFTS
        z+jrZRS050sFWf97pTczXOFn+g==
X-Google-Smtp-Source: AA6agR7Zzblj4Xlxub0k83AuZvMCqpVVbNxPphlAI3oTNPmKajhVKPj/RJ1GaeWLs5yQwv1ptA1tfA==
X-Received: by 2002:a05:6512:1392:b0:48d:a6b7:caff with SMTP id p18-20020a056512139200b0048da6b7caffmr9229978lfa.154.1660741433664;
        Wed, 17 Aug 2022 06:03:53 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:03:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 02/14] arm64: dts: qcom: msm8996: split TCSR halt regs out of mutex
Date:   Wed, 17 Aug 2022 16:03:30 +0300
Message-Id: <20220817130342.568396-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR halt regs are next to TCSR mutex, so before converting the TCSR
mutex into device with address space, we need to split the halt regs to
its own syscon device.  This also describes more accurately the devices
and their IO address space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b3..3411ced96db6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -359,7 +359,7 @@ opp-2150400000 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-msm8996", "qcom,scm";
-			qcom,dload-mode = <&tcsr 0x13000>;
+			qcom,dload-mode = <&tcsr_2 0x13000>;
 		};
 	};
 
@@ -840,10 +840,15 @@ pnoc: interconnect@5c0000 {
 
 		tcsr_mutex_regs: syscon@740000 {
 			compatible = "syscon";
-			reg = <0x00740000 0x40000>;
+			reg = <0x00740000 0x20000>;
 		};
 
-		tcsr: syscon@7a0000 {
+		tcsr_1: sycon@760000 {
+			compatible = "qcom,tcsr-msm8996", "syscon";
+			reg = <0x00760000 0x20000>;
+		};
+
+		tcsr_2: syscon@7a0000 {
 			compatible = "qcom,tcsr-msm8996", "syscon";
 			reg = <0x007a0000 0x18000>;
 		};
@@ -2413,7 +2418,7 @@ mss_pil: remoteproc@2080000 {
 			qcom,smem-states = <&mpss_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+			qcom,halt-regs = <&tcsr_1 0x3000 0x5000 0x4000>;
 
 			status = "disabled";
 
-- 
2.34.1

