Return-Path: <linux-arm-msm+bounces-3868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B4809CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A56FD281B2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC808D51B;
	Fri,  8 Dec 2023 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDJ/1kBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A581984
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:20 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so13259935ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018760; x=1702623560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxwk551dNXF7eGBqSesuNZZ5bUVezIJLfHSd1F1iOFQ=;
        b=WDJ/1kBsMY4hucIVyMGLZqtb5blAeDeb+dRrxlyvUMKhh9FEBEYu4Fa2XHxy3MKQE6
         Z1et48zOaAXOk10VXh6qxGFez9ZBUapHZ93rZLO0QXqD9mZA9C8GVux+FGP6Ge+B7aG0
         5wt4XPwgVQSqxYMwogpJk+644daI3bL/+DYStIgStbDQOMXfwHESX/FLYDNkuoRCrxFV
         uLhiSouAJuR8rGzPt9L5z4bSmOp2IJk7T8ipC03TRLolG4W1TtB7L+m6uIGYLTbfMYdW
         84BrUhlRaWdQDMkgwQKrd8tG3LQTdXiKTbx6DE/Co9M2fHWinLnkJSSxthaBcU5nGVhP
         0aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018760; x=1702623560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxwk551dNXF7eGBqSesuNZZ5bUVezIJLfHSd1F1iOFQ=;
        b=XtxwNYRESMFxxVoLDtK4YsGxvbG4agtQeK31QZP0IGeEI6qwdmn/7gSvdUW8Orbq4q
         TxNydXSmomAhAMDZRA9UGGvEgZxkeJioLO5mHbu3yCb46xp3SPXIxd1RfUu3RE01wJcn
         on2ZYxBSyYQQ6XKPer7XN2cdLZ6+t5YglVPA25PjCLBKBOjgbDvNn60VrM5nAfMGyiif
         vdfSDxhjSNRh+IVdrDtLb03bEwfPNDGPxQSu5/aGwohCHG4NiIPyfDrPWBrWB/94+ldr
         Z2lh8ppjN3gpzAInx4HWYMOOQPNCmcg11/ibUuSgwF+P/zXaQmU2n2XHXIQNnPcJeYYA
         YyZQ==
X-Gm-Message-State: AOJu0Yx+XoSWkzSKA7eql0AKIxRMYkz4PbEq9PCkFrnuL2w4xZrtnmLm
	AZkYzphCugocig3hgSd8PI5f
X-Google-Smtp-Source: AGHT+IEkoR7dWArUlpalfnxds9mQVbxsXb/Ae51VkkL95E/8Ul7u+C4yDK+IX+0+FLByp5ZxPxQ5wA==
X-Received: by 2002:a17:902:e811:b0:1d0:c229:a01b with SMTP id u17-20020a170902e81100b001d0c229a01bmr3939511plg.48.1702018759791;
        Thu, 07 Dec 2023 22:59:19 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:19 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	ahalaney@redhat.com,
	quic_nitirawa@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 01/17] scsi: ufs: qcom: Use clk_bulk APIs for managing lane clocks
Date: Fri,  8 Dec 2023 12:28:46 +0530
Message-Id: <20231208065902.11006-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lane clock handling can be simplified by using the clk_bulk APIs. So let's
make use of them. This also get's rid of the clock validation in the driver
as kernel should just rely on the firmware (DT/ACPI) to provide the clocks
required for proper functioning.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 94 ++-----------------------------------
 drivers/ufs/host/ufs-qcom.h |  6 +--
 2 files changed, 7 insertions(+), 93 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 96cb8b5b4e66..cbb6a696cd97 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -194,52 +194,12 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
 }
 #endif
 
