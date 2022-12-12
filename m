Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87350649B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 11:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiLLKDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 05:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbiLLKCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 05:02:53 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32BCB49F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:52 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x11so11947913ljh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fclng8ESbq3XjgOkvuI1GIyaTCatPo7DiLR9f+XR1rI=;
        b=lFEuCRr4lG0reAnx33yGM1tiiFOPGai48iALv7go08uL71Q36vhplQcWQst/PcLTDM
         chcQ0SW4YDhUo4mmh9msV3dOpe71oxTDxpP/RvCdF4g9mUV63UZlcSCOU/5KmdiH4sNz
         WHB7vYJ7k9F28Zmf5haVAOIRbT7Ud3powDo4hrVDaoVKGjtKqgHG2uLRLB7CTLOq/1n2
         McR+FKzHBISCi3xn82KoJBrP59sS9mG2giNJMBWIOvOqPHt6DUVJBj308LS9slBgCrSE
         Sw8MbLG24ZrjOAqQRXYWWogM6kgrcF16oF5aLEm6/2f1L+c/IRzqrkbBxhTitOpNNIkc
         YR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fclng8ESbq3XjgOkvuI1GIyaTCatPo7DiLR9f+XR1rI=;
        b=jXWKSoHUuwGzpuU3kFXpBMOTAMU44pSMB99BKCocOjM1Y8emrHTtlLqsHNwC5th5Uk
         5fCZeXUPyWmU0we67eSEf0IXjrG8JkXXMHzyd7epjncwJAqRz6RsWXVVwt+YHP7NEZaw
         e10RkLDa5jKcDbZmG/G4GaBBkpMNgDZ1AXHYu58GwCQlRsk2LxrxhAySHC9J+QWeJi47
         1+1xlMVYWGru/C8eLxR7YifAQBo+DQPxvFJodMc6dFKzbvyggT/4hk7MgJXu9sNSq22B
         uIKbdC8W9eHUz024mDYY4I/h9Cu4IbUmbgC996ctoPh+7Qd8xF8VERFDp9lRPOknNtUR
         2RaA==
X-Gm-Message-State: ANoB5pm+bZmi0JLcDFClHo+XS0RxHcyozjdglLuXUJEKvBsxIYF/co6b
        /F+1VLiOVi5t70nkxdFR5g2/Ig==
X-Google-Smtp-Source: AA0mqf6CsFYGGFln7PubdFpjqv3Pg4Jhdmi9rCt5KMgygX+Sf+M//fl3qo3hyx5kOulcJA23X+6Y0A==
X-Received: by 2002:a05:651c:1592:b0:277:8a76:90a4 with SMTP id h18-20020a05651c159200b002778a7690a4mr4306295ljq.0.1670839371158;
        Mon, 12 Dec 2022 02:02:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i124-20020a2e2282000000b0027712379ec8sm1145101lji.28.2022.12.12.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 02:02:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sdm845: move sound node out of soc
Date:   Mon, 12 Dec 2022 11:02:31 +0100
Message-Id: <20221212100232.138519-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
References: <20221212100232.138519-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sound node is not property of the soc, but rather board as it
describes the sound configuration.  It also does not have unit address:

  sdm845-shift-axolotl.dtb: soc@0: sound: {} should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8eeb3aa261d5..5f1f7cb52c90 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3964,9 +3964,6 @@ lmh_cluster0: lmh@17d78800 {
 			#interrupt-cells = <1>;
 		};
 
-		sound: sound {
-		};
-
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sdm845-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e2000 0 0x400>;
@@ -5341,6 +5338,9 @@ wifi: wifi@18800000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-- 
2.34.1

