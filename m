Return-Path: <linux-arm-msm+bounces-59403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52959AC3CB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 853F9189431E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEA61F2BAB;
	Mon, 26 May 2025 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pu5MkGpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22491F1927
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251720; cv=none; b=G3loWLEP5tnsC7w+FjIcOSL4VgB/VlWOUTuxVJvRmUrkPzbLRRDDYFb7ZMQ/0lG6k/SIUFFRs+ro2HHl5uRtFsNrG1HfEiV3gFuZUpExlL8fG0PP5hqaItpe+GyCTj8l2PrKhrg6Woj2jVR4w2HpbDmU4kget8/C+BMpbu3pC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251720; c=relaxed/simple;
	bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uK83zoenZD39phQxvvBuDhXptKT5Y/7otIm/v01YBBauBdCR/Ig4/UYmukapN4PrdSry5FbWt+Ah/3g1qNX9FBUTv9pId2UCxMJDAMD7sde4jlxxLTiuKdzl+/zrgAbxcRKdU6t0Spn10GSTbTGwhM35IBPR63ETdxUkDXKKnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pu5MkGpP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2099541b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251718; x=1748856518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=pu5MkGpPKm+ZZT+7eVWkZ4cEvPn1km0J5ySLBBpQHDy9Rw6Ze2m3KtJ0tSAdSZYrzW
         EKYSyovLRpsZjfVGZip3v26mXJlmTrWur5ubpnnWaq5XaCHOcsu633WYMnD6XNprmL2i
         /RvQhCgHPnbhywXHQZNmCuteZ2QnL/TxDMsakYYjWL5Ct6Jug+Jr/5m+3MRg5Rqp162x
         I24/RVkHOu0XDdz5vRAhReRQtkUXbBCmRF8pkshuQjFdSFkEqU2b7SU/M7948sfrNkJV
         fOwaXv8GBVBHkFKDOiywkOPmd336ktwAV40tXpZAaskJ39bbKWItHKtQDVXwUnx4FQWZ
         fdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251718; x=1748856518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=ek7w2I6/z/ghRTCEshxrEE7K8HUGU7mgTajr6vHsZrOfsMrRrCI75CpX+/WhQsYweL
         BmILDj/VXNVJMLuKQmeCG6KUs8JhUoUWaIT8sVuuNwR6lzKC02KdHC2WiafZbyvWI+Pr
         rJdZKW9afq8NChiFxXEj/NhTqoDcOsqbC9aq8/yUVBYiTK0N2ne7fMVGo5X/kjywZJb/
         nv+exW+2f6sxeMca/v0RET7DxSsU/aV6A/i68oZs9G4aQJL519gFYhuJshLIkKTcY5Sq
         ZynAg8jeyGMAfnv6MjqmuOzo8WERJXGMTzCzXtE8bvAJJ9gHQOOajMIbJxg1x90LDXQC
         Zbpw==
X-Gm-Message-State: AOJu0YwkXClBPfTahyb76gTy3xCF2gUKdSPyEUfKr0vh9UQtDz7cFQbz
	rVnySqyHuwh8/rnyIpzwf42SGAXbPvOzKdtDp2Itimn+JRYoXdKbhSzoKd74BjbccQI=
X-Gm-Gg: ASbGnctpeYMCXfk86dNeYzqeMgn++Ryck0fjksGXKpTbisK/BukQttgnUt7Qvj+R7NU
	ZzV/7eFZQ/D3VVuzmp9NAJvmLusSb5JVb+3QLgK0xq4ap2uavvPXL7Bop3hBP41d5TLkfLyRax7
	BVqeu78PYoknQ8LnlIAjnDFr6AmHEEeOukN6qaCeI0XD9L+dWAw766dq3NdoxMsuh/qtBJjnqCH
	XqQTpD+XlRbIiadI1My+JUsXwafSHzgldF68rLAAjtCpycKdw2nW2xdqCWj2SWtkirIyR5akAGQ
	cn/WjKAPBOcPku/VqlRQU52JRvKE80bl9x0eUcChAw4mz0KHgQ==
X-Google-Smtp-Source: AGHT+IHIEUE39p3pm7fqUEWZFokJNuqhMaFWrAokjMrQkAg+U8O9ypjRt4CVJfbRtZXjQzdHd5A0iw==
X-Received: by 2002:a05:6a20:9f4b:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-2188b6edb7fmr12343504637.13.1748251718059;
        Mon, 26 May 2025 02:28:38 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:28:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:19 +0800
Subject: [PATCH v10 01/12] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-1-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=+odY2eolbWW7KoKHW7wobHwAydvxpsitBhiFd1Xk9f2Swfkbjhr6zFt75/SJEkdUrTE7JTSrT
 +051B395rueB/f33ao+NIt5UbEvnIhNYQjxVznYtMEC1uOXAG0DBH7E
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
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


