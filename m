Return-Path: <linux-arm-msm+bounces-23982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E79150DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3306B28601A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D821A01A7;
	Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSwyImfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7521A00ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240442; cv=none; b=NutuHsLpMa/1dzXWTDCBnib9WZ+g9o4z76BUwdySb4rNmyb7DvIHR9e9JzEfXKsYPw/wpiE6cCUIXpUjA2WhRvgOONu6pBCZwusVFlMdUQ4i/+TRh6jWqnjsLhoSMz/KaOwlRPuBuydTGndG4FdSqXjetlfdJS+B0hAPeIU9dKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240442; c=relaxed/simple;
	bh=BXjW3vQxsmZuyH1IlNRwIHSsrpZblZLTmW9M+NxSCGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gveRuX25cw9fGreOVREHIvr+xf4GyU/1zyYOWUYL9Khvw/5Wqm0HyBp4Mx92g29ka1Dw+Sr3VgD/tkpOZUm1+broZ00Xf41i6VRGukmSvSdMRKNbP4B/4ikrDIdJLpi1KnivllIkX+U2gF1NlIj4tcNOC/HG6nME2/B7B5Swfws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSwyImfu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52caebc6137so4271299e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240439; x=1719845239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
        b=RSwyImfuoS9HyGNKudBIenj0+7ZiUzh1YyUGDiPXFXAkJssg43zVyvF12xibZu/AVK
         81E6E9W65ZxQs3s64imd35qJBOTxVt25A86ogj9UMCwNyl82kf5NG8B+ivX/RBHYMdE1
         NWmsrhkYM0bkTZPCkEswsrF8cQ7x1VrP42W3m9ltHV5HDDLTOctr7XwbqGcBEFkdYBfj
         /T8QhFosqTh5Laj7DRMbRcnsJ3ZZfsGIpN10lvUf9suOUH/uGEHGAkZwFhRXCsZ0OdHN
         0lsB+Kyf8wY5/9q2d0Aew1Aw9SMlaEdSzrZnRWfyks52AdXfiWUZz13R5mgOIGRO9oX9
         fmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240439; x=1719845239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
        b=qOBtTlBdra8WUc5Fum933GswMfdyQMmtburn6N9ikN1aPO7a4ULv5NJkirzmpLPfwV
         NP0OIBtMV4P5IJbexXlx1bFy50HSWWiMTT5Tc/SSf52xbRe8jb6PuIlgEBbV04jQNSKv
         Be1mqYDcTWITYlbYS95/aacUHgqZVYIXdG0FOhUmVRCJR6JN02IHB75/oli9vMe/bWRy
         dUa9iFOHlTYV8sKB3Qrp460omc/4s3DFuDdJNdy5W+eSPMxfbndYZcBT1JnomDFLFxCm
         49lgEg2oEigpBH0hkE/pOLpTZPcrMM7Nu0whcm/8VkYiqR1j1zOpYqbEtyKTsORpUmnk
         DbAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHSqr2rWLfI0W2v9Sq7YjK61BVUPKChzIjPotOnHTogyjPZ7zApqciBY0RW3bKV8t/jV6XGI3QyEUEa1zDyiz63/sqGZG57w3FzL3fug==
X-Gm-Message-State: AOJu0Yzm2OV3xuQuZ1oZ+CXTmT+9DrwcaU/0rXBNYAaDOFzsJ1qn4oAN
	R+oAMOve7kiqN1br1yxPAxW+QqyT9KsmHLweDr6dlFaa15RoU2gH8gXiJ3736SI=
X-Google-Smtp-Source: AGHT+IFo0+mMu75zJsoc9saWGs2TMZTXLwFCHVCfi7bX+JMa6h2za2Gs063bgucAWT7eFH/l/fHgoQ==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id 2adb3069b0e04-52ce9828502mr1762990e87.32.1719240438806;
        Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:13 +0300
Subject: [PATCH v4 07/16] drm/msm/dpu: drop extra aspace checks in
 dpu_formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-7-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BXjW3vQxsmZuyH1IlNRwIHSsrpZblZLTmW9M+NxSCGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv084XpneWPffyXo4xAWuPs5p8u2l9ugMFU
 bL+pUaBr2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1bxfCACR9EzuNAh0cZysy87aKSG7MkjSjyEdt/RZsPW/aaLTwYXAfah8bhHwMuWeF0M957zNJFl
 jiZNivfmAYo615w2F507VQG5nhoM1xlZZXYNrOsfCu2pUegu6LPz49ov52QZDeQb5VIRK/0Z0RQ
 Znj63lqLU6qkX1jpGb9dJ92LNWT5QMzKnZJwv4fqKnICXYcvMmGOqgIKHzAxm9YG0Ivawa2+1L5
 Z3FZH0PqhfkJmpAa4g35+9ZQL/smVan9AO1csAW+22Dp3pZHZGhjFswd5qH8krfToolUcyJjeLo
 WOnEPTc2lKqnljPmBf2vKqCXxTHKe8JuRvj7NIjbIUiC8YDx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The DPU driver isn't expected to be used without an IOMMU. Thus the
aspace will be always present. Not to mention that mdp4/mdp5 drivers
call msm_framebuffer_iova() without such checks, as the whole
msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
configurations.

Drop these useless if (aspace) checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..8c2dc5b59bb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -280,8 +280,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EINVAL;
 	}
 
-	if (aspace)
-		base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, aspace, 0);
 	if (!base_addr) {
 		DRM_ERROR("failed to retrieve base addr\n");
 		return -EFAULT;
@@ -376,9 +375,7 @@ static int _dpu_format_populate_addrs_linear(
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
-		if (aspace)
-			layout->plane_addr[i] =
-				msm_framebuffer_iova(fb, aspace, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 		if (!layout->plane_addr[i]) {
 			DRM_ERROR("failed to retrieve base addr\n");
 			return -EFAULT;

-- 
2.39.2


