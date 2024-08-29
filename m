Return-Path: <linux-arm-msm+bounces-29967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAF964193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52198288CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE7C18EFF5;
	Thu, 29 Aug 2024 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baxmJyPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C95191F88
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926792; cv=none; b=Nu7hy6Bk5lDz/HC9EIt91JLPj717QtV6nTt4dQI+Tdq/R8Xyg/9SwGA5xdqrTDeWDXtqbHoakB03FqgZhG2W+OtGT1iWOCdOycmWwmwvc2pxy9qCSE9bxeXzPErOxXSO0ryT4g2hk5I1jXqpwsbDCw8+sLaWrZ/XDHQHpk02uJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926792; c=relaxed/simple;
	bh=sjBVYTV8i33N2zpmEmydrCOK2azR2M1Z7wjB2RL+G3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sa6hQ1um0d0XjhutOIhLasRqVKdLm3Yov3lUwGhDru1HBYzyJAvw+cH1fsv35HQ2wAgpnQXZ+1ApX0DlZTq3ctZknyY7ztU3wobEYXFX1wFE8MY20AmSj1JMhFDA0OtYrnDbVNvStwHvnxCKR6DnVwjHYUme7Lm+iD0rGweFxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baxmJyPG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-714287e4083so449048b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926790; x=1725531590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
        b=baxmJyPGjZfBbss+26Fo28aPN1tdDf4D5DySLMzrEpseSnRTg/o+ZA0pWYyCPNb+15
         8v3dC6Y3cLw6mEqFddxsxQpiqHu0aztkI1fJDUJ/297e2K1/sQzDXpdLNKjIW72oWSX4
         QrphJ3h4jjAe9wtcPb/H2gJzCU2Kv8Hl8nSuI7z+Zwcwwec7SAx1NWnIEs47WCoueuFq
         AaULR1i89XB/7vTGuJWcB1yN/THFX755FdyXqDP8G/z2qZoObAAuoEaeuLgoLOf2NKpr
         tCzOylBRlzfjWXQcvaM0bqlLHCkym6/s76cg6ai0224UmI5mpQmHnZsoTj2nhMx1ESc5
         7G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926790; x=1725531590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
        b=NzM/4oU2HilwAs24Wil+XrqFkRnH0jYINk4+3JFw+Xr84ZQBB9Vb6mDY2FJgLO2ABZ
         SLdNgHQQWwe1/iWPLkffiY+bTysTTiQauwx8kgpwS/EPz6cEiANxdtf1UqZiT6w02DPd
         W3Fy+YtNsyan8b3hxsN1GLpCH6BSM8pMayGL+p6+op5w8H28SNOf8HSuUyyc5M/+L7MI
         xj8zgAaf2fs+5lOloyN3gxKWWwvijDdBac3hjl8b8ysAJHh1ts4cTyR+YnHONGxZgz3g
         OQ1nJJmsFTIjrss0q40k6X3xB8cfqo6PEbbshINCrQmejxvIIcLgGu3BvLm18TNPSoFS
         3wFg==
X-Gm-Message-State: AOJu0Yw8aTbPErTiT+YHCKy3VpNNhaH4PP0Mws/FCxnf+4LYy3Yj4tOy
	MXAOE2ZtLg9hMHcPgXasDvxO+RcwGIUcZoENvbbbRs/A+SELF/eGFN14cKWDtHQ=
X-Google-Smtp-Source: AGHT+IGMiDAlBDPtFQkiAuC1/1Ru4Yek6z8/XGcKf7/UgBC41xY5mzvqMxXMJ8xpjMIYreA+jiSxnw==
X-Received: by 2002:a05:6a20:be1b:b0:1c4:c305:121c with SMTP id adf61e73a8af0-1cce10fe4afmr2046484637.42.1724926790096;
        Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:34 +0800
Subject: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1882;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sjBVYTV8i33N2zpmEmydrCOK2azR2M1Z7wjB2RL+G3o=;
 b=KlDubHL67SerBVY8xx5C5rEgv2bphTfdqkLShKTQ6oSJjyiQdRzrnDbHsO7yCoorHxYyrI+d4
 PPKWy5EToqpAUBNS0nw1kQCBCuQTNZkTCn/nz02pzYUcFPn1NzZ7pG7
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add resource allocation type info.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 15b42a6683639..e219d706610c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "blk_top",
+	[DPU_HW_BLK_SSPP] = "blk_sspp",
+	[DPU_HW_BLK_LM] = "blk_lm",
+	[DPU_HW_BLK_CTL] = "blk_ctl",
+	[DPU_HW_BLK_PINGPONG] = "blk_pingpong",
+	[DPU_HW_BLK_INTF] = "blk_intf",
+	[DPU_HW_BLK_WB] = "blk_wb",
+	[DPU_HW_BLK_DSPP] = "blk_dspp",
+	[DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
+	[DPU_HW_BLK_DSC] = "blk_dsc",
+	[DPU_HW_BLK_CDM] = "blk_cdm",
+	[DPU_HW_BLK_MAX] = "blk_none",
+};
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
@@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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


