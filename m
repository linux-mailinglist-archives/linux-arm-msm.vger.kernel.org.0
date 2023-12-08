Return-Path: <linux-arm-msm+bounces-3880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A7809CC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486A21F213CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAED101C0;
	Fri,  8 Dec 2023 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeyAgzSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0033BD54
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 23:00:21 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d2eb06ab11so3998835ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 23:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018821; x=1702623621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGLbsXXGOS5hXbJdfbXpRGohhCcqKUKVxgEMXEAy08s=;
        b=YeyAgzSGcDH+2e7mqUPgeHxqYUjbbNguQ3NgSgLy8KXb37NZm2krkB/+f9OXYjUqMK
         sEXsPwQzfm+uGCGugVgye7qgyHpoIzFi30oGTubgjjR0Zb8aaZ0KMwJR9dGmm56SqqUu
         /PAijbv9nP/ZhIk4Lz2utUCTppKLSyXOX3Vnk/nIBpa1NGVPbMrBA04ecUlpVuXFjhHu
         JP2mo+qGTG4ljzQyXS279N6RjvkcSP+2IErsnn6ErgYnFc0H6HHYA/3SWJpTgMVMB9qP
         8o0frzK1OfXLKkrwI4GsYdojndt1+IH2U3HGknpFhmBlzlG6oo39RQvQXbx2z2mqXxsT
         73cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018821; x=1702623621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGLbsXXGOS5hXbJdfbXpRGohhCcqKUKVxgEMXEAy08s=;
        b=B6sORf320PXtlkEEDBq3RgF52ClyOBm55T4PzmGJoyw/0rD1ziWa7saKHJEDRWDpaK
         C3hCrMkQcaW/8W3MoIGj/e87OauCs+xPm4In5jI79DtSgZZ4pIAdSdypqNRoNiIUcQwx
         TFaKwXUbDGMwtMgeODChFY+OXxCYw51QmXDMNpCtAn45Qbpac2Z57wdjKTSph7abAzpb
         9JB9gu1aFOagLjo35JGp7rQ4Dkmo4wHoUGPIth8rRF5Wf8aMEqfBAVWUxE78nwWd6ILY
         hO1wYQrz+nhXqg2DbbFvkla4NL/8TuvmwJv+i/zJPgpdlRJIoKEnoJdhVdZbm3fFmC4n
         CcUA==
X-Gm-Message-State: AOJu0YzLbX/AhywJXjzXaREQf6EQCKJIfAjx/FaIjfEq8DFQCqBAocz9
	7rvDR7JDt7m9pIoVm3j7ZWv8
X-Google-Smtp-Source: AGHT+IFVUyG4dUS2LcbHQXN+dYuFi0KCByDG/dbfAzTMOhqxdP9LZSqbkTlmoGdGcQDFMbhwvqbFcw==
X-Received: by 2002:a17:902:b70d:b0:1d0:8c3c:a123 with SMTP id d13-20020a170902b70d00b001d08c3ca123mr3278106pls.38.1702018821392;
        Thu, 07 Dec 2023 23:00:21 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.23.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:00:20 -0800 (PST)
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
Subject: [PATCH v2 13/17] scsi: ufs: qcom: Initialize cycles_in_1us variable in ufs_qcom_set_core_clk_ctrl()
Date: Fri,  8 Dec 2023 12:28:58 +0530
Message-Id: <20231208065902.11006-14-manivannan.sadhasivam@linaro.org>
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

In case the "core_clk_unipro" clock is not provided, "cycles_in_1us"
variable will be used as uninitialized. So initialize it with 0.

Issue reported by Smatch tool:

drivers/ufs/host/ufs-qcom.c:1336 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.
drivers/ufs/host/ufs-qcom.c:1341 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 7fbd35a3eb81..9b3d6d3609c9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1298,7 +1298,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
 	struct ufs_clk_info *clki;
-	u32 cycles_in_1us;
+	u32 cycles_in_1us = 0;
 	u32 core_clk_ctrl_reg;
 	int err;
 
-- 
2.25.1


