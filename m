Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798232E7FEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgLaMZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgLaMZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:25:25 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C54DC0617A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:09 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id h205so43736512lfd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ae+eotDOGUM6TKajZH+vbsOlioJYe6VPg6q5P3xKHJA=;
        b=Bz1s8pRNAqjTEcnosb6WR0Qt4kZFkzotm+XUWaNNxpkZUMUaEZSUqFWK8Pglm1vlrn
         IO2cZLdPzluiUIibr/2+wudvQdGDplf+AzNbN6syubqQlgQO0DFjKYs1CgOO4TMBBDhi
         fPBfD7nXYcyYX/nuu6SiqZihSNSfxnpRq/jJJcLNasmEC8UFtdn2jCD7yty7UkJnShsV
         DVOPo2k1j8EG2maP19Z1ODZAu4Bgjnz9D4D4l5XJm1C8nzFTIf5oXlKxsdUhsTT+Kqev
         8u7MnExvxcJlidB01dRTbA6x+VBWGrfVTqclRRbnOsWSdSOst6wRWTJbPO1Z5dGS8FuC
         EZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ae+eotDOGUM6TKajZH+vbsOlioJYe6VPg6q5P3xKHJA=;
        b=QL1wfxLrjXgnAATeeKYi0HWevZYC3iC+x/Pg9NipkVRiH1J+ZC9cJ26u4Oj9KiG7Ie
         zAwl4hIQuzBX38sgAtkUj6D62HesRvtzKjOZokqUd2Z4vNs5A/CQMJT9haXVASJf9s3E
         HWsa+aTZLCtpn2+S2dg5gZWOtLqLPRTEF/LdNyUoFFQmyKm0Hab9P1CZlSy9cBZK8PbG
         obLMiyY8gH12jgJmnYtF9/uiELPh1oQGkTQ3LlW9yK6yEA2ALJqZkNt8kzvpNqt3+D1L
         RdtRyLReWe+NIrh7a2v7r7skbh3AJkdwgz6xy784zTz2mVQFk4SDDlUKcWrmrHk73LV+
         sayw==
X-Gm-Message-State: AOAM533rZbkJRPEjhMQINHPG1C2qVqGKMmt/5K7zxKZ/LT8yi6nMsY6M
        cImCYVmZYIHFhvNDf1EghHzxnznZgd2o8A==
X-Google-Smtp-Source: ABdhPJx7Se/0vCxP9CeAwpFZ9PjPE48wfYldMnSGcYFD5AWua2+R3SlTLFwwkQkbgE3Et1WMURVf0Q==
X-Received: by 2002:a2e:a58b:: with SMTP id m11mr27105451ljp.329.1609417447810;
        Thu, 31 Dec 2020 04:24:07 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id n10sm428569lji.99.2020.12.31.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:24:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: qrb5165-rb5: fix pm8009 regulators
Date:   Thu, 31 Dec 2020 15:23:48 +0300
Message-Id: <20201231122348.637917-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix pm8009 compatibility string to reference pm8009 revision specific to
sm8250 platform. Also add S2 regulator to be used for qca639x.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: b1d2674e6121 ("arm64: dts: qcom: Add basic devicetree support for QRB5165 RB5")
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cbced45d7f51..5c1cc836920f 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -140,7 +140,7 @@ qca639x: qca639x {
 
 &apps_rsc {
 	pm8009-rpmh-regulators {
-		compatible = "qcom,pm8009-rpmh-regulators";
+		compatible = "qcom,pm8009-1-rpmh-regulators";
 		qcom,pmic-id = "f";
 
 		vdd-s1-supply = <&vph_pwr>;
@@ -149,6 +149,13 @@ pm8009-rpmh-regulators {
 		vdd-l5-l6-supply = <&vreg_bob>;
 		vdd-l7-supply = <&vreg_s4a_1p8>;
 
+		vreg_s2f_0p95: smps2 {
+			regulator-name = "vreg_s2f_0p95";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1f_1p1: ldo1 {
 			regulator-name = "vreg_l1f_1p1";
 			regulator-min-microvolt = <1104000>;
-- 
2.29.2

