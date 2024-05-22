Return-Path: <linux-arm-msm+bounces-20194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2428CBF96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA901C2157E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7886782897;
	Wed, 22 May 2024 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTCcRXrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7681ADA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375065; cv=none; b=om3O2YIPvKR/dsftkWc5I6/R0ID2AfUwoEOFyyDfxoMINc6Gv03FHCgS6zGklrToyzx3Eluvz97xr3XEb+M0HuVmwRWLjdmljq3TsDqmMMfxcukRImNZU8lmcVNnTO+4X0V2SFAi9ClmtSoFud7WMp0rRou56foYreohVZR/Wc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375065; c=relaxed/simple;
	bh=GHqYh/OpnADzbIGNQTWljjAqbsvOTUqyL6NzDNpzFls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCtwVDMlZ/h7dRRcDk35JThmrTW6ohz5lhZacr5JlgTEJfAdKpQV0jm1qfEHOjWLwGTGn7ysCe8DNELVTeO2MNb4T0T1Cuyhf4djO+CebYzktnDecWX88ejurpO5tlLwWbO80Gm8rzMq3wY7O8GgE0KjOJluW36dCp2sPO8rCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTCcRXrD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so6246411e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375059; x=1716979859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
        b=QTCcRXrDWWkAGiBd93rSVTXvPVTdcRUsUwkBju4f5q6NldPXSpJerIOvr3ma4lAgD6
         8EVeyoI8Fiw9mLltCiJMsYkwrGNgysJssKHmn0oiKxE6kJ6dWNMF/+8AC75vA2NfXc7Y
         6VWC3Sr9ZtUiTDIRnMdRXQMV8ZoMteQwyQhbGibglXeZIDI703bnVLAO82+XWiG3kWHq
         N5ccLY3FGL6/FcY4CbJ3ubz0cmLe9T4c3yAz51vCZFAeNh+nFYLsMhvzNerpwylLy/NH
         7mKMlrKiC5NznviCOwa6XBs0BrGN4w4CpLEat6VhtN9M4lXU5kSuW1BOJN5BsWV298lr
         JIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375059; x=1716979859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
        b=BV00+BQ6PxTRBY6GndixFi0Myz449v8+0gxoeV33evvbSTjN5h8eJZV+h7NasrP8nz
         4ONksX5InYSg2/3P+gx3ygjHlQKDKutwVKFP+y2eiCRGPpct389LED0Tyh6YdGWyqyUj
         mTn00PWjX2wAHldNSlZI3sE/uZ5+X77ohCHT1Qp0r8x1Nf2+0ICdk7clJ1OZ8/3Q0mA2
         36wfzdDHWhEiShuqycByusA9JgMMtyjbcRFzQdBKAcJcTzxWd2dKewzviau9bMx+kuFG
         +QdLGE8uIDNVOJvsFtU8E92kzE6sqVHjThsInVFyZ1guiZ5dGtMnDfj07nAaWu/H+gR5
         BQdQ==
X-Gm-Message-State: AOJu0YyqAuGAu2R7ouC8tFDOfT+/wtqVKgXOw5/4K7nkC2uUgNUMxjVA
	G5ATmscHjEuZ1lZSHaVuvW5rJeOyyNzHr09pvvf6ilTJTxmhH63hocdYcr7LSM4=
X-Google-Smtp-Source: AGHT+IFjZBlFB63a+RCudEv/MwFQ9Q2bCole0thkPnhyzMY0Oy8BRRlACoKsAdrqd0TOgwhv6ucLQQ==
X-Received: by 2002:a19:ca05:0:b0:51d:8159:598 with SMTP id 2adb3069b0e04-526bf35cb35mr855189e87.19.1716375058977;
        Wed, 22 May 2024 03:50:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:50:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:53 +0300
Subject: [PATCH v2 01/14] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-1-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GHqYh/OpnADzbIGNQTWljjAqbsvOTUqyL6NzDNpzFls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4P+BDWacbqmwW114/XMonajf8PabUyuJ9lv
 2ys/6u9ObSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1e3eB/9uYYVb14/WnhhBPj+AyebWjWRnP0iG8FjY7dT+zHqyaHXAWZqh22kKOrvTdAFImY8ih1Z
 Lgk5naB5PAau9KARHCmo4xvSVORJHkEmzse2OCD3YJpxoS/3fZb9pqaQabxdi6zrbj2t6rksnwi
 vtvaSz0tlomAzHIpdZIAxeU6XnxshDfgfnf+44edFQ29Tb658R4vIir+ysKkGeI1qTta+6HQUlB
 EUZc/mqgBdxzKfBc0YlF+Xz0SayBG8YJC0DtMpEDdBJ4uZjmR45AZ7ihrMm57eZ5P1bkEoS4Chs
 91rAubNr/uUXsHn4+bZ3HmPH4dnNKqIfyMAvTS3WyHxqrxzv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 24abcb7254cc..108c86925780 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,9 +235,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.2


