Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C023FCB5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 18:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbhHaQTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 12:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239902AbhHaQTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 12:19:42 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA447C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:18:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id l10so5471592lfg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a90IV7Egq/r+3uDHoTAyGeC9Z9/mMbft4v1gvx1iTU4=;
        b=C2UzrMOR6kUCej434fOZWsrMKiKkqdvr7GsK3WyLzBeU+LMCRj/3hMIOnE4zAo6q1B
         Mh1NZIDg9kqx8D9qxmpal7VDmXb2p2qeCNBLGLMwYze4PAvnc5mHbKB5rgJHmtMVKSdz
         W1W00LGVdI/Mpl63aPGO4xVZPaP5K8lZ/NQj6j4Uz7Bh2UlM8TdBek9sAXJXLyWtFdmO
         57vgC0XPXYpqWYtSeSZgWtBfZzK7vpfBqOIRCVCGYXu1zJCE29zMr+0qsBbEiFsvvCVK
         payeP93XdbCpHVeU0nW9pwQoic+nzObFal49gyJcbtx2Rdida7Yx0xXt2sUbromlEVEk
         roRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a90IV7Egq/r+3uDHoTAyGeC9Z9/mMbft4v1gvx1iTU4=;
        b=PnGExg8T+2UbjmNMnNw6iaS6EuWXdcK0f5uSAblNS31bxrX4v5XlIjK+Uv3zNcqy+u
         LkawxASsqfXaKBZi31MYl135AKnLSrbq/8VZ0WjmyEDmQsoEoZLNS+cCk90SX4xtyLeU
         xmGiCVeUwGmwLUMByH8JrwquzfHploGglxRYv4v0hZDuRz4yqg77GH59EMmHIz7xxb1t
         o8dLwWSPKY0JCFQc5+S9BAwGzqaM8irB5MKP9rRgz6ryFxPiUe0sh7yP8rrAKBlVHGwc
         IDvTfibKP7u9SIqDzkK62kMuBAtuMq/dTIIVdJeVx4WDKbzTIfcSwNTlzfW8Cy2NV9Ba
         g+4Q==
X-Gm-Message-State: AOAM5325uxtk7s/DEr61h3+s3FFndmTYFDSIuZPeni6h+2O7Y69dyrlA
        fwpTtkIn0Z810u50IEQoyBxHow==
X-Google-Smtp-Source: ABdhPJzifFsef3GDCXzguVsyIROXhZRUe/DucjCQcBVM729U62bC3OXOVxEZbc/hRih0rPLr3Vq41g==
X-Received: by 2002:a19:ac42:: with SMTP id r2mr21676423lfc.167.1630426725009;
        Tue, 31 Aug 2021 09:18:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q11sm2229921ljp.91.2021.08.31.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:18:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh-regulator: fix pm8009-1 ldo7 resource name
Date:   Tue, 31 Aug 2021 19:18:43 +0300
Message-Id: <20210831161843.1044580-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix a typo in the pm8009 LDO7 declaration, it uses resource name ldo%s6
instead of ldo%s7.

Fixes: 951384cabc5d ("regulator: qcom-rpmh-regulator: add pm8009-1 chip revision")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c         | 6 ++++++
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 764f4b81017e..486a653e2fea 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -114,6 +114,11 @@ static enum drm_mode_status dp_connector_mode_valid(
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
 
+static struct drm_encoder *dp_connector_best_encoder(struct drm_connector *connector)
+{
+	return to_dp_connector(connector)->dp_display->encoder;
+}
+
 static const struct drm_connector_funcs dp_connector_funcs = {
 	.detect = dp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -126,6 +131,7 @@ static const struct drm_connector_funcs dp_connector_funcs = {
 static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
 	.get_modes = dp_connector_get_modes,
 	.mode_valid = dp_connector_mode_valid,
+	.best_encoder = dp_connector_best_encoder,
 };
 
 /* connector initialization */
diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6cca910a76de..7f458d510483 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -991,7 +991,7 @@ static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
 	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
 	{}
 };
 
-- 
2.33.0

