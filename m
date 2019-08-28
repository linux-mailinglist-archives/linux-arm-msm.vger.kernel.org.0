Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43967A0A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 21:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfH1TSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 15:18:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41037 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfH1TSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 15:18:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so228615pgg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=frRCVqPEFMbhw8WqpjXDJar8k8pcOq5o3U1C6HdWuBw=;
        b=Yjb6U4UM55j8Qd5lit9icVMiTabO3K/CK55xecjtlEFvjf+4Pdftmlehf2ZPI1XIYc
         XrzRw9OqguPYP/qHWihbXPRn6ybHx6rhep7dXtDjlsOroLX5AKsTmUPW7cm/2xjS/Hp6
         dw/ffiytgOzt9ZYxOZAGv7I+35KMp+ivU2u9dlKLMgz6xEtf26Wysin8jIrSgFYnq3Jb
         C3i14S5BW5mrcB8yH9ljDgWNGHe4oAX3+91T+dNOO1xbJK+SMB6UxpfRUikAymXzARuy
         Gv5nYSbgbCB8hb+Ruc8hubVmChEAiViAlTyrKPrLdvfCuzC5B9R6HU1RSuen7bquT3Dg
         Rgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=frRCVqPEFMbhw8WqpjXDJar8k8pcOq5o3U1C6HdWuBw=;
        b=DNhBz7GnFAKxvShT3nATl1K9pGeHFrDCemjt7ekGwByPsSGhE7TNxULXiodmJllPGt
         05wxWUDrWXjaswtU1WbDiyIJTGuFt5lfmgkv2rRRbGk56tHs5hZb8vMmQG5ufTIZkz9n
         EIMXpWaUDc4ScrfvURL0inUDOAYg+dqRiwl01tj3POCfbI7zK8HXmsoLWRQmN7xZ5JMg
         veaZjiZkfuinDkKl0njrrcryMiXO8D8ZAbgJb7+wFajg3sQtM2A59wl9Ux82vT3nL0EE
         X7RlxxoTAlg4md4SCz+n6fZLeJjMl/iA1BLojiLCaZkoV5velVuDYFw2fAS1ZZvLxUq6
         iQSw==
X-Gm-Message-State: APjAAAUXl2zu79DGTaD6rSFiFTbct6h818cbNXYL+gVr8WOiW0kHRKvn
        1Np5JG4HZ/Kcgdf21O1eAolp9g==
X-Google-Smtp-Source: APXvYqwrFTCnXoqdHbgZohuVx98l8XulzgZc2FWKZBE02LtPNRDCRgfcbpdHghyq8UYkjWZjVa3ZRw==
X-Received: by 2002:a63:e948:: with SMTP id q8mr4686361pgj.93.1567019882331;
        Wed, 28 Aug 2019 12:18:02 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n128sm122717pfn.46.2019.08.28.12.18.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 12:18:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, Bean Huo <beanhuo@micron.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 1/3] scsi: ufs: Introduce vops for resetting device
Date:   Wed, 28 Aug 2019 12:17:54 -0700
Message-Id: <20190828191756.24312-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some UFS memory devices needs their reset line toggled in order to get
them into a good state for initialization. Provide a new vops to allow
the platform driver to implement this operation.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

 drivers/scsi/ufs/ufshcd.c | 6 ++++++
 drivers/scsi/ufs/ufshcd.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 219c435d69a7..0fb4bfdd7943 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6235,6 +6235,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
 	int retries = MAX_HOST_RESET_RETRIES;
 
 	do {
+		/* Reset the attached device */
+		ufshcd_vops_device_reset(hba);
+
 		err = ufshcd_host_reset_and_restore(hba);
 	} while (err && --retries);
 
@@ -8371,6 +8374,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		goto exit_gating;
 	}
 
+	/* Reset the attached device */
+	ufshcd_vops_device_reset(hba);
+
 	/* Host controller enable */
 	err = ufshcd_hba_enable(hba);
 	if (err) {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 9f61550abc7f..c94cfda52829 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -298,6 +298,7 @@ struct ufs_pwr_mode_info {
  * @resume: called during host controller PM callback
  * @dbg_register_dump: used to dump controller debug information
  * @phy_initialization: used to initialize phys
+ * @device_reset: called to issue a reset pulse on the UFS device
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -326,6 +327,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
+	void	(*device_reset)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
@@ -1070,6 +1072,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 		hba->vops->dbg_register_dump(hba);
 }
 
+static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->device_reset)
+		hba->vops->device_reset(hba);
+}
+
 extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /*
-- 
2.18.0

