Return-Path: <linux-arm-msm+bounces-69626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F08B2B610
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C129019658C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9A21FA15E;
	Tue, 19 Aug 2025 01:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bo/pqNiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D542110
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567078; cv=none; b=GdQepq1ZP/rum9kNpqczXP92Yk0HN+BYZgQVfn8MQbo785busckb5TilbLx8Wer7/pWDZzTzXzFTqK2Th5yTE46zoUl5ffK3fRmALXoelXVhHvA66McyYJDoB7+Y4MZEUr5WCjaQxkQGqw9yKAHlrGuzw5mjEWezx2o57xQ/n/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567078; c=relaxed/simple;
	bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jj56dJ9UkS2jiqWI04oSg2iibjyzFodKw0yHWGAECBgxeKlFqIjh0yhjPhc6JM4hQHJKyzsC0RtHfORvkmhhcoqgqUaTQIMe9hUVK8cMq20EI9GwWZN0EyY5QQuCnsA8subk0y7z43uy38M5qC4C2V5dr1Pgmu/vHOIWjPhipno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bo/pqNiK; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47174beccfso4047583a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567076; x=1756171876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=bo/pqNiKVwCSqWWlGL+IapfGABk4olZUleUnrv37P7ezoDn4EZ8amw40yClYsKCYck
         5tP8ipgIIjJg+Lkxmww37xL4mVWxN9+29Fh0I5BmDmOt2qlSS4M94FRQic9rN14Wv+av
         L4FTxm1Sk39IKgntkY5n8Us+0yaeL4HaN1qfF+SQ6vNvaSnYVtaGB9FRfz9Ipd81qatI
         eaZ2U2iHhCD9o+Q74jQHdRD3kz731MKU573Wbu6gdY44eCBa5ZleyXz7opS7t5Ee8YlU
         ck2tFaVvWNQ+q0OJMdX+3UfsQ0sErhjL2DTGrTkgRdV6S7G9biJxtfFHe6KTCwG4nHTN
         Bt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567076; x=1756171876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=p+MHQMPcMeBXD/3zP4e2P/0yZhyP0ktanjhxOjhKZUisFOGPvD2TKp3IudaoZYHMe3
         SxRVWjd51mdsBBtTxLJ68MuiBsxSCFXcMatlh3PVlteMOyQqDNDlvuwb+kzrFLU1zt/g
         1Q5lOiJIctVc3voM1vzxz+9HIJLmxiSnTz/moZNuOU++8JmY6Y2EXLNHQOWpFYmtMn22
         F9H5gZC8bv4cneJJbC6klnG9FeEdR+2PaP7/HozrZhH4PS6AL7MqWJ80l+uVnE5T23h/
         5+xZpMMRc+/XlrrOKV4go0oJQSnUFCUxtyYBBtJt4+HjYItFXPm/qDbourX0Rsbi7E5d
         9Y+w==
X-Gm-Message-State: AOJu0YyJIbd4zSUOEZcuoqymQjKORXf2NiZDdyUaNIUAyEZYFH2JTSOT
	bUXgOtGE69CaM8e8+G2RQF+8ckFkfayzg5faojuwl79cmSk75LnnRjElGPaJxLGo5OsNLemlfzK
	t8tM4RzE=
X-Gm-Gg: ASbGncv0Fn1gOp6IZd1FYC1k5Ue3HkSj0+lOyuJr2ArY3a5upH4enZmeEOoIBn8U/ad
	9kVLqmLvS5VAqaO2GbN41mMY3QXYQe0mGrF5q0/F+6I+KRg6WV2RiYDYq6XwH9d9nh/6lW2xx7O
	ACoMD8/oo2LP6/yDLD1VLS1Wuyz0gj0vuLk2fQN/YksRfrBfqVkGrN90iMI+TlMLpWs/Gqw+dlc
	glQ1caBGXbJ7vaOeS+oSYM71XInBJi/zw+o1GXlzxZRlDzxIGdxIFFAAmDzmqVmACnAml7MeebA
	Megl9s3wngUpHdUL+xPXRYBGBBtE0FJij0j1b/7r5nRsi1E6rmDBOt7si1v0P0i3TTJewW2ypTY
	wjyL9KzZCAsByP84akQ==
X-Google-Smtp-Source: AGHT+IGc62f0FENRiq1iJJCyeR6zVE6dbm5+xvtOaOIx8+XYv0D6voNmLjx95QQEIkkIIzZusMZnOQ==
X-Received: by 2002:a17:903:17c4:b0:240:3dbb:7603 with SMTP id d9443c01a7336-245e02cdb41mr10161765ad.19.1755567076089;
        Mon, 18 Aug 2025 18:31:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:56 +0800
Subject: [PATCH v15 02/13] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-2-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=TPHShK0eb/kc94OcL5srQlXFgh8cNETflmBhCcqX/LqO47k+aMecMT7R+mdU+DBvAU41VKW3R
 g3fgYyMrSAJCGTgfX4myvRhkkQwXXYvkI3EFbw9xIYQKRt/DkLP/AQO
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
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
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


