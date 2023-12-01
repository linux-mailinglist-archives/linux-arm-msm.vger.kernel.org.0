Return-Path: <linux-arm-msm+bounces-2910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEF800E4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49C3281BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB2B4A99B;
	Fri,  1 Dec 2023 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqcaiHbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA831985
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:15:09 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6cdce15f0a3so2572407b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443709; x=1702048509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64ppbjLuXnC3sRRee6xAp4YeL9+LAF3VOykBfQp43DQ=;
        b=NqcaiHbD9GEc1QdsywbH+1UAg6UVzN8fpEYFb9BqCPy8/OjnHyfEE/WF58C8a4gTkx
         wLcbXFvyQTq9BWcDY7/nuEgaV5OuKl9+L4xbhxUdFNU/KhlDvbNpcvpbgDzXl9NW6C8I
         3Zwg72HTkUQJgwNRYUnnNrzwsBgj3KJUeyzy5JU/ikEYk1kseUj4TkcngNmSa7+VAHHE
         4CD7wcv4fmktMwc/aWiqdm5UWfvfeTQnQ7laJkyUugKJTAQXxT7gK5Jikk23GhffpnZp
         5hMuCRI94o1tvBCms84+ZqzCn5nR3TXnc8TwyNHp6p1ztZV6XB8dSSwraKG+b+Hf7xSv
         sK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443709; x=1702048509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64ppbjLuXnC3sRRee6xAp4YeL9+LAF3VOykBfQp43DQ=;
        b=a4+cReRI0r2kQO2JqMVMsjY7yrUx3rHSgLoN8Ki/WSSFnOtE4CJUm+VkgAm2vo9AUr
         ZYrsFD6oUiHQwcy5A61fP9+4UDQkdZ3TJNhd5oJpT1PoBSlDrDNUVQ1UT0Qqli8RQEK4
         iEaTmB6UwSLUxn7xi7HlNjX4MkRyG3P9v+RvviuPw5nuWKdKLIVoau7/Esv3kUFNeyL1
         WCi6W4tWcuedpgeggTE+sP0j/yJJzXwRccB4Jsoxp7kY9cK+zwBY7EvtcFsvcR/yJojV
         7aL94AdKTq7jnnRphXKo6i8ordDcmxSw+JkocG7VxjUL0JT4al0OTxo8i6Pscaz7uUT0
         WHcw==
X-Gm-Message-State: AOJu0YyJYxPyKvAz/xMmsA3WIhFm3U1C4fR+S/+vkGerhefLrLa+q8++
	litZ+9fnZFzvrL6DRe4hyAq/
X-Google-Smtp-Source: AGHT+IGFEwYFndW1mgX6h47/MbvGBKo00XuXVuSHUaCz6PgUzV+fkCdc8GeBdLKLTyRZDfjr7WGuGA==
X-Received: by 2002:a05:6a20:918b:b0:15d:4cf1:212e with SMTP id v11-20020a056a20918b00b0015d4cf1212emr38989386pzd.4.1701443708902;
        Fri, 01 Dec 2023 07:15:08 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:15:08 -0800 (PST)
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
Subject: [PATCH 10/13] scsi: ufs: qcom: Use dev_err_probe() to simplify error handling of devm_gpiod_get_optional()
Date: Fri,  1 Dec 2023 20:44:14 +0530
Message-Id: <20231201151417.65500-11-manivannan.sadhasivam@linaro.org>
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

As done in other places, let's use dev_err_probe() to simplify the error
handling while acquiring the device reset gpio using
devm_gpiod_get_optional().

While at it, let's reword the error message to make it clear that the
failure is due to acquiring "device reset gpio".

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 218d22e1efce..a86f6620abc8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1146,9 +1146,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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


