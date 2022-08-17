Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50450596DF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 14:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239192AbiHQMEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 08:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239225AbiHQMEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 08:04:30 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427534D4DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x10so13352588ljq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Oc1vz9/DWeA4ULM94yDKxE44YQvZ9a9JuzHX3olMNuY=;
        b=JOw7aJug/ittMZM397qQMP7PNTssn5birDsiYlSxKAIqKhSQbv6lAKSCuZs95wxO7u
         8FDAG0U7R8LOo9kZ7FFgm9Q9JuT7uHTTFwzZ9oAwMAtJJHrHXYlgKkcPW3/AkUN0Ujf2
         Wr6TLPgDUKOUfj7nXJvmDzUt1/IXwFXHvsecnB3oeQ/Os3tazhB4kdHZQQgotF1G3Ngz
         99fq5R5bD2+xvF+cL1hXtUV+2f9iB4f6E00rg+b9g+fpkS7Mt1W0bd6isEXx1ppHrpYZ
         ncJeSD7TfMTnBdzzNGgvaIKyYEEbfaNHXeFqE0C+aGkAJEGSJn2Zk26nhCAZax9vyn95
         SCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Oc1vz9/DWeA4ULM94yDKxE44YQvZ9a9JuzHX3olMNuY=;
        b=XZyZrBdGAODT4afLFpT06vC39fO1KPAirByNH8CY8/wUSKFmnA8uulbzdWN8XGw4Mp
         r0gKZhPWM6Dg6cTe2RNfMIBRa5X8L3Wlw8bOA2WoTCvCFY7GXyPGChgBvX06lfntAwuh
         i+LMZbs+oEjRQfiWEmHOVOA08a3n2zukveZQMQvsl1b4AtyYtLtalDK/AFuWJ5NLE08/
         /w5e42+PmOmfPhd4r6uZw6DanHvPY2zbZcOCxx6Agkfx0iuXPbVOM7czEJRQnqxqGhWU
         95yNjr2MSbOs+VIZeqblSnNmVoxwwB5VSP2qDJwpCD8iCaO/X5FN/ejrVAS3SepyKHlW
         dvww==
X-Gm-Message-State: ACgBeo3W0ZLAKjPl6+AwgCRU20ZnrneG06FlOtlFOvNnQIk+N26Bra7M
        RGkMpDFUYFGy341ybUic7R5RXw==
X-Google-Smtp-Source: AA6agR76QSaUVvbpXrRlU59d3Q0u7kPWVrRH4iu47NsubtYBm+HnQouPetdXzqwxfxU/2nye1BF8+w==
X-Received: by 2002:a2e:90d8:0:b0:261:7ffd:2783 with SMTP id o24-20020a2e90d8000000b002617ffd2783mr5628856ljg.59.1660737861398;
        Wed, 17 Aug 2022 05:04:21 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id d15-20020a05651221cf00b0048a97042251sm1670496lft.22.2022.08.17.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 05:04:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 05/14] arm64: dts: qcom: msm8998: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 15:03:54 +0300
Message-Id: <20220817120403.458000-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
References: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/msm8998-asus-novago-tp370ql.dtb: hwlock: 'reg' is a required property
  qcom/msm8998-asus-novago-tp370ql.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f0806ed103f1..22b2da74d105 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -308,12 +308,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -1047,9 +1041,10 @@ ufsphy_lanes: phy@1da7400 {
 			};
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x01f40000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_regs_1: sycon@1f60000 {
-- 
2.34.1

