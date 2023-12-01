Return-Path: <linux-arm-msm+bounces-2902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC566800E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1E2B2146E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADCB495DF;
	Fri,  1 Dec 2023 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nogZAFzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE07194
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:14:35 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cde104293fso2138079b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443675; x=1702048475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+jx8HoyhzxiydFyXHE2frQBCbCouzHNLsW3Lqd+5ss=;
        b=nogZAFzQ1gFJA34X/nOWTr5HvcbRNPOp0XtpUZ6RllfyTCHMXaKwDGvQbDFghgE1II
         hzC5auAy1Y9XNvNt7lt+8NaZDh8NEvqdZ52jrSQC/wyfBvRRT3c3eK4Wxp9vtFCywqzx
         0Ol/V4mOt+9JSl4uahzEFX7zZscbU/eE7s44larreDSdxi3Ap1FPnsSneuaMbgxPY6BO
         6Cv2GXKf4nMoupm4rCGqwbdNnvVj/+MNQdWZh5ADgoo5xTBmwOja1KL4THGoq3wb7/1B
         TM15Z4CPuiTY8inOSQedHD0ZWB8Nj0QnrL1sXDif4wGRldoSX93pIYz7dVeoPIJU+XuF
         mmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443675; x=1702048475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+jx8HoyhzxiydFyXHE2frQBCbCouzHNLsW3Lqd+5ss=;
        b=rtnnAwqtyrbnaDOMWm54xC6OrK8qAQVwjUpBCabDPV61bkzUnrzUdxXGj7/hTtRHmg
         H2paUeumhiHGUls/NmhdJkGi+vS1qzVSGA3tBm2eCdJVizE2eAeHhN/Dxg1TnHz9eW+D
         KuG3sTmDnde4xsmU1s0ZZgjS3xBEG2kWdZ63EOkvqHWIOe6HQKUsBpMpvQ3WJ7ej4N9K
         D9sz8DNQIf/TZTpggNhtDVRn+FuwU3ylvkS61i5TjDjnOaDu0neY4sNIsZezqU2eBc8I
         o6QPR2Xll2S3TXSRTu/l3oJnUPzdgjkFqjbVvyv0lH6lb3zp0zLRitTtEp8vBwNeT5X6
         IltQ==
X-Gm-Message-State: AOJu0YzWsQ2FXJbeL2mWH02vUhGTmao+QoSFqlrXiOqhTgHNPvqOmY5b
	bx4ucvQBNbjGyu28/6AbhL/L
X-Google-Smtp-Source: AGHT+IEXcgzY0pBiF4IvEOSKrihXMHf6vn7vSvLxter42ILSy0vyLHU/Ml2svphdhbvyMnc1NER0vQ==
X-Received: by 2002:a05:6a20:1614:b0:18b:f108:1595 with SMTP id l20-20020a056a20161400b0018bf1081595mr26409897pzj.53.1701443675056;
        Fri, 01 Dec 2023 07:14:35 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:34 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 02/13] scsi: ufs: qcom: Fix the return value of ufs_qcom_ice_program_key()
Date: Fri,  1 Dec 2023 20:44:06 +0530
Message-Id: <20231201151417.65500-3-manivannan.sadhasivam@linaro.org>
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

Currently, the function returns -EINVAL if algorithm other than AES-256-XTS
is requested. But the correct error code is -EOPNOTSUPP. Fix it!

Cc: Abel Vesa <abel.vesa@linaro.org>
Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
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


