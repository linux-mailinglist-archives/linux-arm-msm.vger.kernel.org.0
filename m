Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F17F6C75AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjCXCZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbjCXCZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9162A6F2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g17so412455lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBoHAuOBmNq4AyckPRTEYDjwgqhLeJ/y1ejmubgicVY=;
        b=llP8qR0dcKLSqr9Vn3VqzBWYoQL5G8Vx4Qimod8rzYgCRFeebV+zdq9aF4QENbfU4f
         682M7zXscBWxb0gTHYv91qpgS+9JBYWvksBQ9IiKI8gcs5Naqp/oiiedGqGc8v9zus4+
         6XxT5xWD/s1wdcAPOw4f/PeHSoYZNZ06+6JygtqbNW1NDf166kMeR99N9Bea1/6yl68a
         NOSanzaiUnbeT94t1ME52+aRH9OI3gDr/UNv0Pmdqrr1NCb6y87JVHS+8QWV7czNJISI
         ccgqmjPqG0yMtziSulMDBxEIxZT33b7SHA+QrI/gpKb+iGZ0QpbzYWABqyHBhr7kH4QX
         +viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBoHAuOBmNq4AyckPRTEYDjwgqhLeJ/y1ejmubgicVY=;
        b=RhhEP2R8SpNeUb5uOVnKg3WB5YrnbOpCB5FacTSxK8u7suDkwFJWYS0MRtNdA4Cjkn
         LvfhGc29//SNipW00B5Fs886huakip4DYeZgTc9MI4IpTwKX+smQxkgHlLge1RaBfLjb
         bMulD7nSZ1kqQlGoT5sIwjo4YKANHnsV1bMEAXIjK+TBjaHNaGlSaNpL0mWzOR37A+AL
         4zErrThnBcduZgFtAYzyIn8XDL/voy0ZRh3A7wU04iBjsE8IoQYGCN2IxFXu3dE+SzB2
         qDUPK7GPVsZ6yXVgXV3BBzV8/Kvdn25pNWKbFHQgEKMQqOzTVGLXWUrjdrj1BTVaLa+A
         98wQ==
X-Gm-Message-State: AAQBX9ezWTEX1jyMcrHXfusGKPk+ouyvZ8OPRV5yr5nnyHnjfIC59THe
        YaGRHBU7NJa85/R5mQ5tBUs3Nw==
X-Google-Smtp-Source: AKy350bTk7treQsqgQwXtAUPdD9PXu0HU7Wy2A/4z+HUrTs4P33AFxkx1YN6RVqe59fbrf+M7qbJug==
X-Received: by 2002:a05:6512:3cc:b0:4e9:aeaa:ddb5 with SMTP id w12-20020a05651203cc00b004e9aeaaddb5mr201187lfp.14.1679624744088;
        Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 26/41] arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:59 +0300
Message-Id: <20230324022514.1800382-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 18c4616848ce..a816bb212174 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -943,7 +943,7 @@ ufs_mem_hc: ufs@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -988,10 +988,7 @@ ufs_mem_hc: ufs@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm6350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
 
 			clock-names = "ref",
 				      "ref_aux";
@@ -1001,16 +998,9 @@ ufs_mem_phy: phy@1d87000 {
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 
-			status = "disabled";
+			#phy-cells = <0>;
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x128>,
-				      <0 0x01d87600 0 0x1fc>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x128>,
-				      <0 0x01d87a00 0 0x1fc>;
-				#phy-cells = <0>;
-			};
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.30.2

