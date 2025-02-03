Return-Path: <linux-arm-msm+bounces-46726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C6A25792
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2012B3A833D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9D9202C2E;
	Mon,  3 Feb 2025 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haz9mpsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6B20126B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580305; cv=none; b=Zw5YzfIqu9kUXxIsWRCD8DYeW/pjV+/jvzh/li/LR2eSl2oF0bDjXHZDrBQK5uYOLuMut4NYwK3LEwwT49ExtzYUqThwnW/7GHgrK8uSQgvVLCoMvBCv78hlSd2XMCOOry+Rq3b71UU4MfwA94PzNBNpBsZfaHmysdZYFzKeuTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580305; c=relaxed/simple;
	bh=GWDPLjsD/LaP+fD+1LfYD/7l93rcVcvESuGQSIuupYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SuTLPNwiUbNsONTewhxrc1XyCj44dV55hLgoPqBLWpXGigpz3b4oHKWQlQKnhLR4U3CfBrCD4QONEFr6ekpmoB7RojDDvd6EfPO+3kqnTAEAWWu1cBUYy1Lw63C2nBnXIrskJvlFTVVQWcKpunoE1GfNLUJ0AKI+xkIanacNvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haz9mpsj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43624b2d453so48882825e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580301; x=1739185101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2PDrSggs/qvWJ0wmbl57SFwliqss9oSkkJg/zY+uKY=;
        b=haz9mpsjY6zn2KC+36gXFNwgVw7L2jQ5LfcKMxK1YM2kfOYdQM1mivK6vTsfxUSPZ5
         DHwYpDySNsj8VZYakSFK0FM0IsgZRGR1jMUy6CtH2dxgdr5IFSyNfViP0D0oU0L0SXHw
         krd5Rq1ndOPCh3UlK1BlexgWEK32mIfAsmLXdpqFV7+jIn8lvswwGJh3I1dVnK0lxzyI
         4K1Ofao2fbDXQr+B4RbhJ76mX8NmwF122663zl5A6t7nZB5kP1G4XcZGHbC4YIDOPjv/
         FSgMKvrG0FY1C+CKqitJsVRbfaDeETjnXv4dkeK/FYqa6+BPMrW9kcJwpKRLHniGDplV
         pm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580301; x=1739185101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2PDrSggs/qvWJ0wmbl57SFwliqss9oSkkJg/zY+uKY=;
        b=OQLuxAtOY54E4EE79dQ9U2SH6iU1cf9c716Ee8Jr2TURUfCxcDJ9RlCUS+LOZkwxf0
         dwOGGPgwA3xQbMXGC+OKw3kCkTBPBi/e5oda4wdOWY5txK1UYpenXvrfZ3OASw8WkeGZ
         hZvprp2U64mEZMxX8+dFd18Ljxyryw1vM6oaOjvZ6rkBP+FUVsyb5wYwCQJStScrJrK9
         GFgmLuO0G469o/yyAqeNIOMWhoMplcychCmaUbUHolE9hWpCJoLwkzyQBUHlcePsiHxn
         oHrf9cim2HyFLbhE6vrPhh/qVxHxLgMbd/jmmHP1KBsQBfhNu5P0oASXa8cT7a27IyA6
         45BA==
X-Forwarded-Encrypted: i=1; AJvYcCVjdw6bDO3NUaUo0g6SPcgfHP8VFw/XxTYrJW5CXwR4Jiyef2C58nqBoqlCVaCjW52v8tDTs4pDTQIOntli@vger.kernel.org
X-Gm-Message-State: AOJu0YyJq81NPbbOgJZxnltaubXiwxHJrPiQHrsso3yUCRmWLDZKDwC8
	Sz0rEDJDOqezn1/W3O96KMW3/cK6gD3RSQODufu8pN1uSI0sVBC2HVv/XtvMxFE=
