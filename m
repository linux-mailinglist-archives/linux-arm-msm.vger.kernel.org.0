Return-Path: <linux-arm-msm+bounces-3874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDF809CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F791C20B05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94635D513;
	Fri,  8 Dec 2023 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmE7sC40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0F91981
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 22:59:52 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0538d9bbcso16074955ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018791; x=1702623591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkWOwl1gLnVxHW9Sk9i4VGOJ3Gf+zYB/UjGbRoXR81c=;
        b=wmE7sC409h0Z1AqzsfGRreFRBGN9XqN7GgJKdxVly1q2zyWBByCUtVJEoGQcYc5TFN
         OqXM+odAuee2nH+pe2dqXLKwx9fFUKHsjWOCAMRO6wg/3NtKKfak2UmfpFqK5CLAj65Y
         n+M0cBeSYXis8tiN4jPERzm0tXbkVMMCH1RgDrh715roDpTeRJcI3QlDH4dkVGk3PiiS
         LVZz17f5Jvxt642jhNrRyRcxm+rYDGUFNNXtboBflfvxsFtq3gr6X7LrbbdtoCnCsPsH
         m3ul8303tWm6G6+7MgCWfXuKkK/faqrrVS6j4XPNvj6b3552RUlb50Ej8AGG3D3fMq5I
         Eq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018791; x=1702623591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkWOwl1gLnVxHW9Sk9i4VGOJ3Gf+zYB/UjGbRoXR81c=;
        b=rxm3WNv76uUigS+VqLbp4zk6eiV818bSk3LFXTZZPXrQmWdUWItq4Z7QDFkViNU4hC
         MEyx0c/cVe7EqkWQbPQjuberFaW8Q0N/K0yhLyENGDKNZS6NioEIS7X800XO4uRCXD0i
         tiMmYK3pc1T12JWGpNkEMk/BJybR5raizJSDZUsG5s4V+vQJBeoEQH+HllVD+0Cc3pYW
         W/hICWohOayRK7JqN1fse8DtkdliljiIhDANYBcpOn+AyZt0jmCqx/Z/TR8+ArJGcNRS
         iNTF6nh5I4KpAMTytUi/lyyn/37LEgorY8ISB62y+dx9XvWfrnn/zYPFPONQWz6JtWfx
         bhjA==
X-Gm-Message-State: AOJu0Yxjl6H+MD5zSCjW7pWwy2Cf2CPGaTNbkQtxpTmbT5jG7F/KUTIF
	aUOwskbiRU1ecVfqlOSkQfeq
X-Google-Smtp-Source: AGHT+IHLDjHVaFMfxqHVlQylAA59l3ygh31Wv41zWg5H31h364vHz17oNOarusJYQLvTDusipO2sYA==
X-Received: by 2002:a17:902:8d85:b0:1d0:6ffd:e2d8 with SMTP id v5-20020a1709028d8500b001d06ffde2d8mr3844469plo.114.1702018791539;
        Thu, 07 Dec 2023 22:59:51 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 22:59:51 -0800 (PST)
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
Subject: [PATCH v2 07/17] scsi: ufs: qcom: Fail ufs_qcom_power_up_sequence() when core_reset fails
Date: Fri,  8 Dec 2023 12:28:52 +0530
Message-Id: <20231208065902.11006-8-manivannan.sadhasivam@linaro.org>
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

Even though core_reset is optional, a failure during assert/deassert should
be considered fatal, if core_reset is available. So fail
ufs_qcom_power_up_sequence() if an error happens during reset and also get
rid of the redundant warning as the ufs_qcom_host_reset() function itself
prints error messages.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 604273a22afd..365a61dbf7ea 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -317,9 +317,11 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
 	usleep_range(200, 210);
 
 	ret = reset_control_deassert(host->core_reset);
-	if (ret)
+	if (ret) {
 		dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
 				 __func__, ret);
+		return ret;
+	}
 
 	usleep_range(1000, 1100);
 
@@ -359,8 +361,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	/* Reset UFS Host Controller and PHY */
 	ret = ufs_qcom_host_reset(hba);
 	if (ret)
-		dev_warn(hba->dev, "%s: host reset returned %d\n",
-				  __func__, ret);
+		return ret;
 
 	/* phy initialization - calibrate the phy */
 	ret = phy_init(phy);
-- 
2.25.1


