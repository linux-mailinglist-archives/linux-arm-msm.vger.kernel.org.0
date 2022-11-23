Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6214E635158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbiKWHtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236094AbiKWHtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:49:15 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0A5FAEBA
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:06 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id w4so7140687plp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ+MoCrzv+gfQQlMeW5WbAnmXRNL0HTRmdnVMxPl0cY=;
        b=rTVDZnzCbprEOjWhm+OWYfVd3SVRZhCSkGhAb8ZFiWFAeIq8pMUGmVrS1DV0RCTXz4
         RtvpSBrlsnnWjpUMod2BPbot9BTJ+fSHYSU5Gj2CTBsIss4fTozJfFcMU32rYErsCJeI
         JxANAljaFOM8fe4KPlHmCPaJ2G+XP7IDfOyp/TXWEgO9OtobP8RmOBRHznIaDFYQ2zCO
         bZ1XXLB2c0XDOh3o1H8w0qGReU5YYqlQvLVUXgEPPH01qpcWxITAhYt6iwijrg7ALIHl
         s9vnUys5X2DW6GwJwbkveHNxwbPwKUQhV6OSKF5V098puOuEVHiAcO6tqUA5PcowdSNO
         BQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ+MoCrzv+gfQQlMeW5WbAnmXRNL0HTRmdnVMxPl0cY=;
        b=DWcX/E/kVKYaNBUkChGctW3JtIO0jzGXs94LllbsIiZHLOk1Pxmbrm1/amKZQDWOtM
         nVQgCQ5k9hQ3MDnP8+G6S5EsNQfKPHQZMyqVnmeHXcO9zXUuL0APgbAI7R0q6VKUEhQ1
         f48QKUjGXhiV7OnKEW/wmjgjc/Ffol9ZzLdTib5Hy8MkDMT9lvYnO8941MtRcU7wXm81
         qaqUDhL/N2tF3Z4Dm/6OHzMrH9maKjNgIH5wvrRJBNTHBGz+5rWhtXClzVIF6RBiJEW9
         WA/RPKX/rmHXoFFZE2z57Xkn+rM1KFYDBKMQ/zUxkbw/Q3tVJN6WIQvF3NnevO5sRGg3
         4xCA==
X-Gm-Message-State: ANoB5plf7m52U7j9k/gTNFTJeWXexaX5xgcs880YQHmd/qcVzSv1xfUU
        QBsuACHwqynd8WzS0D/jrEIQ
X-Google-Smtp-Source: AA0mqf7t739TpdcQ3ko/yzBAkk8CJjjbrbWW5NFxLKP3l+rmMq+NCR2N2qvUCyO4zu8PHoRl++US/g==
X-Received: by 2002:a17:90a:5918:b0:213:df25:7e8a with SMTP id k24-20020a17090a591800b00213df257e8amr36106769pji.154.1669189745683;
        Tue, 22 Nov 2022 23:49:05 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:49:04 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 05/20] phy: qcom-qmp-ufs: Add support for configuring PHY in HS G4 mode
Date:   Wed, 23 Nov 2022 13:18:11 +0530
Message-Id: <20221123074826.95369-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
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

Add separate tables_hs_g4 instance to allow the PHY driver to configure the
PHY in HS G4 mode. The individual SoC configs need to supply the Rx, Tx and
PCS register setting in tables_hs_g4 and the UFS driver can request the
Hs G4 mode by calling phy_set_mode_ext() with submode set to UFS_HS_G4.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 694b1d6c1f9c..1b6e76bf82e5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -553,6 +553,8 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_cfg_tbls tbls;
 	/* Additional sequence for HS Series B */
 	const struct qmp_phy_cfg_tbls tbls_hs_b;
+	/* Additional sequence for HS G4 */
+	const struct qmp_phy_cfg_tbls tbls_hs_g4;
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
@@ -587,6 +589,7 @@ struct qmp_phy_cfg {
  * @pcs_misc: iomapped memory space for lane's pcs_misc
  * @qmp: QMP phy to which this lane belongs
  * @mode: PHY mode configured by the UFS driver
+ * @submode: PHY submode configured by the UFS driver
  */
 struct qmp_phy {
 	struct phy *phy;
@@ -600,6 +603,7 @@ struct qmp_phy {
 	void __iomem *pcs_misc;
 	struct qcom_qmp *qmp;
 	u32 mode;
+	u32 submode;
 };
 
 /**
@@ -894,7 +898,11 @@ static void qmp_ufs_init_registers(struct qmp_phy *qphy, const struct qmp_phy_cf
 	if (qphy->mode == PHY_MODE_UFS_HS_B)
 		qmp_ufs_serdes_init(qphy, &cfg->tbls_hs_b);
 	qmp_ufs_lanes_init(qphy, &cfg->tbls);
+	if (qphy->submode == UFS_HS_G4)
+		qmp_ufs_lanes_init(qphy, &cfg->tbls_hs_g4);
 	qmp_ufs_pcs_init(qphy, &cfg->tbls);
+	if (qphy->submode == UFS_HS_G4)
+		qmp_ufs_pcs_init(qphy, &cfg->tbls_hs_g4);
 }
 
 static int qmp_ufs_com_init(struct qmp_phy *qphy)
@@ -1086,6 +1094,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 
 	qphy->mode = mode;
+	qphy->submode = submode;
 
 	return 0;
 }
-- 
2.25.1

