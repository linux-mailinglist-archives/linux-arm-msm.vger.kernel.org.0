Return-Path: <linux-arm-msm+bounces-59405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D980EAC3CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6151897192
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CA91F03DE;
	Mon, 26 May 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXo5Itmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7481ACEDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251733; cv=none; b=elV72qpiYTQ9PZtTEA9QZ7LoXAi2DvXaq+lZ6YbDYK/57k32qKV98AzfMtqy42v2K1tgsekKzq7/fvune+u4m4LFUMf3wBLtyPi+c5psu9MuzUnSqfUaNcqBZk1CN6zTy/MXfYmCFYUUJzrCzzt9FYc8ydduqOxKTAX4Eb1qBbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251733; c=relaxed/simple;
	bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL95kD7fzUNY/LyHmyxhYPZYkguyeTFDb3hSSf7knrhYt3aSoPsVLNJ6kbJqH42aXE3+TyClsmKXyeO7gr6sWbsKnKGjVq30QdGiqt5vjuC3GcFo3rO5L1Iz+hiUEAPzjV9PMV2islEbSjZg1hDe4otcUCjygBT01VPeMkLr6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXo5Itmn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399838db7fso1519814b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251731; x=1748856531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=bXo5ItmnqZwYKryiSm0c1qZw5r6/RNVhAUBcHeiPbVIpCOjM/lhupVS91gxMGI8tT4
         P787lciIg4lRStV7S4z5Yuio9hknaXym8WRSevHl3FueLYc4ExD7VYRv5lkCYcCUjxV0
         p+nmoYnHM3MqdZm5ri5dyBis7WFcMed8fM03ouP0p/lekNFCA4yNlDMCDzpNXL24lXMV
         r5P1aDhBo1bRMiBuwXyxhMsn3ZlBz4ZIL3yjZE120TK41+EAvzOfHnZdFiZ7F3CEyTwx
         tg+LJpoEGRrUuvRmmHa4fBC+u6RKA/wwEFO4t6/Gif03X5Y4OAH5v2IdcesdskVehHfO
         B6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251731; x=1748856531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=VIfr/7Jrd3MpZglyObWmvaQe5js3Wu+a5k5pAdyQRWrUjLmnvLpmP6swbat82iYEzp
         7gGDxznTEFl4QdUNLyX1WdtOS3WruuT2411/MCm5z9YymRbRkDVBSi962w8xXmT+cCjL
         pI3qrERXNKZKsF+8eCsCfnEFSicNCh82QrMxO8L6a+hPyguiT+blMZx4QZviVg4R6sX5
         goBfnruHdfySFAwtlEEWLtAH32Mz6RKnF52VnFitOS/U/ynYDlmeC08a+uBLCTOS1qYL
         18NTMvfkhhp2MLIBquq3YGalk1+1peLZqctcAMXXgu3o0AbQsmOTIgQLPSwvtdSjg2Md
         kEsw==
X-Gm-Message-State: AOJu0YwruerMu0U5/cssMoFvJy482RgHlCyYAzKya+xpJdvmYUrHV6N/
	r4nRMDvVCYtZWRlZjDrlfmIFzyzxkExaxSqK1bUBGz6pVae4R6DyaFHCaXNK0lLRQik=
X-Gm-Gg: ASbGncvsDUpEBTngXmpqMJl5VLeeIpU85WFvH6zAM4jDtplnQ5/vsp5WFWXCe3qWpmo
	AqXhC9yEL9tCfe6E0H17NX3KuyLK1Rp1rEqLh8ts4lbdNmAvo0Ndtn7JKtXQi4w2F3yoRtMbjIf
	xDwUSPl9U/e5cSur2dcWrGpwOHn1128rMDcXXt53MMdThs+CcMY6BBgeoKnT2yQm7NcMAJlHyMS
	v4O09Y+3L2dqj70r5k27CoX+iPfLXQsnOK1z8lD+hcW+wXeNoHKrQlJaeyHhb74QIahuerb/gsX
	QwQd9CxezAtaGliswxWmMGmPtCpucOepiT2c0Ed4pwTpb4qAOA==
X-Google-Smtp-Source: AGHT+IGJHwGsOxCdN5oGis27vb1AyYNhvNbxlgv3Kb4o4M728AI9zEGSMuLJuyD0gEFVU4qbEDu0qQ==
X-Received: by 2002:a05:6a00:138d:b0:742:ccf9:317a with SMTP id d2e1a72fcca58-745ece8e29fmr18116579b3a.12.1748251731195;
        Mon, 26 May 2025 02:28:51 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:28:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:21 +0800
Subject: [PATCH v10 03/12] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-3-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=lutuJy0IlgOtx6aUkFLZEfXbrUQnxG83yF25Vb6Q9+e+okhLrSXqHlx66bdw4JoPZ/idme+0t
 fsk2zMHDXoTC4OFQ469lUlWf2vO+151FQG8yJoYNfRKlvlJCcMBqOuI
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2d8ff4b524715c658188fe56bc337e3ffa831c0a..bc7639a46386c6b9457edf3afdf6f747a632651f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1