X-Gm-Gg: ASbGncveouT7bXIRXbT0zR6g2rzNo48ssy7vfVZ/Iq2F6j2hnidJVmQgtKZVHWkLD9F
	5BMTPtv0It3p/KVVoHQQJ5q1fpTLsgYYbzyWaSqEnDspzE+CkFA/zEQSTPwKrUNGMEHsukpGKKn
	+4icticc1OVmWEr1QavpPJINfrbV4EAWVMe9Ov5qcekFbW5RWmO2iph5a3vGij8JmS/C7soKAZl
	iK+9zjtT7zTCMe9ok9lBb3zHErrk8JimqdR15I8csm/VGKy2pF54eqyJqoDmCX0RRT0PP5Jizt1
	U/RnWukSH4A7g6Q=
X-Google-Smtp-Source: AGHT+IGN36phU2HT7tCupyKJD12EwPvmQAUkoCX3ifHXulTtaxt/EYCFNMaPrYCZ0Vr2bnElK/dpDg==
X-Received: by 2002:a05:600c:4753:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-438dc435842mr215585115e9.31.1738580301516;
        Mon, 03 Feb 2025 02:58:21 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:58:21 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:56 +0200
Subject: [PATCH v5 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-1-c865d0e56d6e@linaro.org>
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
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4430; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=GWDPLjsD/LaP+fD+1LfYD/7l93rcVcvESuGQSIuupYA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFE89QOXDiWSJro65eII8Rv3UxY8Qc4UyUUI
 531ArtGoZaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRAAKCRAbX0TJAJUV
 VgtjD/43YCJn+kR3wQvW34kEv7ddETk/bpBbvc+gF6M7mOlHTfHynaAffq939L1AgY2sKs0Ehem
 W3Ql9tbPbR5GPSxwLs+TK6wRt6Gqia8dwDdS+GRPBl8JtMFEI3Hf1Rzs9akUdToFV5BFIaqm1a+
 zZgwAdSycOWeyoVwotoojTFVBH5l9iHVl7xJkcCIMYP+LRke8XLepAW23jcYrjpo0Af3uk2UxZv
 PNigdxWHhIMyubZI1QzE8RoaJFLVEvwiIymaaICaU51PXN4p+651Jgyz5v2Wd/zWAelnH89HFV3
 jhVfTpHgVEx/2ELpV2HjnWApWKO2y3UxalTfbG4z4twC6sR8bj4zoR3e6A4H+tp3ZM/IL++quo6
 toJJwamCFUy0XUFSQm7HY4z1jVrWNvtns4yBm6c+iAXAIIKtoDfgI/XWCrEo514Qyeoba45IovW
 VfyWGZpYEEIKw1TOCGMMdEqUCikLbg9UtID5UCtqGU4oQelo06HWIJCYrvH3cblppwNc5gRacyb
 v2MIbm8qQ4wPv8iltN0OK+XRbanbtcC9N5PbB5x+eX3pswEUz51It3L3cSRY1HGLKuB3w0vDchB
 Kt6XEsCoDVip8OJAOhfAc79z2yz0Xvjz1chZCqg/vNqm06bjUOuQWUYVQRlEh+hX7WVf/Grria5
 86nPpHdX0g3xNrQ==
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

Also add a generic wrapper for the helper that handles the explicit
disabling of non-transparent mode and its disable->enable sequence
mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
to move this handling out of the vendor specific driver implementation
into the generic framework.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..ea3ad0fe51c4ce13961f2918cd651ab2d23b4edd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,67 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode() - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret == 1) ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
+/**
+ * drm_dp_lttpr_init() - init LTTPR transparency mode according to DP standard
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
+{
+	int ret;
+
+	if (!lttpr_count)
+		return 0;
+
+	/*
+	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
+	 * non-transparent mode and the disable->enable non-transparent mode
+	 * sequence.
+	 */
+	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
+	if (ret)
+		return ret;
+
+	if (lttpr_count < 0)
+		return -ENODEV;
+
+	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
+		/*
+		 * Roll-back to transparent mode if setting non-transparent
+		 * mode has failed
+		 */
+		drm_dp_lttpr_set_transparent_mode(aux, true);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_init);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1


