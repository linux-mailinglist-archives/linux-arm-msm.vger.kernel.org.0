Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2180B45A1F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 12:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbhKWLzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 06:55:15 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37470 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236587AbhKWLxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 06:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637668210; x=1669204210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=7/gMbCtAXli/isQMOGRh4m5xxrb/6LKlexYvHRPVb0Q=;
  b=E+B5c9WRLKkmgQB9gG32Wg7S5QoELUpSnFW5Sz7Z/yWTAlIZ1FaSGqEh
   wG+e5V9T/VXybe/A9J8XaRyGRdoeFpU9T31eah5Sjtc7/ZnepxI6WPDOG
   u5fDt9Ay2k4pEgRwRgjvP8Jhe2rgJbdf8v54sEKouj17jPT5WiENVuRT4
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Nov 2021 03:50:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:50:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:50:10 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:50:06 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <swboyd@chromium.org>,
        <mka@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd
Date:   Tue, 23 Nov 2021 17:19:27 +0530
Message-ID: <1637668167-31325-4-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pmg1110 pmic regulators support.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index bef3037..cb0aaf8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -23,6 +23,18 @@
 	};
 };
 
+&apps_rsc {
+	pmg1110-regulators {
+		compatible = "qcom,pmg1110-rpmh-regulators";
+		qcom,pmic-id = "k";
+
+		vreg_s1k_1p0: smps1 {
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+		};
+	};
+};
+
 ap_tp_i2c: &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.7.4

