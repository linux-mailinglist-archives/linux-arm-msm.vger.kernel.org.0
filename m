Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE2A6C75B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjCXCZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjCXCZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D1E2A6FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so424108lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztyVvHePc2g0fgfWPHlP7Fkc4koigeoY8jwnoi9HE3s=;
        b=xbkmYlZOE167rM1f/K8gU7inlBIooaIZIv7GjJ/3N1wJnEVF31QsXzVDhFJUyOm5WM
         8EXr+gvs2KNBr8lfJF5PRAxnRGU0a1GrpLCnjci3HOBv6vb/ayJP3p/DjWfV1AC/tzEN
         +XtCjZwZDw0XiaIgAUAtKlVF4OsMzBQhJWwmVHD5ZHOm27Q9+YO1U5UI7zoM+qwfaQY2
         qisEuFUIDpdDdCJtSKB3vrKJdYXCFOAflmxFh8pCtOYMzaYKxBlIejoODvlAsZMwtYyG
         uR9nPiJsZ3f+E/c3SBI2Lj7loxOR24/Lvsu1iWo2WVUauIn+NwwVxMeLEXPxJef1SMkV
         WTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztyVvHePc2g0fgfWPHlP7Fkc4koigeoY8jwnoi9HE3s=;
        b=gC2a2MlIuFdfsjQdG8auXYvNFoZ7QZ+WhfzAMc7TvGuFz0Jf+2c2gWmo+FD50I2jgx
         qlKeh9nCotxOldSpd9g9aWR++dS0wLst9ml7/tenBhpmj4waGxE+QEnnV/mFNqulDW85
         A6p47NcupF5peRgo540ryyCfkF33FXVR0KoHiGXTPCM3F68GmUrX8IpqPSdYNI9oz8Eg
         lGShbkBKJy04TaDrW47HN1jHAWJkebt8LQuoUtxa/wFAyf5Kgci66jCOUwJnZh4FGxd6
         30myF6I/PXpw/CPSj0WCbkOT54gSXJMzWQVpcWtIQ+bAzQaiD8ifIvojg/TJzNQdRGYM
         ywXA==
X-Gm-Message-State: AAQBX9dekclBTE2aagle2prWQV4KG/J2YH3qoJTQrf1ZbWdSJAWHZ+Ng
        KGe9ffbUqP5CAPMoCWx+TCNGqQ==
X-Google-Smtp-Source: AKy350bDSH1hnFn//QrzuFUAFg7C/7e4jB7mKj8gv29RKqqJhCVerYG087mxoTsJon8TUpMxQPYZoA==
X-Received: by 2002:ac2:44d9:0:b0:4cc:96f8:f9c6 with SMTP id d25-20020ac244d9000000b004cc96f8f9c6mr267800lfm.5.1679624744821;
        Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 27/41] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:00 +0300
Message-Id: <20230324022514.1800382-28-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index c29bbd5c6fd5..be10b68893e8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2011,7 +2011,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2056,10 +2056,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2069,16 +2067,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.30.2

