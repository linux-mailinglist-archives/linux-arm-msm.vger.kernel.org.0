Return-Path: <linux-arm-msm+bounces-36567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC49B7DFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C27A4B21D54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E5C1A38F9;
	Thu, 31 Oct 2024 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezBBx4Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5C1A3029
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387593; cv=none; b=Yyav96iPqH3gpGXKsSxyTJXkLwb4iSsGCdEGMBiF+HFr9Ck8U9AXEaB2xgYED0bmfk1i6XkouCaTw2A8/DOSVNN55CrKRz7YtTPimcgnd4G4glReSEwQhylHLLH7CDAEAXMgZ0GhmD0k+rQdtNr5R1eB3ogI/TFJAwTo4bN/b5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387593; c=relaxed/simple;
	bh=XZ/ajUYHZWGgjHmhbqkl1JrHUAEV1/I5zI1XoBp5oT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXsICq3JZQYx/ISho4v7svEYE+NsM3BrJ/+PBGGEv5SccZiXwjziFUbZcxhkBkrSIVM+wISuT3R41WY5CcDqmePmKwMqyr01ohbPZeCVIs1pZDuEyFHsEYWj74nNE2/wV5elKPf11oXmsDxEBzNRfd6yvw6/e8fh0c6jhvyuIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezBBx4Pq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43158625112so8631465e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387589; x=1730992389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgFJhacbBEQJx5lq46wGlz8Xe+c5MAPrpBg+3+N4GWc=;
        b=ezBBx4PqKnURkSRUPlehIkNQi1hatnW19r0YsVrN2IVORZq/TIm0A4eNeNNowrb7c8
         lqGi24FeymAvBaIkLX8gbXfr7HU72ZeCYTifptzzKsJXY20mL8MDRGhMN8NMftnrOKut
         ylNocpQ9ygujg8x16857vJYwmcn3NPdv8Ow/e+P707+pU5WCsaHXFTQqPYj1ISpDZF3T
         bEy7CK8q9gtyUvqjPLV7XY4Dj3lzBQCmOXP4iIQNPRNJhws7rlzZUc7ohQEhQxA0yD1Q
         AfNM8qdqIdKbrweOYSXJa+GVh/F56QsNYYrCZYzY+tpg0VrsDwz+PF6BCJNHI6JH/Ks+
         mrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387589; x=1730992389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgFJhacbBEQJx5lq46wGlz8Xe+c5MAPrpBg+3+N4GWc=;
        b=dCkDw36LUPg2TpopmHW1ja1BzctMHtvzDgA6ZTZEUOUd+n+LCbETR+5izqd1rbf5cd
         jEeI0KxR7FVbsLFYpMjbRyi2e7/kQP67mDsuTY45YoFNB+cDoOiJ55Bwj/Ne06eSPK1z
         BS1YxWO7PgOBAelVXKdItzaNBECp73szEVVAFK56m+9lhvaaK9Md/dE0p4MtIe+bzvJS
         QOkMSKl9+X1Y0tWUDR04gEzRIfIEn4xwK3FBYkTPMDodBJk5sBuYZFWWxRR4sJLbP/Gw
         w8+kR28Klhggh8i48VvtR4HAQ2D1xxPxSLbdQUOFXnp4NqvSkSOPpi7Ie7QmDBYnKU/f
         Fx9w==
X-Forwarded-Encrypted: i=1; AJvYcCWio6iWafNYUp32M/rR0+C+5Zmc3XPFKNbNVGlSsfBvVP0aJg/N4VbNnFpcImcYkGNxVEuNavg21nd0F7yh@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8t7MIiLMfTusb1261OgnzUSXP+uKKHyGZDyXxcr9AqgOpM7L
	3dC84PlziDfEw4gT9mOzv4tdEd3CBpRnh9oANXjQuGmMCsi7paAvYTrGy8wBe+M=
X-Google-Smtp-Source: AGHT+IEWuuD16E+YY2y3hefq8MYjnQhho0CYv97H+0aT8wbovB9hG+bLIgKL5UbBFnTM0p9CfZq83Q==
X-Received: by 2002:a5d:59c7:0:b0:37d:4fb1:4fab with SMTP id ffacd0b85a97d-381c7ab739cmr297791f8f.57.1730387588983;
        Thu, 31 Oct 2024 08:13:08 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:13:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:45 +0200
Subject: [PATCH RFC 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XZ/ajUYHZWGgjHmhbqkl1JrHUAEV1/I5zI1XoBp5oT0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI553SM15YeJbcMDIXDi0Ccw8bC8HLQgGja2a9
 zapG9ymj3mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOedwAKCRAbX0TJAJUV
 VgxrD/9wtFx1ut1ApWOFw6oQSMKUOJZZ5yLIv7D9H64dDvMeq2yt63ez443XjVQpHqnGfHh82XJ
 zG4LWKWshUh/2NFkKOO9FdRvHwANmz/OUrBZsdmHWWS64GsjL1pgo8xhoOPrtiNFs7vmekDX8RN
 +610XpsGno1VZWuH5KE9lU+Obd0wsoo9LEQ/tDx7UgDD0rt7RomUoxHKvz8GeBWPBrFLhYBiy54
 ijLYRO13NAyPzpeRL7/79JoPD3fNWaEW2JXcQoa7HIltKcYdlvIJi+72zmLuwaXKIUAwKquH+xJ
 qKHrrqgCtt0bvHP/X3oquE6qLSEWin3LpoPjO//FL9PVHdgl064nweiJM72soEQxzszlM2REyUR
 8P3JtB6oQzddMfWFULERRtJ1w0uNba3MsYdtNSs6dmry55DbRqf/x1YEec0E1MvOicPPJQXdawd
 R7sffKgETc1ct02DiQ0lHjiyoW/BB/WPKY9jKMQgsPEl6w2Q70ycSHVf7iMNNUHyG9VCu+k3a5M
 h+F0qIKxaAu6wUnS6hzws9GrJKEktaVEhArNM/xIPW7EsonoSm81JO7CWBDmfnrFKCoes4/9767
 WUED81PmXTlMUlgnvYwhmdKTEmN7WjFWxV+yJhO6tLFqjgz+Fw4rk3JOQin+WsBTEN4TnEuJlT4
 eOdc/7bpLxb0srg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

Add a generic helper that allows switching between these modes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+
+	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1


