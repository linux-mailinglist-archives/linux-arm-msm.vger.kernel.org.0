Return-Path: <linux-arm-msm+bounces-44403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54714A05EB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A4311887C79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059031FDE09;
	Wed,  8 Jan 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKn+MkOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4261FC7F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346729; cv=none; b=rIO3s8EiSRb1KQnUIKqI2OSW/4UUJ0CPMx5PT4SiT1cKl+NFjDBy34HJH6ZXzj0w8YNdTpbuct7pgNhYMENVUpW0VAErC3di8xRjn4D2Ma9e3kGNy+yfUT/ekir8OrOjMcp09MjaRXbS77BRV0RaHATGZs+05ai5uwliDxVhhO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346729; c=relaxed/simple;
	bh=hQr/IAsgI391eMqAJ/TFfPR5pzoBg71o+SfYOehGuXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1+POgK/j1d7nEOXKvTdZz/WTyO4JK0lpd7KV/GmOHBExv1VKVOk9eHL6UvfFi/OU/3yRK1uDrprnOwOBxKNH4rwsItK1kbI147JeZ3fxQ/3yFIVvUiObL9NuYehxUKjrnu16aP67nnju9f6kcvxe3jIL/3riTyk6zrADloMMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKn+MkOw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e87b25f0so621084f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346725; x=1736951525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozxVqcvRkquGhB1kzrDi6yJPiO5kbxqyUPBtpe2sSKE=;
        b=MKn+MkOw5gTz9uOe1q/E+gTKuOOcqqAo/DHj9jWIJF5pfq2PNMYt5AEvjDsDaVH+Ui
         Z/6MhNsOaS47pzpqdaFFgJw8E1AQIQZ1ji6SoKXxnBw4PgLPz+nXZZx7gZY3kiNbeDek
         s/5rL2SmSxBYMT7V1NUPnRwE62nJoD7EMVTJFbIb9FPxDAyhRz2vNJLTZ+QrEKkcORSS
         g4VUeqP04pFjRkcQ5+ihVIjTr5igj+wPdr3ETaEiAgP9+ERWbJq/oRIShBH9ZYkIX9s9
         UYZoWRRitVmVJ2BKnR75LWZms2CkMDHfJIpb7wobn1n0jAzbUSe9e7cS24+5Hj+WC5JW
         YsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346725; x=1736951525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozxVqcvRkquGhB1kzrDi6yJPiO5kbxqyUPBtpe2sSKE=;
        b=V+9DMAcn/3K8ltK6nPuTzaV0KLkGo4BdRiUVHom1H5/si8KSjmcH+txgIMIq1DZmNi
         ao9ajpbGiCDEWizQrI2brkerq8LJeiBo1Wz0RTWXohlWi3cp2jdpfYubwpS4CkRL70y4
         ikWi7zUFGdsZoL/H1XZ2/V+AoGE3JwK5tqZDreLhon1p5U9aiy47j8XZy7EL70tiKAUH
         WaPJzkEBX9OQHfO6UdT/X1dOy5YMUmdIX3G3ASHRjo2SdLvxcmSr5JMKbKahza4LmtQt
         fhGdtZfZOSJrP/K34KaX24BFglP5S2nNQxfEaChQh9rxxihmW01vLugnjf9vY6/MKs1E
         +JBg==
X-Forwarded-Encrypted: i=1; AJvYcCWLX2nk3sZAWTIqxU4+4atOz4LmZKNIlXwzxNGU3Px5hf59R9ueDbrLzispaoBPf2cL4XH668EfXV1FtfK6@vger.kernel.org
X-Gm-Message-State: AOJu0YxWq9LN6diEeY64lnXBecgeCF/xwbOUd/f4QPcWRtlUT9DmthUI
	K95EOEeX7u3kV6zpWayVIKC3M6lOfVShPB1GsVvLfWvyRpRQF6K9Kf22rZGXBI8=
X-Gm-Gg: ASbGncuuFqEqv3e0GSMRuAGG3QyKOhavyl3N5sZd7G3B3ay89VcB5ywuV8JZbWfNKCp
	D0BBGg08Hg1fUN/t19Z+O/JBD0K2ujx3llmg38mXBeX12E+v2FWNqeGR1WW/OQMHEL61szr6Azj
	q1pC4SZxHP5w20wwJ4ZoDsgcmUhbqXnxUNtAtG0N6kxB+RhdzjsqUAIW6Q/PLZnvDLqp4UkTt4I
	uukeu6CYLqpERHzEJXj/SLJkZr7YUCF9+1sBKKAGUyK2Bf+waJpY4Yn
X-Google-Smtp-Source: AGHT+IE3dafdYBKlINfwAnwKDn5hfhG8IPyNYTDRcGz81zuaq/Vi6giz/D+3dnPZVSuuVV/IkiR6dw==
X-Received: by 2002:a5d:64af:0:b0:38a:49c1:8345 with SMTP id ffacd0b85a97d-38a7923b926mr6118668f8f.18.1736346725277;
        Wed, 08 Jan 2025 06:32:05 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:32:04 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:43 +0200
Subject: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
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
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=hQr/IAsgI391eMqAJ/TFfPR5pzoBg71o+SfYOehGuXo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxc1Tokb8M+VMMDW1j0rqVaD8jJ1LEA0bvc3
 9bB3X1npsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXAAKCRAbX0TJAJUV
 Vj8MD/9mF1N+AQ0FRE4H9Xg7TXqo3McbsRtCf7si0ZpOt7ze90eWbuEii7Dc/ThErOHA5jI9By+
 QuRcu9XJH9msZIDKlvFhl2zqTjxYFzu6JXTniUreJZQSgJLFoMKli88oYIDW9iiszIGP61Hri/h
 ri4s86DL8DLaoLtLn14nrgGwypGy0NAzCImgX46Iit6MqD12XFnK6gS4NqHVx5cpN8lTfHpweGt
 aViYrMxF7oxe4+zusH4OXtVyckGUnXxLyY6q55x1tDXRiZty17Nr4xnFpyNNQ7HH6oJcvh83ZHZ
 rO13MvjyDK+4st6XxUsansLCP54YUl3JB3OuHPAxjdvyUBGD74CkUP+2efjq4Xw5N4E1EHibsG8
 82Umkwl1EVBjhQyezcWALqxadrQrRcVxmaArM0hoEdM7rhkrCbSQkXluUeBFLgGNpBsRTkQcnXP
 dLk7dBL9XW955AxT1H1sapcj/b5tLvjwxUkWiq93CA9tJ82RPrMH6hS+qmekUlhqYP+6FoshiUb
 UznOay6J6WDxjyDIZwNeyS2Z8xPEOoHYoW1GRgaCetzJml8MxpK8kWfIXHj0ezVOr7GvErHlWLY
 gIo/tf9Vw9dVtrwKNWOlhnLpHfuxrb6+v62zFpkXRP8ra8KSudsu9ZY+ZMzSE8J5Gu/eC4Fh3RB
 U33EKNfD8tibPTA==
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
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
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
+ * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
+ *
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns 0 on success or a negative error code on failure.
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


