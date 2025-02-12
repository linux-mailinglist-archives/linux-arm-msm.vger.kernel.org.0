Return-Path: <linux-arm-msm+bounces-47684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F73A31CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 04:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2CB3A821D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EAF1E7C1E;
	Wed, 12 Feb 2025 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoXSpo1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE21E2838;
	Wed, 12 Feb 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739331763; cv=none; b=hhMXv2o5LcuY7+Vgm5+KrmOnH0UOW2wbASMKNzL1IsSW9sAFUWDwRsqAQc9j+FVISJQYyuAHDLdVJnxqrs0rBmhiGo4ea+vOto4b604p9vqrUOeWxghzCzjOqwzOOrGz91URVh37/vrFKMZfOqIcYIiLTR6bhFDzxnuXkoNAmc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739331763; c=relaxed/simple;
	bh=N3T02SZh7OA4gWBfRQ4z09hnrpwD6/fc3bzKbL3pijE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uT33QsvMfGRYZNpDFaXAh9LC5pB/PZcgs8bFKIQOSgi2vMmofLAh9QaeTZQgF6ugGwmnN0QeE16r65MNRXnNJdXGby2go+SxKwY4N16YjkOKV9nBQLDx9FlyzsO2qIE06wARaJqsvrFoAvPiUGm+NmzrOBl7yHRpEXRptz2Cf/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoXSpo1h; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f6022c2c3so6654475ad.0;
        Tue, 11 Feb 2025 19:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739331760; x=1739936560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueKWrRxljHH7KriNyyANgoD1D2VXG9ivKWGBEdHlHoY=;
        b=LoXSpo1hTZpcC1yEKOTT59PlADY+ZhRCtKMFaNtq2mqVDeTlKNG8RbX0vMMTBUFE8j
         dw3HU6R2H69eU79flhGnKOvPNOpPwUfLT+2eS1ilWJmKfQZbZJwmzb4Ktkf6QHreIkZ/
         OCnVYVqcSMZ+6HWkXZU+vv7AX2Y/U4KxnBi4k+7/BPNwbpIjmYuHC/SzyW0qTCraghfe
         A3dpgOWwJJgV50sIGeOjRtlj7prbicdVvUSBvVlXBbqJ6In7FbPhM4lQAbdyyachBnWg
         G13Ks+uyFjETib+qesRZ8Qyu3F26rwn9Y7F6PRdSnFtJN7W40QXoDfV0VRgHnruosxWK
         TQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739331760; x=1739936560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueKWrRxljHH7KriNyyANgoD1D2VXG9ivKWGBEdHlHoY=;
        b=J2pGIH8EdajDn/II0Hc12H2OdqcHg4xt9KzDV9xQmeKgPbOkdklZg0XAvh/7dZHFmN
         VWq8moC52SGLZH+3KFExxm92+9/MGB5Y1a8J7DMCtHWm1DC2eA43zyqzYVS4uOHGupvb
         lSZ8qmCZSHTw0akVj/wg1TyS61tjZOrq0SwjRJBn6TY9JlU6RqyGoO1VtBLWRxS1Ynq9
         LbOBA/Emoyi6HOjMe1FAh6z6bB0aaU0TXaMIBUmCMTijxEQXmSeqBp/w3WyR4erU8Njx
         T58pP+61ZvLbuLiRyUjisP6xVXgW6VMgWNjWCB+c51RtQ7Xjmz45agtb5A517Te/nJsb
         cJpw==
X-Gm-Message-State: AOJu0YzWELUYcWeopm55LYCNCeyPtYcX4yPjIlj3Ajoqi57XVfn1HK/7
	2Ju/0eXQpwPt/Q3LhQ44Ub4FoEM9lHFjwuYgh04F5qh2O3dldgqsEPUTDouF
X-Gm-Gg: ASbGncvzpLx83nNdvmw4TlPDm6I45ApezpCrhyxxixaUxgnX0Cy0VMQSfVlgqhU4zWe
	ZhaSLjBwLmqV95qXOK75dnjIhVXEv3NzPpbYiG1ZckK3r9e6fFpzv8h/2qgCHLx3KlLIwkACzju
	LCHLpu5l2YBlGidJ5Ostaxs+I1p8OXqUjm1UKGSbHbWucoaq9t8M31yA38JQB8aBYEedxHNVGND
	VZ/yXqrn3jOyBd4da8fz2DR2Vx2pkbSyiAd8/+uy2uKJwnLD1TzZT3O4LV50K37DZvNlQ9AJvwt
	SdaLCcyClUlziI73BHbwLyT9QrRh6wvZIoBoNA==
X-Google-Smtp-Source: AGHT+IE3mvhAkVu/fqNqn9Ndl/Wy5AuF0bpcu6ed4bE/0j3gnwSdb4BDlMTgwupTG0T7FduAzFmLxQ==
X-Received: by 2002:a05:6a20:2447:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1ee5cf5e25fmr2710271637.19.1739331760573;
        Tue, 11 Feb 2025 19:42:40 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73218c206a6sm2304923b3a.49.2025.02.11.19.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 19:42:40 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 2/2] drm/msm/disp: Correct porch timing for SDM845
Date: Tue, 11 Feb 2025 19:42:25 -0800
Message-ID: <20250212034225.2565069-3-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Type-C DisplayPort inop due to incorrect settings.

SDM845 (DPU 4.0) lacks wide_bus support; porch shift removed.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb..3e0fef0955ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -94,17 +94,17 @@ static void drm_mode_to_intf_timing_params(
 		timing->vsync_polarity = 0;
 	}
 
+	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
+
 	/* for DP/EDP, Shift timings to align it to bottom right */
-	if (phys_enc->hw_intf->cap->type == INTF_DP) {
+	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
 		timing->h_back_porch += timing->h_front_porch;
 		timing->h_front_porch = 0;
 		timing->v_back_porch += timing->v_front_porch;
 		timing->v_front_porch = 0;
 	}
 
-	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
-	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
-
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
 	 * widebus is enabled
-- 
2.43.0


