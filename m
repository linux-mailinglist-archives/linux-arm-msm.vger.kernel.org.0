Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D5673D3EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjFYU0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjFYU0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:26:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA699E48
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so3164011e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724763; x=1690316763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqYfKELW1+wrqPsZqRcnDYBPEPnkcviMkJ4jXzmrQAY=;
        b=WB7c8ob6gjoKG2Y0dUtc9a/UKvDIXuy4Acx7sOxoEidLA46Qdr2q0OL1He+tLcclLE
         H9FAxVcQbaVKhZ/k48N+c5VqM3qInnxzG+tWCvI8B7EaJ3CDLgCi8KEJOWJUjbpOL8w+
         oPl25pRcQPZnZiOwZ60CPsKSbxxFfZF3Xj4FAJS03BykVfF+88QsOOCb1QLyssXMphV/
         VqrUiECrnDParhb+VEHtAqrW7rebfdbcFJrpHlUDNBGVs+0o9TOBlTdHgstKGTJ9HV9l
         sTGEyzh4Mt2H/fHKHjLH9ME/V2Fa690xDD+SRKkPLXGuHjXDWraVhYO+wo7LuchSrZCb
         ZXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724763; x=1690316763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqYfKELW1+wrqPsZqRcnDYBPEPnkcviMkJ4jXzmrQAY=;
        b=FRaicwQvzdWLAOjrHVJ5Aj6BRW0xLX3RHH5UJ8Kkal1xWb9tN6/P1BRKwACQvCWH/a
         MwWGN9GEAX5iKU1tljsnSLHtI1DTjOIot0cOKVN7GZ1JnoaOyCpiGs3ngyIBZCtmE04A
         OxzS10V11+lHUfowKq7l7mYkN7TonuXpaotTJF5jjh1fDHljCoj6pAIgDStXsz1FeJuk
         ur8aMYZz4ahE9xiGp6P4WGU2eYIIIt4Yj4UjMyN0Oa718kJmLGxzfo56HHNyDKcMe+fT
         VWz6xd7vq7Wr9mqlagQ2B1XT+drdwewI9D3NUAAVxPmWPOKT7KxDPN4syL7opXH+HfDy
         9Yiw==
X-Gm-Message-State: AC+VfDxWOVgz6oNndZoq9BEsmC1jPSQC69Wce7FRoaPWcornfJYUsagl
        X1Lssx4Y1rkBQbEQ5fo2o0ga8A==
X-Google-Smtp-Source: ACHHUZ66sG2YdOyyWQNbNN2f5oMRfBf+HALD5+I6vSStwtWpPZoO7gqk6SSw9Tijyo1NrGhfmNFjjw==
X-Received: by 2002:a19:7115:0:b0:4f3:b242:aa98 with SMTP id m21-20020a197115000000b004f3b242aa98mr9732949lfc.30.1687724762965;
        Sun, 25 Jun 2023 13:26:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 15/26] ARM: dts: qcom: apq8064: declare SAW2 regulators
Date:   Sun, 25 Jun 2023 23:25:36 +0300
Message-Id: <20230625202547.174647-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 471eeca6a589..1eb6d752ebae 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -425,25 +425,41 @@ acc3: clock-controller@20b8000 {
 		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw2_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw3_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-- 
2.39.2

