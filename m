Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CDD3F353C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238717AbhHTUb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:31:56 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:34209 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238945AbhHTUbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:31:55 -0400
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 82DC03F319;
        Fri, 20 Aug 2021 22:31:15 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: power: rpmpd: Add SM6350 to rpmpd binding
Date:   Fri, 20 Aug 2021 22:31:01 +0200
Message-Id: <20210820203105.229764-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820203105.229764-1-konrad.dybcio@somainline.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and constants for the power domains exposed by the RPMH
in the Qualcomm SM6350 platform.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 4807b560f00d..53405aac75c5 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sc8180x-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
+      - qcom,sm6350-rpmhpd
       - qcom,sm8150-rpmhpd
       - qcom,sm8250-rpmhpd
       - qcom,sm8350-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 8b5708bb9671..fed59c104900 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -20,6 +20,14 @@
 #define SDX55_MX	1
 #define SDX55_CX	2
 
+/* SM6350 Power Domain Indexes */
+#define SM6350_CX	0
+#define SM6350_GFX	1
+#define SM6350_LCX	2
+#define SM6350_LMX	3
+#define SM6350_MSS	4
+#define SM6350_MX	5
+
 /* SM8150 Power Domain Indexes */
 #define SM8150_MSS	0
 #define SM8150_EBI	1
-- 
2.33.0

