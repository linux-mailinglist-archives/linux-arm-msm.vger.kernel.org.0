Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8F13258BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 22:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhBYVhA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 16:37:00 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:49677 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbhBYVgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 16:36:53 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 69C381F630;
        Thu, 25 Feb 2021 22:36:10 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: pmic-mpp: Add missing dt-bindings mpp function defs
Date:   Thu, 25 Feb 2021 22:36:04 +0100
Message-Id: <20210225213605.117201-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The pinctrl-spmi-mpp driver supports setting more mpp functions
than the ones defined in the dt-bindings header, specifically,
digital, analog and sink.

To follow the current way of specifying the function config
in Device-Tree, add the missing three definitions in the
appropriate dt-bindings header as:
GPIO_MPP_FUNC_{DIGITAL,ANALOG,SINK}.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
index 32e66ee7e830..3cdca7ee1b3f 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
@@ -98,6 +98,9 @@
 /* To be used with "function" */
 #define PMIC_MPP_FUNC_NORMAL		"normal"
 #define PMIC_MPP_FUNC_PAIRED		"paired"
+#define PMIC_MPP_FUNC_DIGITAL		"digital"
+#define PMIC_MPP_FUNC_ANALOG		"analog"
+#define PMIC_MPP_FUNC_SINK		"sink"
 #define PMIC_MPP_FUNC_DTEST1		"dtest1"
 #define PMIC_MPP_FUNC_DTEST2		"dtest2"
 #define PMIC_MPP_FUNC_DTEST3		"dtest3"
-- 
2.30.1

