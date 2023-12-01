Return-Path: <linux-arm-msm+bounces-2912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B2800E52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A2C81C210CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB644A990;
	Fri,  1 Dec 2023 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtWJ/wzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468401BD4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:15:16 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cdcef787ffso2229247b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443715; x=1702048515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRvflStZ/vTcP5B8zVnsU2ULybvGH2B1eMnhOvB9jfI=;
        b=GtWJ/wzcoOW5Jc3UDjFMV81ANMdOg5e0pedMcEQBThMVaiJvZeoMKfs8uaoECnZFNx
         orK42lnrM+sIthwFggaw6nUl7gpytq02A5vlbNO/t13babiolophin53U7p4xwymiWfm
         GRbi0RbNy3Z6WeFd4UL9nN6YjqzSNE92cxJ/hcXdRHTifM7L/oYTE/qs8JhEGvv4INbi
         F/XiVrm7fcCwWr2+HkEpY4FdYE0IZKzQAdna0U5OTkSCrbAxdBbhi3Llq42NvstM1JXj
         MgSYEbSGzSpj3RGkBuH4jqSqc7m4ZCie7zJfamt2BQU5JiB0EU0JnYgCXXNtqL0vFxZZ
         CNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443715; x=1702048515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRvflStZ/vTcP5B8zVnsU2ULybvGH2B1eMnhOvB9jfI=;
        b=dGaFcI8R23b/uZQqm+Sq7y1Mh+Wy9eVtmoCmYBRC1RcKCGzhm+qbMGBogMImtk+Bz1
         r3sjWq4ZeL7aIMG/oiPlQ3Zxl7FXE9Auri9m5aZv2SuCsEzybPwjj/6xMJzlKXLctwy2
         eKPJgv5mk99jdhGd2jK9+cmUC1IVIebJo7gtNAxipPTXU+Qg52LftVGwROgxv4ruYSTH
         2E8ah8IEe+NXO75PKz8GGUZjAdrD7sR4O0+knxl5/fSwKqYbyfCcK8okaagZ/7q7rNnt
         rwdIpJxBs0MQpRQNP2oT9NkDI927/64rCMkJJzQMCciMtMPN416J4qm8Zj4F9Oki/fHE
         NvHQ==
X-Gm-Message-State: AOJu0YxdB7oxfmO3McGCWNgwpA+/n1BniMCHdO7xdgpAojzG0W+AKMeQ
	rsOa7/OIdSJtoGNM00EKmsU7
X-Google-Smtp-Source: AGHT+IFL+VdkT8Jx4gdpedUqkKxN/i8MfrhTGRszx2lMQkD1Yq8i2V0FL16deBTMgMSjHw0oq7LBQQ==
X-Received: by 2002:a05:6a00:1401:b0:68a:5cf8:dac5 with SMTP id l1-20020a056a00140100b0068a5cf8dac5mr29042906pfu.22.1701443715471;
        Fri, 01 Dec 2023 07:15:15 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:15:15 -0800 (PST)
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
Subject: [PATCH 12/13] scsi: ufs: qcom: Sort includes alphabetically
Date: Fri,  1 Dec 2023 20:44:16 +0530
Message-Id: <20231201151417.65500-13-manivannan.sadhasivam@linaro.org>
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

Sort includes alphabetically.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 824c006be093..590a2c67cf7d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -4,26 +4,26 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/time.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/devfreq.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/phy/phy.h>
-#include <linux/gpio/consumer.h>
+#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
-#include <linux/devfreq.h>
+#include <linux/time.h>
 
 #include <soc/qcom/ice.h>
 
 #include <ufs/ufshcd.h>
-#include "ufshcd-pltfrm.h"
-#include <ufs/unipro.h>
-#include "ufs-qcom.h"
 #include <ufs/ufshci.h>
 #include <ufs/ufs_quirks.h>
+#include <ufs/unipro.h>
+#include "ufshcd-pltfrm.h"
+#include "ufs-qcom.h"
 
 #define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
 #define MCQ_QCFGPTR_UNIT	0x200
-- 
2.25.1


