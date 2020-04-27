Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7041BB0C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 23:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgD0Vvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 17:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726257AbgD0Vvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 17:51:52 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B738CC03C1A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 14:51:52 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h69so9296867pgc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2US+UFErdQz+/2WUCZdQSrynGNoBUJIwL6mFZZjO4Zk=;
        b=R/EIr+RRamTRbKEAIuBhHKtxaZewTjKE+LoWnkc6pD9eXhURKoBWUI4TmJyQusVmxP
         jOByzuGCKpFdP9gc4/+Qkuces3cOPbZGbpK8Xb0bGwpey/X184pwhchY4wkJaj1Ja18d
         ezEjZlzbb/RPusZpc4a8A7uzoMB90e2nYlB6QmhrB/GCOW5qjRYmeC4clKzYjjTQJz62
         A5LU5tKEnL0jix2gPrIJMSTx2tQpcWR8K5FQRSml2SIT/K/F0hI2tj/EiZYa27s6232T
         0q3JFgy7tEtWSEeVAMXJtCJAgPIoeElTBbGf6s68t3zak1GwAXvtYfIeSsJPxgZGokhg
         vmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2US+UFErdQz+/2WUCZdQSrynGNoBUJIwL6mFZZjO4Zk=;
        b=kB61GTeQeknYStA574OR1mXxNWdHP4qUw2kaiOVeXDD2aolRtSsJ3ztZGSLryP90Ir
         Ql4XMlQN0ol4J+V0vWf6amkjJWGHF6jufgyqtpW51nXCcrV9kd9q9akA5gb+p4BG9tqe
         PkDv4C+ZAHN/ujzPcDK4PAAdCAE6pF/qDfN8H7Y5iPNxXUguREVSCuaMLjS73VPvOTS7
         3Y9Wn8GaFYq46UwdWOFSue76GKvlwv0MQ2h9win9J8Tz4dHg+uvsXKORKri6fw8l9hqb
         QtSR9PBXfsUAxwlk7Xc0NiSggkuHVrWa6rtiwmhqN+HKQIc8xZ2oJr6ybb556Z0FApL8
         aVCQ==
X-Gm-Message-State: AGi0PuaPs2627Iw+mInlD/VRXyYL/CcK89kq040hKqd21c3RgW3MzS+d
        +GB5kTDC3SfCrKmyhNZxwGKxlg==
X-Google-Smtp-Source: APiQypI9w3mN/5nhDZ6PT2DjOc9Txq+MTciQT5JDWxwj7p1+7MIALxUJUUbrsUd/RNQXKiPBr/2zFg==
X-Received: by 2002:a63:241:: with SMTP id 62mr5334082pgc.38.1588024311660;
        Mon, 27 Apr 2020 14:51:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j5sm4153876pfh.58.2020.04.27.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 14:51:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250-mtp: Drop PM8150 ldo11
Date:   Mon, 27 Apr 2020 14:51:17 -0700
Message-Id: <20200427215117.2900139-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8150 ldo11 on the MTP is wired to VDD_SSC_CX and controlled in levels,
rather than as a regulator. As such it's available from the rpmhpd as
the SM8250_LCX power domain.

Fixes: ec13d5c23a33 ("arm64: dts: qcom: sm8250-mtp: Add pm8150, pm8150l and pm8009")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index e9acda9f5b83..0c6b936be471 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -136,13 +136,6 @@ vreg_l10a_1p8: ldo10 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l11a_0p75: ldo11 {
-			regulator-name = "vreg_l11a_0p75";
-			regulator-min-microvolt = <800000>;
-			regulator-max-microvolt = <800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
 		vreg_l12a_1p8: ldo12 {
 			regulator-name = "vreg_l12a_1p8";
 			regulator-min-microvolt = <1800000>;
-- 
2.24.0

