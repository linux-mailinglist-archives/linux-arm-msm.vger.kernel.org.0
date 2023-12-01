Return-Path: <linux-arm-msm+bounces-2913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472A800E53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE78281DA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BB6495F8;
	Fri,  1 Dec 2023 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqpTXmDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D44B1BF5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:15:19 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cdfb72172aso913202b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443719; x=1702048519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99jwCtueYKuqHSnO06pq+vanF2UHvfzCABwBvmt41SY=;
        b=dqpTXmDoXE6wytJPhm2PCBQfp/5HV7AtqtFuSibrn7aUkYe89B32Er6GSctfWsodS3
         5adNy7vLCG/+vARD/4JbpdWTFJb8JGike3Oa9YjC3A18kQ5paNKCktHOGIWb5SY8rFdx
         hYwMu2edywVkLpgNa1FYcalgADmyGnWCieRxbjpkzNO96Q+qqi7AxLB3HcbyhJup1WKe
         9nAw/W4/BGMt8cMwavX5YXBQo2jeXN1wMH7Jxa/8X88R7KKhsq0gpmNI97pOpt2IC8lo
         ZdXDc5tnZxdwXd1Aekcl8X9VjzPKXRjDe60PRrzGBVhNdZUMd4PmmlSipE1Tu7p1+FCc
         po+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443719; x=1702048519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99jwCtueYKuqHSnO06pq+vanF2UHvfzCABwBvmt41SY=;
        b=Ifr6Ux8/SBwGsPEFQUnlfLLkwuWMH8Io73eLlG3J663hcZyrqraET/krAhTcrr24gr
         b0tDBFn4pYTEi51PTul4F7F+TnyuMepx9WpN/6Ek0vdtCJ8vhq566i4jijaZme++eTei
         CBtlg0reNmeFRnX9vJObXdqRXCkhwGSei0GoOGX3YOA6s25qkTdHQLA7uJOU/LO+ArRy
         OsdqnwcE2Rc2DTV7Nks97eOZiVOj2Jcwj3gFhMtcU1KFI9h+H0dvgXQ2mD7De6L96TDS
         QMlBBsiZFdGW25/FbBRyGGlAYDBnzVx1JfI+RKyRO24s3qqk1YdNX64Hke78/xJfStXb
         AfUA==
X-Gm-Message-State: AOJu0YxPhiyByXI4l1lj2h6gXl8hE/C/efjEMCb9sEW2B0vydg4E7TyY
	n1VfFacFiw8HSmMLOYfPQHiq
X-Google-Smtp-Source: AGHT+IG0lDGObraHLt0PSday0c1vddh/0X4DzkGcDUEtJFQ4rieNhf2pWlFV1r7BSDu6rIgWhh5OOA==
X-Received: by 2002:a05:6a00:938d:b0:6cd:faa6:fc36 with SMTP id ka13-20020a056a00938d00b006cdfaa6fc36mr3968638pfb.30.1701443718764;
        Fri, 01 Dec 2023 07:15:18 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:15:18 -0800 (PST)
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
Subject: [PATCH 13/13] scsi: ufs: qcom: Initialize cycles_in_1us variable in ufs_qcom_set_core_clk_ctrl()
Date: Fri,  1 Dec 2023 20:44:17 +0530
Message-Id: <20231201151417.65500-14-manivannan.sadhasivam@linaro.org>
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

In case the "core_clk_unipro" clock is not provided, "cycles_in_1us"
variable will be used as uninitialized. So initialize it with 0.

Issue reported by Smatch tool:

drivers/ufs/host/ufs-qcom.c:1336 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.
drivers/ufs/host/ufs-qcom.c:1341 ufs_qcom_set_core_clk_ctrl() error: uninitialized symbol 'cycles_in_1us'.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 590a2c67cf7d..208543a62d43 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1296,7 +1296,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
 	struct ufs_clk_info *clki;
-	u32 cycles_in_1us;
+	u32 cycles_in_1us = 0;
 	u32 core_clk_ctrl_reg;
 	int err;
 
-- 
2.25.1


