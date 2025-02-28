Return-Path: <linux-arm-msm+bounces-49788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C89A4902A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB07E1892D36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D321B85DF;
	Fri, 28 Feb 2025 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuAbZVtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96561B041F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716061; cv=none; b=bjZVwprKCcEfDMFNwHuRwWvEQVSPbqQhj9MbQfLjbx5woOnA5IK7LkBixdE+1yCjMg48Y+8Bjx+zuPxsJNeMNy0zxr6uIN3+VuKgAdYFD1YRYMXw1bkDzYqZMS1OKzvcnpfTm2zb0zK5KwEvZnqm1u3cqTZExX4kXF2K7sBQIpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716061; c=relaxed/simple;
	bh=hfgy9wzGA5Q6AEJ70BD9uWOFMy1Prwe8QkTd0ByFtoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyR4sqH3yYQPijnANjb/ZlfIpNpqxZ2qQUDBajxoz1wW8YLvbA1yvey14OrDbgY9epWg4BTcHs09/zPq/+xXOvdUI9V3BcMWAWFIbsZ3KRofQohNESXN9DaFdBoULUtt+645Ux9WuoHyIOu06WapHhXx6B5muim9sHXrxXDLh0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuAbZVtm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so18075621fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716058; x=1741320858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
        b=vuAbZVtm1DmAlmyCKom7ExUNXrZ/AHc+TWqBaQSKjWEPD7ynnKEVEq4M3qMDwvEj4k
         GFCIGK3qqdFzrudr9xVYi7PwRtMGviZGHZTr7gxTtKucigaQgJ/XOER/5KklgogAf5Ep
         SHnynRK/WCoveY3QpbB0DP3+QKCVTGg/pwNecB8VqAZbCvqN9aydJF34KIk1Y2I2PMst
         3rHflDmyPBaM4BlBgWk+PbwN4LlO1seKiWhhQWqN5TcvtNLe9OSkg8c9QA4VLQLkZ5T/
         e/WtGeBHAT3svKkLyRjodxtxaTbFj2ccpclt8/cLmVZTnO9m1BcOxYlPlsXDpFJWPqx7
         Wp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716058; x=1741320858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
        b=AyD8Yks2N1COZtvjtpAGlJeT2GbGLLAgv8at79FLxfWj5dGK2tdgOOVLNW9BvYGdSp
         SfZlvJUVTNL7+sUvXmmkvhTypt2ongPgSHjHSBzk1SXX3hGG2yAI6Kjed5eNquppVpmr
         EDfF+RLYEI4aj0n2Z8g3r+p3XZCQ3fWsUF7tnGCR3pxPw5pbJOnI6UQnZneD12yfEyGH
         dccG3R33N2DXoEMGrFWz7Ttv5w4ZoK9XIoDkdbGhXRS0DdvZYDtjYayj8CBWmjFDi0vh
         DNsh0A+29KzeIhHIanlkT/dQOBoQpXuAknHN6tOHKMG+wVti31yE/SMoTxjI0DCoMVcO
         WpqQ==
X-Gm-Message-State: AOJu0YwJZoLrbQo+/rK0ZBvKRf7mVF6iCHsCQXwVWPlneI6j/MXenhEZ
	BjeL3FypMKk1f0Uu0zuai72kZRYSwSa1n52X9LF6N9jDVjQiKI/oxzUyJfljIHk=
X-Gm-Gg: ASbGncsYtzF9AtSbd4JK2f6Q3Z+sOlWujGCvdDho3NKoB8j8SNAAGNKbrK1Xiwzisqi
	JrreVb2/vGCvQHY2XvxUTKFd4FdBhaPVTrkrQiNFDzapqEGQHGNSoHqh1Rrj2FwOHn0ZZ5lVXQh
	dM95suj7jQXgBIeFMr3mtMYin7hJyQvEUEfOI9U/sZ40T3UYA54HFxC+u0G6r6lt21UGk5GTVww
	E46DPet1qsGPSXhBwvQxe6ZjMoeAy5oM4MYIyfzm2NjsD0iVsrnhj4pmqDvSCRigA2V6poycfaR
	WD+nukBO19/7IyGBB/V2YCiy5GdSwp7N6w==
X-Google-Smtp-Source: AGHT+IFcT7s4yVONTyYgY6zAKsU9+9abRufWWlIMfQD+nj7E9gZmr9mDgSCmtquQiPUvpSCt6Cmr3g==
X-Received: by 2002:a05:6512:2827:b0:545:ece:82da with SMTP id 2adb3069b0e04-5494c12a0a2mr667916e87.4.1740716057671;
        Thu, 27 Feb 2025 20:14:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:07 +0200
Subject: [PATCH v2 3/8] drm/msm/dpu: pass master interface to CTL
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-3-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hfgy9wzGA5Q6AEJ70BD9uWOFMy1Prwe8QkTd0ByFtoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgO7AzfWXjKQ6q1tuTp6RHJgAal/Up8SzZqq
 QYw2I3uvDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1amBB/9ISmNQ/7w5UzOXxtpKcafpK0NDzRl2xZa+xPfU3WIIyQBQl7XQ1mExWV4yT53OzNbW3fl
 UjmLXTMkn815GuemnTmkSAoWOK+9irdUboUHmSwwN1TxDscP+OemA/gvyh5QDjOVL1sYu67hisQ
 BKiTgTwO3g4PvPdjW6KTjxzind9WLQzplTYYXLi7gHkfCDqtHFf0PHcWo7dyaFXjCa6yoOtBK0z
 jIsfNBrMS1d+SYmcjKvdZOAdNx80K1m/CNymtdTl16BY/6jzvCB8cpTn3QuS4ZKGNXQUfUsI0cV
 LcGdSKR7/kwjufT9P3MgiRqzFGDZ/a/jqOTmWnTbEJm7HYYw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
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