-static int ufs_qcom_host_clk_get(struct device *dev,
-		const char *name, struct clk **clk_out, bool optional)
-{
-	struct clk *clk;
-	int err = 0;
-
-	clk = devm_clk_get(dev, name);
-	if (!IS_ERR(clk)) {
-		*clk_out = clk;
-		return 0;
-	}
-
-	err = PTR_ERR(clk);
-
-	if (optional && err == -ENOENT) {
-		*clk_out = NULL;
-		return 0;
-	}
-
-	if (err != -EPROBE_DEFER)
-		dev_err(dev, "failed to get %s err %d\n", name, err);
-
-	return err;
-}
-
-static int ufs_qcom_host_clk_enable(struct device *dev,
-		const char *name, struct clk *clk)
-{
-	int err = 0;
-
-	err = clk_prepare_enable(clk);
-	if (err)
-		dev_err(dev, "%s: %s enable failed %d\n", __func__, name, err);
-
-	return err;
-}
-
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
 {
 	if (!host->is_lane_clks_enabled)
 		return;
 
-	clk_disable_unprepare(host->tx_l1_sync_clk);
-	clk_disable_unprepare(host->tx_l0_sync_clk);
-	clk_disable_unprepare(host->rx_l1_sync_clk);
-	clk_disable_unprepare(host->rx_l0_sync_clk);
+	clk_bulk_disable_unprepare(host->num_clks, host->clks);
 
 	host->is_lane_clks_enabled = false;
 }
@@ -247,43 +207,14 @@ static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
 static int ufs_qcom_enable_lane_clks(struct ufs_qcom_host *host)
 {
 	int err;
-	struct device *dev = host->hba->dev;
-
-	if (host->is_lane_clks_enabled)
-		return 0;
 
-	err = ufs_qcom_host_clk_enable(dev, "rx_lane0_sync_clk",
-		host->rx_l0_sync_clk);
+	err = clk_bulk_prepare_enable(host->num_clks, host->clks);
 	if (err)
 		return err;
 
-	err = ufs_qcom_host_clk_enable(dev, "tx_lane0_sync_clk",
-		host->tx_l0_sync_clk);
-	if (err)
-		goto disable_rx_l0;
-
-	err = ufs_qcom_host_clk_enable(dev, "rx_lane1_sync_clk",
-			host->rx_l1_sync_clk);
-	if (err)
-		goto disable_tx_l0;
-
-	err = ufs_qcom_host_clk_enable(dev, "tx_lane1_sync_clk",
-			host->tx_l1_sync_clk);
-	if (err)
-		goto disable_rx_l1;
-
 	host->is_lane_clks_enabled = true;
 
 	return 0;
-
-disable_rx_l1:
-	clk_disable_unprepare(host->rx_l1_sync_clk);
-disable_tx_l0:
-	clk_disable_unprepare(host->tx_l0_sync_clk);
-disable_rx_l0:
-	clk_disable_unprepare(host->rx_l0_sync_clk);
-
-	return err;
 }
 
 static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
@@ -294,26 +225,11 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
 	if (has_acpi_companion(dev))
 		return 0;
 
-	err = ufs_qcom_host_clk_get(dev, "rx_lane0_sync_clk",
-					&host->rx_l0_sync_clk, false);
-	if (err)
-		return err;
-
-	err = ufs_qcom_host_clk_get(dev, "tx_lane0_sync_clk",
-					&host->tx_l0_sync_clk, false);
-	if (err)
+	err = devm_clk_bulk_get_all(dev, &host->clks);
+	if (err <= 0)
 		return err;
 
-	/* In case of single lane per direction, don't read lane1 clocks */
-	if (host->hba->lanes_per_direction > 1) {
-		err = ufs_qcom_host_clk_get(dev, "rx_lane1_sync_clk",
-			&host->rx_l1_sync_clk, false);
-		if (err)
-			return err;
-
-		err = ufs_qcom_host_clk_get(dev, "tx_lane1_sync_clk",
-			&host->tx_l1_sync_clk, true);
-	}
+	host->num_clks = err;
 
 	return 0;
 }
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 9950a0089475..e2df4c528a2a 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -213,10 +213,8 @@ struct ufs_qcom_host {
 	struct phy *generic_phy;
 	struct ufs_hba *hba;
 	struct ufs_pa_layer_attr dev_req_params;
-	struct clk *rx_l0_sync_clk;
-	struct clk *tx_l0_sync_clk;
-	struct clk *rx_l1_sync_clk;
-	struct clk *tx_l1_sync_clk;
+	struct clk_bulk_data *clks;
+	u32 num_clks;
 	bool is_lane_clks_enabled;
 
 	struct icc_path *icc_ddr;
-- 
2.25.1


