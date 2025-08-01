Return-Path: <linux-arm-msm+bounces-67395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C92B1849D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F47A8162E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B7626E71F;
	Fri,  1 Aug 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIjphZkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002B26E6F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060907; cv=none; b=uSjmZVX+Uy+0jq8lWaQVTinDzEH61by6dJmsw4w8/l999TrrPncTDiP4f6LJuw9553rmfh7M+gjOteAv7fiFlbHPC1ryfhnIhPtNlk4qQ3M2cqbr+w+kbgdBu1vPZSxDU+mU/mSANKYDeAwVOsKmj72JPca3nlJuKi5mBwh9XfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060907; c=relaxed/simple;
	bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKO5ar8o6I5e5QgqPxEK/5lhk1VpWx555p9aViYcnCE61M1xSkmFIDm5iGAJOT5gD8Tmzvl1adEeVBlq0evzPnl430PJ4KN1s7g0puhs3Lu6WrBJzkHIZ5SfL6lYTVdQIbOrxqEDF0EJ2FfEnlYhIRZhAmHwWbBOUe03jewXynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIjphZkN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2402b5396cdso14967935ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754060905; x=1754665705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=PIjphZkNp4eZ3DXXdxZnn92guYHcTP25oH4NBY2TdxBGueCPNtO8Nj3+GRS+gvCeAI
         eMP48MozRBRHd7cMWZxE8RUMf5nD5rm9g3TfTux4tXZPEh5BGFT/RFWvfllNpmd4DgI0
         0wQKKhJr86gdM80Y9LUPg9wlSYWxBNwBN/bYpjwZ6ZAVbCv5zcRbRgNAsXNyHbjhCbJq
         HGOvlzd9kn5vBcxfQTHyWbVoAB15K1MbT6AaOL9z3McCD6hP6D6P4cvzTDzpkgKxyoAb
         lErtq3swXXrdrl/OKxo6aarPwpxRubsLLhJMgMn896Gma5AF47dnZMhggfIeyjIXnbfw
         OFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060905; x=1754665705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=SzEPQ4GcDE3neqEJ44M5C4R6y1159R8AhKqqI82Lzmety5Ccanv3J7xqtqqv4rrixf
         qIdxu/eilo4yL5tdsF1azq8fRk0YQgWpnEqA2S+ZzchXHuQ9ikH6/YtyzVA9ekFG8hu8
         0vLJVpCeLRUzHhzrtABxxnTsPp+F2aKkwGi/Y8gvNGW0orlmiYJiiggNhN2+R8UR7jON
         0onKIQQ4beK2ppJ3DcwyDvUHw7+d+6Lo35y+Smy8fojc/hbTeWlyXRxZSO7wk8NQNt+9
         N0sdS/M7jbqiUiuCnij3tza6OKncI+KD8OAEe4NgJ818+db9iwGoEj8xVAjTc115hES0
         t9OA==
X-Gm-Message-State: AOJu0Yx4mK3h5ElTY2MviNAY+AlSG9hkKk764sHoy5ByhdMsgFtGcJSl
	9tH0ZAZvMRxf5r/dH56wyvlS0FkJ6fse9VDCiFwr63sUOqxUMyB4GnS061CC32cqyGszAW7YsLC
	dVuN6C3LbBg==
X-Gm-Gg: ASbGnctye/Y6KZlBChAJRKIU1lgMUFm94rPOZiLaCdfqCdoqkYZMx31uY8c5lathXSk
	QbD77tdGs4tRsdIKXlQ+o1IqpqNPD7xSU/TYPcvPlwYtvUbCskwkWa7ugGz/r4zNyAstbWIeWee
	HGJ0KG08YOkRL6YeaOjyzBU0o6dtDe8gMlhlx8Aq8lcJ0eFENqZUbvlQIcbP3BPDU0Stld9fE3F
	boYYS5kgPRm4uSwvjxzGpAACFtZM3Mo6hGY0RCAQEuACZlnf/KNSPwIpTHSL0Tjla9jH2BOhA0t
	gyps/qHVP60YOltG/eJzBB/Ec0L/Lh3I5d+BDvdwQ3dO72TL5dzF/eREU5IPWKRQ5SjvjHguYo6
	zU6M3mSqDIebmuD212w==
X-Google-Smtp-Source: AGHT+IH3rFRxJbNEGoIdlXfKI3ngk9xo4zAbircoTLi1exmZLBTo2nsmpqb/YUonhRbOCVX2aImZLw==
X-Received: by 2002:a17:902:8604:b0:240:7fb:cb05 with SMTP id d9443c01a7336-24096a4735emr123884225ad.10.1754060904805;
        Fri, 01 Aug 2025 08:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:08:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:30 +0800
Subject: [PATCH v14 06/13] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-6-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=PumtsqWG7lAhrbJemwLfsU2Y/RTvVTcmMraC19wGoL0TORM9byUPT7MayzR9kpGKNZg9iVH2X
 PxhaWYom6+sAVwBecB/T1mVg7v9mGANR84aZ/A4gNhLkC6vykj8nEdQ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a40492e5aa961f7180ba4ac6c86e06fcccef8c2..cd0ec3edfe2fa8132e114bc1544c389141d1c1ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -419,7 +419,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1


