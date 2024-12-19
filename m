Return-Path: <linux-arm-msm+bounces-42748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7719F7628
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85B077A2BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FCE217F38;
	Thu, 19 Dec 2024 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEv/+NqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05606216E39
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594593; cv=none; b=Y5RFQTplca+6Rdz5t7tEOKA6knT1GYyvQ9gY/34FtYtGqVVhjzZzP8Rj6gR/VPB3yye6WjsWXlptS31yMofFwTFk3imKHzYyET9tiGxmgYTApl2bLB3bfLrujOMqVnofcaTmEj7oquNZJxQ5ukMDsJd3mUCiX+jAAnpXipaPnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594593; c=relaxed/simple;
	bh=OspW4wNM9FswzvS293zm/N/Rth99PB/cv63qlI1/JXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqAQz+Dy7pR7yxBDFEn+bcF5lIyy5J5zuJlyGSWaacDGhSFO+OhTfpVnIOZEnS44lCQyPg8K77gT0O1w91J4vRvJ3+sttKjTx+8/VUEtTNyB2/8dUkJCuhQfpC9HyNBf6MhGmJmqyhx8f9/uG4OirdPgd2G8KyLdKddkQKfubAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEv/+NqW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso331797a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594591; x=1735199391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntwyeNHAM8vdoBllqLbul3GM7LuDoqcfQURQf8f/iyY=;
        b=JEv/+NqWy2ps6EFbVeajqDStg9Wfb4VAVlGk0irrDrYZQ0X8lx8+qd6ggPIrGqojY6
         5PNofg4BM7OWshh7DTGkgWqpIXfWmp7acApALB14I2AkDD4QWi+HY4oyvmv6B8n6dmm2
         dg9Pg76Z3fLPY7cgJ/Sy+Qiqi+9X88LYkIWSEoRRDgeZsw0KFa5/jgkLSX/vQJy+u3mM
         BpJThCafunpNmB74LkKHRYllIZRJaBpMQGUFBJCkG052DY1C4/x2qwan/tpjwsgS/Th7
         mNasWrkq0r1Y9xmW/BSlqvaA0u+TO2utrMMxz+wkB/xdSmylCVBQKwqB04t55cu1LQpD
         0mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594591; x=1735199391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntwyeNHAM8vdoBllqLbul3GM7LuDoqcfQURQf8f/iyY=;
        b=BbW/F3gLa7EOHRtq6ll7Tmej2l9uQPTcT+pdhZlX+KR9j1LyQLXhnvWpLDK/52IAMk
         vvsWdLbwdDwPmUuUXMgXIzJv+TWDYjRy5uXbde/32pWd+iig60lBtQqT+evnRVEePRKe
         L5xZIsWSA5fzj/XlDbRr2bH/F4hoWguzbQaMeFiCpCA/Gr3a27/njb+Tanyp3NT0TMRE
         +TFhb7nFgbA8z32fzN2KSgAvGulhGqUq6HSkmhbygg0uBlCBPs7/sWwUWGA7IuV6wMBi
         6g22JEVXGDrCnYVeeEhkBiusHC20b/yp7C8M+WeQpK2uQw2q+DMfctYlMF2a+zSl//pD
         3gAQ==
X-Gm-Message-State: AOJu0YyotP3umsKDj25mek1fxDP5rVIwk+xyn+5mtjzS2McyAqG4suwx
	H+EqzxYr5fXE9msCQIBy9jIX3g87LzKib84KTRfhK1Cfv0u4yMBd2XOtP8W2Z8XisGeo5m5fi8f
	I5hrRSQ==
X-Gm-Gg: ASbGncsYVlgM1eoDO28AoHdEkPPBGSpnyF89q2sHXoM3Y/p+6iTnhBxkYWjDdsqWw4L
	6VDgT/Y/1hkmFgDQ8p03vO6zXz/CJS9AakZPYDzcvd/Ay0YS6a/BWHCIhqnDRjxezHyxCkznT2p
	u2oWIAmy6So4eWTKEfB4Da55bVLp2vrQ9uYkuqk9TNFuXMH77khNA6S3cxEQ/HAn9fvaSC9qgtu
	hLFPEdUYNeeEnSxPx41Y9Ht0jtrxWbsIXuhXwjdDT7yE6Orw5hJkg==
X-Google-Smtp-Source: AGHT+IHylhqGksguRWryHJqU/y1cSrvMKT7OODzv6gUo595Vy99rw8bFUAq9w5knvwhJEVvpdpUdWg==
X-Received: by 2002:a17:90b:2c84:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-2f443cd2db1mr3408286a91.7.1734594591238;
        Wed, 18 Dec 2024 23:49:51 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:49:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:21 +0800
Subject: [PATCH v3 03/15] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1781;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OspW4wNM9FswzvS293zm/N/Rth99PB/cv63qlI1/JXU=;
 b=6gxzO2YImydOFCnp2SlOv3X4bZtMMSqMY8E3b6yJztQzfBRFpLy3nUYay6jc7K4FHaZ/VOBRb
 b9X2Qi8xVxgCxd/pUAJxWOnuN4H81YbCeer+5H49yOhoSYQvDF3bI0A
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add resource type info on allocation failure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 6dc3fa79e6425..cde3c5616f9bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -814,6 +814,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
+	[DPU_HW_BLK_MAX] = "none",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -874,13 +889,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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


