Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999AD515729
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbiD2Vrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238976AbiD2Vrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:47:53 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3BDB0F2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:33 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n8so8246155plh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3bM9obd8ZUcuxP0enz30vvUZW9ZRPh152lks3wc9yEE=;
        b=jx/9RFouIHwDBbb5ltParsJO8zX0BXtnSKD44EmOWMp7kf4ItGUYTnPJxMQxvAMJti
         l1vXQBN4cx1+gql8oX4TyH8vmJavYdYs/533vJ87dfxi5K6G92ypZx4C5R+sMzLbyNot
         BHn9RIJavZM332RZWSSP/EiVQgdziwCoFMZTYFzzRvqc+TtV8t3sKe9PiRA6BdPvYE8I
         Sw80enWWUtwh67pOWxl3Q4mPvWgWmQIXIUcCV5E3ixX+bH8xsJ6aCeAR3mEN6Rdw5lIa
         ki5V5dRe0uH6OC/NdkQXn5oqOGKMaw9891eLUSfSDyFr9Lgemhv7j74ZsLXWZj75PCfH
         y4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3bM9obd8ZUcuxP0enz30vvUZW9ZRPh152lks3wc9yEE=;
        b=OE7ZW7wEwUgzEbQpuyhMJu7JIO6HQaDytNANX3TP6oQLGjviMbxH47cO2y/wMZ27Kj
         rDH49LS28pqZNJUCRLex85ta46ATU69i3JM57hP2yo+QMJhVEJPmU1bLnNtyN4vogtvg
         HowEIrAvPLCgoOcb4UGM+UP6mj13lPk8Yo5M0T71XUv4udHr61b6n8LVqREgm3HNHWeh
         AJ7BLdOk3kv8Pu7u88tNK4wadtQD+6H/smmInBl+CLLZaqMIxA2CLZEkWd4rhcFfrFmO
         J8w/5/+2NGH5P7nvLEPQhO6ReG28V3mGj0rgV2R/INxFYM4XOxYlaJhjSgi421yJrc8J
         NheQ==
X-Gm-Message-State: AOAM533HvqopoSQutDPsRv9zLviAVzjAmG0OUA8wEifHwg2L1AcfQ1Fw
        IUSGf38YrR5j8X8s9C3aRz2IvePSlLiEcQ==
X-Google-Smtp-Source: ABdhPJwLfzQU028dFeAhHJWHK0rfrF/8yy59TSbfdsh5ltBwLCdTmQIhgdRePazCnUeMWPW5UEx4sQ==
X-Received: by 2002:a17:902:ce81:b0:15d:29ba:7808 with SMTP id f1-20020a170902ce8100b0015d29ba7808mr1061485plg.153.1651268673158;
        Fri, 29 Apr 2022 14:44:33 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id fv12-20020a17090b0e8c00b001cd4989fed0sm15271086pjb.28.2022.04.29.14.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:44:32 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: Fix node names for sdhci 'opp-table' nodes (across dts files)
Date:   Sat, 30 Apr 2022 03:14:19 +0530
Message-Id: <20220429214420.854335-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
References: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
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

Since the Qualcomm sdhci-msm device-tree binding has been converted
to yaml format, 'make dtbs_check' reports a number of issues with
node names for sdhci 'opp-table' nodes, as it doesn't seem to like
any 'preceding text or numbers' before 'opp-table' pattern in the
node names.

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 86175d257b1e..b6df3186e94c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -725,7 +725,7 @@ sdhc_1: sdhci@7c4000 {
 
 			status = "disabled";
 
-			sdhc1_opp_table: sdhc1-opp-table {
+			sdhc1_opp_table: opp-table-sdhc1 {
 				compatible = "operating-points-v2";
 
 				opp-100000000 {
@@ -2609,7 +2609,7 @@ sdhc_2: sdhci@8804000 {
 
 			status = "disabled";
 
-			sdhc2_opp_table: sdhc2-opp-table {
+			sdhc2_opp_table: opp-table-sdhc2 {
 				compatible = "operating-points-v2";
 
 				opp-100000000 {
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index fb1a0f662575..87a5d72b2ca0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -497,7 +497,7 @@ sdhc_1: sdhci@7c4000 {
 
 			status = "disabled";
 
-			sdhc1_opp_table: sdhc1-opp-table {
+			sdhc1_opp_table: opp-table-sdhc1 {
 				compatible = "operating-points-v2";
 
 				opp-19200000 {
@@ -941,7 +941,7 @@ sdhc_2: sdhci@8804000 {
 
 			status = "disabled";
 
-			sdhc2_opp_table: sdhc2-opp-table {
+			sdhc2_opp_table: opp-table-sdhc2 {
 				compatible = "operating-points-v2";
 
 				opp-100000000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2700a8145cb9..e265d61f7c05 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3563,7 +3563,7 @@ sdhc_2: sdhci@8804000 {
 
 			status = "disabled";
 
-			sdhc2_opp_table: sdhc2-opp-table {
+			sdhc2_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-19200000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dc2562070336..5ca16f76ddeb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2937,7 +2937,7 @@ sdhc_2: sdhci@8804000 {
 
 			status = "disabled";
 
-			sdhc2_opp_table: sdhc2-opp-table {
+			sdhc2_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-19200000 {
-- 
2.35.1

