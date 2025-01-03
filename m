Return-Path: <linux-arm-msm+bounces-43890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1331A009A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6677A1978
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B04D1FA8F6;
	Fri,  3 Jan 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuXziwUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D61FAC3E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735909137; cv=none; b=LnfWG09ydE1jOJauN+J+MUj7lVr4ZzFWITrrdFDp4JWSwYea+E2J38enY6pgafkxzOhSGQsBGSAotXvEYLfZNGHwsybmMi1byyQSPAU8iXZNnMRuZ28eVPNkZV3cdpvvgDWCGxPl+HttsG/Cb6+lpu98/TGJZ4P5hPDH9y5x9kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735909137; c=relaxed/simple;
	bh=t7uWQZmvlqArOJmOhip0vxH0p5Ao0CcrYSITs3tqLBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7CdQznDuk0qZ3jl0XJToO7WnPHHP6EDQLI+52kNP6lv/cMIN7j2qRMxBIOxTHKyr/WgGYrov6aHOn0CEsT4mcFefKsEkmvCyLZzk96lqrrziNKJ0ah1VotCFHjtFcvDA17ZTnkqQJPLYx4iMkQcm3wyEIda9gw2KBLfY7oyXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuXziwUz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so138535055e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735909133; x=1736513933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZpHTfSit5gO2Gh5m2JOOcpLY4DaYFIg1vpxWhNZbDk=;
        b=CuXziwUzophIYbXfPHuVVobOIaFhwG2dDoJgRrcnC5Gqnj0byFi8hifJ+QAEFZeLyu
         N1G5PW8OlSMk6MSa2wf41GV1jdJ8q/rtqd+UjvdKnchMLADHHdGIobdSPQwt7kzsBMvN
         V/ZIpnrE5w7MHvmrwaZgBFbOhJ86Hefxuf1jKpRi56m8LGFv7seDYCmgThM2hFY5XPgc
         q/k0pr6UcKnmlE/yxJryOgkxjwGKok7JISW/SHktH00406sVVgixpCtZVdg4p2zVPU5/
         7w/Xvd+YOzTquHN3Gf1lZA8GfphoPweD80D/taBa7XY5YH493h8ZKWMLgU6AFk/oHHWA
         myrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735909133; x=1736513933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZpHTfSit5gO2Gh5m2JOOcpLY4DaYFIg1vpxWhNZbDk=;
        b=kn0QAXMWfnie9PCp3ghSUTQW0jq67SPRrz+k464ZmYCaPy/+5/t0ZzsSHhs9ePvzjg
         2fv+1uybHGjmUUi00kXW992O+9rOJRG2QcPAXyiw1+yiXjds3v39i5y9rUBgdAopKCDV
         Ap/1gKWHWZ8w4/6FtFyS+GUDgywixgQdQEVjNv3Al4eK3Xd0xF/pNeTIjTYcz+usDxmc
         rwPhVL2SQSBQwvimUMqAYQz77WrRhU/iUQ8pgu7zlSbi7INvxM+biURDfpcFRDnnD0fw
         Og7Ir+RQnJWt1j5/Y41qywc4FZT6EPKZSusQ3mIfx4t997605voBeBHQXOfWDKwFaP+o
         m0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVkWlEf5UX5urJffhZtZ3LsI5UXPmbxIYlhDwK8aUCtMt4746uS5BrM6aIAHHufjuToecS00Wt1w/IkK+AY@vger.kernel.org
X-Gm-Message-State: AOJu0YwRnRwqVEcN0orKW6oQh8L8wGeDa18IjCGZw1V3uPuETFPNBVXT
	jocp+8W72X+WFCvPEpzqk7a9jzSQuT8UIa5T0GL5hsJbnrUoCordlKBefTELhrWTKPtJUNYvnkh
	H
X-Gm-Gg: ASbGncs5+Ajvqh4XJwGdubNsUXvYVxE1FU6sU74cml+H9l4bnAFOHW3KLESrnFHC1+7
	y96g+BNMhn2C3kjq429b37YfjuYSJPSAMvwAPIZq59ZRo1xBy7Rw2QefDWmLgHUW9nHtivk/ZeH
	dKrIzQKStVxXu1sByYNt58n++DrD6+2VLH0WZgg3XWdoZXicrJZSnsoRKScYBVw1UGgN/FJqe9t
	jlwzuwvnLrUs35o9ofEstvl0Lp+TXAl9LGBOYbAwCVvynruibM++Jy9
X-Google-Smtp-Source: AGHT+IHzzw0z0olhiMQIF4i+m6RWPCwn/5pzBtPbIPQehiZzeOw1sBpO5b4V2d1MU84ARWYaRT4n1A==
X-Received: by 2002:a5d:5f4f:0:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38a223f5b4cmr45535380f8f.39.1735909133357;
        Fri, 03 Jan 2025 04:58:53 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:58:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:17 +0200
Subject: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=t7uWQZmvlqArOJmOhip0vxH0p5Ao0CcrYSITs3tqLBs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98CWJIRcWNajaQUs0XtEmjBpJ6OADba5w2NK
 CosooeKSVCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAgAKCRAbX0TJAJUV
 VqLKEACTE5rtDEB+D33MFt/oZ45AqV9b3HvDi4rXOsndYQGSTU63k5aEsmdo6JZy3Qg0D+xuuCR
 No9K5tdKFT0oiyRF4TvWaH/9wNmSFsIcgwcyng+spkYd4QZ+7E7kkMTW7RLXwmixcX+PjnAbhRu
 uyWVArrU3Q9yFK5JJb7zh3DEq5YqSBXK9iE1Kjls0cIR7CkmSer/AmxrISk43jNNHajVr0a+EIT
 cblU0Z4x3n9TlXxwCsowpn45Wl3PaemuzNzmKo9SEbGorOnfB0wYxTX78pIr1D4M1/OXG+FjxuB
 WyNd75KSJMQMigAKoKTA4DOLYtL1XB/Bbt6byj01kMwbXeg1rApXR5lgIAzx9GfiI7LmkdDZGL1
 RlDFiT3f/uMfw7tzUohgIsQIodhlCuZ2eFXrHtb9u8XapXiH+knM5qqObAd4U6ePoM6Zj6MEFK6
 4W0Xtc4G8RFAkDZWJk05I3mbnXUL/2Qdik+U2Phyz/k9eltZvpFm5eQgTDYI+nqEMlJmH5LGsi0
 4DJ3EKsEUGwFVDi93iwvKHYq6dP9nkU47NbWjRe6jY8BHgLi6HQuyAC3trQELmnGY35TFpNbjL6
 Q9GYYK4NNMqjIZ86oG/ibnG2NjtBKCdOhR7bzrw03Cii+gZK9vG/vaQujwKNdO+h9bjcuGNNAU0
 AMan2WsFQIdj0uQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
-		return false;
-
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
 
@@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	int lttpr_count;
+	int ret;
 
 	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
@@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		return lttpr_count;
 	}
 
-	/*
-	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
-	 * non-transparent mode and the disable->enable non-transparent mode
-	 * sequence.
-	 */
-	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
-
-	/*
-	 * In case of unsupported number of LTTPRs or failing to switch to
-	 * non-transparent mode fall-back to transparent link training mode,
-	 * still taking into account any LTTPR common lane- rate/count limits.
-	 */
-	if (lttpr_count < 0)
-		goto out_reset_lttpr_count;
-
-	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
+	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
+	if (ret) {
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
 
@@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		goto out_reset_lttpr_count;
 	}
 
+	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
+
 	return lttpr_count;
 
 out_reset_lttpr_count:

-- 
2.34.1


