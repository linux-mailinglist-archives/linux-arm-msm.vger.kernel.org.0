Return-Path: <linux-arm-msm+bounces-24034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC491588E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 419F51F245EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21D61A0AEA;
	Mon, 24 Jun 2024 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5rTs+M7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0691A0AE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263634; cv=none; b=L9l/ro0c6GWjxHiSxxVcCDzz+wcO07dSFf5yNIE6QLWk2uTwd3QuVv+9Ax3ncoIyW93NS8UIGxKh/1QZdK8QIK04EU2savd6volFlPPR+yQAZtbsGeJXld/quBJGW21dydzkaVUNRf3pZZp4iOhmrVCImnhjSCgZzuUvtFyvVok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263634; c=relaxed/simple;
	bh=BXjW3vQxsmZuyH1IlNRwIHSsrpZblZLTmW9M+NxSCGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpMaHpGt+iyB1b+rwBTV1lMux+SqjYJ0+XfeF+3c/8WafMi2RBK2Kf0aEKh7b7C6gJ5hvWJskiSb6WzyafrSw+vyW1h3NvtUug2MD2VPE6+Z9MR9OQA0LhsiLocn0vimpG/rztIlMGyuXhbWLQRj+O6rtPQk7nVqXNWP0wxoQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5rTs+M7; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so54401491fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263631; x=1719868431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
        b=n5rTs+M7AScCqH9UeLMYZPv1dvw0d3fPOVnzAmmkzYqpyZuxfOCD4LrgZC1DVbHrLY
         IaNjmcJn2fVnOdqCBswa3gu4RuqHu+aqm44Nk0i1KvE8bTiMu9Kq/WNFZSOz+4CPO4a0
         BOc4vvxCX82mh0mA7iaCNs225n9y8VqPEK13B6J8kWr8vKEKpvKAIzkVPnz0+BnRBx0Y
         3yOG2tj/4UxhArfd7hbTRa9yFzolCiBA7cNbh8RXOyimdAy3Bat8Jk2DT83nvxWALGhU
         Q1zY5s29QahtC4RLfsIHXFhd8L9ittLg57PGRleF/QWw9GDjRbOcUY2/Bqv33J6K/8J/
         QVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263631; x=1719868431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
        b=Kv7p+XwHJba9M5E2gYMNL2UllKhPUAuSrizEvXQMlqNMSnOJBfLeD0+kbBZCnlUfiO
         p7ovuhO0yPlmng27POrroYLDlzUMxEqztyu8o3Y2Hj8o1S1Txax+aQTSKmw7K0wGQRa1
         ampWOOZdv6Lsh64Pz14PTSlOaZva4m3rRC21UF08GrF+Am+DeamnRWxc1B9tUsHtx+Lf
         t7zxBujrfgpQuwvVwJOQmPY7AaKhmH5cZ1oYM/Wa04JishIfUiGUHpRlTW9z+AZBFaY+
         T4DGkMNhSf18eNr3Y/8gk7C0fc61Yx6sO9+ySzbiNl7eYvvN++cV3FmGgxZFrEliivtJ
         FYrA==
X-Forwarded-Encrypted: i=1; AJvYcCUbmPld8eYgBf4DuRReE73r8MoplSls7VT5eTWILBv5ai5xaSqxLPvX6Aoob6aKB9DrJaQQGQeq8mkWrtH60v8vztaDBk0Y8wg1HRyKrA==
X-Gm-Message-State: AOJu0YwNDSBHUrWT1WAibNw2yplzMqz2T6FA4KzRvKnYfEBF255qf388
	OjB7/cQS2BkRr5KoxyGZs1xdv4GFWeS9fnG8dkftzJNFIGzlxSv80Aa2jjyKAg4=
X-Google-Smtp-Source: AGHT+IE2xQondEQZvECIFmiPxReGgcme3MZOLqHLKQMr4bEDKDZ+8huGlEQUTrO9SnmdfBGF1L7SYQ==
X-Received: by 2002:ac2:5dc9:0:b0:52c:dec1:4578 with SMTP id 2adb3069b0e04-52ce1864495mr3199012e87.60.1719263631270;
        Mon, 24 Jun 2024 14:13:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:47 +0300
Subject: [PATCH v5 07/16] drm/msm/dpu: drop extra aspace checks in
 dpu_formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGISnjCTywn2asiMABQvbQvd1ljz/cfGpMTD
 lRXzy5D8xqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1dCJB/0ShsSArMHTi9IBz9sHfFnkzMWY0Ey6MPeT3/MK1ctjOSmp3OfLxxeyUA+XTznNd3FiJDz
 wXAYdLFjI0H4EtiHWcvD19PPYc7Auh4tQAW8qSTsp+/qi5PpTwCcK1HFDd54kT4ARtB65her9a/
 61qkiyldUEk4XRbX08zEvqaMkKx9hpapZviYoHx5TRfxF2SnekApor/VVDltxIHdZEziNqSOQmK
 GKRr1Y+qP1tg6MY5WiVNh6fKXV1rdqxmPf8RmXPvFDFDFMzIqhirG/bxZxOk80n9/aKVRQhQSBU
 O/C74mUeQmt+F9zvRLmY+Wx8ZsmBfZq78DPoanwgt7wKVlyg
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


