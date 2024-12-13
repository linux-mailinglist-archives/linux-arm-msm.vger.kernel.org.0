Return-Path: <linux-arm-msm+bounces-42142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D69F18BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83CFA7A1128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6776A1F4709;
	Fri, 13 Dec 2024 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkubIibX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAA1F428D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128117; cv=none; b=RtwpSvs1yYZ5oSJrOH36crS6uxlsOiknHnQCvfh9KOOya8aIe4Oa7DxISxgmQcB9t/lW/QerUVvRM2M2mD0UAUdCcqakT71lUpq9DJwF8zT8QZDrmkVr9cRUmo+ODkpgcFF08PYWYCg7jOB9CizF6X+5SXhhn+2dg7MgHPNQTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128117; c=relaxed/simple;
	bh=/NnPOG7oiIzewxWYg3YzQ/UzNsq9zG9OnyGw9Ls5kf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1PWCfOsMGZkFQpw+LeyJq44HA7QHOiQIcvNQW5BNijxwNo7mgZPBM+BZPCmJVJllWeXf8ZcEiXpLHIyZiA8F3UXre/5MTGr+YiopLX+ohIYKXleKZdVFcNV7M6uXVEjekZdOdKZJofaUsTkndTpkNx5zz3a8o9iFsk44ZeS3mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkubIibX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30039432861so23566181fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128113; x=1734732913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTen3MLzUzXXvgZKInKgFh0vdQsFh4VkZP2U7PMmam0=;
        b=dkubIibX+4q9aOyl9uBwqvfC+nOQhzWQHJvCsWzZveClXY0D5Xt7Sld8GQ0uAvQ0tf
         yQtTOvNZz2qTUOwBR90dkfeWJgmstosgFzZdi9J4nU2GgMB4EujEg7WHqNCW0VjSeMjM
         T90fTDnr6hihDAq3TDd/vgE6gKBGuK2nc56FEwxtxNlCU+Hx+49/54pNAcpEqCoC0Wsr
         g80EAJPiwswsdyPbBp/Tles4G8FUHj6HbjA7z0goH187ALtKW+iicDfV0GPi83lEoj9D
         8eZhK2rPGyAQ8f7Gd2yKKAt5g+hyzfZWWAgHWJNl2s2rqJTk8+jXShR3x6Uh0f+TOsY3
         CdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128113; x=1734732913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTen3MLzUzXXvgZKInKgFh0vdQsFh4VkZP2U7PMmam0=;
        b=fP+2JJtpVohx9u+2E1Vs7rPmboW/nNK/oohg8atDLBF75IG3fpVU3jIS2oC3hx8PM6
         NmUjIuxAlslbYruzfF+4MGulJI3wG7gT/3foE/AeNYzs3Rk4kO9CgqVr1V8J8KkpRQTw
         7K03GGOj+6bLYgnxzBB+WlsxDmv05HUJX2Wy31ZkVrkXK/E4wccV598nUk0izjS84Wb1
         hJBbKcyBWUblxntyLEMeuD5pDnjjB1oc6NnawKRpTo34ay5ColslJ9II1uvQL/OHhTAZ
         mwjuqxCVwswSRZQfww2H/YdolqZoc1ZNginLMVif3fhK8Ssb3tMS6nS2A8BJr2rQX22X
         uFLw==
X-Gm-Message-State: AOJu0YwMMAT04cccWy8dOFQ0hqQSFpnH15lBkG7Cm1znboch45NRVu96
	WONwhQujJWzHUidANxTk0uyof7fU9YymZDUI1VHlWKXzmtcLdksKTLDlSYHBGAI=
X-Gm-Gg: ASbGncurez2rmlietPU/frqx3XEs3efzrJhc+b1K8g2ANbkUR/SbSEYEKbJMf9GAgXN
	sVCXH4ma5D5f9c5Dq7tjMgA2prwtlY/NzQ3oaKjMOvsHSXaAG/FeXObOEzIGq4QC0X362oRyTHm
	4/22MH6il0Kn0PlkCaFl0Z5Jik+4A/qS7mYciyYbahmH+rJr4TfIojTxIyFPhsK/hecgt2nnWnB
	57yNlaX59b5uJq8fhjO/EZ/5xcbnrNX/0y1mmNxUwWcmJMfqqcitz4JhLLAbYd9
X-Google-Smtp-Source: AGHT+IGhehVgdzx1i1C168VhhYvqHD8YUOQ5/Sf6tYXDzcFnjRY2EnsjMMRs7Cl7C2CtfmggsqIRGg==
X-Received: by 2002:a2e:a9a1:0:b0:302:2320:dc81 with SMTP id 38308e7fff4ca-302544f94a9mr18022951fa.29.1734128113516;
        Fri, 13 Dec 2024 14:15:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:32 +0200
Subject: [PATCH 16/35] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-16-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/NnPOG7oiIzewxWYg3YzQ/UzNsq9zG9OnyGw9Ls5kf8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHG6jMDZ5yDcAevjSw28Xh4hS26TBQsquJ6d
 xULnxrrSrmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1QjECACeBo1ZSnhdDm60oXksK6oQWmuKuKco79Cntx0W+9EwBK+59HdEJ2Zs6J75IoEud9S9mNU
 4ukULTZgjbYMu1Em1057NA64f8Z8e/SftJKjkqdyHy9WWTSnB2kh4kJz7i8pOYKSjDY25BX9R+C
 QulDuJNybExzcu+Z+tEaIZCF9IexXZJwuicHNR4JR899pciHmH+UuIYgBQEVW6Q/o/RcMfwXVk0
 RQIVfmAwhEgmZiR9zoRewQLN3C4DaCb56nkpNgYf6q1DaBh0XisTUSGEdSjmoWxubiF4zYpNg3Y
 Cml6JyZs+gMRLVkjOvli97ZfhA1w8qnMMTLuE3gYa/P8ZFa1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5d8f89f8a8a6ad772ff5f4cb8421cb3dd09cbc30..0078b203461992267250b6ceae7559aeae4bed9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c21e1b0ded669b82f5939df748ce267c18d05ae..5afdf7d4324423952f5e9d5735ad112f600f1b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5


