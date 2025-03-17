Return-Path: <linux-arm-msm+bounces-51602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC06A648B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F188188D7B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 10:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0EF229B28;
	Mon, 17 Mar 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBbm7DCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DB2253E4;
	Mon, 17 Mar 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205866; cv=none; b=qdOtf6jvgVfCY6GbAtcDDVU+qlGCP5M+SWsXjQoal0IshdMs1/96kjFb2aOH15OmNG7WMC6QVQtIpCiO4BqTvnortbUmGCXwa+opuJ5lYeLLr95qtUztC0dKfJz5Tsgm0l9sGMWxXdpndN5j1cWIuRXVB1Tx+fKZW1vno5lUMgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205866; c=relaxed/simple;
	bh=fo4bucBnXY/q0oK6G7meZ4oUY3TMcCAnjpICzIo+a5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XBu4KucS8IHS67YQywhgUQRlBUDf+S5Q0Mh8nmGsL2mwZKmgLhjuy6AR7mz063mFhPxPTNUeqKLNIXqChcoybHUYvefV3i8jsrVdSlVYnIdVoAeghgz4dRB0PBktnqi4xlvkXqHMYCKU6hfY/xtp2cwIro9eaKjecVmpaUUKrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBbm7DCG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so10381915e9.1;
        Mon, 17 Mar 2025 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742205863; x=1742810663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=lBbm7DCGlORKae5NgPnNmccYQe2FAdUB6dOptUkb8cNpXh9D0vKvotkCPwUlkjAeom
         5xM6yc50V/8+34ERMd4IUCaRjz05jehks65GKnY1jceE5t6lawhgomMTonJx/BW/GQL6
         VWzwUFTfSjNT3tnLP4OTI156JhCR639I4ZXT3yz1YFlyx6xlRJ0qxU6gRulBk/nv8y1+
         q1VOw7x7+6ShS5SbBAjgr8PyXcqk2CvjcEYafw1KYkCICJpfAkBCTImCvIkv/MRWUWba
         IIFvzs24wumLm/z4ZlENT87bz6OwwYCLSUrI3o+aDYjOdEXhX17n4FNhQ55bfQ2tCGo0
         NApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742205863; x=1742810663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=QQzk3bo2/kl3FiM2XaStoQFQmxLcLdCo7B3H43a4jHFhAlNatdsmoV1wQpXA18OpQf
         Y6HLwAHqf0QHmqJ53xL9nb5l9qvu1zW21z/tPYg4cy1DJgBBLOt/5DbFyYXN3Ci9BliC
         VbAkWb0Gy9nHGU1xLv/xfUjTjn68iu4m9V+svBatb2gqBpLIycFmPjUPUe+jvR/A1kkG
         mXEVAP/Mmzg2YRXfBCrqOkzHsgY08a3RF73IWu3LvP+NjxV8s0iHlbdGHwnrM0M8HmtF
         de4JbCNOycwy789nzaMp6DfShGA4xfTbBMj47MORPOuVmnvy8/aC59UlTc9gNxsXcu4F
         C3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTBlFINvi6CRbIO6tOjoLn54iLU+Yl0vYhvrH80reOX12DhaDSKQd5+aWBEoe8SWRL+H5es6rmtd/oWdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6O2nvlq6Oj3Xammh0aqiSr6DTSidtko4v5azE7psjV+Qc4OL5
	ezdrBgXRI69RgNvifdd+dnOmshna55UepWW1oWPTwSKTaEIj6BCW
X-Gm-Gg: ASbGncsqjq3S2QDy2zM9cvRuYr+GC7IZj8kqBAGA1m+6up2rgQWHzFfMZidCSrJkdE4
	UYZyBOLpZDCYC7U+ekzeZyZrEeu8sSyjslP3FQgQWgLUUoO/k0JfXWuq+3MI5iB+MZ1/VtgFWVV
	ZRUimle2BAbCqS/OhrfFbFU18+1EeQZgpVC0jQmH68QV7YOKcYhDQveQVe+1ETTCpv6LE5ZxwKu
	9HBE7mL2lxRaFMsz4cxkjWwYaMQ5C9Akt6YrIC+jnHGATeiFXO1a+a8E5bdnrg1Q4puGyHLiUHE
	7Hoefd7+mtoGC06YgmaX4pz+r1AssAalAQUJJ1wgDcdZLZn8JZxSeNo=
X-Google-Smtp-Source: AGHT+IFfGeQEz1fH8E9WgZ9LTqktpbJrFeivyHsKULyD8zVFvwU6tCzK0tU0jMqV23CaR1wP57QAPw==
X-Received: by 2002:a05:600c:3c9e:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43d1f1f3fccmr125031635e9.7.1742205863188;
        Mon, 17 Mar 2025 03:04:23 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:12f:b743:681a:75c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62c1sm100391105e9.4.2025.03.17.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:04:22 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after sanity checks to avoid NULL deref 
Date: Mon, 17 Mar 2025 10:03:55 +0000
Message-Id: <20250317100355.14789-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
before the sanity checks which can lead to a NULL pointer dereference if
phys is NULL.
 
Fix this by reordering the dereference after the sanity checks.
 
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Moved Signed-off tag below Fixes tag
- Moved dpu_enc declaration to the top and initialisation below sanity checks

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..0bd1f2bfaaff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,7 +1667,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+	struct dpu_encoder_virt *dpu_enc;
 
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
@@ -1678,6 +1678,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		DPU_ERROR("invalid pingpong hw\n");
 		return;
 	}
+
+	dpu_enc = to_dpu_encoder_virt(phys->parent);
 
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
-- 
2.39.5


