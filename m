Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4306C2C61A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgK0J0w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgK0J0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:26:52 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC1EC0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:26:51 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id j10so5204910lja.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovfcInOG2jOIO3bucTekrPlXYPy5EuGmFzoylmEoRJM=;
        b=jlFIAgo1CP/Y55tYPrnGC9LBcj6StbievRJG3daE8JfQ9RzShEmVc8EKG5IQvWcdqS
         AwVNf9zeXA0HIxjSIMS4oxYjSPV1hDYBpDzcK6xrC67yoUhA2Z12eitstZ7K1xHVDR9X
         bKvm8CuyBMgzwgkd/ZWpu4QhBtZ3fCC5Z6UnGv0A2saEJMX7wnq91pVApMEZ+Tcfbw9q
         b3jqtz83p4zHnSCw0C2DgsD5CaafgxvuP4Dwj61uTa0LLjvuUH1xXOwCy+p+t/DmgXUt
         LLzggjE+Sr8SJPHsKuWlGw0nL2fee4IcMHeWv+fqb1W6097MdkNiTtyF/5qnxYIOuQV8
         q/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovfcInOG2jOIO3bucTekrPlXYPy5EuGmFzoylmEoRJM=;
        b=DZQx/50PoewK47GHpqv2OdBCGyXhc1/BLDJqleae0rBNCkAgWCaLR2lNRhH8nU4y1w
         2k9A3eCN68ZK3tvA8T/GeZuaCphVHImx4FHz4fwbQ+2UhHZ+tsoNmVAWsxYI6JZl3hKR
         q1gZYWbmK7ghEyoIgvP2ZoSaD0PAbuy/OUpjL5tzoZwy4GhYVZPfcnynLa984y7tXrS9
         mWUkB2Eigos+ICd80keYzhq6MWrrn6v7xPaNgfgcj+1tOpRn65ocM8lvwXvlU/MEx6zz
         qqncQuOABXd0dFT4IHThhkMh7dJDXnS3Eh/ZJNNM+OFHV9+MGRt23e8sri4Mk78bXw1h
         8T5A==
X-Gm-Message-State: AOAM530oayl+eqmIWZj1wMuQIAXytz834fm+m14ztts6HVDqPMErem7E
        eFdkkQaRHEUIrsznpgBFHuBL4A==
X-Google-Smtp-Source: ABdhPJzbo8zcHzExty01+hclVYEYCheAooe0Kdh4kfzOi2r8taEpjvlzh1hzDyNKOOxed5q1B0zjEQ==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr2944951ljg.465.1606469210197;
        Fri, 27 Nov 2020 01:26:50 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
        by smtp.gmail.com with ESMTPSA id v28sm623877lfo.27.2020.11.27.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:26:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: sm8250-mtp: enable USB host nodes
Date:   Fri, 27 Nov 2020 12:26:46 +0300
Message-Id: <20201127092646.122663-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable both USB host controller, hsphy and qmpphy nodes on sm8250. Add
missing pm8150 ldo18 definition (used by USB qmp phys). Both controllers
are locked to host mode: dual role on first controller is not enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index cc57fce0d505..8797c9e5dcbf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -284,6 +284,13 @@ vreg_l17a_3p0: ldo17 {
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l18a_0p9: ldo18 {
+			regulator-name = "vreg_l18a_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	pm8150l-rpmh-regulators {
@@ -643,3 +650,49 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 	vdda-pll-max-microamp = <19000>;
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p875>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p9>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p875>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p9>;
+};
-- 
2.29.2

