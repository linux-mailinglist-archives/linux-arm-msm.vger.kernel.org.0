Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9427820C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 01:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjHTX6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 19:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbjHTX6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 19:58:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0FEAA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 16:58:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50079d148aeso1134495e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 16:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692575894; x=1693180694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lY5n8pvkZ+2T1rqIQ+TPmE/hW2jf5Gx3K91sbxE80mc=;
        b=jjwSYY0dMPHSPnYcJMc/+qkpHjd8baHB8UdX63W+hH3G2lcC2S5lAwWMbqPcOEIIpR
         2HSgDSXFh5tl7cGitQjwUWFhnqfk7nwhOtmnolu9+nwq25ybtjzEFvLJmkvzMwAUVR+J
         7aEjvZmfbW8AYZvFV04jd9Q7LS2J5bYzLjUqiLoXlJ+r1Arns86VVRfNxLJrV2S7WPw5
         FUXNgmtazKvyNZVJzuWe5WsiXd2ZKGBPBo/ZfGEFHDk+nlCMfRP2KqFFRmCDeEISkq8i
         5zqcEQSGoP1XwL/kzg1W1/Ea79gDqCKBt35pd6Ck9kRD4iaCvB+fB0oYpPJTHNV0wlC1
         tcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692575894; x=1693180694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lY5n8pvkZ+2T1rqIQ+TPmE/hW2jf5Gx3K91sbxE80mc=;
        b=VjS1xGWfq5OEtr910gXU+eubTkQgmgbJs9l/zjsfcDF+GTYrnlYh6zg5Q20PjjVOtU
         ntGedJCbvu2uCuVu9JG/jquMevUwJCsXMTrwNrpI7GdBoPtOCGtHy+49q8m6Ea5zLnua
         J7EXL9scXFe+qt7JEKgfARLGI/7kDffD2N4Mt37TckBvwOcfPTYkr732/f0uuUYI1DgL
         FhPAN774yaZcYXo9yctddj9BxLw7QMDZlhBsiixjdh50rH7Xbd9bX2BLiNF3t2v4ZooC
         3UFXPV1QIbtYaJ3sfmqS/JReQb0rHkY1K8c4cHYAJB83Zr+F97Osegg/3D/ARF2LBM0g
         RD6g==
X-Gm-Message-State: AOJu0YyRVfzPLybzPHbWURAIiLMNtntLQ60kxiGTmy8DXl3Ym0gNvIWL
        u54G7fTNOpeOnhenUe0oDe8DmRuKYfFNFl0M4ng=
X-Google-Smtp-Source: AGHT+IFfkquvhaHxM3dAUzYxcyY2IICA+/G1U9dK+yXHGz4Q4pHDjl9E0SLnTnXpnELmzni8Xp+05A==
X-Received: by 2002:a05:6512:1047:b0:4ff:8aad:8c7b with SMTP id c7-20020a056512104700b004ff8aad8c7bmr4344495lfb.68.1692575894450;
        Sun, 20 Aug 2023 16:58:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h9-20020ac24da9000000b004ff9ed89408sm1442599lfe.193.2023.08.20.16.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 16:58:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-qmp-combo: fix clock probing
Date:   Mon, 21 Aug 2023 02:58:13 +0300
Message-Id: <20230820235813.562284-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During rebase of qcom-qmp-combo series a call to devm_clk_bulk_get_all()
got moved by git from qmp_combo_parse_dt_legacy() to
phy_dp_clks_register(). This doesn't have any serious effect, since the
clocks will be set in both legacy and non-legacy paths. However let's
move it back to place anyway, to prevent the driver from fetching clocks
twice.

Fixes: 28e265bf84a8 ("phy: qcom-qmp-combo: simplify clock handling")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9c3de41ecedb..cbb28afce135 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3067,12 +3067,6 @@ static int phy_dp_clks_register(struct qmp_combo *qmp, struct device_node *np)
 	if (ret)
 		return ret;
 
-	ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
-	if (ret < 0)
-		return ret;
-
-	qmp->num_clks = ret;
-
 	return 0;
 }
 
@@ -3332,6 +3326,12 @@ static int qmp_combo_parse_dt_legacy(struct qmp_combo *qmp, struct device_node *
 	if (ret)
 		return ret;
 
+	ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
+	if (ret < 0)
+		return ret;
+
+	qmp->num_clks = ret;
+
 	return 0;
 }
 
-- 
2.39.2

