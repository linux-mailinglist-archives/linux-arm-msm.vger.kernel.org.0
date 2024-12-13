Return-Path: <linux-arm-msm+bounces-42139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C09F18B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89771885A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BF22AD14;
	Fri, 13 Dec 2024 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0CeG6FV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53D1F2C40
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128110; cv=none; b=o5q4L7i81j5E7/jLoH51cioOEk9bWOqfw7SvuLpLWFrYSDx5U2ZHGQKf3tWZgDdvClNkuoqbVTYEuS0Mr6r3neOud3NRt/k0FEAzeOOyYNzbv4bZ1BmNRgsHNTfaMw3wnpfbgKPBpkOqojdDVytXB+OKCdD3o/gp7OiXwyKYN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128110; c=relaxed/simple;
	bh=pQCOp1S6V/JRH6JOV3082YMk98ZUP3XYs5wxxF1uZAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nK2E8EFt1fFUAkNNfsCmDkU9LUU/XAH0zGgo1jUuCETXMY1vAAs3nr+3dMdwSBKTHQtHKQLB78ETvOqX12HWwc+IktJPpSubyrXcn4Un/SpnfoaTpkxTalt7+gyErL1gvbpdWCCQJLm1vOHgUegWFpcPFFUX3ciMKvEnNy9HYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i0CeG6FV; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30033e07ef3so23889731fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128106; x=1734732906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
        b=i0CeG6FVp03CdilHe0yHBB/XEXnpXZ3svf/piql/ilIL11nAjGxVvQU8HKBHLYlqAB
         zSx7h1Y5Wv/6mtFYTXq4Cp0xUI20Id6M2i4L+8qpfYxEuUyHrnn+TVwEt0VH8GAyvRe8
         p/8ldTm7Rcuwx25EAmBQHW89iKb67pbVcuZrsIRFhskQuEe2LZWjB/GNt/IZW1M6YiMy
         Ho4aqo3dPDD9uoZEUQVoTQDbhDhrK1RyqwftpxgV2JAiD8QlmLHdr9zKyI6/rPv08jqa
         f8+o+f62WLqdQeAx5KWvBbTX1HSXxvg9H8PBN+niQDBjKbOyoMVmWtjrPDV6Kg1sbdge
         9w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128106; x=1734732906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
        b=fDRoNrrAXir4nASmRgnyPSIzMQqQ32HEcpKAm+9OJTJoMa0aqzwPOwthzGDbcnEBxP
         J2aA2Roj+HzSixSxSZAJ3yP+xNLh2maWtIci5njnbr5NVKeddMU3IxiV3XPDsKuvDIxH
         2eNzxB77iOT5OiNcsYeTd+8iyboDNVJF0hsvXX601jHQRRGoMM95OYswxBqhxQjLCYQY
         RcDGkNbf2sDUgOQCbr9Djfj12daVr/aV3+fnrsMCLPpkMBGIgBniOsVnIgE9n884g6Xo
         sKeDwdscJNYfsEmGWpjbpRx8VTc4GwSdESFGgtKp3UjSslQ2fTXFCrGEOThFfHicDVEK
         rmAQ==
X-Gm-Message-State: AOJu0YzjD1IgPHkmjsCoAphAZ/FjbnP3/eORVjqfDcuWAlrQjksUFjn6
	pEK0XoCu6I4VYrMkmVIV5FjQP9YX6l3hE3sy8+8h9Tw3rM6IcmcNmW9Kvz0SVyU=
X-Gm-Gg: ASbGnctWOqlH5xzLW0j4KloQYC4fEnK9vCePXYR58texxLE/UUaqLKKtYCoZwzlm3Zu
	iGLAgph6OWIy9NYxwixLQmbavVxCNVIIS3FaaRyELScpqX8EKxs40slUChjjmXgnz/SgF6n8GQy
	Cn2/f793XVov5XvOuPnw3rEzYXJWuh2m2u2YrAWkArghzDdZbql4Nm0DqZ13ASWAdcfcAH8HWYi
	q1eo9zy4/mND9b3nM2rK6zvrRic7IWyJ2vKPxNQOtbwY+MU3Xgahr29OT6HR347
X-Google-Smtp-Source: AGHT+IFnTWBphArn+3nEEQZAb7l6bmtWQ8xRj98QypbmoOZGU0ruXSDAvaWrK58SXtuDlMbXHNeRCw==
X-Received: by 2002:a2e:8095:0:b0:2ff:5d45:883d with SMTP id 38308e7fff4ca-302a4d2182bmr10620311fa.13.1734128106486;
        Fri, 13 Dec 2024 14:15:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:29 +0200
Subject: [PATCH 13/35] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-13-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pQCOp1S6V/JRH6JOV3082YMk98ZUP3XYs5wxxF1uZAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFa7D/ZOU6IWO40FuM1ZI07Ay9Uc/VNqqwo
 oX+EXBeavqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1QFAB/4vfqU0CQkPt3pS20P8KsDEBmonJiPX1mt3JX0VCdEdcJrcC1udYFMOdgcnMq03qC+YfQI
 3Sr6VpcdPUX4MiqjZVctNlVdNzE5dEZ36InR79hGK4yey7xZ9D5QAWKDe18h5Vi7Uw614vgi5Oc
 ndUA26f9HBfBW9+O01C73SjpM4746nj8kLYvcV3zBuMJv84ymli6thWH5qzUYP6nZHQJkve6dos
 5h9RsGGSzHUVD3kIdQApOO38PUOj+akVpikaL1ltqzeWQQt2EN1dFA9Ko3ZVyzeE2ln5m7QLbu/
 66O8zNnAj1XJn+OTSidkY0+KixCF5/Q//ZPfD8q6BcGR16XQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4b44e4d8d13631b6b1a8824b12cd8d5bd4ae7e3f..188d73b56190c2719a012889d6b7993f38a28906 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1acc1a7d0a365e511d5b6d7cc236e1c28062c76e..12b0faa9e9380034c20142e6c7077192ca097985 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f0dbb00737df2b4ade540eb440cb3ae0baf7c153..4427a97ad52237b4ad64d63e4e02428c76f8616e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -753,7 +753,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5


