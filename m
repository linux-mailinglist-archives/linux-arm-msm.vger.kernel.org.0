Return-Path: <linux-arm-msm+bounces-50614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D733A560D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A263B4784
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB76B1A3155;
	Fri,  7 Mar 2025 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma2vRfTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DD1A3151;
	Fri,  7 Mar 2025 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328707; cv=none; b=LmckFxaNsbaF6T4tcSM1g9MJ/MI5CCT2YrVWYSGF8Ru6jJVVA3xFb4URGVAIQWt5l4DxyepXwKui/j7cyzbOB5qVcohIrpg0/e0xveI457qQ7XsUVc2RgPgvmhE77VKwluQ6vwHIjsPiGMUWZQi9gLGVEL2lWdo9SCo+02eAsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328707; c=relaxed/simple;
	bh=ToJ3cdSShRxTh5D7YbbrmuSVXEQc4dk2gJEoA36jpSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwpF088QA2bhVg8zGBM+te1tNUXN9zPbcKxExqfRQ6fuzTt5vlB+pNiJNq/7GOl9LAoU48dH7QxLU77iePsnYCAsHLW5Gm3ho0xdbr7l89r4eHNME6w76uOX2WmOSOgk1gBeDkKRc7Vv5ZhqEu6Vnz6Kv8wierVsuYbY7mPvzY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma2vRfTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12850C4AF09;
	Fri,  7 Mar 2025 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328707;
	bh=ToJ3cdSShRxTh5D7YbbrmuSVXEQc4dk2gJEoA36jpSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ma2vRfTpZETfjiq8xEkioqtoRP+fxwZVqSSNO3eulV4HVGVoFJ/WcNdMbiZOW1aNW
	 dptmcjtQaZIHxJMYcy0V3WMP08W0WRcKQf29a9bHKHjbLWq3onp1OhYb1LsHFWDOII
	 RRTWHl4FOlZkv4+oDoWeL8uivIfOSenASwdqAm50o/hCy6Tq0d7NJOYnt/REv8Aae+
	 rjMww6SwGq67heVvB150q7wVbUsJiOrgzxDq2nMrskQwnjgOARiEnh+dbLKdlQEmKs
	 goOJ3vNLEjMzFfZnlZlJ7sOCxBBz1+5fZoJRVaGIYfsMbePWurqegSkrzrSCMRRNi7
	 by1rDHPXFEvxg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:52 +0200
Subject: [PATCH v3 4/8] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-4-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XtKtQEs7QltCe35WP411DsS3zIkURK+Ca3d0ucslYjU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0Josiif5SEScDkGJhl2eT7X6NXJy3N12wn
 hzi2f+Qa+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1f0bB/91WlJXYDXmggaf0hbEqIgDXXViJDXPQ0YJV5zRc0a23Z4tsW/gZY5TMYw5RPhD6z18Wzl
 n8x1txku97hlQaZbnNeFyJuRi0WHD7rk6jAwoK6Q2kgWdUoO45SOSowyn8pvVfLvCtGevpICddk
 UJuWHx2re90hZf2h0t0nohYwotgBxBLqhXxkVt3Wd1Zn2nStypELAJiGkjoFTaf4phSrjFh6WHV
 5Tw7wnWA1QqRtYPLzg6GeExRX+7YxdTGbN03rDQ682Ryo3FzOdF9x0nHOANuiafoZ/oUI1fK8Fb
 nqhnlG+FXmBBU/GNy5smz92rYIawQ4PxVBc0ZHYdEfdrz2ou
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On DPU >= 5.0 CTL blocks were reworked in order to support using a
single CTL for all outputs. In preparation of reworking the RM code to
return single CTL make sure that dpu_encoder can cope with that.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056beda6b54c0d20f027a53c84f67db..b5e8ba592d8af298a52924d34a573d4f9e05c476 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1247,7 +1247,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		/* Use first (and only) CTL if active CTLs are supported */
+		if (num_ctl == 1)
+			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
+		else
+			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
 		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);

-- 
2.39.5


