Return-Path: <linux-arm-msm+bounces-48646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E4A3D697
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888D6179298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571A21F2388;
	Thu, 20 Feb 2025 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0AadUTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827831F12FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047191; cv=none; b=s+dkV7L3xgs5Dh908qnKgPLl0HLq5svGxzLMDIThqxK6bx3bq7BXqzoGHvi3ly9nTLa+TEAasWD5Q/3ZgowZ42qH8oXHNbPDSPsrz3D4+IKSEJ0V+chV2MzM2px22Pv8L22G2+2Mdtu/LTUdXLlWtbYpCJXvVuQtCLaq9h0equQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047191; c=relaxed/simple;
	bh=/O+unDh5T1VFusnWXWTP7rs8hDxFqzKuCi3hJ4pCKbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtSv8m1uO3AIKR/SOzAI6hAuYwbVNSWACozGxp4CFFy3BC5OtduTGiiuF/GSQAg0W6Mmz8YNaFICx+JIKG/MF3+VxkF+v2tZEO8XihfJ+S4sX3Y6BvOTT49bZe+Y8XeczjPqwvIvZBIfJpktJth+x99z5CLNqvZOPnlUk4TsaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0AadUTm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30a440effcfso19003521fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047187; x=1740651987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
        b=M0AadUTmGmJM6Tgvtk021qwi3oOYtN3aaAX53JsGxJYHvtZiSU/ndvfHcz+41cjdxq
         g6mdS37cvstXkughG2ulwb29z5ugoNI53GpV098VH60+RkqTrBgyb2tbWuDDKZRxHtd7
         GAA526/Px8PkpyGtd62zdjMAKkU0/scpvXb/qE/R4iU3CZLE1W++/sfZb/qjCS3Hc0qn
         79H5jW+QSiO8IGUFUb6fAWXOxZQ+iemVwSk1HFlcsMYbogQV8EWf0CUN9MsBu5Lqjwjf
         WrzfK2IjGDVH7jLzDRHkfkz8m1Pdte8/R1C7e0cUsSf0arybkZoRKeyhUh8gObYqvv1D
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047187; x=1740651987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
        b=ies1DOJA/iqZDeiuhnMpWn0o942rrDCiLMtVuW9aWANxZYGQFrEbwTyQ7+vjb2lNv+
         nZfhx2nOcBIKMczf3NX4Dupc2rKMgfLF6pQDknxTP2L9WUHP0W0FCWpUWBvxXfp2CHC6
         2mOLynnY/Qwt6rk5KT75kLNhh6Hop6QlTo+YDAn/IoJvRCAr6ImazL7V1nEXp0LdRWsh
         W5fdqmHA6j0/d/HPV/anVrNWJi6s16p4+c2+vKEPMG8iN49qZDfp0ccI62rOzQ6RHztB
         hHHN6i/XGU2UZdZwsfAuryuXA69mMcJ+KIzRt0G3cSUxfTQtwb6NgM/gokWmERLWzSz9
         Z/NQ==
X-Gm-Message-State: AOJu0YyoKaOIBgh3Wyh2jyZghJG1sO912xDl28Aw6gg2+EDo5sJmblR9
	UC+zYrIkHR1kTuwdVBd8hkfoR+WbbgvB3ra9IilXeBidgoscf5Yo7MS66MzXF3U=
X-Gm-Gg: ASbGncvwKCwSQE8zdmBRZ02c9g7VIRpst+rpZKmgjPVezC3EWcTBXFgi5cUFjUApVwk
	bPh/6BwWqjwUeW+TsSwTqNMRRPnIVcGpZHH9HtWEehnKVDFXM/NywS7KDIJYXTnEqRLEiVPNPbz
	wxNN/uJxGOU8FCkFJ+kx+zaDiwpmyw8KbyZdWtCd3fWo7COzvZ/IrycdGRuDFzqFfMDE+lDCFfm
	LFdJVZnr7ok92/76MCMz6p9wD38VsNechXx9WmS3jj3GVMRtXWkTk2Xz2Ry2huS6VEpRWXjKtg6
	3698FwnzfEFGhSGSgn7iceE=
X-Google-Smtp-Source: AGHT+IF331MiMfKkOmnrNILcorNZpHZK9yLwRpgvYJ7WEviZijKR1lVKHGb4C+1ru/+g/xzWTNOJhg==
X-Received: by 2002:a05:6512:2399:b0:546:2109:1efb with SMTP id 2adb3069b0e04-546e4662c70mr1044724e87.11.1740047187568;
        Thu, 20 Feb 2025 02:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:26:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:20 +0200
Subject: [PATCH 3/7] drm/msm/dpu: pass master interface to CTL
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-3-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/O+unDh5T1VFusnWXWTP7rs8hDxFqzKuCi3hJ4pCKbA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKBFIT3AwoFKTScXTNMjZQ2C302xc/Ih6ae
 /0vg1jl0m6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1S44B/wIvkjQwHjwie/PsatFKnwZx+EoYi3i/LW0hl9ylAvK2w6DmmfzL+Bmj4+LW93FtBaWvII
 tP8iTCLrVfaXjq+uWjGpkkQydL4uIwTggZex6YpzVf2VqUBrbJEFDrx8alY+FsZY7qA8WG5yn6p
 gWQo603hoUZhG/GxzpU9Yd5HC/ubu7x33LFa9EplSqI7Dm6UKWyUXeUaz7NDZC9hgu7pNRM2jJb
 Si+E5E2Gln050Ey0XAONMApWO8p+x2JtqMef+yI6aqeJfMhK5rjvaizXgvyGGVGKh7U1GtByGwc
 qp2uKF8QeV0QGDWzBjhDSFAet+8SMpKhy7tBdjtITtGsOYkJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad8b391cd51daf902307105b2598fc..d1e16da00529de35cf4e205077c4264bdb70de16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -59,6 +59,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5


