Return-Path: <linux-arm-msm+bounces-2904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3FE800E44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5857C281BF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73199495EE;
	Fri,  1 Dec 2023 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GsWDNJ7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF8110DF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:14:46 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cdd405ca77so2199138b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443686; x=1702048486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beKD8U42oVG/LPkYMpuiHwtdIQIz07SaBd5mVxpojp4=;
        b=GsWDNJ7hcVWO7R7fS8kXZDkRU2GrEiO8pQAEWP2PXr3Rt4UdOhlW6LDNwy6zg/1uu3
         w9Ty/ny+sn9lQKWroXzOJi5eqAUP2ZfVQNWql/Rb5mHejSMIdCUC1mSmgGODT1DVnRFk
         pnhuTLXsyNXcRxt5/4dJ3PYZtu4zgo1U+DJpmz3NL5navh0bAxkxUEGWBBpuqlgN8AF5
         DPCcILbCCojk+mDxDBv+bUQaUk6pTuRL1ImtnS5C4kwexq6o8uz4R9kxuf134WZKhXGj
         sbm73cOkgsE2fuFoFg8vk/o57wWBfgeAdKC4t8s8mQ4f/MwwaCMIGWLnoboOCB9Xt/If
         l2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443686; x=1702048486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beKD8U42oVG/LPkYMpuiHwtdIQIz07SaBd5mVxpojp4=;
        b=HWDVidKERNvOy2R/6Z1r2y2cgzu0nGnR096J6sHtO+LjaynSlW1q2XhAYPAfjKAiUg
         M+KLIpk5TYTQnpnxfaG5+7wPyfuzFqdKZei9/P9s3o9hVN1iNE9hoQE4DUGlEavh3Ctf
         h/0bURXusjfM1/K6xz2EZdBRU3rybND7ouqKj1aOjLjrIGJ00EheqkS2v3Fua28NueK2
         DTkqbqg6Vl0jX6dq+RHvsUM+BLneJ5ZeAHR/zrSuuR3fNCXTvy+hstqXX82HRdSIVX0P
         nPwtfGdJKCkUzTG42JC4+xSCPPdDwchJlVJs6FpKW3W9D3ypoRgRP3zaIxy4Ej11fvXL
         OirQ==
X-Gm-Message-State: AOJu0YzuktwpPZ3SAVHfnWmYyTemMZ6IHcclyo07oQGWox24sM/xlRaF
	j6SXUxqyn2DAvkSZUwz7fNTp
X-Google-Smtp-Source: AGHT+IEI1gQxHgxIVFSXBW3Lr4VkCQKmvityUZ3YN6dTPUUdQJ6TYB6K3ddDoLazcxETDunDTEe2MA==
X-Received: by 2002:a05:6a20:9712:b0:187:9f15:bfc7 with SMTP id hr18-20020a056a20971200b001879f15bfc7mr22594590pzc.27.1701443681635;
        Fri, 01 Dec 2023 07:14:41 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 04/13] scsi: ufs: qcom: Remove superfluous variable assignments
Date: Fri,  1 Dec 2023 20:44:08 +0530
Message-Id: <20231201151417.65500-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many instances where the variable assignments are not needed.
Remove them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 778df0a9c65e..dc93b1c5ca74 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -219,7 +219,7 @@ static int ufs_qcom_enable_lane_clks(struct ufs_qcom_host *host)
 
 static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
 {
-	int err = 0;
+	int err;
 	struct device *dev = host->hba->dev;
 
 	if (has_acpi_companion(dev))
@@ -237,7 +237,7 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
 static int ufs_qcom_check_hibern8(struct ufs_hba *hba)
 {
 	int err;
-	u32 tx_fsm_val = 0;
+	u32 tx_fsm_val;
 	unsigned long timeout = jiffies + msecs_to_jiffies(HBRN8_POLL_TOUT_MS);
 
 	do {
@@ -292,9 +292,9 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
  */
 static int ufs_qcom_host_reset(struct ufs_hba *hba)
 {
-	int ret = 0;
+	int ret;
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	bool reenable_intr = false;
+	bool reenable_intr;
 
 	if (!host->core_reset) {
 		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
@@ -417,7 +417,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 				      enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int err = 0;
+	int err;
 
 	switch (status) {
 	case PRE_CHANGE:
@@ -463,7 +463,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
 	u32 core_clk_period_in_ns;
 	u32 tx_clk_cycles_per_us = 0;
 	unsigned long core_clk_rate = 0;
-	u32 core_clk_cycles_per_us = 0;
+	u32 core_clk_cycles_per_us;
 
 	static u32 pwm_fr_table[][2] = {
 		{UFS_PWM_G1, 0x1},
@@ -1418,7 +1418,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 		bool scale_up, enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int err = 0;
+	int err;
 
 	/* check the host controller state before sending hibern8 cmd */
 	if (!ufshcd_is_hba_active(hba))
@@ -1689,7 +1689,7 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
 	struct platform_device *pdev = to_platform_device(hba->dev);
 	struct ufshcd_res_info *res;
 	struct resource *res_mem, *res_mcq;
-	int i, ret = 0;
+	int i, ret;
 
 	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
 
-- 
2.25.1


