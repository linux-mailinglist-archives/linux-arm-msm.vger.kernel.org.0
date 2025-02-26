Return-Path: <linux-arm-msm+bounces-49499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A676A45F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A799F1897F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06B0219304;
	Wed, 26 Feb 2025 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwOq6aSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468AC21ABA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573167; cv=none; b=cJRNkO3vuIJyr5LvFpKJklh5OJqbjux/eqSWgF99obssxQOk5VueTE+E0NrLug/8pkigKFpAhXWvWU+qi70cjV7SrAxF4exNwu3eFww1zXXgnGeE6yL4iHk5j/5rgjMt6+2aZkq26Mun/ZYB3iBg1dXxaiMQ0Rb7JaK7p8o0QoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573167; c=relaxed/simple;
	bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hq1a4SgRoQ2hMcFPerTj6x4svJOwMKJTeK4Eci1ErhbVug+BXOLwIusW6A2XIA/GxY1pfOH6jF16jh3qykHKGGlZVcobVj/pmkiRRelcT/kYNFdQ2pb83PU7qvxhpwKisSqTCwxs2QGS4p/zHqoB7I3/e50q4235NbThm7hy86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwOq6aSZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso10784447a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573165; x=1741177965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
        b=iwOq6aSZUtS9YsnAhRbOB363NKRu/xLiDHIaE3cGUUQHVWkRiiLT/3Piqo1vb2WKHF
         g2FdN4drAFVxTPlVeHdA/BT80ZIoYbV5Cyz4tLL92LR56YLq7PiQT1EEifPs0/7y/IhG
         B78Cm19C4k1LzHRu9GlgUuGEZ8LX4uyRNzT8NQ8IkQINxSEo1EbfB60tV73WIk1jmnGe
         ASFN25w7PkgwQpOnn3wtU7Q5Vh1djERoluGf6EQuaXzhEh4MbLi7xOd9rZZVV2A3uhjZ
         euTa4FnoGobjRaOOXZ8c2UsfdQMC7LpMNRVc3IfC9pdshpsiTcnsKSFOr7Zvk8DP1xL/
         Djjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573165; x=1741177965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
        b=dm46IiXjFGhVyWpTSifKQG2AGsCZmjv+w8RSHOFqLKaqb9A8O4j+otN0Vd+Mrmvm6O
         ndlEEHwq2idb0e//KY2SUS+goKDDwzZvOovEifTC29jD6Hfj+4kDfTb6Cxo753IY+HB7
         c7Q8PxnWDHgGu3+Icxq/xwDQzrIKbx0a3PE7aWtd1vulK/GHrXg0wKLB3qPL/yXa8nAf
         FZjoh2+Ko4/NXe3Dz3mZ+FxBUcC1x+K/6C7WdUpYvhp1OT3xrTW6OBYGfhRNswzA7onR
         824kGgjOj8l9hjqWwZqcM7F/yyO0VPweX6ppZtZQZSaJ/iE5sYV/CI63WD6k1P972Bnd
         gRQA==
X-Gm-Message-State: AOJu0Ywt5ATHjbsc4lp2JEZmv0wqztnauWhOO9bDn+VYz5agoufJqhDF
	JaFchrhvmdytQUzkEdU/yYPAxYR+qYagjEk6bPmIszcoVJtgrBufW+h6ugT7rmEwPzc4dUy4OCd
	EK+49QlQQ
X-Gm-Gg: ASbGncvpW5jENpcpHqy0Uv3B3dkP88htO5DmG0YNWw2is2Jm9Q+w9Ta8fxMVfwjQMPf
	oz00aYNlpRLOWdavIzXGNTxqNpW1s2Sle5/tvO9fEDhkqIlvQgphHGbXUTFkGJIItkodSbpUlwg
	5raNi/0fmSdRInJGA3jPhU29tcKvZ2ndpk5VKB4YyF3lDKrJEe2tDVuSEcvGoy+GyqG0eHnSu89
	KpsuB0BPqUuRyMlbXZFfCONLOahWF2z6zdS23fMLDW3nlInfj7aMP3JEXjK0Z99xR8fCH1zD8Td
	SH3Rd4L0K28fpL58Vg3f9yo=
X-Google-Smtp-Source: AGHT+IHHnvY3kAo8md724TLX/w1JYETJEQRhRXOPcyrnv9Hw68j0FgOVTVXm6m2F1RCRi5C6CxILig==
X-Received: by 2002:a17:90b:2551:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fe68ada3ccmr12141180a91.9.1740573165406;
        Wed, 26 Feb 2025 04:32:45 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:32:45 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:53 +0800
Subject: [PATCH v7 04/15] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-4-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2320;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
 b=N800EMJxkM870hTlh1d1YNwghKBAv8eUi9PS91ZMRhMCmx8xuZNr/cf+VD5ktphz+UCqq2yKS
 rz/q1cuzprYDmmKZsf4SJJ0WuTvxyJq32Zs41gIjKoZyWTEGbOZvkPm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f5c14b9ec34806b83c7a58b71e16..24e085437039e677e0fb4bbd755a8cb3852300a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


