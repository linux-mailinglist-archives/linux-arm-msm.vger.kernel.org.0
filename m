Return-Path: <linux-arm-msm+bounces-53579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86BA8136F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A217AEC35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 17:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB70235BF8;
	Tue,  8 Apr 2025 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOUJVUwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01A14AD2D;
	Tue,  8 Apr 2025 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132958; cv=none; b=Ok6BOJb+f9aeDZOXfsqa4+NjUoqeu2jjl4dnAF9NicOv69OqKy047+BJqIfesVoz1kupCUd4h7R4em7ZvNEFhpBctbzBTARB5uoqYybY4TOyS4yujF2GCLi0wTapacJ2TK0X6I2N/nTraJB/hdoLALQnvm4kxbH3ER3AOoWTdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132958; c=relaxed/simple;
	bh=fo4bucBnXY/q0oK6G7meZ4oUY3TMcCAnjpICzIo+a5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BpNhSU30BsZWE1vCrg3KJiRiot1tvdl/4j2KMf+kKhuEwUVOEsi1VKxLMXqtwGjgIw43CjfIFANWZLNU2mMg4vtfTy8z/0pK1Yoa3sDzM4dW45lp/VpK8V/GZQQe2EqE1/qdpJjoEuoeJCzKcIfGMJ2gOj223v9ikgqA43mQoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOUJVUwK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso3493885f8f.2;
        Tue, 08 Apr 2025 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744132955; x=1744737755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=fOUJVUwK/7BigCFP/cO6ij+v3OIJ/XZAibupTL+cObPZJZi7cNJKnXqBrf4P7pw90+
         EwYB+Vr5StOvgm1rPvsnAM55EWDs+ZKogCSKWRnuuTeDOw42pqcd10TPKoC/CbfqxOB6
         XAPTcrbIJ92k3RT2Xtdb1FdFDT5n2TAW4P6cEORLlbxu/UaFjK0Kc8e9k+xGbMfdAKRD
         SmkU+XP0J3FkbYLBxiys7xLc0SDRWgszJDVm3MLf7nTHehGa4qQ/gyD/wWHp/I0dUZr7
         lwihvQ78KqTSr47XBwcjZuYkpx10VrV+kzj/h5uyUjkGSTVBrOsrboEs3dgmvIM5UAfh
         I3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132955; x=1744737755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
        b=Lpvp2VTvql+rIUc83RIpOOul1H9BjotkkQDZQcgAEV4MPfEldP02BLstoJBgE99+JV
         QXibqcLpSqlzht4wNxJIm+xvALH080lGRJOAlkuqo3m+PEarzkdNQhyMas5W51j2jeeX
         SZnOu8xkPCLrbbSGxIUF6dgqZKv2sRuDKFoWRlLwBzflZYnPpmdwrsfvb4RolmdIBC4C
         zimne1kOHB6XOnphYfry+HyMFHoGdYT5FAeUOGix656Jv69GPAw7SRfOHo7x80VK0vuI
         /AdCP7ySCxjgRs9ka11zSYX4qhEXnHsI/KBzRZfOrU6yUZrV6fgv5rS6+xcZ1BFIjGQP
         veJg==
X-Forwarded-Encrypted: i=1; AJvYcCUlHXD9TlXRRfm0R/2tgCPcuLlOso3T8Z+8i3zUmEiFBqCXuYjO/zUFHb4Zk07hx7+9mOl7L6xqdZTbLgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytY18ib+C05YlIWHST5wPtVShhBBgwSc/1/77ZEa/5gYVA/Ubf
	+hhCzABjq6PbyBgVfxnoObH5VCJeQCASPknuNQz6zU3UrwTbezha
X-Gm-Gg: ASbGncuaqFSOLTk/a0h2LaaweBTlFscn/WFjLS03M2kyjNv2ifBCS3MRAdUpM3d00HL
	FHFOw0m/lBOkSaY4DKxli+/E/KzVhBa/2Hd8XyaK5YZR4WL1HdD5Lx1C++z2MDaBddrgbSNB8cO
	G0XEfUtJVllM5CtMnJlkyZS7J17W6OCNuqX6tllgDVmlUkyjxJEXHA1ByD4EFi/YYj5UsUOKMk3
	1bZm9XN6m5Sz6n68pmwGraWR0+j9nyKLMAtPW9My0KAowsS5ZNIXpXnTyTeFlKN7OSjxbaDwpLv
	J4+X1/qJCWbqiFl8H8K/alm+jNtIwgQ+FtSkAXbm6xg9L1z33FJ43h8g
X-Google-Smtp-Source: AGHT+IGF2ELWn/bt4SThTAhIsS85ycBVt4QmEGy6AROd0iJukYlBEQMvgJpx007p2eIQD1aBh/DVGw==
X-Received: by 2002:a5d:64c4:0:b0:39c:1257:c7a3 with SMTP id ffacd0b85a97d-39d87ce3284mr16492f8f.59.1744132955207;
        Tue, 08 Apr 2025 10:22:35 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:5b45:5642:beb0:688f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm15729953f8f.19.2025.04.08.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:22:34 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	lumag@kernel.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after sanity checks to avoid NULL deref
Date: Tue,  8 Apr 2025 18:22:23 +0100
Message-Id: <20250408172223.10827-1-qasdev00@gmail.com>
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


