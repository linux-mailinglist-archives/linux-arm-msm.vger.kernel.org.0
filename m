Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CA6191DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 01:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgCYAHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 20:07:21 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:11975 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727228AbgCYAHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 20:07:21 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2020 17:07:20 -0700
Received: from asutoshd-linux1.qualcomm.com ([10.46.160.39])
  by ironmsg04-sd.qualcomm.com with ESMTP; 24 Mar 2020 17:07:19 -0700
Received: by asutoshd-linux1.qualcomm.com (Postfix, from userid 92687)
        id E99CA1F79D; Tue, 24 Mar 2020 17:07:19 -0700 (PDT)
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 3/3] scsi: ufs-qcom: Override devfreq parameters
Date:   Tue, 24 Mar 2020 17:07:05 -0700
Message-Id: <8595b24c49bd84974ced1fec5a8eecdeeae47746.1585094538.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
In-Reply-To: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Override devfreq parameters for power-performance
trade-off.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 6115ac6..0fb17e2 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/phy/phy.h>
 #include <linux/gpio/consumer.h>
 #include <linux/reset-controller.h>
+#include <linux/devfreq.h>
 
 #include "ufshcd.h"
 #include "ufshcd-pltfrm.h"
@@ -1689,6 +1690,21 @@ static void ufs_qcom_device_reset(struct ufs_hba *hba)
 	usleep_range(10, 15);
 }
 
+static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
+					  struct devfreq_dev_profile *p,
+					  void *data)
+{
+	static struct devfreq_simple_ondemand_data *d;
+
+	if (!data)
+		return;
+
+	d = (struct devfreq_simple_ondemand_data *)data;
+	p->polling_ms = 60;
+	d->upthreshold = 70;
+	d->downdifferential = 65;
+}
+
 /**
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1710,6 +1726,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
 	.device_reset		= ufs_qcom_device_reset,
+	.config_scaling_param = ufs_qcom_config_scaling_param,
 };
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

