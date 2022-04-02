Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB054F05D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 21:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiDBTa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 15:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245261AbiDBTa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 15:30:57 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D117AB0
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 12:29:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u16so8730677wru.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 12:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrL/DeeTGKDUmIO0s0ktdBOJGDCSZ62AedFscY9wS70=;
        b=GSOVLA24K5u4gRiAJRRwlqQb5vfiM459ZzPdHPmLHzzSHAZrsiKa2QEiG+JNUagQ0c
         UFbx2EkakeIznFH4jIn9Ou2Y64AzfbTgFTZ2rVJlOiW5+XycQSLRayqIb1x/wiWFuPA8
         kW4ICAjre61QezGxCKQdIw6BA96uaa2hH3XjYkQ3z1qmXYEo9iZ/8bWNpWfyYGl0ZIeo
         qutA/P8qBUyTBPXjGBQvwe+W+3RR0n+EhLfc6jF1PdNBqOGE2xOkvy3ltUOFgbmEWiuC
         xnejCkeMkFgOrr87el1dovfaIw8wK8YCP1QjZmgA0lRWiwe8PZXmcpyEA/tSMNSuIOS7
         JvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrL/DeeTGKDUmIO0s0ktdBOJGDCSZ62AedFscY9wS70=;
        b=SNLCzW3brX/zzxEWsw8dOt2Qmnp8IWW+ZO4IRmYPJ+9wauYM12akywGx8kDaGoZECT
         iMAFgmeLD2X3/9EVxlaR8Cm1EHZfm/B8p7cTJ4gNwChI54DBK2T0ACpsnxDiZYpwa6Bz
         CbAJutzNMzaYXh0V5K0/Bv8me4NmY5Y0Hj+g/s26kVfsd3eVfL2PC9fiRzkc/8eKBIIs
         0Z/YZRvh8yV1EWq4uckAlOPR3Ly+s7JaZ0cisoNJukbXdIlGCalGZwnbkmrT2/tk2ALj
         +r+/hl1FL/5FqkOder1KxAcq3UpT5/YDGUPMgJgyqYHUmZL0zc8tZYZYGHpj0pepJgsJ
         Go3g==
X-Gm-Message-State: AOAM5309gN+12KdrpXQIt5fubkqGSIulg0UsC7TGwHY0YORqXbkxrEYH
        3pVWlI+4o5hNO/pp1TBGExw/ig==
X-Google-Smtp-Source: ABdhPJwbL7AEpfTk3KuxN7pH4dRlvuCi5PU8hKd7ri96GJegxHG5exdihR/jcc/tRXnITrrcUlfOiw==
X-Received: by 2002:a5d:5848:0:b0:203:fef3:888b with SMTP id i8-20020a5d5848000000b00203fef3888bmr11796295wrf.611.1648927743677;
        Sat, 02 Apr 2022 12:29:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id y11-20020a056000168b00b002041af9a73fsm5770629wrd.84.2022.04.02.12.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 12:29:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: msm8994: override nodes by label
Date:   Sat,  2 Apr 2022 21:28:58 +0200
Message-Id: <20220402192859.154977-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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

Using node paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).  This also reduces the indentation making the code
easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..c1fb9a7d6fa4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -27,15 +27,13 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+};
 
-	soc {
-		serial@f991e000 {
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart2_default>;
-			pinctrl-1 = <&blsp1_uart2_sleep>;
-		};
-	};
+&blsp1_uart2 {
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
 
 &tlmm {
-- 
2.32.0

