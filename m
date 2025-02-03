Return-Path: <linux-arm-msm+bounces-46728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CAA25795
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25133A8391
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB8C202F99;
	Mon,  3 Feb 2025 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBLvF040"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01B202F67
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580309; cv=none; b=oqaR02rAq/EVSL0tQXoYEeHipP2KcpS6OCzzRgMP0bah1JpDdj5QLTfUX/PiW+HgjZJ3LwfXFbtUssK7Nuxqz9kUFmnW71HqHcG0+yoFIdW84jMxR2MpVbSJSRJ8U4YUUxVEwCXXuZru1H15V7ZyrnHgbtO5zUuq3gNC5Ie+okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580309; c=relaxed/simple;
	bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAfMeYnHGJoHtQGBMatt9/7nUb+RtK6pfmx4n02J3l4pmF5EqSeAJQswEdjETJJmLkPynphpiF/6hNe1xLC/LX+zWhZf/sjZYGJpcBr6p40aa9z2lYh6+Z+NcMXJajsDpAmKQEZorHH3X9lZjQMvoWR4pf+wvTRgukmKYUCDiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBLvF040; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso28742305e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 02:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580305; x=1739185105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
        b=KBLvF040pM9184uMDMM/fMU8IvS4ZAuGbecuZ3Nh8AIosPsJQIwy6qVxUz10DdFWje
         WDyw9cgl5jNWdtmEpTk8T0cWP1rKMhfoQ+egB/kNf81I535ttJikq/gcbc4zam+fni8V
         +QiLYrxD5cs0CPvFjuuLq8IEI52bFQUqGDEhb8QrYwZFiJ0rSVaaoly8aHb/fzZq1CZG
         rgDY2scNnkVwIgNpesQJeaAG/TkrIJJ06gJydLVuhZPQvmOdMmXMCcGPDMdfkWr+cQCC
         zhX47MHXu+yhmVwhu1/d6nM+/EOZ5/nH4grnR6FXdxiw9RBaZ4X60XdrSOD+nI4xmqtL
         GEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580305; x=1739185105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
        b=Dk0hhyY5953VrBFPCy97WHpp5eQxxzBew5D+b5EarRXyuSl0+J4gavwhCiDNd6LP6n
         S8Z7aLva7/twzlFatIcCUGVESO/cYot4sBD5wjhUFL1WvCNckXhHSYa9sC/CQEmHeuzO
         QG+s4Y/vQI6+qOSXSKuCBRVtrZIcsWYf5MfQpwkrFB3AacR7c75hguHNFDOgJpMtY2sh
         lgMn32YvCsvHLHX47n2cY//XG3N99V6jw9yLcZHaFM2IM1MmR6+7NqIsSZaf/KdPAbER
         cTfddvhSV3SB+sqRG7AY5hJX/dtdASmasr4k4BermBHZ6rUy9fpA4JdiphIsfC+5r5H8
         bTIw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2whkHPkNNFTnikxhx5aWahNVJMg55G+MUvm78AslNp2Wey7lrRKeLZitesR8ba7qMkR4gjD5yvpH4AGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0SPFllMHC7LAa7Dn7Ea50LpCAHeNBesa+p8yu158gVixcBbt
	tUX4kjkQVUOd3rJiyk8fqQr7uGUIAPnp8e/IWVY9Ggh9ptg4c3iMHEDiK/GVQkA=
X-Gm-Gg: ASbGnctuW20mzkxrB1icqUsYzmx3Ly7iRFfVfgDWeB7KNl00HIOC1jTDGb7k4dt8Lsr
	KRfOGgUBFR6/cm7B4CtQI0/yPF2cmyJokRd2WdXcsxfmKxgzEUvc5E38x2K0PxEyovI3hJ9xger
	fmT7ZyNasbPwv1wUFA5GCIzYKi/Y7JNAh2Cj2/fdwqi5a/npMHWyTEAhg4KXrEpz0DycJcmLly2
	pfgOdUs0rX4+gLNvxzd3ZouPWtTTkAY4IiSuReJPyf03ln0eDprAjvTHMZb99k6m9stt6YQvNs2
	wvIOFN90BKvL7kM=
X-Google-Smtp-Source: AGHT+IFSasDqEOzfX51Cb+efM0QKQ3elXk+hBHYXZYdwzgdqIdkhz/Op8fasjqvlbzslKL+ssHNviA==
X-Received: by 2002:a5d:6d0c:0:b0:38a:6929:ff9e with SMTP id ffacd0b85a97d-38c51946af3mr15013169f8f.7.1738580305547;
        Mon, 03 Feb 2025 02:58:25 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:58:25 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:58 +0200
Subject: [PATCH v5 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-3-c865d0e56d6e@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFHEE1x6guj2+EFNZpgvNKSLMm0sxnSo8XDB
 ultsrbwiS6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRwAKCRAbX0TJAJUV
 VrQMD/9ZbpIZU+o65MtFjC7Lzb0Aw68FMO4/mI5BTwjbk/4A9V72TEg3Npiq8ArwZ1e9Fyb198d
 RlPUg5v1NRguCXwPgx5Im1wTWKo5ntOzsQC+nbzFuWO2alKkcnCBW2+n3Usud9raVxTj2NBpEF8
 b6LICKL7tcGZhhhYewU10Ta1pScIoYnrjGsoxl3IaK322mXuf8sQNGF486p60IVHeEfwY9h040/
 /f/I+wt3ADnPQtjxGwMjQxCqi+Fjk259rhIpwn5Dwid3++ZMX1mjk1DxyBU7i/6NKM/38oAyoS0
 /iubtZbC6+ssuxcFdu0TN2ideAZLCIB+bGzDdlyTqXvZAmrNfvnerEo4Dpom9Tg65ql71KMXMw0
 9xbPF1r2shnWKqNDR7ZCzSeTdJnn+ManTv/kZUwWxEW1dW6SUqXrrbuGhmkb1L3rgxPKQFyCqcG
 H1LLJdtpczf/yH8tmyWmlpAbBp9jE5sTdj601fsf2E71Q8twQmlEVM3MTjypO0bcdZy8f81lAa6
 fPR7nWGWLeOCNpJK/9rSxzxRIc/d8UVY7YVw/PQq0M6HiDHH4khXZvTz/7IkAzDfZmeuPD1NDPq
 RKPceFqsfbHAKpJVzM+S5SQZ5sw9tn+VtmquzckpoJuocNO0LK6mGnOZFpVCLQITKBVS65LEn/v
 za3N8+9CZVBz7Rg==
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


