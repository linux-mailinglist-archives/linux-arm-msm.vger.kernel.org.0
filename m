Return-Path: <linux-arm-msm+bounces-46727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82780A25794
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B332E188085E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D02202C5A;
	Mon,  3 Feb 2025 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oFn0AqyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFBF202C2B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580306; cv=none; b=lcTN29gkk7gwCosW/TG4BvdeQzccGEkGKVSBn6wKpMbVWbOIumMZZfVeGifbyfEPUdC8CSjJnTx1pjbgbA4/5gMXLRNHTafxUCOhrMYuMcoM1wuu/1+XLqzlyKbFjE4YI3SRisOqJpJl4+SRtIF2ARu1k2Ub5Pj10qgTNOGBN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580306; c=relaxed/simple;
	bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MuXmE8/Ws39GmrKHR4MNMaQBPKwP8XJL0QYHud9Wek1SqcC65xIqYM0Nekl9phetaHKNxVjelsOWoGpOqWWIn31vpg8I34gc73ogmYe+XzKOLBrwX4ZVizKUf5KDjl2VKAhnhTkEwG8p8SNFyUAATZrd8IM0C+dNMOlMLPciYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oFn0AqyD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436a03197b2so28627485e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 02:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580303; x=1739185103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=oFn0AqyDQKlemBaVDjTX4pJs5/VGamluSVuQgt32LxS1ovbXgxDSu16gKXM7fN/vui
         ABtZE4yAe9pY9ZqAuhj60FnKwqc42AsgJrB2ZqQwWxpOzN/HMmi8OaeAJT0BaU5wbLsS
         IPc6mR5ih+3xvMZwyykO7BFxfavkr2B3ZfZ/fpKCEOHZqFbmpokwF9iMtRSS38n+oqRT
         KaO6nZ0P7k1IR9gj7Pj+taMmYtO6SA3ERx6P07jEJmdtjjLPOIaCCu/JlmoWTViixt6c
         Iz0erCaBFqE4ezY59YVSXSMzQTGReO3PtSBMKO61gmcniFWlQJsdARzX/kXsmMC1y7WE
         hN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580303; x=1739185103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
        b=c3de2udOoJqct1yVtzOFyAI6S7NYf7J0d/XyrFyEcHnXIxVLxNPQq6KHuOuLTG2m3E
         7wmOwt+ihuzYJauEoRAa/dmuEeGG41I2fESntTNMPhNC4RPVUaxmouwGJfx3+OSC8OBS
         G1UJtuEWf+sVEOZkORhM/1R7DX3Ln6VyabB7bs+PI9d1/mlsZQ4LkTBUvXhZtpDFpekP
         kgAlkXT6aSZuDfCkqEJhtlW/Q2M/PYpD16CdTqW9RS0jfa57GsHqUVoKWhfbGYhRN0Ut
         ZPSEwxeo0WJ7A8kgeHyGG6HexmuwPrgcLTkZqQkccoFFRg7mokg5O3O2LPpDnlEvDtFJ
         XQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg7vGRGpOBaqakGy9/A7C0ci+5jVU1m2puaxhY86FAqNGK/nCitFkiCVV/kYWxOgHJyfm4qQrOGtrerYBS@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyFDMwc5luX7Uhqr+uR7QuGCBOk5g/97rrTXdaYHSTOh/1OA3
	z6tTGptRpx0suK4keJc+K6d63cHRe/SSMUYGGdL64Rk2L90xZVgoSNxyYv8EinQ=
X-Gm-Gg: ASbGncs5DZ7+GceBLBIV+Ydgs++rYd8wW0nnm/y9PUMQfYGbJ9sn/45dUify24wiqdw
	NTADIAd0H8GMa60rH+lFXPNHEJv+P9+QCVP4aczFZ64DF0S9pKgFEmfRDMwzxg7No7wU8iqPbrC
	EaGveNBWH0v2MlRsywsu3FaJp36kTL0megxIsrawUdS8khSb7zhk+nAD800ewp4PM0tYZctXSMf
	qS1xiGAowAPP2m/jSlcXccF197WFW1NEeHhX9/3NHlOrOa+426Ics4po2SpI9hjn9OBXnONr2S6
	ilz3A/KBJpT8z4s=
X-Google-Smtp-Source: AGHT+IFthNBbLjS02kgsZVYwGukRDHyL+VpzJLps1CtcKLr/74/ZMFJ692muUaKO63TfDrMyjpuBEw==
X-Received: by 2002:a05:600c:a44:b0:436:488f:50a with SMTP id 5b1f17b1804b1-438dc3c877cmr187531275e9.17.1738580303507;
        Mon, 03 Feb 2025 02:58:23 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:58:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:57 +0200
Subject: [PATCH v5 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-2-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFFwp0Q3Pa0vilB+WV1NstXg3L+NhCg1dZF4
 9nljGvt4aaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRQAKCRAbX0TJAJUV
 VrpLD/9KZyQu8jIhJYXTVneqLeoUWkoZlTZO4UcXbLROqhAXzJHfoudtKqN6Uo7EBphzOjbqXkw
 L8V+j/CO9idN63ZqcHf5mQVmuMbjNWkvIeCsMq42M6ZZUmACXguioar1CbFgHQ8E5OB3ianHEyo
 ZEHBtewoLDvvkXGlx3Dhb/8MfMTiYeF5sCXozl5qdc2wrPhXO76+U+tpsexdEQxTUK/9iVE89x8
 sQlehJqfxHeZsz1PaavyvnQPc+KVvbdFdkwFfGWPYbSFn/TWOSkjIF64HS8q0tjcDLBDaXEr4yJ
 3hG+Wvz8DC9sXLujBQLUZXZIhqAdcPWUfiBvW5BZUB6B6Awfu0UwoRjExTQfKwqCOYPWJIXMRWq
 XbMkXFpQno5vlWWimF249S1Y9vIUWhyJro/PosAXnBrUzNzjS79NpAqD0GuP+vmBod/t5Ls/p10
 9M+KuiUzWArjDa4v0ZnRNhI4u+OUeTTrlDC9KGoKvArCLJwhmhkPaFQ5Kh0Za84DPk+SIcH3t8A
 u6SJ5QH/UTUb0MV3fg93+zQPTV4ZrYguUN4qyIgiulEbIPa1hYwBNs+96lfizy3+QAUO58clj/D
 PjEX7lpaZSm1/2PAINaciL/swbWOOjlUQMlUEe7fDoN+tTtc4cdp5Gcig7ewkuC47gVY46TdH1d
 raWn+ZZSSCri46A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1


