Return-Path: <linux-arm-msm+bounces-31614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06058976D3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 17:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388E81C23441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60E21BDAA5;
	Thu, 12 Sep 2024 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ayz2gAiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5D1BC9E5;
	Thu, 12 Sep 2024 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726153842; cv=none; b=XoLU9QEiBC+fPKZHsmUKWDevARqJFh93RpGG9Ltt6z0u0aD12Ac5PyV2spZPVKY5jYRPRAAo1jTwFAyEHkQaHn9Lab4Lq0Rv/0/xq8F0vz1uf/qyv0kXFJ8IvKqY+zvhiCadzBvXneIscfiNAvj0of1ymJapFXBjYPLhzr8Mb2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726153842; c=relaxed/simple;
	bh=eZRjSMsxglbYBnMIMLlotaha1L4NwpH1XZvQRqSngjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oC4C1Qy8O3ljw37+N3DMJvfudgW3nLtJaLbyg6uZ7WmbaTPKa6fKBSo+hJ/BaMeodPinj74d7u2FOkIzKzE2FppU6o97bjnoaxfTemQUqF3fOGnpZ+N8QP02iaO4S71dUuYuAgmRD5ybeJiPipY1E6gaz9uUR+tYfwGp9UoF8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ayz2gAiZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbaf9bfdbso9235485e9.0;
        Thu, 12 Sep 2024 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726153839; x=1726758639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8WoX8P+epnSNshOLCzpXpl70K1Lwft4iav6FmplCPE=;
        b=Ayz2gAiZJd8P4b9koAUSOWKIjs7iIS9Yp719Q6mglJJ8bCs2Kxx/hDdyHwUsZiBxpZ
         7ZfJXyXbXsaXmM8ein9CS1yiySflhTnogL73ijv9/8adGz8bM5i5LGFpfUIlhUg/Vkvh
         Frpmt4HirY2cJtwl+umwiIZ0A/wlOYgGq/FlvGVMP/4JJeWTdlSfSjgQnxMFASc5+Zho
         HDxZ3cgw6sV+H0S9xZFZZF/KkJBqEAhRtWIUGJ6GYyw0f5RFFzaTWd5jZALdA7b1+EWE
         JZ0u9SJCjKDEgz9+R30qyykQeM1VKmAe7PITDP4vgEVzDc7Nzh/K+ED3PWVznXR71KYq
         CtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153839; x=1726758639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8WoX8P+epnSNshOLCzpXpl70K1Lwft4iav6FmplCPE=;
        b=eYQWOP2+k3u1c4emPTem+MaINMAhEr7nBStLBbMCxA2LNyyNinGbwGuqubGb99mPF7
         cTUU4e502liQG0icdfSigB5C18uBG4kPCFVQI05EAVqlsUiWVveDKMX8AYKbJpL5bJpj
         5Cjg1nWbffySnTOBieR2fa2Sm3AJYEOXVUfGq9wyra4YBRyg9R7/PJ5nJfbYkJnVdoDv
         Z6+m6FPPpSEfTYRmVbjf8ogxKL7ToxDwSFTAADsIMzz0IMjxMtRGbBFS5KodTIwIGYUj
         /eGHNvmoqzTYqFZ95SuliXO87CrPsVZUxBv/cvycPjN5xlDLaXTS7P2cUjg64sX+jM+g
         xUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXGyglfTeytP4N1qt9LUrhPCoiS/9L/pM1cN22CpNIrJlA8/Ere7b7r2CBg8ialVU46XY9iNblCFTcxrQK@vger.kernel.org, AJvYcCW9WhLlWgUafTcrenayO+wjQZ4pHYiufUQdJCeEUvO+7Okpvdp6BqscC2YpUFyDzQah7p+G1fxV/Ng88sB5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4YPK50NQUZreHSPjpJ/8JCAUpRH04Hzd38pPVsOyQ3Wd8vZuL
	dai0CFG8fQy+64/y3wXja5s66BlfnxaVj7PoX0o+2otNTbimbMZ5zczPdjYq
X-Google-Smtp-Source: AGHT+IGpzTJbDNIVU4M1s3fHFXgywLBRPXTVSrJBFZCSKpEuUnw1QKzJPLNOIAsdnhNmKiA4JsiELw==
X-Received: by 2002:a05:600c:1c02:b0:42c:b58d:98ad with SMTP id 5b1f17b1804b1-42cdb547f2emr24890885e9.14.1726153838851;
        Thu, 12 Sep 2024 08:10:38 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3700sm14661524f8f.88.2024.09.12.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:10:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm8998: make const arrays ratio_list and band_list static
Date: Thu, 12 Sep 2024 16:10:37 +0100
Message-Id: <20240912151037.592477-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the const read-only arrays ratio_list and band_list on the
stack at run time, instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..3f8f73e31ddb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -166,9 +166,8 @@ static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
 #define HDMI_MHZ_TO_HZ ((u64)1000000)
 static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
 {
-	u32 const ratio_list[] = {1, 2, 3, 4, 5, 6,
-				     9, 10, 12, 15, 25};
-	u32 const band_list[] = {0, 1, 2, 3};
+	static const u32 ratio_list[] = {1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 25};
+	static const u32 band_list[] = {0, 1, 2, 3};
 	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
 	u32 const sz_band = ARRAY_SIZE(band_list);
 	u32 const cmp_cnt = 1024;
-- 
2.39.2


