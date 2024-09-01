Return-Path: <linux-arm-msm+bounces-30357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C159676E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 15:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3A9280A13
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 13:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B6917E00F;
	Sun,  1 Sep 2024 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jooq4BOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214F17E009;
	Sun,  1 Sep 2024 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199136; cv=none; b=jCVKZs9x104fR7ohs4m5zQogdKCev4B+CPQg0VdlN44fPRO5fpiURwuB6mRhG6Ht2nb0nowO+vqxR47nOHOM8MzDUHVNwQwODDWWJoOCfTtbY95DkzQUWEK1VOIhGveXcSh7+xqxKc0MLG3K5wWjRH75luXGLadcuxPsLbEqRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199136; c=relaxed/simple;
	bh=s0i5ADl0K7DntgQCTfBvEdaBgPw83fZVlWFAqfcd7oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7+jImiOTkvEVd85DHDNCbDDgLcfiMWnxy+CMG8gsZgR4egYVeNKkVPkOiin9sGWIpFZ5P5h33pPykpF4vVm3M2V9NkdiyQkBpwN0Gs5Ysh7VC5zfxuLELVWXJjsKTKp040PQtTDpYh6a0VMz+DE7+aLNKH9RSUUVC/+0o4yr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jooq4BOn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so938472a12.0;
        Sun, 01 Sep 2024 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725199133; x=1725803933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+CwOEtqu3IBPCzfQKTkK2Lp868q6E74YpTPp0btJmU=;
        b=jooq4BOnX1S5+ZKjqukZiCzpvpitfeHy8bCBBmf9yo5LPZuJrleFXGCpQHWBJZ1lJ1
         lsBsF2JjzqNkio1AQMk5/07MhZEXkwSKoYH4knMfbF2nIxmzx14luBapthp0LbJbH0VM
         0XZEw85rDzQNVdb77a4qIr1X431c1aJXQh9vWT0xqxC4uHiVB4OPe6blgz2eToU9YMBc
         i5LOLSaHLF39TpNTPcIHWzlCYvOjcn+R+8Xp+tp7Az8tLWZP9XiWm8qifCA2YBifID0w
         MR6G1xcIqGU5MuFE3v0h7xsI6KnOIg0g3puayvZjOqjlOVuev/xNlpXLh0jdPWBMdCK7
         0oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725199133; x=1725803933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+CwOEtqu3IBPCzfQKTkK2Lp868q6E74YpTPp0btJmU=;
        b=XI/A4c6jmeje6tDB7AFo2pY7kIoeIzDjqS4+v3gK5oYhY1r09kZPHMIkLXUofavu4P
         V1yHKio/KIbuufU5mczX8GqFczy5X6U5LLrF7qWHJSXpz/5ia11ybtdpg7tBs8UzN1C2
         SfDYTNYmGaFTifOTd4rT6WJRMtnp5Vrb/kKRpjCRz2Qfy7g4RHinR1FAI7AJI17MDE8l
         6fRganlls7jpUMEMsxksUAl0fexOmlylFZc55+eewTUkq6PtW6mtaGkoqmkUNljBPY2e
         XLb40dbXR3M+NS6oSloUxGbgBnRahyqii1Nfp+NieZTs1zJV76HQeboPjqudiBzRqGw0
         YpvA==
X-Forwarded-Encrypted: i=1; AJvYcCUdhz2JTMbSbVEyadrspafvAWJg2DasoIs27K+hIsrkyh56YYKTll3s0a3BxB4Pyf4Zvlf6KRDOlUtacylt@vger.kernel.org, AJvYcCWDkz8pXfdi00JUwOPXzT2F+o8zR5Qchy8HOBPLT5+VvLjGozbtjk+B9KHsvq3lkkhukJts7Xvf3d04z/E5@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRjSXNuvBu8AZiuMJRA1d6b1HE3LVbWkgNquZ+1HTcKYPCmoA
	dEeR1SXX+laiVnuS477+Lj+3pnnY4njqyJxwcSaJT/RPrhJudkcx
X-Google-Smtp-Source: AGHT+IGB9/p9xuAKpPD5hLbzPgo/k1PC7HI4vXcDLu/C9nNRamu9OWu9KjLrtObSAMysisCiqYCWgA==
X-Received: by 2002:a05:6402:254d:b0:5c2:5cc8:353f with SMTP id 4fb4d7f45d1cf-5c25cc837bcmr436347a12.22.1725199132019;
        Sun, 01 Sep 2024 06:58:52 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:58:51 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/msm/a5xx: properly clear preemption records on resume
Date: Sun,  1 Sep 2024 13:54:01 +0000
Message-ID: <20240901135419.1075412-3-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fields of preempt_record which are used by CP aren't reset on
resume: "data" and "info". This is the reason behind faults which happen
when we try to switch to the ring that was active last before suspend.
In addition those faults can't be recovered from because we use suspend
and resume to do so (keeping values of those fields again).

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f58dd564d122..67a8ef4adf6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		return;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
+		a5xx_gpu->preempt[i]->data = 0;
+		a5xx_gpu->preempt[i]->info = 0;
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
-- 
2.46.0


