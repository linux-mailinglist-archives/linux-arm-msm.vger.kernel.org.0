Return-Path: <linux-arm-msm+bounces-45198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BEA133C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7DEE7A35C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8804194A44;
	Thu, 16 Jan 2025 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBW5ypuK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DDC198E78
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012392; cv=none; b=ex1lY/gcKJ08/zxJiofHrFaL9xrHome0HWoaZggtc0jQHzRszKsRoG+fzPz2U5hZUb/OkcJVGYKk9dP5tUxgLcbixUPoac6/vrPT0Km0NyLzt5D8Hz96zOGBdSu0sET7njrZrUH8RBXLusvhMqKP7sEG6gIDWoREZhNBaPrF230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012392; c=relaxed/simple;
	bh=OIStHp3vqvhCacoNrcsrSybMaAkAUq1kz8KBDHS8J0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8/49xFHqcikg45j6mKszQ6qyp3OoT6pDzeNImiJ5gqfAZ/ZadRhoEIe7+eM2vuSOKAMM0gTeTtBZZkb5BLM4rvg5bKhyh8DdopJeNGGWnSiEFtqZnjUWCg8HH5zhImpSCHFlKkmgXZVvk/nAtVOjA8+SrClQqbOK9a3LHoiU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBW5ypuK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166f1e589cso12487335ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012390; x=1737617190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
        b=QBW5ypuKHkvYdN4KpZ3CblzRp2ruU0XWBnHzvnB9esvNjX+bsxMqZX8QkbvDmfgYci
         fV3I9/tqRwOX3a8oqJnxivdLnaSYpkcSagv1qW/YZBKKigPmwPwC4yBH9lDQgvjz9/cB
         KBJy4M6AHOlaTBzkoM6O9BS9Ulgsdigl+6+vHXafVVTof54lzFkVW2Ludn3GHaXy7zw3
         dM5XlD7POt9TaC37hEoYzmH61hI1WjMcGeD+ZNMyveTyO81SrXJGatVyvEQppZahzxyD
         60RbaDpFbNYauVYqYiecqhYCuxrzkOCXq+h/sy+cygLds56wGkzPfKhw8Kucmo8y1OwM
         /Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012390; x=1737617190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
        b=q5xZUQrhhEZDvcqae7HsVVqN1yCTrgOyiE2FbEGJI+tA3Tp1IDnmwedg998IQkM/kz
         xPGHEFkkQQErMY8jjgGnVLk7SgUTcJmiog72J9baI3RR7FpzfC6TE1I5FRJFqNTk5ZFx
         urlZAmC42L40s8zBJ/TPXeN9mG9NCOVTZiLGZhrmUxlQx73GD1CpCnwCHhgjVVIKxoK+
         NSiZ+IiOWSgKymMK2/1N9PZXLctebTCaiqbzJZofMFx/G6GTU44lOFnWHZ8TDyc2MFf2
         ZW0ES9qCaqlCVCdNHa8kp/rwHfsX1VOOEbimgtPSH6PzesYBOxSwqmODO/MAK8V6nD1B
         vOFw==
X-Gm-Message-State: AOJu0YwP+1BpUNrxKMP+0yRQBGbYSNMIlgQGAXk1e7W55+iqMgDlJmlG
	soXlaq0+YtE9Uj48faH5lIJpEtFS0R32e9P1gHu0Tq1WrDs8HlaG7ZrphfWrkqM=
X-Gm-Gg: ASbGnct84TFNnvFvL3JjKm2bkjFCQl5KIw1CPsKCI0/7BIA8bBsbr7v5qe36zoeIm9E
	xp14AgckJnr2ubHJkSf3GXg7HHPUJpcfN1jUVPAB95K2fCJkpOBR+/cUe5RDBchu81wUTX3BO2J
	i8C5Op8alGdCRvekwVcfz0Z1BFWs0ap3wlMuPyVVeydo/R7oWXMdffcQ+IpgW/uaaLwmdj6VgrR
	kxyqDJsL5Xj56pEP84LUlBYrS208pKMgYPWfA/PtyL8yjLaYQdUIA==
X-Google-Smtp-Source: AGHT+IEEyBRAhj+yuGi93sK/+BkUn+itWY/3PcfWMBSR1VeRwy1zquY8/MSur6Q37Svz6ElMecHztA==
X-Received: by 2002:a05:6a21:8cc4:b0:1e2:5c9:65e0 with SMTP id adf61e73a8af0-1e88d2ec106mr53738358637.32.1737012390585;
        Wed, 15 Jan 2025 23:26:30 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:53 +0800
Subject: [PATCH v4 04/16] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1960;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OIStHp3vqvhCacoNrcsrSybMaAkAUq1kz8KBDHS8J0s=;
 b=rwgQXNy+2oms/4wk72QbrJ2tiXoOO9ioI4wGoHth9IcABkkGbeVTKQ5oUk77DozsBcc/Y1JHZ
 hUFpVz+6JBpAZMlXPjS+fKBTgkhFs75VsPOWOmfKzrh0GJMkarXpjsZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add resource type info on allocation failure to ease debug. Because
more resources are required in new usage cases, such as quad-pipe case.
It is more likely that resource allocation may fail than existing usage
cases.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f..24e085437039e 100644
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


