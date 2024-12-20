Return-Path: <linux-arm-msm+bounces-42888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2669F8985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83C2165107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992ECCA4E;
	Fri, 20 Dec 2024 01:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7OoKju1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBA770FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658128; cv=none; b=TaCJcQk+I/me1PcvbJQbFTM149rTak2nKqvODk4P/nhdwCLpSeWqurKSo/kFRbz1XlzGKxEwbmm3b3FH4D85TLsr/hE+PrLtM8aEYSeJllQRfowhKwIwS33vGAE6tPNLmsQ6wavA6K9CNIrxltJB2dsfD14P4TwwDJxEDflvrfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658128; c=relaxed/simple;
	bh=vb3CBdu7rRYdoP/BORloE4ExhCArGx9G4wRA2z3QaT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRsEP2ruMT+rhGQWtcBeJXeolSfG5r3TByqSCk/CF8E4ZWSYTIny8U0LjtO6n3tMzVfycisuZ5m1aYlGLddxzrmXBepO6fYFvws3qqBcFn3IqGutwy5fBZV5rV4FkLSQMxfvza67QOVUSBbimrQuxW74g0hVTRJpWvVuj6wSo1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7OoKju1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1572647e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658125; x=1735262925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3GKBJwWEfw1/CxFlxhza+7CDGlBelmYowiHKIMRKmk=;
        b=b7OoKju1ajy0KIrsxVGicjCP+HD4YuM56+P6/zz57uvNWLT6BeIHTpFbeB7vSvx3zf
         PvTdegdWqQl9ZgFiXHU5fSzJoVcgqIIO4WoHFkKPeYc7bXDnKoDAF9DpAEKJMjuW7p2L
         z7okANWdXGchcGGWSIX5AHlKWba+pHUQy0fPEF8jLTb7pQlfN6HayUmEa0QfZxwW34BY
         VqHC1PYmJYdBMVa/H5ehaisaAsHmIKE/bm6cjH8OR3/BthoKlUCC77YVUwOqk5m0qutP
         9qV9PVyBdIdmnWDDmBwLNyODzoFxFAIg/czPlbqTZ/NRI0UqFtS8bD/gel+lVYQDsmxw
         aYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658125; x=1735262925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3GKBJwWEfw1/CxFlxhza+7CDGlBelmYowiHKIMRKmk=;
        b=PZsjMUDl9bIyBPtwu+XzGcRAWKQfpNiw1vMJFF7YI9s1w/UNwIC17oKO8i7eHVS9Mn
         pUlueFocG3EGg6V1ZFR3ojmU/ANn741TkPOCuJgX1n3xVCT8rK1lMbGnJvB/9xwzG8FJ
         OrSYm3iZjMz/6iXN2OoU882PFrmb6hNqCUIE1WMNemS9wA4036CLh8KG+n50VmtZlCgJ
         L4JjjGp2UTP6HFippI0sv3L2noVXzW02HiMvgSJqOrl59OoOveTA7FwmGDUGGl8ePUi7
         nboG+AJhSZp5gJ4V1Q0WztTrAy6aElOOTCntHEuku01GEAczoysnuglnIyrGVgqO98Nq
         YEog==
X-Forwarded-Encrypted: i=1; AJvYcCXmQvMP0E66vqpUlFEcjW9goUu985Xlc3JAnKKN7HS/yQZBMhh1bXtrPbM/fKLL2P0ysPCGG6+ej3HbK74S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ELxouiT0cUp2KotCUMNGiKlSfjavgSlodhL9uzHUnpUtNgry
	7tTm/0aU0YKjezvQFfFj2Hkbh5zoOxUrMcV4YGfkcTXLp80e8x3rtkuBnoekhpc=
X-Gm-Gg: ASbGncuJz9KPoKCdcRfUMU25gofGXvCkkpFY3dH41pvx1NrsDrNoSlJLio7XWVSp5DX
	B25cg6fTBLZr6GDpPdzdBOmJYaBlhbqvBMUdYfr6JTuGVY3JNfu5ZylFByQxD8tbmU/I8Z7A6QQ
	TJvySwII9MWCaY6L/uzu7XU1vU76oU9/S/crHe9ZPo392Uew9KxvbzIhdwUIhei4vOWxgk1F/9y
	1GVPOP1+e9VqvVwBDWuioltoS5pjE5WVaBmHJw2uqdo7yOcBAuQLJwDcBPsmsUd
X-Google-Smtp-Source: AGHT+IHESAj0aPRm12hAGclUJ3UmR8oxmXDZHMsUjV8nmvQd5MLhJkySZ0kJVJQK5K08IYjyPoxqEQ==
X-Received: by 2002:a05:6512:3f04:b0:542:28af:816 with SMTP id 2adb3069b0e04-5422946ed34mr244788e87.20.1734658125099;
        Thu, 19 Dec 2024 17:28:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:34 +0200
Subject: [PATCH v2 6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-6-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vb3CBdu7rRYdoP/BORloE4ExhCArGx9G4wRA2z3QaT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/ND6AujJKVlejqIx5KgOPU/QuqfhojOWOi
 DhTvYmZfx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1bHqCACxnLhTsGmevsDSoJuKkR2vjzK5c0HdYKwGpX6aV+XMirfriaa2P5aaQ/tlhTRWFh6ufvm
 UUq/IdVRCqTPCoyRknT5AR0bXpShVOk7mW1h1BL+zhdkygTNie8HqmjBrQI13S/VEDjAgf9vS2A
 XM47vQjpfYpCw0wkwQXpW75lPPE+DCkEIzfR9srWIxj3eHjgsFU/543xYYM37xUlZPIcCyLYp4K
 k2NC9DgkYTXIQ8ICtLnna3UzGRR6GyX81wPnLPjU2NUNBCI1kgJfrZtamqnexvEo4OJNwUXA8f7
 cOG+Yn9ZFNI1Aa+KLW57vbItrG5Rt6xAVM0V8DPL+XcK90l/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..a1dbbf5c652ff9f21c02af2e2520f019702f29c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


