Return-Path: <linux-arm-msm+bounces-50701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41629A57B3E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74934167BF6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514A91DC993;
	Sat,  8 Mar 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzEyyjCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D21B0430;
	Sat,  8 Mar 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741445378; cv=none; b=ce842WnqCEii8LrThyih/VRVvdppnWjkB4GOuPs6NXABubIVNzS7iSJeC97DlovRFB8bcH7suTr1gASKSjzVBoD6Wal9VXVtJkJaKYPnIQ6nzTc0rZzNJgTgQ3HGsw4OgEqejxCzQOc9bYKkjemtA1kIco0Zr7VklPHOAwcloqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741445378; c=relaxed/simple;
	bh=eaSqxlytlhlldcn1zbZitCYapmCB4af4DAUQQuxWKeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HopyuIN577eQleNAk1vMHGw+MpsdOuQSQ9WClb8izOvc4JkF2NtnOCZk8+lP2SVJTbeGzaX0sRs00R/8ba+mMLYQxYpb1kqDW958ivChDlUWSuvbi1GsEhZCFv8eP0WBo1BH0PMJbepeIF1iVNOaxtDPx04icrEYZOPZmUtl/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzEyyjCX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so5284161a12.0;
        Sat, 08 Mar 2025 06:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741445375; x=1742050175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRs8q/E+YxEHfYzeqhGXM8vaWWky3KZk5dtfm8gcKag=;
        b=DzEyyjCXp1d9/Qy4bC95ZBa6+D0wRolNfFKEd+6q/z4qlvxqY2KeT8kpgyvlcyVyMj
         XdZMXniYn/WuU9uxHoVZyha3M5QgsVovOMdiiJUescB8FcYU+xnmeYS0HnV6jJFamITj
         7CYzs3X1QBAPTIXd7ulD+018IYSSAVTuoUbsTZ438uuuWY63Am7BnYOoGrCt00xz/JEv
         ez2q9MVX5K69uIen3g3xnzjmjudG1GHvIGfw1ip+eTQFaRCDoFNSnLKg3rF8j2qyyh/Y
         xK8h+H54Uxk+9WgGW6Chd8C7MDWr8/ggGIBMxq23e82ut7jZnv5lrRbwMPK4kMbmr/nV
         ZaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741445375; x=1742050175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRs8q/E+YxEHfYzeqhGXM8vaWWky3KZk5dtfm8gcKag=;
        b=QKYZRljRwthnOEjNMESk9YQXED6+ZSy7+gIbLccvCBHhH2Un/65pPzgd3JSUR4XbER
         h/z0iE0vuuTk0yZUC9Unhd06d4o3VWn6pWzVGakf2tgwwqnCHMkLQtL8FdA11I/csexl
         Sfs+TgVAAd9QPuND+pw7e/WT1Q2xZU+s0XME5bLKkU1YjOKQn+dQJJXUzyvhGWhM7jHL
         Qf4pN7MahMvP4V6bCy3rfIVQKPiXEJyNTVBMuV2N/bcMipCfsaxt9jAWDzvo0wgrK81Z
         e8Fxh1FCTc3x4BNb9FsmtbJhHKAEQE8/trMnpaB7kZgzZjPiw0NtIKCJxHou7IbTv4P5
         Qcsw==
X-Forwarded-Encrypted: i=1; AJvYcCWjVUqzWxdbrHXlNNcwVj7/wAWv83Lm0LA7/FDVFflvywnGrSCWeVoPvWFe9HIBUPyOCmvmR6tDzFfNlno=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+5YkjIR2G+JTdrerzf5bbNBc1pVF+kv6yCjX26JVK4qXIcvT
	LJGC/SSGmjTWEp+WhtS9W/e6RxC3lfKYOR8nmz0FMiuaBdDQ896H
X-Gm-Gg: ASbGncsP1qZSF3OMdDT+cKubyq5XwZHc9nWbe6QcmSIWUJySChpv/8HSULkpcGfkejB
	lSlI238/xd7BRLA0Mln1uSz8u3c3YZEuAE/2xHa8YA3ZsQN+RP1R+N+N0wNy6Bp8FEvpwJAlAS5
	5dxfFT+BY6hcbYpZKrsLjWLfh6LdwMjqV/nJ27/nj/t9xHQo6azd+yUitQG+dZN1y71wlWg5jkS
	wgfagqChCTxamZQPPIyeK2lZpFULPjthOZf9L9kUIiJJfn3LOmViO4UkcdfCToR8QZ3PRRq9ks0
	mnqF3pRv2MZ2IwJ6DJ5H34oEYTfKVN4epqMOhowYzUHU6A==
X-Google-Smtp-Source: AGHT+IH3iWpTp/kADlD2HLaPKcJqEBeUrsjaLWMoTc5IY7cK4QXHzs4NBpWr7xZoA4gbaakl4pzjbQ==
X-Received: by 2002:a17:907:6d01:b0:abf:6cc9:7ef2 with SMTP id a640c23a62f3a-ac252ba35cemr875905866b.42.1741445374674;
        Sat, 08 Mar 2025 06:49:34 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:f465:a080:411e:5b2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fda1asm444581766b.78.2025.03.08.06.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 06:49:34 -0800 (PST)
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
Subject: [PATCH] drm/msm/dpu: reorder pointer operations after sanity checks to avoid NULL deref
Date: Sat,  8 Mar 2025 14:48:39 +0000
Message-Id: <20250308144839.33849-1-qasdev00@gmail.com>
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

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..ba8b2a163232 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,8 +1667,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
-
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1679,6 +1677,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
 		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
-- 
2.39.5


