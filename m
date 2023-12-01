Return-Path: <linux-arm-msm+bounces-2909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1F800E4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9B3281B23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1584A99A;
	Fri,  1 Dec 2023 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/WAEUWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E94A1731
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:15:06 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28648be0811so1447989a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443705; x=1702048505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7s+dxOARPtmuDtxtrPmYWXFcx5QSwMABsj/xuwm0cfM=;
        b=a/WAEUWwXBU2IwTd/1lnStFpgCNRsM5snta4eqSqhLzBSBwpsjhVCyYVYV2lD/WBVS
         mbK/kKi8hhafFgki7Qke4VWPLBaLVImDjo6NBPn1bm3a1GvCkZ0+dXjGVHMVK+yz+ULe
         oYrdGfOX5MjAeEeT4kdwQP9lF1ejE8xyN2lHRc6ITB5fuWqYJepJip1GcRZ6r3sphNuX
         Qtzf+A6M6VkKAP2DtPIU5aln+GiDMb3JrCAeXSJU6d9i+kCdsm1ElijHkwoTVlLBuS/r
         FeoRBICXTsomzzFwdEpmQnGC+jZXB6VG2ejEmh3/xzob3O/wH+KPR86ty7Nt/YJjAb41
         cXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443705; x=1702048505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7s+dxOARPtmuDtxtrPmYWXFcx5QSwMABsj/xuwm0cfM=;
        b=hXRaYMAisSM/FDdaC8Mx4DhqykNPjppnmCx64F4d2/Gtv66kd0U/YhqeMxahpvAsxB
         G5SVXRCgVMzQiwK0C1QJ86SrnzzGm6+gUMQ5sBqJXr5r5QNxNNUp7lqP8dJj0clJWxU0
         27sxu3GiiLugVJ+dZYr0fKVQ0dD76oGk3HQYnM017J+1lFK5PUhXqaZl2EdjA35H/jHW
         N/a1Yi54hMFp36xsT21Uag+SaT3sJ31Vs8FUnuOWzxiMv29W/KztTACLxljF+M/Msw0P
         uRAlelSr4pZu4dQ/dsnQHsAnzWU/LUwR8b6lZPDpIpx7j6K40wQ35k+0y44gpiHcemO0
         99CA==
X-Gm-Message-State: AOJu0YzqHpCHx9KSn0ePSrySxQeu0MsSVnHzGf8DvuuBKYH1COCQdtDM
	J88rCrV1B3UOmEd9hQZulhvc
X-Google-Smtp-Source: AGHT+IFvJZzkDlY46j20YHiJ2dxic5gDp8k5OB44MAkItevykW7t58SjWek1DweEF2vi9nrFLvLUYg==
X-Received: by 2002:a17:90b:1a8d:b0:285:81aa:aec0 with SMTP id ng13-20020a17090b1a8d00b0028581aaaec0mr26173302pjb.12.1701443705444;
        Fri, 01 Dec 2023 07:15:05 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:15:04 -0800 (PST)
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
Subject: [PATCH 09/13] scsi: ufs: qcom: Remove redundant error print for devm_kzalloc() failure
Date: Fri,  1 Dec 2023 20:44:13 +0530
Message-Id: <20231201151417.65500-10-manivannan.sadhasivam@linaro.org>
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

devm_kzalloc() will itself print the error message on failure. So let's get
rid of the redundant error message in ufs_qcom_init().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index e4dd3777a4d4..218d22e1efce 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1107,10 +1107,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	struct ufs_clk_info *clki;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_err(dev, "%s: no memory for qcom ufs host\n", __func__);
+	if (!host)
 		return -ENOMEM;
-	}
 
 	/* Make a two way bind between the qcom host and the hba */
 	host->hba = hba;
-- 
2.25.1


