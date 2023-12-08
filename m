Return-Path: <linux-arm-msm+bounces-3872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97E809CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A559F281B2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14F7DF40;
	Fri,  8 Dec 2023 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIuWUZwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66B1199A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:41 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce72faf1e8so1276630b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018781; x=1702623581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5bBF/sQbySCYPg7WmDeYMVJLCmITb9mfETbIB5H8fc=;
        b=bIuWUZwDoM+8k8PEx/f7kPnNqpxLPkvkh+4Q5i2cT79IuqAG+tHePzik/VKmr6y1+N
         avvvPlGhMw4IR7+1SIw06XkWQhnPhAM+pISfC8v/IN1o6WY8wDP/m5gR7RxKJxrJkFUV
         V1UkyiKMq4MhiphhAiwT2IUF1+uJke5qmbEKr1SNsyJUAeng0EGTE5OdPdf3U73n7Xti
         6k0V3p+awVtjYKFbQWb+kOMNcQlLW+XWi9Y0Of1uVMH9dE/JoxBHFeDBgMPCfgqnYlhp
         Gpx9phsOa2q9xMj5VR/yplv0ovboJGW0OqxJ+y5Jp4K84om0KpbUAxPCE1kp6aTc29F/
         RuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018781; x=1702623581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5bBF/sQbySCYPg7WmDeYMVJLCmITb9mfETbIB5H8fc=;
        b=G8B+y9Va+Hptie0WixVVRW3QrrGCv6yCYz6zvupzLILOVN6r0MGvQ/OINklT6hgZA0
         lpXZUFcTce+3j6+kwK5uEEPWtRcELJgRnrqrDwP+voINAWgyV9XUd8P+gfOWmEJrQP2/
         5CdE/tVGhqc+2TDHMd1fK5m647OyKSCuCS/duSWoVCFjU5N0DFiIe6xZpeq47m9Yvton
         UlfcjYXUoXNe73eCSpiU9jVW1imnpCFBXprKVgr7MuRX1ysH40KYoxzvGYqV3JVq3A5B
         u/bXdQMdiMtLx98wkVwmhvmdY8uZmYGb+QBUHmWZHUb5h0dVqj6rPC4nRG0Wh2Vdvxl4
         2hdw==
X-Gm-Message-State: AOJu0YwC9bDuwF49JjOjRCK7HUOMQlfB7nN0s2iEkZmUZsd1AiT+mJTV
	oJDrdAtjU0FXUmbsEmDHfUiH
X-Google-Smtp-Source: AGHT+IHXYrZKT2ATj4oKtlQJr6YZvfZhqey7ziao9xfgNWvfFicMV4V7v7/6dsujySPQoidr6LTevA==
X-Received: by 2002:a05:6a21:32a0:b0:18f:c6ac:807f with SMTP id yt32-20020a056a2132a000b0018fc6ac807fmr3439182pzb.51.1702018781119;
        Thu, 07 Dec 2023 22:59:41 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:40 -0800 (PST)
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
Subject: [PATCH v2 05/17] scsi: ufs: qcom: Remove the warning message when core_reset is not available
Date: Fri,  8 Dec 2023 12:28:50 +0530
Message-Id: <20231208065902.11006-6-manivannan.sadhasivam@linaro.org>
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

core_reset is optional, so there is no need to warn the user if it is not
available.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index dc93b1c5ca74..d474de0739e4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	bool reenable_intr;
 
-	if (!host->core_reset) {
-		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
+	if (!host->core_reset)
 		return 0;
-	}
 
 	reenable_intr = hba->is_irq_enabled;
 	disable_irq(hba->irq);
-- 
2.25.1


