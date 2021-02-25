Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A5C3258C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 22:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbhBYVhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 16:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbhBYVhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 16:37:10 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE241C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 13:36:14 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id B9DE8201A9;
        Thu, 25 Feb 2021 22:36:12 +0100 (CET)
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
Subject: [PATCH 2/2] iio: qcom-spmi-vadc: Add definitions for USB DP/DM VADCs
Date:   Thu, 25 Feb 2021 22:36:05 +0100
Message-Id: <20210225213605.117201-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210225213605.117201-1-konrad.dybcio@somainline.org>
References: <20210225213605.117201-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Some SoCs do have a USB DP/DM ADC at 0x43, 0x44.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/iio/qcom,spmi-vadc.h b/include/dt-bindings/iio/qcom,spmi-vadc.h
index 08adfe25964c..c7bb9ef1f9ed 100644
--- a/include/dt-bindings/iio/qcom,spmi-vadc.h
+++ b/include/dt-bindings/iio/qcom,spmi-vadc.h
@@ -72,6 +72,9 @@
 #define VADC_AMUX_PU2				0x3b
 #define VADC_LR_MUX3_BUF_XO_THERM		0x3c
 
+#define VADC_USB_DP				0x43
+#define VADC_USB_DM				0x44
+
 #define VADC_LR_MUX1_PU1_BAT_THERM		0x70
 #define VADC_LR_MUX2_PU1_BAT_ID			0x71
 #define VADC_LR_MUX3_PU1_XO_THERM		0x72
-- 
2.30.1

