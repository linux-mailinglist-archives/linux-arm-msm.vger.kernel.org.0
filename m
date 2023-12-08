Return-Path: <linux-arm-msm+bounces-3878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E567A809CBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913671F212D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F17EFBE6;
	Fri,  8 Dec 2023 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0ARUHZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB0B173C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 23:00:12 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0ccda19eeso14900815ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 23:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018812; x=1702623612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdbM2PfYii852DpHOsW1XBn04AhqRFyeEuBtlshPQPM=;
        b=i0ARUHZIMZo3TUvm3DwNHIDr/NbD045vDQfkr+NwCagtWvBDh+YCk7qXGqv1vasn33
         169Y9Kf9/+7TqODM+Gfc6eCXo1ik3h221iInYdO/xD3BTc/YR4m2VILeMSyvp9tktLuq
         EI6pNvaJ+bKijhMCWbqyZUmGZLSieTm1DIlJfnLsOxxBwaXIARaH1kcfzeAW5PkeQmB4
         ApHH2FICEypauGNsRCEmzu28k6ydo4HLH7lDCBXwGxu+xq3UWk+IzJgVn4dnfPLytKnZ
         y0ILhJtutPFvAgf5SDeGCHzMmYPZsa9mM4nbTjyCDeaS62kFYAWs/knyxaFYiMaE/znw
         NQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018812; x=1702623612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdbM2PfYii852DpHOsW1XBn04AhqRFyeEuBtlshPQPM=;
        b=mMtsheWdEbEIfey/ZYcbQXurhq2nyrcKqUmoqPZKX81+W0zXMMqr3nyvayaaQwadAi
         RrZ61pnQjbWyTrCCol8SBtlw0W9TIGs3PU2v1VkwFYYJFZmXyqfihGUamchsiE+C7sis
         vx/eRCoJZW6cCfOk1jyy/Dd0lem/cSa+m8TT8FHXf2i3DCcPYIkiaQxHRtNT/YMu2uo3
         PondZv5xRBF3/eCUNq0nXZWrQ6v97++4b6TtwG+obmVS4oaa3lV3tBvLY1qoP25CEXNi
         LfySMaektYIoIGquPZWD6iNqITFRufa/p63abNBXkRWuJPMlDxWPgFuOmPBW9byxgozD
         qoXw==
X-Gm-Message-State: AOJu0YyqXJ1WHkRKyijj9Wsmk0qJKFja1XnEfACyhHbw2KJuYWIGmUjo
	9vAHu+o0DOb6rBw46PAGarpFMy4zaA98Ke3ZpQ==
X-Google-Smtp-Source: AGHT+IGv+GAPa6Ypg344o0UlsXWILp6Hb3RQcQuHpl5BD9CYuBn23Qp5TZa5x8eqFhl33IaLmcYJxg==
X-Received: by 2002:a17:903:2115:b0:1d0:a0dd:7d3b with SMTP id o21-20020a170903211500b001d0a0dd7d3bmr2951714ple.65.1702018811863;
        Thu, 07 Dec 2023 23:00:11 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.23.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:00:11 -0800 (PST)
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
Subject: [PATCH v2 11/17] scsi: ufs: qcom: Remove unused ufs_qcom_hosts struct array
Date: Fri,  8 Dec 2023 12:28:56 +0530
Message-Id: <20231208065902.11006-12-manivannan.sadhasivam@linaro.org>
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

ufs_qcom_hosts array is assigned, but not used anywhere. So let's remove
it.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 -----
 drivers/ufs/host/ufs-qcom.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index ae9fafa49ded..18ea41f5bae9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -90,8 +90,6 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_MAX][0][0]		    = { 7643136,	307200 },
 };
 
-static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
-
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
 
@@ -1194,9 +1192,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 
 	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
 
-	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
-		ufs_qcom_hosts[hba->dev->id] = host;
-
 	ufs_qcom_get_default_testbus_cfg(host);
 	err = ufs_qcom_testbus_config(host);
 	if (err)
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index e2df4c528a2a..53db424a0bcb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -10,7 +10,6 @@
 #include <soc/qcom/ice.h>
 #include <ufs/ufshcd.h>
 
-#define MAX_UFS_QCOM_HOSTS	1
 #define MAX_U32                 (~(u32)0)
 #define MPHY_TX_FSM_STATE       0x41
 #define TX_FSM_HIBERN8          0x1
-- 
2.25.1


