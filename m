Return-Path: <linux-arm-msm+bounces-27346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1A9403EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE2B1C2136B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3545DDF78;
	Tue, 30 Jul 2024 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuKax83r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2EA1426C;
	Tue, 30 Jul 2024 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303536; cv=none; b=rlR20xIdLhzvbHWiuzyLSwRiJm3Ik2LRVJr7/clCYK9i9lk01QOpQs1KpwnXXDHpAz+bTWu3A9yYayPo4PEuleMF9MdOvpViNCbYM704BN7wlYlE59jy997HBFieKWS4WlnqYpmyx2vCoVS4pQodFQidhWN9I1M0FhwHCWd+EhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303536; c=relaxed/simple;
	bh=wME1vzhzNffBnYVgZMcmE7wNLX8b9FSNKe98Dh8jRSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMj40es6egcy8SrIrgyBk5updQxEEE3nr1FuVlkFeFVL8IKImRtymTKWxs/l+p09pLwF83oQ3B12bpX5n4NhWH7DC3KP7pnAtxd8lHDs7rvR8eIztoIYmwvTUQUKFB3Id/gHnfw4x7yUyZz1tc//ROlI04dxcVqY9kHln7sPew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuKax83r; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44ff7cc5432so26634301cf.3;
        Mon, 29 Jul 2024 18:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303533; x=1722908333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SCz45+BPbCjHq8X/VdUn+0NTCgnAzl07b5UECsnodY=;
        b=RuKax83rO4LFzR9QeSh83BGxpfP3tMUwZ2v5xbbDZEjd4eppTUyg6SA77/GbYbwnWP
         FfdKzUimiagRBLCWuQgCN8qHL2ffPkL6K2cjPFMkVtXbEnmxKAtFmHgafTrcC3OLvMV+
         eh0qZIcSF6UuRrlfx/ClKAbYiylDYGY3Xq8qIjmU094/KKtvq639OD2gdw/YX4bFWbeJ
         5flmks9uYwz6M2+k7u348foXSr3vFSGNU9Dpqt+cS6TBBHiS88NDmFOMDzD0L3nV1lj4
         aHHmw31QuiRu4ZQWlN6yLmStYjdWDJNLR0PouFb6A5+LKxsM/N4TQ4AeiXPachPUO6ZS
         oZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303533; x=1722908333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SCz45+BPbCjHq8X/VdUn+0NTCgnAzl07b5UECsnodY=;
        b=IJrdO4nTEFaFWySzs4fe7QgJ/d88xTwjCER+f2qNcvfIuUklnXGAwreQDvvy5Klz9n
         LhV8BiHdSNJE+aZy15UCsugZZ7hNjD/V8HL47tjMKzJeGuitOIpq69jGz4Gq3/Jc1W4o
         YqKohHFVubCinMEIqc78N8XKufpi2ODyL6aVJbznANRKhanzCvR6GGjKaAk0SEjxaT0G
         E/vJyl+UVzr61MByp8X2XSVPSYwU9vcntscIPwV81QE25rAiQCwcJ+1m4SLP069y/ZZw
         vU9S7UHj/PwdF9sGraYkaHda1mmgzSZ003XA/BIX+aNF5/aGhxo9Hqc7aCVRLAt8X2to
         +Emg==
X-Forwarded-Encrypted: i=1; AJvYcCU/PFB45HEpWb1Yf2uter7kSVXsSzmSYFUEb8CjmPYOUTmj+SmHnwlCWJa5rpstOUxBw4rphI4TxhSfidx8ygp1fhzEur8kBy0TRBJSnBnEa7HHzTlqUqUeYscuLFoz5ygWjP3KSKT/V2Q=
X-Gm-Message-State: AOJu0YwbZIcZGXnqAcKMxr59gX+BOEJ/Cct1BaOh5WgTvq4KvtqOX3gu
	gi2sFKXbecT38KX7kxx7LAgYTdKdW8kPLIu2dAfT+pCFBKO6/9kK
X-Google-Smtp-Source: AGHT+IFeEeg8clOiGdEAAhcNy0xa4Aaj0rQjm2UC8tAdca4VXiAtuGxBMfi7SFMT9uW+nbvQLLdP9w==
X-Received: by 2002:a05:622a:8b:b0:44f:f20e:84e5 with SMTP id d75a77b69052e-45004e0b738mr154738761cf.34.1722303533388;
        Mon, 29 Jul 2024 18:38:53 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe814d0bfsm46525421cf.33.2024.07.29.18.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:53 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/4] drm/msm/adreno: add a615 support
Date: Mon, 29 Jul 2024 21:38:47 -0400
Message-ID: <20240730013844.41951-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Adreno A615 is used in SDM670. Add an entry to support it along with
the speed bins.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..fc4fa2a9547d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -651,6 +651,33 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 615,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a630_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a615_hwcg,
+			.protect = &a630_protect,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			/*
+			 * The default speed bin (0) has the same values as
+			 * speed bin 90 which goes up to 432 MHz.
+			 */
+			{ 0,   0 },
+			{ 90,  0 },
+			{ 105, 1 },
+			{ 146, 2 },
+			{ 163, 3 },
+		),
 	}, {
 		.machine = "qcom,sm7150",
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
-- 
2.45.2


