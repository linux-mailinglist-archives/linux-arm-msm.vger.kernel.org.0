Return-Path: <linux-arm-msm+bounces-44405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDCBA05EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0E53A7011
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEC71FDE2C;
	Wed,  8 Jan 2025 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ViGAC26J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6D1FC7F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346732; cv=none; b=C6lrszQ9LJxgT7XTGCtyUJA2AAeMLxOx8CzO0ugUGgtN2nDxr3RZ0vZ20Tr8VdbsQyy/DLiHaBEhTi4KXml2UCy9bSpYHrB51vZWMgSs6QtqM6LhR4qDOtbYW2gQkYBvQilf3S7bEvTXHKHggzw1SLel5vabNYl2wroAfdXwUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346732; c=relaxed/simple;
	bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qH8RiLUJUOoEFnQgnj1dXAIkR+Op4JtFYmaQ+C4gxgntXnUx2IvEYbmQREPDq2Gnl0LveFiHoRPaP4oqZugZQciSn6dqW9E7KdclEhVHJ9djwWyu9THj8BPCc9VnDJ7venJ2EdfE6jiMl+3nzTmnuWw2L9y3NcQZnwE93AAjguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ViGAC26J; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43623f0c574so116440955e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346729; x=1736951529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
        b=ViGAC26JTPgy0QEn/DJb8St0jpn0YF11nXUaGpojbuz7RjWCdMxGdqk5Nym9VeTHIC
         dSiDCG798Q9X2e99bUNFP+Cdezoir1XEutTi0P7bofZjdxkz9XbPxYiYAjnn8QvD91es
         HIJmdhHegDw3SP06Gu/9AXTiicRjtvxa/JWRCFPWOEWpRHMTx4iXVecQvGsrUAFmkDQP
         UR2Mux9YS1FN6NWEte4OCMjZ3tymafDhyJWnNEZuEgOdPMrGhHs29ecKQVdtcu15z/k/
         tiBO9MqVrFJYCIAY9sQX+rUOZJUd19zCs7Z8chNM65+5kng1k7mvWV5rufs0SeIaAddT
         Hpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346729; x=1736951529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
        b=mXGkcsHuPeZJmxjyAvpNFsQg0FEPKtqYlI80VdZOEEYIRm2S6plG1OwFGaExzh+FY4
         omJDV4+8zQWKh1s2U5k2Hk/4Hm4kxo0wPJi8PFw7B7sSXXNoa0yAATCuqTGdej1XcnTp
         2Xpdg9X5vPpEshxdAIw6CYr4FiBrwW5EyeVkZVK55noV05NuRy13TDVxqXUDLZiMINHe
         aJmJ4yDLf/GRXKWAmlfl/5LfrRmALQGcIeXsY1okGCdoyBVToPzNX4yd8mxHerZHDuyE
         YlCZ/7nuhpTTCvqGn2HmxWr5E3mfbOf3AxOAIqT6v6L1Me9cT0xVO08rMhW57IF7DbwZ
         aZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUXjn3GHYzv3IWXi0FG3XM0UMUqHCvtBoDYZAdtnrC/MeKgXvH6TkIq8r5AOZBE+GT81wNiRgVgUH9PuQhX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04hZjwDVG3vbWeVMmOnvptTRLSh8w+OQsLc5xCHcAeP/Jlsmr
	dNTCIvBtXnvjp9gk+0FKHV5D8I/yqUKC+va4A29t6T3pt0x3RjZBgJ8eQJJimWE=
X-Gm-Gg: ASbGnctfSGe7Zj/JsSAwzfCb1qYh2zDjBXOBTLkNmriK41RBHCjzwZj7qw7YRnfhVZg
	m948kA+5M2nToYAA99Fn50OobgiJhkmnoZZe7S3kEPkz8inSX80k6LjZMll84XTOMf+Tu8lwPqV
	ul2/Ctg5uqDRribdIcPqjWIAzEguXLtW7nwmj0vHR+rHlA01/fGIprfY62JaiKkeEc2YSPUQCzJ
	xP01KLFkK3MiD/rerFrVj+xuVWiIJsc2z5VUuBGskt6W77x4vXi4Lal
X-Google-Smtp-Source: AGHT+IHOFNgi43hh97zw23/scdO9rgdvzo4suhicC6urfK1gf1ViwOyw1YHkL1LYT0r9NFeFOfWQ9Q==
X-Received: by 2002:a05:600c:4f15:b0:436:51bb:7a43 with SMTP id 5b1f17b1804b1-436e26776f7mr25763075e9.5.1736346729387;
        Wed, 08 Jan 2025 06:32:09 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:32:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:45 +0200
Subject: [PATCH v4 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-3-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxeHNki79B0QYd4mTUlmaS4L+1SJlhYA9Z/v
 A4IDLvBSQeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXgAKCRAbX0TJAJUV
 VvsXD/oC6cp0EXwMhmMRSeEBz9Zyx8ZcCFWQr/TnVk4AXiXuzPX9TJGnd77Zq+bPTvcfFEkGd9T
 2iCgdfAC12kiMTsTGPfSC4CJw5A6F8fKgAu3Gzm9mhGMIvSEGMUH9ObSxk8aLljgxHjWqJdBfsS
 PnX+z1pwhNwDf7dJMqmeyDCUtaTCAOX2/0aPtGYDaPV9+5xHAUDipJ8/6f+XAbgUKLmisnmVeO/
 x1JN8l4JHYndHJ0UVM5r86iEytn0+7Y/WDSv5faTe9lxmZXBL2vbr+IGwI25/dsCFbueTZxL1ot
 N4uZBzIFRqUMN2eTq2DHF2IKtKoSHsEdDUcrGkmolIL+4B2BIP1mrjrd1N5MbiFtEaHfmFdNkzj
 XNSijG0GamQoUl+OC+VC5AyL3QYvG7X80lZhthpK3Ad4wiXzqJG59so0TeEpx9OWAqs7BTGdF0T
 +wwS6vXDmzqygQrfXuQfY1zatwG0RZHuY4LDJz8U1rs3gb2HUqgxesCwaXK95u4Xcms5qGrr6Qf
 V7UFT8z0OFgZ6jzG++l1+Ud28R6i2GbJgISqMjRqEstLMKA/HPo8db1bIiY6lgiMTj3Qth8kcSA
 lY+oYAQaSCGcqdUVuE4D9b8V/3CL+h7FF4sSgISfB2xfD7eq2XAV43yQ4tc5uPB2BiqR0hqyuPc
 +ZR64oI0/smoEBA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner. Since the driver specific implementation holds the
lttrp_common_caps, if the call to the drm generic helper fails, the
lttrp_common_caps need to be updated as the helper has already rolled
back to transparent mode.

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


