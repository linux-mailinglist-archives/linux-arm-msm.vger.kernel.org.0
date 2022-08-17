Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6225A596DFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 14:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbiHQME4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 08:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbiHQMEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 08:04:47 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D926B57202
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z20so13362446ljq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GGC6/FAtFLtsPec3v0Z//ulLsaLmio7LVXcsIKWCfDM=;
        b=miMj+avNVe2LIWr1HvJA4rGseGDIOeygunPdCMBN6CSnZr4fZvx1MS7rw6GUgMhxyg
         nSN1YKLeXmDvVX8VfYcgxDVCZNdAmWzyqwCfgEtSYumifD1B2mrenI0UyZJNw09CXFEk
         5SzgDvS6O5xTedd1yXhWCDDr4y6LLmMmvYYEZ/MpUCubbVcM911wrnIicI/IWgI7FO4q
         7VaEcQiKliQ6RyNkAcm5vDWX3vwAjSHG8dW5QPjlDOQwvcJTUk4njD+QpsWG2qwo26pA
         id3OXB7qggMKuwKb57RbdptQkVxbBZwBxHOBbpqEh9wW8kIEpVrmv0FY5kNYa4rvdS+Y
         oiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GGC6/FAtFLtsPec3v0Z//ulLsaLmio7LVXcsIKWCfDM=;
        b=ws6gDcWH0uZ75WIlW4xiVn1UKeRmNg/E+STJgr7zBrSA6xsyyIMlNoDHhe5VVty0J8
         yZ0ffxpsY9Rb3DmulVo7lVRwxPdPBEHd0bj8cJP3X4kGXHhtVsK2ZGbtHGvbAwD3WS6a
         MdfE0qukAaUdY2eG30U8RqfSjabzrH7XOp4zyJTWNzbPzLBqdC8Se3EhhXQMeoOgLPZ6
         TtcIQ7CZ8z4qGuPfROWhfQTqAo8HWm8K6Sf8um35zazErH7nPfZmVB+xS2QSYyKwKT81
         6eJTwZAjHvdInaS065hxOb+4ZYY0ArbHIan24QeuNH/zRKz3nL9megeT1fpbMkp/xWFI
         NUXQ==
X-Gm-Message-State: ACgBeo3g0vZKIxuwI/z+vCm5Ozylu+Wo53b/LVtAJ2xSk3whi3Tlb5z9
        KE/xFtT6X5P0bbWGU1r6Cn6/pXGaw508RDk2
X-Google-Smtp-Source: AA6agR7gyE2mBf2oCkQu9AfMIjk25LfntH6SuRYtq8dw+mhllXqptMMvleWmyxNwiDl4Z/Wens5vAA==
X-Received: by 2002:a2e:bea8:0:b0:25f:e9ab:5a1b with SMTP id a40-20020a2ebea8000000b0025fe9ab5a1bmr7549871ljr.448.1660737874403;
        Wed, 17 Aug 2022 05:04:34 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id d15-20020a05651221cf00b0048a97042251sm1670496lft.22.2022.08.17.05.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 05:04:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 14/14] arm64: dts: qcom: sm8150: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 15:04:03 +0300
Message-Id: <20220817120403.458000-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
References: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sm8150-mtp.dtb: hwlock: 'reg' is a required property
  qcom/sm8150-mtp.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 7d509ecd44da..dc6770391813 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -585,12 +585,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -2054,9 +2048,10 @@ ipa_virt: interconnect@1e00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
-			reg = <0x0 0x01f40000 0x0 0x40000>;
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0 0x01f40000 0 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		remoteproc_slpi: remoteproc@2400000 {
-- 
2.34.1

