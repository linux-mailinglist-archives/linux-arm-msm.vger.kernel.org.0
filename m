Return-Path: <linux-arm-msm+bounces-38390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55B9D2D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B0341F2568F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BDA1D9587;
	Tue, 19 Nov 2024 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBNKVA5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF81D86CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732039020; cv=none; b=PgtBs1kZYnwi+omN4GFPhr7mdrsHBe9HvkbdxjNV+HaJnLYWDF8fpKiFx8IwwdPdcc4bDMfnxvaYbYAAuMUxke2kaLqWoWmHlqKHFEzqjcIYZgxJ5oaa1dLtAY+J9BMpCr+tAz6erUs2Jw4pNZMc79q6yH3BYG77vbQwGbgfn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732039020; c=relaxed/simple;
	bh=L856afxfFYTrzTjleMcDff0M5LSJvcUyglLdt4As0hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPtjT3mvO0wR1zIco3HnAkOSs5AEaMLSHWlqe9vBmWap1IVZ+f7MXSY80E6MZISFTVblJYlKl62uSBcSDksbkSLTOYtbdkZgXfl49UciPi2R73ncnGJKrUt0NzXr8DbOFRp3q+MBtDnRGWV8JtkOcKsidKV0SN6ccyEntUsV5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZBNKVA5f; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so11451405e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 09:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732039016; x=1732643816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sOdhCwiSh3xkI7uU9B1Lb49u97b/k8HIRiPISm4XY8=;
        b=ZBNKVA5f4Lu1HQgZkEWNOeRFCq6Va0unQq0hfRCjR5PO4bNsdS1lC7eRbnSl0Wn8O0
         ee1sWPLHNujMA+TGN3qPFlKZ28VkcmtCUXGCdflmKy2klD0JUvAHjxAJNbrr6rl3rtym
         f5GINNFSBs2OiNeNCR5ESEszQ9M4ITzu6bSNSoyU5kHNhW9GywHheZ3CfjIOUoszCNCA
         kDaN5XgHDGIlUA8LDbS6H/qu4c+XfHm8ILh+O8+wSw8ZoT76H+VQGvehJ0ECdJT6UEy/
         fjSBLZsuur10JHWAJ7j4mGCl38GpyDqOXBOY15KvwLc7ROuzfwvbW9xAYoekG2v8H0kc
         B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732039016; x=1732643816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sOdhCwiSh3xkI7uU9B1Lb49u97b/k8HIRiPISm4XY8=;
        b=PmuC0GI0IxgtSil9kJqB9WdwqnA9SOV3kvHDw0lZsxNfz2fkUAVsKJMl0abPtCZkVn
         ocwql63SIaJ4LujlL00H9uUuIpTq6sy1Xpj9JAdYHL2sSbjRcSG1bVkrr7unwEiai9dA
         n5TyjiLN0Yp8B6Uj4kDz8P2KVGse3eKV7N46DGn6+/BexqQm/xdRvYhODYP2W3MtG2J+
         BDNhy3Ii1OGhDdijeMdaOQVK2A/pcPWAbqkWIBZtUO0EgCE3seaf04U4vZhQ4Rrdv3sx
         IEOFxRcFyL3svTZAvBHQ+cMShqGWYoGx86lSxbHsQLzAtntankZhPHpZj77Xo8knjZQH
         mliQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3qCeAMgAxpIDAUFL/p8FIc1QTAPJLRQmhFCdJZ/98HgSVgVKLkgrK/L/RwAwkNA+UeCPr4Y7r/pjNJ8fI@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkUVTvTFdZrUvfSuPXYakYVGxfOkgu/d59MB719O4i+nH9Jot
	+mloLYh11LO92AhNQc9Zp6CgS7r0/lbpR4grJO8os1xXiWMm+naYjs2g5sQZdcY=
X-Google-Smtp-Source: AGHT+IHApaxnzvnBHMhgfGhZ0ZVtiOtON2gIMaKaToPdOP4xBZY1h1uuKuZxErPzNHlrhhyIABadNw==
X-Received: by 2002:a5d:6484:0:b0:382:3e51:4b1d with SMTP id ffacd0b85a97d-3823e514deamr7632572f8f.20.1732039016495;
        Tue, 19 Nov 2024 09:56:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:56:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:44 +0100
Subject: [PATCH v2 09/11] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-9-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=L856afxfFYTrzTjleMcDff0M5LSJvcUyglLdt4As0hg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFaONQvWVA4bP4yQAg2u1VE2uFOJH4JqIlyKjuL
 E+b5cDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWgAKCRB33NvayMhJ0QTMD/
 9Ym4y6wn5ANBhacJSlVGVq+pieT1LNiuwmZiuqSYT3/FAUZxjXIcuGnBVPWROkU8WG/7Ea0BV6zx7G
 GaAg7kVOc6fwaAXUEgidaO+BO0d/C6XjOF75YoaVwNzEQ632acKIeBWDCPnPKv58KD+Nqw/LQTpl+2
 Pl+4ZitIKwP5OlbelgcghCk+KiNxKPRxpiOi4OXJeJPLGh2eAKQCWQae7uSKmHofFvSefqK3+3DIlJ
 HBQpyNslSFCzh5BZ/CPPCBfyc+rNP7TYAxZHT3EbolVv2Ti8Q2PuAcFJcKHVjZKAsQU5TB/y1Hikhx
 3900PeUp1zuXz+LiCiACvsOKvnDAQAEsHUtMwEj6rSyUdixVbGCZHOsCpCMxtfeVyxm/A7b7R96CNN
 xCIkhzd//K64UKDkLx/oARBg/KC5TWNblhqNWee2XVrc2civdB1OWbFWSk2mt6J8S2/TL6h17/Vb9v
 vJl1D4wrMkfcsQ+48D6qY8vzG4BYACQGe3qw7xXqmgaj24pHeBPGfRMTI5/3obZsMIzHSAWzenpqDT
 EccOZwyzZtuPN2FJzDiPPdkiqoQV82UdKrsyKgNjS6l9NYraZ+Pwc/G9njaCkRkMW8OSHPGulWOj3O
 8QmSiYESfdbe44ubCXHV1PNcAlfkTHDA1s/n1O9Q4+qzWx0rV5ujJhUziC8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct and add the
GMU_BW_VOTE feature bit to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 93f0d4bf50ba773ecde93e6c29a2fcec24ebb7b3..7cb96d524f76df67c6ee4377827a38384c1b343a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
 			  ADRENO_FEAT_HAS_HW_APRIV |
-			  ADRENO_FEAT_PREEMPTION,
+			  ADRENO_FEAT_PREEMPTION |
+			  ADRENO_FEAT_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
 			  ADRENO_FEAT_HAS_HW_APRIV |
-			  ADRENO_FEAT_PREEMPTION,
+			  ADRENO_FEAT_PREEMPTION |
+			  ADRENO_FEAT_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1


