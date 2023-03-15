Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08BCB6BAF14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 12:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjCOLUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 07:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjCOLUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 07:20:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F39415143
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 04:20:01 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p4so10762549wre.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678879194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4lIKxT2fGoirRHmch8dzAkOMft+emleSnT/iIO7ryY=;
        b=qEBZGcIwIGAd2at6H9jZUl/tx9Z9iMV7iFxl8LkThoqL36dWKkoJTyjGu+eVHPxQNz
         khgUsvvGOHnquG+NoUZUmaSepqq40281Gka6xbC57tvYNXy5ly/LiFF/yJpobRo1ciEx
         VFCwva1sU4dbHkLGVozJYUMuWPmTlZ5OqGi8ix0UftnEnbxDJ5RRlL2GzvlLoetr7cgd
         xajJEdOo7TUEYmd3WI2J+w7yO7mhldFqyHqI2yQ7C8H7y0AX+Tsu7y/5zqd8p7wUfyfw
         f6tpNz1aCJvFffVEucPGr/kllav+4+YABMbHuV6PqZh/Rl6Rajs7ZxBFZjE2AgfZcZJ2
         f/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678879194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4lIKxT2fGoirRHmch8dzAkOMft+emleSnT/iIO7ryY=;
        b=XD+didOg26cX9z679DIvzqf5YVxAstAlUq5pCxCy09w0o4PUtOnkcJXNQra6cSN5Qy
         o2R4aak2zipjV/UpvSeXnBlI43o3XCsFBlNDubxlqAIzu2xXMiQ2hjPBlE83hPtR5c5m
         TAk/kux2kgvz5j6ymWaRWjzvnqCsdrc7K9YqI0kTD6wWm5yebMfcWFHRynwLLWkJlJjR
         pEJErJl1hpZHcYDJrdv8dGTkiJKq71+bVJFWX2GjtGXnRzZ50EWg3jxayY7l/vZhxZiz
         ifa0BKXbbuC7nKSaGiDsTf6YShJH+qMOsNckAvkrsqUHQQZVYLjzJiLxWYmM2ZtrFYqk
         3WsQ==
X-Gm-Message-State: AO0yUKVlt8N5H6ZVEcPrD35TwHHae2IlWq5W0/wsTZW6OFG1IXb9s3EO
        QR7t4zXWj0iqMbH9iqZbTyZWkw==
X-Google-Smtp-Source: AK7set/Fc8+nzOWDf/h9rE6Qamjt7uImZWspknxs+LN1Fq/dt9PUbqVcXIy7K5f2TqSZE/rbZ0VQBA==
X-Received: by 2002:adf:e707:0:b0:2ce:a162:784c with SMTP id c7-20020adfe707000000b002cea162784cmr1530128wrm.65.1678879194571;
        Wed, 15 Mar 2023 04:19:54 -0700 (PDT)
Received: from lion.caleb.cas.dev (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id d13-20020adffbcd000000b002c55521903bsm4250015wrs.51.2023.03.15.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 04:19:54 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm850: commonise framebuffer memory
Date:   Wed, 15 Mar 2023 11:19:46 +0000
Message-Id: <20230315111947.3807083-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315111947.3807083-1-caleb.connolly@linaro.org>
References: <20230315111947.3807083-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This region needs to be reserved as it's mapped by the bootloader and
the kernel doesn't currently have a way of unmapping it.

Both the Galaxy Book2 and C630 use the same address and size for the
framebuffer reserved memory region. Move the definition to sdm850.dtsi.

The c630 was missing this region, this patch ensures that it's reserved
there too.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts | 6 ------
 arch/arm64/boot/dts/qcom/sdm850.dtsi             | 9 +++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index 9850140514ba..6e36ad2f2d3e 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -61,12 +61,6 @@ aliases {
 
 	/* Reserved memory changes */
 	reserved-memory {
-		/* Bootloader display framebuffer region */
-		cont_splash_mem: memory@80400000 {
-			reg = <0x0 0x80400000 0x0 0x960000>;
-			no-map;
-		};
-
 		qseecom_mem: memory@8b500000 {
 			reg = <0 0x8b500000 0 0xa00000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index b787575c77a5..89eda97daa57 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -9,6 +9,15 @@
 
 /delete-node/ &cont_splash_mem;
 
+/ {
+	reserved-memory {
+		cont_splash_mem: framebuffer@80400000 {
+			reg = <0x0 0x80400000 0x0 0x960000>;
+			no-map;
+		};
+	};
+};
+
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
 		opp-hz = /bits/ 64 <2841600000>;
-- 
2.39.2

