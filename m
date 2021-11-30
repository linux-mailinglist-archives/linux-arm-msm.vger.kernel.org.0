Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEDE463FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 22:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344049AbhK3V1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 16:27:16 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:55803 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344007AbhK3V1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 16:27:07 -0500
Received: from localhost.localdomain (adsl-d210.84-47-0.t-com.sk [84.47.0.210])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 129473F3F2;
        Tue, 30 Nov 2021 22:23:46 +0100 (CET)
From:   Martin Botka <martin.botka@somainline.org>
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: qcom-rpmpd: Add sm6125 power domains
Date:   Tue, 30 Nov 2021 22:23:29 +0100
Message-Id: <20211130212332.25401-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings for sm6125 SoC RPM Power Domains

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 340b0ffe5eb8..0006a2930dcc 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -219,12 +219,20 @@
 #define SM6115_VDD_LPI_CX	6
 #define SM6115_VDD_LPI_MX	7
 
+/* SM6125 Power Domains */
+#define SM6125_VDDCX		0
+#define SM6125_VDDCX_AO		1
+#define SM6125_VDDCX_VFL	2
+#define SM6125_VDDMX		3
+#define SM6125_VDDMX_AO		4
+#define SM6125_VDDMX_VFL	5
+
 /* QCM2290 Power Domains */
 #define QCM2290_VDDCX		0
-- 
2.34.0

