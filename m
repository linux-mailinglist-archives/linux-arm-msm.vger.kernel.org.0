Return-Path: <linux-arm-msm+bounces-24378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF8919A05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 952CAB223CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22A619415D;
	Wed, 26 Jun 2024 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqa3c7s/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A51940B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438369; cv=none; b=FAzLO02bXe1J/IhUR5XH8XTHNjkOpQLowk4g1227CgAofSbQQlwKDWOt5sojWdgE143VpeJH2FFBXQCJ8om3tsDhe8NmumUfySXIoHBUbXdDUsHJp3Kj3yOCUIjuq6pF4yZjys43sPFqvAjzcMFb5Ss7kHN0EGz9ywPGpSPIM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438369; c=relaxed/simple;
	bh=8yHv1uDtNh1zFe+evsAaAR7pHsAK+9eMVbKmkVZHZ3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUY1ff4O+jzCo0jmh9IWUeBe0FSDGbesUoc528Z1zjSmLL1QmFWcyccuIkBHZHBrFU8dHBTn5Cn+l0j7kXIVOsfa2UYT0ZwahOouJIAw6hoRtg2/HOGm9oT3NogzFM1/liY3I8dESlWuZVx6sagsJhOAHnLLzCFl36c+isuUpQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqa3c7s/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so80296581fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438366; x=1720043166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE6HtgQd+Mx8Lu8xmMVxcDxjcKP5NsJsVfSIeNxRays=;
        b=bqa3c7s/FJzTGDAB9CySxNod6REk6uP3YLUmfsN0y7HAJ/kBVSIY5fUeUKj7KHa9vW
         S2T7mrksVEkTS7bQtUbxNd9dkbF3bwvRP+5GZ45UIuuJM14i6cVKyVU2sT3ZpVc/z1sH
         JFDUkhHHlEeP2u/fx6o1FmSUarfH1rikf7avVAcVlUlBtRkB7azvNLlZl9KXs/PftLg3
         UI/MBdNzJ1vY37Yg6oj7z3VwYpZgJnSPv4OWZtfMIcakpzEuFdV3zsrQzaVfAiyQ6eSA
         vH7e7gx7uoq7DlnRQyQxAkohn1wzHmPkdPyFg4EHXcqR0UnUQDmsnzDqeY9R1LuSkyvb
         LrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438366; x=1720043166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE6HtgQd+Mx8Lu8xmMVxcDxjcKP5NsJsVfSIeNxRays=;
        b=CGiGM6x9xb4lgQxuy44CSkreQPsVJ/irB2FVR9qn1d61Ch5f0QBGHtSns6tTHlOCuu
         rC7OT8hlI7sKtJu+w9DIX1lfACcltuq+PlbPEJd7o7zsEYspGrHU3h1ic54WfRNV+4QR
         6dqmtaYtuiaCVPzCl8sSKXjJX7x/CjZUqcJC9b/rooQPPrQJiqFZ0DStqa5N5RVusv6J
         sVpGV9nXuJti7zJVPdHgLkNlrsV3+c7a1qgShFZjL060ZB/+1a/9h5Mc1T7weXTycGJb
         2AOE09+JHGCVFDaZ/vMyYBb4/cpCDDAmbmMUq7oiI3dRXR8OCNUBJyOTRXfM4ssvJRwN
         CKxw==
X-Gm-Message-State: AOJu0YzcQDL7yw0GDLKiqo7+sqn6xdLYQPNJ5s63ZZuEFDsfw560+MOH
	tTChecOqLoh3bDR8XsKYJeikcGaVT9w3skMtw9CsUWLH7N5xG7jVQgfnnxwbX3A=
X-Google-Smtp-Source: AGHT+IEcbqPIXB+PkfdI8Yo0kLZq1BBtRqDahg0rt437G73mUya9VhLJ8pWt8yUjhAYLKQa85KaTeg==
X-Received: by 2002:a2e:8416:0:b0:2ec:500c:b2db with SMTP id 38308e7fff4ca-2ec5b37a4bfmr67252731fa.22.1719438366287;
        Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:58 +0300
Subject: [PATCH v5 04/12] drm/msm/dpu: use drm_rect_fp_to_int()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-4-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8yHv1uDtNh1zFe+evsAaAR7pHsAK+9eMVbKmkVZHZ3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYzzhIPw7sJS2U0UBMC5r5eumxFeTQOFjn+
 xuuS/LmwFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1WTqCACJo+fFyJf1Chi3/W+DgOXcyhvo9JItDrAOrp0c44p8n+h9IBsRPTFGinOlQkNK07lHQMq
 UqiAYoPt81sPwVEZSuAawZ1wTUBl+AOSg9LmxqyVdw9df4omxB3WZNqsUs8qSgnFB8Yb7ieb8/f
 r2RK1JWI3ZxOP7FpMei07VkIlmoz0eFgNuiOVC5sqOk9BXJ35IrFjAAYpaDbkXkY65aveRHcrjx
 G90yQ2O+51lHWOCu6qKcsCGD9NRLYdUkPZQoP7RMf5LnvSmrdK1tbaIkoRFFFkVqrAW0t3d9d8g
 iHIBPOUJ29AjqSd7AA1RLaKzTjQm/mTz9fFAQq4pPmhL8Ynb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8f2759d16247..4abaf2bb8a08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -837,13 +837,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 

-- 
2.39.2


