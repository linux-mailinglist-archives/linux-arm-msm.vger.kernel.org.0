Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00963099A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhAaBbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:31:46 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:37949 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhAaBbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:31:46 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id B7DEA1F66A;
        Sun, 31 Jan 2021 02:31:02 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom_scm: Add MDM9607 compatible
Date:   Sun, 31 Jan 2021 02:30:57 +0100
Message-Id: <20210131013058.54299-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for MDM9607. It uses the "legacy" calling
convention.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 drivers/firmware/qcom_scm.c                             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 78456437df5f..df8379356021 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -12,6 +12,7 @@ Required properties:
  * "qcom,scm-ipq4019"
  * "qcom,scm-ipq806x"
  * "qcom,scm-ipq8074"
+ * "qcom,scm-mdm9607"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7be48c1bec96..b5b9b13d8d29 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1265,6 +1265,9 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 							     SCM_HAS_BUS_CLK)
 	},
 	{ .compatible = "qcom,scm-ipq4019" },
+	{ .compatible = "qcom,scm-mdm9607", .data = (void *)(SCM_HAS_CORE_CLK |
+							     SCM_HAS_IFACE_CLK |
+							     SCM_HAS_BUS_CLK) },
 	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
 	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
 	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
-- 
2.30.0

