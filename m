Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D3463F66B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 18:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiLARob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 12:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiLARoS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 12:44:18 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3031B71D8
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 09:44:09 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 136so2292074pga.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mbDirqLKXr/5FgIX54AJCxh8nLq142NlZCiPSIMpPM=;
        b=sni+VE39ph4Wmu0pSL4SAxtRsH0USVCJEeh0Ru52p3PFG6T8aN2b62f8x+Jr3HDW8Z
         Rm7k+dqCqcvwqG8aN3CcVm7W8EjC3sLjebFHJWv4hMdDy/rqncSvSKCf8YolNNIC3oBu
         4QPGEUjE4DyX3DKjfY5J4JaiD0wXub7mvBy1zlZ+x3Vvbow3lNGzbC+qxGJuvSWim41W
         Om84NnbGTEop+u7Is8zBg8KDji2uhDdiyPJ5yWgHtOacWRt+q/GLvTm0ddA2gs688Bm5
         20dfDRKUvHN/AF3qq8atg9JOX73GN1l6GaVZvtHn8JPxqN+MPoOngeKV9SFphBuK1gJB
         x9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mbDirqLKXr/5FgIX54AJCxh8nLq142NlZCiPSIMpPM=;
        b=VUeEosQYmezJMhF/ilGoxwVIgA3p76xYgDbBeZFRfXNhMKN2+c1xM0JyVPvCINhaph
         4nE+wKAqy18qELhx8AXyS8wJ519SBu1wPskHUbpF/N+7N5CZJy0douGmWJRfqU8oY0ye
         unlCT3HAcW75P1sKFP9mzX+dR4/jylTN7MnMaOlxGW7WIF93Wt1VaFkSMURR5INPEwlx
         39rjt109R+jmWRpjim3t5a170Hx3h75JEwhTWNz0GHmJCEQCzS+WOfaVuVwxt6mCeNiK
         VBZjoCL/pP9VLVYe/xVUF+1P3WYJLxnGWIPwv71TRs2czOJQ4523pJyQ/10WU9tuiSLM
         F8GQ==
X-Gm-Message-State: ANoB5pn79tVM9Lp8e0KsLrUEhhAHY9ddMjbwRGPBmIW6xaKNf5X35oP/
        NkS22nyvaBZyDnxnQ+W9X9W5
X-Google-Smtp-Source: AA0mqf6tDTI+X3TwNGz54Kh+X1FOzooq89OmoICdtqmBjTnZWRiH7OBEycCI7N9VfWSUb485MxkmAA==
X-Received: by 2002:aa7:8542:0:b0:575:3c6a:f05c with SMTP id y2-20020aa78542000000b005753c6af05cmr20007862pfn.25.1669916648890;
        Thu, 01 Dec 2022 09:44:08 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.39])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016d9b101413sm3898743pll.200.2022.12.01.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:44:08 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 04/23] phy: qcom-qmp-ufs: Add support for configuring PHY in HS Series B mode
Date:   Thu,  1 Dec 2022 23:13:09 +0530
Message-Id: <20221201174328.870152-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org>
References: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add separate tables_hs_b instance to allow the PHY driver to configure the
PHY in HS Series B mode. The individual SoC configs need to supply the
serdes register setting in tables_hs_b and the UFS driver can request the
Series B mode by calling phy_set_mode() with mode set to PHY_MODE_UFS_HS_B.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 516027e356f0..2d5dd336aeb2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -547,6 +547,8 @@ struct qmp_phy_cfg {
 
 	/* Main init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_cfg_tbls tbls;
+	/* Additional sequence for HS Series B */
+	const struct qmp_phy_cfg_tbls tbls_hs_b;
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
@@ -580,6 +582,7 @@ struct qmp_ufs {
 	struct reset_control *ufs_reset;
 
 	struct phy *phy;
+	u32 mode;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -841,6 +844,8 @@ static void qmp_ufs_pcs_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls
 static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg *cfg)
 {
 	qmp_ufs_serdes_init(qmp, &cfg->tbls);
+	if (qmp->mode == PHY_MODE_UFS_HS_B)
+		qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_b);
 	qmp_ufs_lanes_init(qmp, &cfg->tbls);
 	qmp_ufs_pcs_init(qmp, &cfg->tbls);
 }
@@ -1011,9 +1016,19 @@ static int qmp_ufs_disable(struct phy *phy)
 	return qmp_ufs_exit(phy);
 }
 
+static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+
+	qmp->mode = mode;
+
+	return 0;
+}
+
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.power_on	= qmp_ufs_enable,
 	.power_off	= qmp_ufs_disable,
+	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.25.1

