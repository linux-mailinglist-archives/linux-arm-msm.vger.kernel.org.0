Return-Path: <linux-arm-msm+bounces-47683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DEA31CFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 04:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCF193A8260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8771DED5F;
	Wed, 12 Feb 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngQ13Q2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71F1DC9B0;
	Wed, 12 Feb 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739331760; cv=none; b=I2vA89p2K2grUrK1yjJoWFPPivMG7pZyXoyABcgDb0jLQGcM83oc8vY2OjGJTlllfQ9Z3KAj6NhgI5v4ud6Da62uHXrDv2EOSH9XpVWjrqRrmsWAQM82P20U/eRcY03RcXCniOvvO2pnroj0s4uQTiKsCeyNrcawPiaHT6EREb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739331760; c=relaxed/simple;
	bh=65lmxrdzow8jpKLsELbK0O108xiut0TKg7mz63uj6YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3UflS66cZOpNiMZrtEPxUf7uaH5OxVFSmKd/DMgSw4L1i5yljWZlvuM0lP4xa2+NvcoV6nMCTNTQ29ziqEbqMCuPtxjMlAce+EBGPcMydKnNqNXDkPmWY2ajD5fhiDLn6zikzP1dqyY9APwznic8KHooznI7V7vHr3IArVJfm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngQ13Q2P; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f5660c2fdso91564035ad.2;
        Tue, 11 Feb 2025 19:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739331758; x=1739936558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXXxScIwQFKN7LP5CI4QAzDFaxMA+7SppSQtl2ntzes=;
        b=ngQ13Q2PgtCheY56jcqlMcnHWq6qjjKl6bZAhgyC9F6HBCuM86inwukxqUbbU03aQD
         CXaB99ijJ8cHCglzfcjI/12M//bmTESBvn5abiJEp8RMZbRJdGM4ZMGeIkGiWvbIc8mR
         SDYK97W5s1PGW6Zbd3MI9/pO8UPbXf9CJ0z1VZ4BxlUlIM40iYafMtdWobwc9zA6vp6o
         VFIURmIcth24RjEkk7QJDk+gFrpS/MNxokH7I2N5W8ZdP0abREGb5LgK3/N5uxk7Ajgl
         P4jiAJ8Cr3xizIq6NgBnj5RA39KjyhxeUgXMQ2IOp3xd+4hpfnHz9vJ3A25NhpiEEaeh
         RQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739331758; x=1739936558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXXxScIwQFKN7LP5CI4QAzDFaxMA+7SppSQtl2ntzes=;
        b=O9NlKS8ubrH9pXF1ZHA9E3ixO6cOTAfxxyhyR2n2nKzaVTaOLLGo0NjZobYxTSxuS5
         RO8UZKdBJQidml4i3ea6p1+6qKSTFZfGKNEu/ck7GBa2qpXXZ/h2wxlHQ4JljBj4tPuj
         MkTz7mpWObHFdrAm3D2KDBJkVP8asmt0ivibCxubgWotJgM42zaebDICo6RPNVNTFm1O
         hHvlKHISNGTTMqhGak11FHCp0+SDuREjBlmXV4i4H6dsWO2Cr06fntXyOBnfiiV0G/p5
         IrAqotxYIyMjK4tQzRcHRV1a1keTTj7XCo3UZyAX9KIuDw5PdQa8Edi/o4XWolYajaMM
         pGnQ==
X-Gm-Message-State: AOJu0YwizP+Y7O8R9Eju5NwdwwZE6VCaRUKeRpIfTpXfszagv9vImEOh
	HKmG7xXzL4AxGtW6v5PaUxRzg9gymPBBkJLfGMRlo39flUiDgrJuozHW3MuO
X-Gm-Gg: ASbGncsIPYD9w20Tkid03cmDXhkOLIYxJynd3Ds9eJFfDUn6QcW2Bw9xKZyGT0Hyc3K
	9HO+lQ4CFJdYrD0+lSPVWp19qekTiXHPHO+17HirPIhETrfG6dsEOgcBymxMrnVWe+npvMAwneU
	BNJa5UKzzKPdHy6nrD/XOb5tfT5gCeq98odybK92kw0J/Pii917oD8mjkMrSN48XAt7MpzVe+Zz
	Gvmx4Zslvn9hcrC5l8xX0P86hDH6YX+ILCMe7M2gPjkvb07QPdCjm8vWfoucq4HK20vdy5PH7fZ
	gsXyy/q1LmnstgfmZ760rnLwapE0hr9FHmiscw==
X-Google-Smtp-Source: AGHT+IE/sGLa8XAKyqqGT3OXXewnXnEK8dcyr51RJTiO45dQm7hvJIMpjXgxvC+P2ISTAmv5et6NhQ==
X-Received: by 2002:a05:6a20:b603:b0:1ee:1bc6:2341 with SMTP id adf61e73a8af0-1ee5c73abb6mr2784860637.15.1739331758406;
        Tue, 11 Feb 2025 19:42:38 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73218c206a6sm2304923b3a.49.2025.02.11.19.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 19:42:38 -0800 (PST)
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
Subject: [PATCH 1/2] drm/msm/dp: Disable wide bus support for SDM845
Date: Tue, 11 Feb 2025 19:42:24 -0800
Message-ID: <20250212034225.2565069-2-james.a.macinnes@gmail.com>
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

SDM845 DPU hardware is rev 4.0.0 per hardware document.

Incorrect setting caused inop displayport.
Corrected by separating SDM845 to own descriptor.

Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973eb..2cbdbf85a85c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = false },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
@@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
-	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
-- 
2.43.0


