Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810FF27998B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIZNMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZNMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:12:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBDCC0613CE;
        Sat, 26 Sep 2020 06:12:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x23so1960898wmi.3;
        Sat, 26 Sep 2020 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gsjNITkh5YR5pGsbZMMxt3tvrXpmG8+mzhmnAdwt/Rc=;
        b=YBlp0XGj/PUZ6Zdhkp/8uGqaxq1MxW+FG4MoKOf71zKOCnSgUgIaVvihCLaPvcc9Iv
         58A2FiHOSTmOSEKo6UVLjC1JEWRIZOgSlV3sfUsjxgXwmY28LCAJpGdtpTDKuM9fm1d5
         RV+0KocxsYt/LRGyI/rOExw5QDLGJwFosElU7IxSsKqk+JM4QLOTu8wKOV2ayGeEWwS6
         n1J0npt1SZ2Lo386VgS5hsbrw2lUqiq3TzNYZaS7qJHEFXPe67NG9OAa8nFJQ9NLC0PT
         Dxfcz30vd6TTKdUcB3x4EC4Ym1DqywrnyxL1cqQZDBd/pl6lbHT7BhJ/ARWtYfitthkT
         F0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gsjNITkh5YR5pGsbZMMxt3tvrXpmG8+mzhmnAdwt/Rc=;
        b=mRz3jrCZNjdt5kSF3NQaT8j36WIY2CSMZ9NfhT9L5hIqM4InRhijI+GynUYK1qxiu+
         YIjYnqOO5vexLT8mzLZR6aqVLxPyGTEiOv50CcbvYjLIsx1b/rdRv+0ZjbpKuGACbKKy
         Yp+Ni17DOqRjgi+2orX9QEv9Z9B9R+kyVZKh8SxF+C186u+AlwjvyuWIQJJkrHiZHgS/
         b8PkcvgsgTI04GxorIsc8WYBXPhb+TttT07uyf68h+iiIaAYxpIjPlKZeVvRv754ajtA
         x8wEK2n1KYDtD1NEAAqq2GnRxfZaBNIpO+ETNxVKMqApJxb0tv8m+32JvFLIQT0Wws/K
         WMTg==
X-Gm-Message-State: AOAM532aJ8RgrQ0h1/9TAm/oOety/m1XsdQJ3TAHiEKcYZFSuRDlVlSO
        V/fuchGcH+gGPIXTVzWhqtE=
X-Google-Smtp-Source: ABdhPJz3GP1BYW6za+Y7HeAOCnWq61oyhJjnta17SILv/Dy5fVTt43tz5VRmFSlBsoZ+W5MfuaGj2g==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr2575522wmg.172.1601125921224;
        Sat, 26 Sep 2020 06:12:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id j14sm6792031wrr.66.2020.09.26.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:12:00 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, kishon@ti.com, robh+dt@kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
Date:   Sat, 26 Sep 2020 15:11:57 +0200
Message-Id: <20200926131157.14633-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

QUSB on these SoCs actually uses *almost* the same
configuration that msm8996 does, so we can reuse
the phy_cfg from there with just a single change
(se clock scheme).

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index ccda92859eca..97dae24752b4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,ipq8074-qusb2-phy
               - qcom,msm8996-qusb2-phy
               - qcom,msm8998-qusb2-phy
+              - qcom,sdm660-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 557547dabfd5..a4d706b361b9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -702,7 +702,8 @@ static int qusb2_phy_init(struct phy *phy)
 	usleep_range(150, 160);
 
 	/* Default is single-ended clock on msm8996 */
-	qphy->has_se_clk_scheme = true;
+	if (!of_device_is_compatible(phy->dev.of_node, "qcom,sdm660-qusb2-phy"))
+		qphy->has_se_clk_scheme = true;
 	/*
 	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
 	 * clock scheme is selected. If yes, then disable differential
@@ -818,6 +819,10 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,sdm660-qusb2-phy",
+		/* sdm630/660 use the same config as msm8996. */
+		.data		= &msm8996_phy_cfg,
 	}, {
 		/*
 		 * Deprecated. Only here to support legacy device
-- 
2.28.0

