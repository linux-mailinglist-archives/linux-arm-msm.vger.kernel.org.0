Return-Path: <linux-arm-msm+bounces-69633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49787B2B630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D83A527288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222D023909F;
	Tue, 19 Aug 2025 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="miLgbS4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130F239E62
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567117; cv=none; b=EEb9wa8v+SixG150nt9SSONPzj9QozmQdcfCbif0OENwrblrc0SLPHGbidl3PpnP3VOhWIpReNT9owL4wezR8ysTLj87iUxM60j5y+CDaR6KBvPjy1mPxmSZC3ydBSQFl6lGMMWLkd3XuuLFKmPW0cKQJYks4mpK1eb34kH+7O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567117; c=relaxed/simple;
	bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqXEv9a5Qr0GrQgTKRuFtYYG4r/EoexI83WnWxa4KZT9LfaI0AM8KjeN7yf6U991UAZ+M5Rg6FmXxfcVd/VqGsJEevW1jM6Kc58dGCvESL0zsIBvpeBg/JZuysu55Dj8UOTq0YQPneZ73Fe9ljLuBR8wGrebPzetiq7x3NRmL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=miLgbS4r; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-323266baa22so3679224a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567114; x=1756171914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=miLgbS4r9M5ZMptz21YrcnlInF1gfWA48NkHE7KLJVvP67WJIR0ZKhSLbrzagZJO5i
         kM6NV3L+IePHa8v4XRX3EnyHPalEArdiD68a8NFhMJ+TfSpxNniJ+HaL2p0ocp1irB2m
         yKswvtplEGbp/Wg9yMM2vtCoGnF5johLyyjJgPXeDknFoC2PGdySSLz6u94ZuWY6uwQy
         1HUUnawv3uteHsqS33XXtGNF7iJsdqzvvTnogJUn0YVCBuvka0XacwcA1qne6CnDuays
         krA394if43SX9KuOoetaGegN4qqg+YhFnCtcXevaXYvUZthzRtJ0pkYfsaUbfUC2QkO6
         5ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567114; x=1756171914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=WCNYZWvP6CeQAYUyWLSiEIzQc86+YdgfzMXD0Epp5N1wl6fHVWSWzySzw7AVnba+ki
         7uLYYzn0S6iOvSop15qNiyO0DvGHAFJ5LP6hVN61CLCGPjg/644ofxkJhag2zxNM3ECR
         K88D/6W+nLaecXCMNMFzfxRFVaGfsZ4uljLqDTaFiEbYyACyit7sroSAcD9zONOXt9cX
         fio5dleFgGdFeuWkgy0EG5sPERvCLxL1hF4klGkQNuy1zAf8qq5/hMgKi+9G2ocPNfKF
         ktHlKcLOVhTVvf5QO8GcpBuI3JOchk8wTQ29trt6eqa9kNSjHW0rriRyujzLQDsf4pdx
         4ytg==
X-Gm-Message-State: AOJu0YyTs3E0rV0YYqY5fQ+vQFcVm83gWzgKo0fbDIMNP6I1O7JH6DMK
	3k/bcVSBcaI1/85qmNL6JPDyxXpcpBDScUohZ9PmxrIlnScDis1Q+EgMoKk0S+LyvSXOKhLcehw
	mt/DlHMs=
X-Gm-Gg: ASbGnctFORxndGvZ6R+kAPXmVblF+7Mx6n0txAUtvzR2FzUajWqy49byRlnEm/LvRGo
	TvSe+HhTcVVuPec/PCJQp0y2YJog3uHqj9sz0QtNiJppVhb1+LoDJae+M9ceK9KnHkOLJHUNBNd
	Xm9L3KolUxSOF9x2U3PbblIR2BnB+o6ubtwexUf/62XI0sUnARHpUUb0pgxTxQhiBLZ79RIC3FU
	CP9Y4XFwix/fbgNOl0tRd5zgNSeqFUEl8eWLu77sWwsapUpZKp4NqfkfT2AhGLGVc3hmkm2By/9
	O/WolYmn5AMQDzV4axIFI9lcqjl9Kp3ak5lPB1ERfquIJhvLKgk38027+noUT9IaN/0fq1HfwGT
	XShMy1UVCWOssm/uYofUrze5dXzgG
X-Google-Smtp-Source: AGHT+IH2kVjberDRpSlxOjehMswhobbGekKigcmkVDPGGJC58B2H5j6Wr2QGX4eK/xZiHfjmYspfrQ==
X-Received: by 2002:a17:90b:3c12:b0:31e:3f7f:d4b1 with SMTP id 98e67ed59e1d1-32476affe90mr1293364a91.24.1755567113520;
        Mon, 18 Aug 2025 18:31:53 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:03 +0800
Subject: [PATCH v15 09/13] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-9-2c7a85089db8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=Et/gGQXTneD5OZkXn8Pgl1NkEtAaawb54PFekqSi7POOha9fmpe+nFaGtNIyJt9uu4hbBiQ3H
 CuZXEeVVGbjBgyAnBLxvaJyamAe58n+gzvGpQsipqZzjf2adMJgCTVr
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


