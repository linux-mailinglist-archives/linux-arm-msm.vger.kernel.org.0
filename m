Return-Path: <linux-arm-msm+bounces-42884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E77209F8979
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D69162210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428DA179BD;
	Fri, 20 Dec 2024 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p83fbR5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CE8F6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658119; cv=none; b=OBVznAaADC7hJLwGKQarGkDPvJw4qDb1uPbG8WVmu3/Ycl0G/WZmdqts7IKn6H+LsPebXEOfqxglcSqrkQ9M0dbBNTZRtM+7mUbYHnTXXvgxOiQeFghU06qxKatFuoUur3TYN7JS4IHknGJc8ThCWGo37GpbNfzRmdZAcJNZ24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658119; c=relaxed/simple;
	bh=0nHV+KsFnBOLA7ZxxfDPuxSHN3vDdgnluGgG9s77asY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXD1dC45o+8Tj5QMgmeqwKAtFd2rVycYOOzHCC+OQcz3ntpxMlSgjMgvlytKMVwL+fH+7czZeq7i+TYxOxSvh8lf9t9AoGzu7wHEixxhFAdpI4ZzHUeqbSEIMV0yPCoFruk7GWC6R6lUR6XaicF0G+jhBjZhA6rdM996ANrmtuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p83fbR5E; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so1343910e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658115; x=1735262915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4ndfZOZJO1jxo/ZES5BqsNFMwpzqaVZfLDHYM6sZiI=;
        b=p83fbR5EKtBHDtWWtr49cJOvqsDIzQWp/wU2bXU+MWMMI58bD7z8/iJF3tZPZ8MpOD
         s6FsDpZnVuHderTIYtCdJhCP5afOkyTtMblHxSPnLsEQCzE72KYyOFf+R5bFzjAeLIi0
         bVOX9XM/WyrI8qvmBANfH6CqKuSNkhrkmswdQmQ5rhpEa23uiqqrKNVyFYPoWxi0XQk6
         1hfFSk1VRGe2VqahgWikxpMH4qk6UjegCsYr/x1rM2Uzw0Xbz2lz4hM6JjN8ymQXEtV/
         RHA5YmI4tqQFnmDWPXsp1zQAfQwp3o1oN968I/idFQfyF+NJPnbXWlWUPFtdhIKVIQb3
         16TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658115; x=1735262915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4ndfZOZJO1jxo/ZES5BqsNFMwpzqaVZfLDHYM6sZiI=;
        b=cVe2aOoDUQzyPM9PzZk5lys82d0CNQuCFyW6WgiKY1lePjoU5zKbC07laM5Hxbtict
         P/iOOH2niMovDyZHefhsdIbk+cuV0d1IA8IDD4SBmFv4KlhTiE3mQ5jH6tFzCECU8FzA
         Xx+6deXrF9xMrXohu/UoTEkim3YLsOf9kfBmrfZO+FmYXplO65uCs3h7kOXccPFUoBK5
         /CMqCB+TJQy7txDKiQaJhmZLbNBKkdiDErNizzDTFm8etaUUcTwdTB+XojQVRZzALAyj
         ls+ZYqXrWjpcTeqZWEmcksajWRIOVS0+9NzwJpbPya+Oq1jyR8L+l/h1tNzGOxsruw7y
         xpEw==
X-Forwarded-Encrypted: i=1; AJvYcCWplfh7nATj5F9m70LvHIy5sJ9zrDedmgOILyuTtBFriRKyaGiLytkArAnnd/0nJ5uhlcxgBHgRKB+Vd3R5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+Enhdnqy7nSqIXjLdjyJO3WFctV/qV2W5ycT9yuBZ82tQCOq
	/0VkWmOIs0hra8jFrajeSuON1gbz9e7hTlbhuKcbheLiLb7YaXuXULIoPWgbo+o=
X-Gm-Gg: ASbGncvvUA7/OqYqafTFYo8GzB3CB1KdWAmvIod4dAtESOeByXMEGzLPUW84PHuElO1
	Nq8rMolv/QYWPetSnvOXOfx+GLcR6WAzNM00x96aJsB9aELzkmoZnknSMdcnfKwc/7Gm4oSKBxi
	nzmV4kk8Dn+8efuFefoKodk6fnS2m05R8YziTeSP9ZJsTHNXQkBzAghBeZr/ubp1zBzX1VphOQK
	OFiENyGMSczTYzKadH5NMFEYq/gNiClfs3he+prLekDwJyjFpxNMiXrdCCYZ+Pn
X-Google-Smtp-Source: AGHT+IHs8K/VbvXTO8Xz4iZdDagLPpBuaGlYHTDPeiDhViakq0c6cSmYpXdTleF1r+SIikPOF9knag==
X-Received: by 2002:a05:6512:2308:b0:53e:2f9d:6a81 with SMTP id 2adb3069b0e04-54229560339mr177427e87.39.1734658115428;
        Thu, 19 Dec 2024 17:28:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:30 +0200
Subject: [PATCH v2 2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-2-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0nHV+KsFnBOLA7ZxxfDPuxSHN3vDdgnluGgG9s77asY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+cUL3mr5ppuT98cOi+fVsGwppbZmBA/cXY
 T6tI8w+2GOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1d8ZB/0YSHJHTNMquXkcsraZdDPc40CYd7yWi8YA/3S2WD+87CVaoICq8y56B8NmuLoeaq+eBGK
 +Ju8Le/3jUsJlwb2kHtL7vGpEnux9+b8ozLGdL0xs19S37/SkWOO3N5eIKrQXygVIN9kpEaJijD
 yh2Sidt+1WbR7/x43yLNs0T4kQK/9Y75INqPBRRq3xm4PEBsB5SFG2yK62owBF6kAJJs8mwE16X
 +nStEKtF2sMuZNvPkRZ7a9wkLNx5Edr4QMeXFsU/KQTDbh+Hgb1lbRsls+LnnRc4/jpeZfPgWyX
 kmdbILxAjDIHpvSQdHUN3I72Y6Uxeu+Vhr+jVwV+C2LMv5cI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


