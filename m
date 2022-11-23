Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD218635176
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbiKWHvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbiKWHu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:50:26 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077ABFC715
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:50:04 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b21so15916428plc.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2Xd0gDlZp0b1F7R46Bn1beu0377yVMDIxRd9gxYrRE=;
        b=j4a2IZ4M/RPn02KaaMa7o/DiXf8mhGrp8hO1u8giHS105CGBy7ebnfzwcG4Ysm3Z2K
         kaxfRevnkU72bEifmC5K/ilMeVXZC9kdXRrTFph5Dd+4P+gg5yT0H8eKeBDNCUnZMhtP
         8jmhF5FG90qgX6YdP3X5BzL5dHnPipH0647G5o5q7eTUZ14l9ax7zB8kQD3IOmHSbPAp
         Xrq4yyYFYxZ4ktvd7X0uVK724lPuIJgYS24OpnuTkgzYzkBp76epnP7TMIby91Wvq1aR
         dRCLodWM9m1RMxYDJD4rlsjA9RGAVl8nD3+7Vki373kL62fuNXYaEOdHVl2WpUu1DKjc
         0HTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2Xd0gDlZp0b1F7R46Bn1beu0377yVMDIxRd9gxYrRE=;
        b=UQkY/fR57QSV3/hzv0tToGEFk808hAE/R5Es53bcQTELBBfSAN6PS8bm3tPJ//ARwY
         h7JtaWHHNR7k7wUwheqojrfGT0jg/UAcda27jnOXqBvLppAmJC0sIdIBiEy53FUNzUY6
         80SbyM0bKPnGngiHrexTUiZuboK+KUYTYU6AD/rLZ4bBJbMrPMlDAIlFJM7hV+XiMncm
         gVccpgB5BcehzQ4xT9BuxuaNAPDVCoxoyKhkfsK2OMgJ00RhIghTyv1GKVyu5o3LED6h
         QaQnBfd7bDWjguNMOJXK3/Pvd/oYY/zbH0x+LXYIKdbELXKkCFj5b8ppq9P43B85adu5
         LdMw==
X-Gm-Message-State: ANoB5plFHHBIAc4K1eGdujopxQ3C8JSwNC63vG1Ra+LLGDq2WLJCHIe1
        cDCRk/toVxm6406gaL09eCUr
X-Google-Smtp-Source: AA0mqf4EA/xu0LNp5Eeym9s5QmhuOi/k38g2Q5DDLTpsDvRmwE7yo049HbunO3rvytSj8UQTUayfsw==
X-Received: by 2002:a17:902:b184:b0:189:1d01:a4ae with SMTP id s4-20020a170902b18400b001891d01a4aemr8039549plr.93.1669189804266;
        Tue, 22 Nov 2022 23:50:04 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:50:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 15/20] scsi: ufs: core: Add reinit_notify() callback
Date:   Wed, 23 Nov 2022 13:18:21 +0530
Message-Id: <20221123074826.95369-16-manivannan.sadhasivam@linaro.org>
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

reinit_notify() callback can be used by the UFS controllers to perform
changes required for UFS core reinit.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd-priv.h | 6 ++++++
 include/ufs/ufshcd.h           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index f68ca33f6ac7..37260c1af9f0 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -226,6 +226,12 @@ static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
 		hba->vops->config_scaling_param(hba, p, data);
 }
 
+static inline void ufshcd_vops_reinit_notify(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->reinit_notify)
+		hba->vops->reinit_notify(hba);
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 9f28349ebcff..09927a011a84 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -297,6 +297,7 @@ struct ufs_pwr_mode_info {
  * @config_scaling_param: called to configure clock scaling parameters
  * @program_key: program or evict an inline encryption key
  * @event_notify: called to notify important events
+ * @reinit_notify: called to notify UFS core reinit
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -335,6 +336,7 @@ struct ufs_hba_variant_ops {
 			       const union ufs_crypto_cfg_entry *cfg, int slot);
 	void	(*event_notify)(struct ufs_hba *hba,
 				enum ufs_event_type evt, void *data);
+	void	(*reinit_notify)(struct ufs_hba *);
 };
 
 /* clock gating state  */
-- 
2.25.1

