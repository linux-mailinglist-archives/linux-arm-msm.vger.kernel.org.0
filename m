Return-Path: <linux-arm-msm+bounces-3870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C39809CB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F822819D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0978ED284;
	Fri,  8 Dec 2023 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LRDPeH5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEADF198C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:31 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d2f1cecf89so206885ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018771; x=1702623571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAuafsSJin/545S9JBl3k3169/mG+pk906+BZqM02rw=;
        b=LRDPeH5c3X1gTwXbBsyhAE/Qfkm2in7DS7OWrRZlWbwmq2SiHtQj8ogscfsNPh7on/
         Yf385E5UGVZYYBDjkL793HhhuPofS7TvBDFsu49/F0JLVPrvBlNkppRg/iUi6fhxxt8M
         ULYMLrGQIYAOKgkoki617P1KFpo5XYEqMC51lWtIoin+xVQWWhDpckFkmnLxcF+MGYUl
         /WpSGoI5AhsIo3MDOP4y2CiatZVzJ2alhoavN5CUw5IRKPoeKgKapzcM9HVFFjBxepnp
         XLuHItg1WOE9NakN2u5GaapYffw7YczLfray0h29Y3efzJ3zzhqNg9Ou4ixQLh9viXKJ
         Bk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018771; x=1702623571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAuafsSJin/545S9JBl3k3169/mG+pk906+BZqM02rw=;
        b=pjZLAPWO8f/0bLknFJmQUxUYQvjkNqsBFn/heWtVkpjCDMmUcXhIkhqhbbmcjNzV6p
         bbNsF1z7pU3N7joivOtmStqStxPthouznYS4+9oTYQmUzgj4fiGTQ6kQxl77ZGtvo4uE
         YQ/IH0XGXv0wVYtaLdY17KUyMc21kG2vVvzrFX6dhIN2Mw6mI5aUVHiCUfpSZh8vMgdb
         4au29H+qmL5fprKpp84ThjV+3Fo5pEZOU4gbdzDB+lN4C/KszIHdOY418LMd3D1sawed
         o52cQWI4oGLw6CeTfAVEkDuOF5MTCj1Z0fPAgknKQgF0nL468wI7ba78h5fCFALDDZHb
         DLQw==
X-Gm-Message-State: AOJu0YxNwhro92kH+mPVP7Vo9YvtCpJcCONQNeUHi+Qcz2zW2MvVjMyI
	jcOwQhMdn2DKn6j5DLkRKXIz
X-Google-Smtp-Source: AGHT+IGflETh4yKi3d3wNFGR84GW61XgeduRIXTsZv1jIX1NkcqrGsIZt50fSYYR0Goipa+nqYoolg==
X-Received: by 2002:a17:903:228b:b0:1d0:5878:d4f4 with SMTP id b11-20020a170903228b00b001d05878d4f4mr3198154plh.5.1702018771023;
        Thu, 07 Dec 2023 22:59:31 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:30 -0800 (PST)
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
Subject: [PATCH v2 03/17] scsi: ufs: qcom: Fix the return value when platform_get_resource_byname() fails
Date: Fri,  8 Dec 2023 12:28:48 +0530
Message-Id: <20231208065902.11006-4-manivannan.sadhasivam@linaro.org>
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

The return value should be -ENODEV indicating that the resource is not
provided in DT, not -ENOMEM. Fix it!

Fixes: c263b4ef737e ("scsi: ufs: core: mcq: Configure resource regions")
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 852179e456f2..778df0a9c65e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1701,7 +1701,7 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
 		if (!res->resource) {
 			dev_info(hba->dev, "Resource %s not provided\n", res->name);
 			if (i == RES_UFS)
-				return -ENOMEM;
+				return -ENODEV;
 			continue;
 		} else if (i == RES_UFS) {
 			res_mem = res->resource;
-- 
2.25.1


