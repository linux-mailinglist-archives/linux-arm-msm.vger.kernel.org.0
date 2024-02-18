Return-Path: <linux-arm-msm+bounces-11588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A063E85972A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 14:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D51B1F210AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 13:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907265BAA;
	Sun, 18 Feb 2024 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="St/Uemos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB24F1FB
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708263879; cv=none; b=Q2EPT2mXPP4BqR7qIVYLTk4wZfWbfZu6EaHLzpk9dqieH1bwNt+Nb7i+0GTJqKvrmiM3T8pRrmNEo5W03e2dgZWmWgcwZxQdrtCOV3D2vJt3YrDV7o8zE/uGU5J9Wea9S+ulQ3MnYAlsIQMoyQHKB0H7K+j7XK0pw8goDzfD7RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708263879; c=relaxed/simple;
	bh=Fa569FtDkadUCa1sm7aHuKguKlbJAIw0uOj//H0xNiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tbSE+ST9fBk7+LaOkg2lFof8Lk/zp4XCsqCUkxv/k/UuXj4bx4FT8QVXSUaG4OaHktgZ3WTV7KEi2an25+3jvDyCwUGnwGfBT1IKB8pu942BbG7u/Y5VD7roXPLKcxxN2ZcBo2CJJscL/F4Ve4OupQGHGgbpIpvRoQGrt6/c+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=St/Uemos; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-511831801f3so3435399e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708263875; x=1708868675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkAm9FJgA8fZ1qm+DC2Z9j6bt6uIGztvWhk79Yld62Y=;
        b=St/UemosepyzEf9w4jRBkILIIseTRNuzntA1/1X+ByEuTGVGHljlXmUl+fzpQKMcFc
         hpMote93XFjA+2Hx9kLSe9JtUKdvPOAMw8xAUlPLk/2xF65vtVNcFvcYonvqTkVglLF0
         cKICexIo33JYE3C9YFXxV0qF6GV6P5XlxmEXnX3Hfdf+cLeAk4dEtA2DRZENChTQuPVi
         YS9wXQtTHfhtS9zC0En9VCAGHGKHnaHwAfCns4ciTdysjOrjkpIqhBJDQ17EU0Rtkoz1
         llZgnP7YQITx5JLO+CrdmksWp19LavCitEWtErQ4+zbKnY/dgjjMag7DOhaUCmh+Hf3K
         SRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708263875; x=1708868675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkAm9FJgA8fZ1qm+DC2Z9j6bt6uIGztvWhk79Yld62Y=;
        b=sEVUaAl9+VJo2kTjzT5zpDaA/oTSwY/jWwgBJLAuRUYjpCtIi23Gsn70kNZTgfCUuX
         Hm3OpU3fEJ+lDWQWDlgV/EN4EyqOHJZwEKzZJHaGyz76o8Cg54TMRAdmqvNJsgzggNZD
         j/BWzQgCKdPYUFULbVD/nxFFuMQazK+UiyBdsSHNvbCJ/CS1mV4QukfWZk62a9ocfXiR
         SC8vdliLYCrVDjfKio/o2z2J/zFJLYL2Or0Uf4Unc7uHZZmMVsHMxRokJCF2YAFGbndq
         mLN/cscWzE3d576iJxMCbScV5OcuElrlIHyh3uyWoTtQZ7XAnBxy33UtI9K5nJrRqUJ3
         +D0A==
X-Forwarded-Encrypted: i=1; AJvYcCWFxQtA8PFgpwbgBQzu/xC9T0ORDicnjsFT4SFcYQjRsUDjXxVQUZdMqqbHCxDTLmzFV/4p3oNo0iVvGWrBlUACm4Qsk9v2PMsYtpkRuA==
X-Gm-Message-State: AOJu0YyxnCY256dOdqowP6CyjbnpkJTZtEV9oTKIc0FQAJx+rWkp7y/m
	domRiWUIKZ4fVir0Jo7Yd+Lsmw+HQtcVHGs8U3vS6FxmH0Ja55iSwi5sq3NQLnA=
X-Google-Smtp-Source: AGHT+IFaPpSe6tPn9cyTZaL/8FD45vmtfTMY7IiRBueShXuB3DzFM83GLkaa6gxt5a3A/8lmW1q4wQ==
X-Received: by 2002:a05:6512:15a9:b0:512:a9d4:c507 with SMTP id bp41-20020a05651215a900b00512a9d4c507mr2297689lfb.32.1708263875539;
        Sun, 18 Feb 2024 05:44:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y21-20020a197515000000b005124a4eab2csm547406lfe.225.2024.02.18.05.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 05:44:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Leonard Lausen <leonard@lausen.nl>,
	Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH] drm/msm/a6xx: skip programming of UBWC registers for a618
Date: Sun, 18 Feb 2024 15:44:34 +0200
Message-Id: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Historically the Adreno driver has not been updating memory
configuration registers on a618 (SC7180 platform) implying that the
default configuration is fine. After the rework performed in the commit
8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
a6xx_calc_ubwc_config() still contained this shortcut and did not
calculate UBWC configuration. However the function which now actually
updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
check. Thus it ends up rewriting hardware registers with the default
(incorrect) values. Add the !a618 check to this function.

Reported-by: Leonard Lausen <leonard@lausen.nl>
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
Cc: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note, a proper fix would be to incorporate actual values for sc7180
and drop the a618 shortcuts. However it might take some time to
materialize and to be properly tested. As such, I propose to merge this
for 6.8, keeping the existing behaviour.

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..07d60dfacd23 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	/* a618 is using the hw default values */
+	if (adreno_is_a618(gpu))
+		return;
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
-- 
2.39.2


