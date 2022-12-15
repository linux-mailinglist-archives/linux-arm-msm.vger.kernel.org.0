Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D5464D575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 04:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiLODHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 22:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiLODHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 22:07:08 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8000552150;
        Wed, 14 Dec 2022 19:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1671073622; x=1702609622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fc+/8vFSou4s5+MOccYvq7ute0TTCtlSbQeVttuawN4=;
  b=d6/x1t6K6KRd/+59DKk1poAEjy742NrMkTMb0TFZUAYwr+Vfbr580UVm
   WzBIdedj3c6RN2Bq/iK+o8D0I6i+YKcPc3dN95oLcTK+0DxrZx1EpVqjo
   GQ8hYEBoMagMETMZtK0/MvguKabGzPja0r5ZxdNTybt+P8cBrVtp7cRwb
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Dec 2022 19:07:02 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 14 Dec 2022 19:07:02 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 0BB4B20DB9; Wed, 14 Dec 2022 19:07:02 -0800 (PST)
From:   Can Guo <quic_cang@quicinc.com>
To:     quic_asutoshd@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, Can Guo <quic_cang@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/3] ufs-host: qcom: Add MCQ ESI config vendor specific ops
Date:   Wed, 14 Dec 2022 19:06:22 -0800
Message-Id: <1671073583-10065-4-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671073583-10065-1-git-send-email-quic_cang@quicinc.com>
References: <1671073583-10065-1-git-send-email-quic_cang@quicinc.com>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MCQ ESI config vendor specific ops.

Co-developed-by: Asutosh Das <quic_asutoshd@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/host/ufs-qcom.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  5 +++
 2 files changed, 102 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 96a58b4..ea5b5f7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1568,6 +1568,101 @@ static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
 	return 0;
 }
 
+#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+static void ufs_qcom_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+
+	ufshcd_mcq_config_esi(hba, msg);
+}
+
+static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *__hba)
+{
+	struct ufs_hba *hba = __hba;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	u32 id = irq - host->esi_base;
+	struct ufs_hw_queue *hwq = &hba->uhq[id];
+
+	ufshcd_mcq_write_cqis(hba, 0x1, id);
+	ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+
+	return IRQ_HANDLED;
+}
+
+static int ufs_qcom_config_esi(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct msi_desc *desc;
+	struct msi_desc *failed_desc = NULL;
+	int nr_irqs, ret;
+
+	if (host->esi_enabled)
+		return 0;
+	else if (host->esi_base < 0)
+		return -EINVAL;
+
+	/*
+	 * 1. We only handle CQs as of now.
+	 * 2. Poll queues do not need ESI.
+	 */
+	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
+	ret = platform_msi_domain_alloc_irqs(hba->dev, nr_irqs,
+					     ufs_qcom_write_msi_msg);
+	if (ret)
+		goto out;
+
+	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
+		if (!desc->msi_index)
+			host->esi_base = desc->irq;
+
+		ret = devm_request_irq(hba->dev, desc->irq,
+				       ufs_qcom_mcq_esi_handler,
+				       IRQF_SHARED, "qcom-mcq-esi", hba);
+		if (ret) {
+			dev_err(hba->dev, "%s: Fail to request IRQ for %d, err = %d\n",
+				__func__, desc->irq, ret);
+			failed_desc = desc;
+			break;
+		}
+	}
+
+	if (ret) {
+		/* Rewind */
+		msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
+			if (desc == failed_desc)
+				break;
+			devm_free_irq(hba->dev, desc->irq, hba);
+		}
+		platform_msi_domain_free_irqs(hba->dev);
+	} else {
+		if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
+		    host->hw_ver.step == 0) {
+			ufshcd_writel(hba,
+				      ufshcd_readl(hba, REG_UFS_CFG3) | 0x1F000,
+				      REG_UFS_CFG3);
+		}
+		ufshcd_mcq_enable_esi(hba);
+	}
+
+out:
+	if (ret) {
+		host->esi_base = -1;
+		dev_warn(hba->dev, "Failed to request Platform MSI %d\n", ret);
+	} else {
+		host->esi_enabled = true;
+	}
+
+	return ret;
+}
+
+#else
+static int ufs_qcom_config_esi(struct ufs_hba *hba)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1595,6 +1690,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_hba_mac		= ufs_qcom_get_hba_mac,
 	.op_runtime_config	= ufs_qcom_op_runtime_config,
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
+	.config_esi		= ufs_qcom_config_esi,
 };
 
 /**
@@ -1628,6 +1724,7 @@ static int ufs_qcom_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_remove(hba);
+	platform_msi_domain_free_irqs(hba->dev);
 	return 0;
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 6912bdf..7937b41 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -54,6 +54,8 @@ enum {
 	 * added in HW Version 3.0.0
 	 */
 	UFS_AH8_CFG				= 0xFC,
+
+	REG_UFS_CFG3				= 0x271C,
 };
 
 /* QCOM UFS host controller vendor specific debug registers */
@@ -226,6 +228,9 @@ struct ufs_qcom_host {
 	struct reset_controller_dev rcdev;
 
 	struct gpio_desc *device_reset;
+
+	int esi_base;
+	bool esi_enabled;
 };
 
 static inline u32
-- 
2.7.4

