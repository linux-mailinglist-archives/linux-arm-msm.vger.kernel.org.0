Return-Path: <linux-arm-msm+bounces-2903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2D800E40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8ED281BA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7B14A99D;
	Fri,  1 Dec 2023 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HM4mQeTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A95D4A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:14:38 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04dba2781so5401755ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443678; x=1702048478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3kfHr+zbu/uneZ4lD4JhbFPgELgLtJ8NZ2za38JuAE=;
        b=HM4mQeTztByqk/kg5XN28mV8G7VAhhkric9HJh6Dyv0nETOl5yw6qJA8bj2rRWZYyQ
         BehEv8BjjJX90L8tGlHmUO9kIfveNPevPzuGkSCMTAb8sLktkJA1mfv4NattT/F+YCec
         iPL8fWZO/nZ0XdGtBtrJDV2xfJ1C8iX+2krU82IIu01NcVNa8O5CG0HBLhbbtMa2ECVl
         GrAqzw0UniZ3LhkN5rdKsvncsbI1tVbI1C70ALTMVXDp3V6sYy/VYxBC5dbrj4FKaSAY
         7Z9AHPwNTIpVQ9oAPZwwOeD/TvGInAGY/kgWtPKA12jm3LHrksUYAVSQFLc9GItHzDQH
         6yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443678; x=1702048478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3kfHr+zbu/uneZ4lD4JhbFPgELgLtJ8NZ2za38JuAE=;
        b=SJWvQukDN+v4wq4nT7mn5VRLihan8wVPY1BRxImtjMwBTZU6jS5bVhg5MUQwAhwTUV
         6luOzX6zxRIqRMy57jHYYFHmcsushBPq336H5px23rZ1F8EM9pih2URJDUXiuhQRP/wY
         0U3uvhvizkQe9pAk8XL/CjJlpjm4tPsLo6u+Dq+wkyccrU+lrmrZJk+ZjYTdut7oY/Be
         uuGtmlcEJh5OeXPST+hLVXvuUcZuTH2qv15IwwvYN/ZP13NeR7LEPqMmU3gJhYuv0VWS
         Rf0T0P17RNxO3E2IDldRwe7VTh1fQGXmMPws9RDNgXF/3shfIaLXBb5eKNTbuA0p7/ll
         oRHg==
X-Gm-Message-State: AOJu0Ywx9571tJhuBl6B2mDBbutZlPicSauNsJnPAVFJ5K72LkSZJYPb
	N+NL+IDwYA+hTp06Y9MMJQlh
X-Google-Smtp-Source: AGHT+IGQbMODfad0onWH3yp27ryxYqlJOk59OxMJBwWdXR8mhA24qEpLLbVa+5KmJHWVuz333O747g==
X-Received: by 2002:a17:902:d4cd:b0:1cf:e113:7932 with SMTP id o13-20020a170902d4cd00b001cfe1137932mr15787296plg.17.1701443678293;
        Fri, 01 Dec 2023 07:14:38 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:37 -0800 (PST)
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
Subject: [PATCH 03/13] scsi: ufs: qcom: Fix the return value when platform_get_resource_byname() fails
Date: Fri,  1 Dec 2023 20:44:07 +0530
Message-Id: <20231201151417.65500-4-manivannan.sadhasivam@linaro.org>
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

The return value should be -ENODEV indicating that the resource is not
provided in DT, not -ENOMEM. Fix it!

Fixes: c263b4ef737e ("scsi: ufs: core: mcq: Configure resource regions")
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


