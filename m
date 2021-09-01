Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91B33FDF2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 17:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344010AbhIAP6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 11:58:40 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:37985 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343842AbhIAP6h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 11:58:37 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CBBF03F40F;
        Wed,  1 Sep 2021 17:57:38 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        robh@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v7 5/6] MAINTAINERS: Add entry for Qualcomm CPRv3/v4/Hardened driver
Date:   Wed,  1 Sep 2021 17:57:34 +0200
Message-Id: <20210901155735.629282-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
References: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add maintainers entry for the Qualcomm CPR3/CPR4/CPRh driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f1db301fae..abff8d4555f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15493,6 +15493,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
 F:	drivers/soc/qcom/cpr.c
 
+QUALCOMM CORE POWER REDUCTION v3/v4/Hardened AVS DRIVER
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
+F:	drivers/soc/qcom/cpr3.c
+
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
 M:	Ilia Lin <ilia.lin@kernel.org>
 L:	linux-pm@vger.kernel.org
-- 
2.32.0

