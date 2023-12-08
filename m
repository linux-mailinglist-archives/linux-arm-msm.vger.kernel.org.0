Return-Path: <linux-arm-msm+bounces-3869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6757809CAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B68281DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D6DCA4D;
	Fri,  8 Dec 2023 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnecBDvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3051724
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:26 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d04c097e34so14445145ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018766; x=1702623566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIWn45Ech+fto22q1XGFNjdWj3hQRi8//sYbCfmx5as=;
        b=tnecBDvi8mgub21fpXNe0w89pKeQ140jqJeww+5fE/T5Iqnn/UBEN9ZrEdtM7IKJTb
         TQ9gCT9xEMXbk7oGshB5cBWIcf0cpbD48tp/JHa2jqf6slp9IYK12YJexpI8UiIUt2Jm
         1R61VPyKVp2pCy0oTKw8EBmLdCcpkuEW1rW9Gsc4sVGIe67O3VfgeGYZzV9tMqGVUoeX
         MafsW9ZbGdbyRvUQenmfY+YcQrZy4Wfa2xK4rc2lsf2pj616SgAM/p7WLvmVGYsS50kC
         ClZrHKwmYQqzrTYQq9bqMSFRuFaFO5l17DHxh+2iN6DsArnlyqMZek//914A/ue+fen4
         Sdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018766; x=1702623566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIWn45Ech+fto22q1XGFNjdWj3hQRi8//sYbCfmx5as=;
        b=HTpGPiT3UiMVWBA8Uh943zJ3fyKpy1owLZEx3G7mEkPXvcwy5haUHvPqcaaITQ72nM
         RzkpNhnTCOE0I8nVkDStmSSa4Aq0/kd1MsbTu7lb4ugWLkKWcJxEF1qgj7N8zQVhshgu
         KnaB0Xc4/9/1+r3zhhbTPZit+5Do9jpKS08M7gCthCLfV7dLaJtw07ki9JR7nPzncVVJ
         FmmTGOOvLuW9rHphLSjKR+mZbWMnaRPncXTQQRZnr4mP3TkaslLFDoM1CkIRzPxInhC+
         QcM5aLCKOBzY173L+HcJvqqduZqCqbORxQcDuTGY1rPNIY/XLGWqc9tmijn9gMp9U8+f
         /lXw==
X-Gm-Message-State: AOJu0YyjSJ+GvZDLfqXqBL/Rp1pqgTqmPf1RMWhwPo4Ex1Xs1vwvdPJt
	prx2uE9aRjFR+yF62/wAMGgB
X-Google-Smtp-Source: AGHT+IERpN0qjwvRGfdxD0ngWc5t5NaEAM8UxB6Ozm+bc5A9ENjr91lOleAtvBMS3kdiWYPeA0VG/A==
X-Received: by 2002:a17:902:ea11:b0:1cf:cc3e:c550 with SMTP id s17-20020a170902ea1100b001cfcc3ec550mr530932plg.5.1702018765889;
        Thu, 07 Dec 2023 22:59:25 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:25 -0800 (PST)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 02/17] scsi: ufs: qcom: Fix the return value of ufs_qcom_ice_program_key()
Date: Fri,  8 Dec 2023 12:28:47 +0530
Message-Id: <20231208065902.11006-3-manivannan.sadhasivam@linaro.org>
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

Currently, the function returns -EINVAL if algorithm other than AES-256-XTS
is requested. But the correct error code is -EOPNOTSUPP. Fix it!

Cc: Abel Vesa <abel.vesa@linaro.org>
Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cbb6a696cd97..852179e456f2 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -158,7 +158,7 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
 	cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
 	if (cap.algorithm_id != UFS_CRYPTO_ALG_AES_XTS ||
 	    cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
-		return -EINVAL;
+		return -EOPNOTSUPP;
 
 	if (config_enable)
 		return qcom_ice_program_key(host->ice,
-- 
2.25.1


