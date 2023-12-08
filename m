Return-Path: <linux-arm-msm+bounces-3877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFC809CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1E1281B22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E52DF41;
	Fri,  8 Dec 2023 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwCmZLtz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C4D1733
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 23:00:07 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d053c45897so15930945ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 23:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018807; x=1702623607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoOVNeTfZvxRIC3uL7kjE8KmflrgcfElV/ugTIZ3BFU=;
        b=KwCmZLtzfSCH+x9hWctFcR/nNTj+bpNObKtuFEb3EGFPHCMpr9jV9m+WJQmAeTKd4y
         tagRMoCVcQEjRlSbvbyeL6lpIhUUi0NsydWMTPVuP+7ghJuICuzcPkyT+MH8Vc70ZN5H
         cKWV8cop1/h6bljcUrVk1vIQJ9XxSGXxGgjOjToYJsz8nTxG5pkCvvj/pz0oZ/SL6DXr
         OEEPbHxOrpJPPWxy4aSWPMgX7ssCMeon2UIHRC93lRvRCGRwVWQO8kNo3t7FYdDinA1c
         KzVEDmG70NT8VYjI69Dc0iinNp0xr1wJsuNMO2o2P5YtNI4eTLTb3gBlXuHNv7qu9VBp
         LWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018807; x=1702623607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoOVNeTfZvxRIC3uL7kjE8KmflrgcfElV/ugTIZ3BFU=;
        b=FUwYEJx7ZT6XA9ndcVq+Ab1SXyoJmrJkUe/L/0mS/LriRpsj+D9q5/5aLKBZH4xQb6
         ET6ql8GO/rvaBzjpSEPT9u6P8yH4IN+DLL2c1ecCCwp4zc5VkaUE9zdaPACVdkY9Ty83
         WLKtOBaVWSqpqkxwd5459SvLm2Pdk1xqxdqPjxtkiZHML+oX40rwN/+JkCmL13uH7TA/
         h8ikpYdILP+f0qfc3IA0FruMav3CDChud1F3sS0efIGpXEfCdsRKl1VswTdtq4kM6/U6
         yRD8bpIBe/wSKfgRRounYTx2FJT+DRBsvj3GDOyV4PWYCrV3M/8kJaBlPMYvmXpmCwlw
         Xd3g==
X-Gm-Message-State: AOJu0YwhF/KITTYkCx8XkN8jEHG2oM7vC2p5aZrmIBLs8ecSacxkZvrr
	Fz8bZql9HDPSZgCAlE9v/vvh
X-Google-Smtp-Source: AGHT+IFHXjjSzEnbJQ69uJyZLTm7fPUJl9zwEdBx4rjFX7xj02p474j1v153Jofqvy+9awTQ2dmKgg==
X-Received: by 2002:a17:902:d2cd:b0:1d0:6ffd:9e22 with SMTP id n13-20020a170902d2cd00b001d06ffd9e22mr4168124plc.116.1702018806680;
        Thu, 07 Dec 2023 23:00:06 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.23.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:00:06 -0800 (PST)
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
Subject: [PATCH v2 10/17] scsi: ufs: qcom: Use dev_err_probe() to simplify error handling of devm_gpiod_get_optional()
Date: Fri,  8 Dec 2023 12:28:55 +0530
Message-Id: <20231208065902.11006-11-manivannan.sadhasivam@linaro.org>
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

As done in other places, let's use dev_err_probe() to simplify the error
handling while acquiring the device reset gpio using
devm_gpiod_get_optional().

While at it, let's reword the error message to make it clear that the
failure is due to acquiring "device reset gpio".

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 05a9a25bc34c..ae9fafa49ded 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1148,9 +1148,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	host->device_reset = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(host->device_reset)) {
-		err = PTR_ERR(host->device_reset);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
+		err = dev_err_probe(dev, PTR_ERR(host->device_reset),
+				    "Failed to acquire device reset gpio\n");
 		goto out_variant_clear;
 	}
 
-- 
2.25.1


