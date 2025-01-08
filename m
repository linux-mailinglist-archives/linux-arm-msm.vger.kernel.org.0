Return-Path: <linux-arm-msm+bounces-44406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38FA05EC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB343A74C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4A61FECBB;
	Wed,  8 Jan 2025 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQEskSqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81C1FDE2D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346734; cv=none; b=WH9rs+ewtoJQQmUQAEx1OJfqq4E4+356PKiwYTbzOwCAXZB9E8JbMd3A38c/s4N0VMkq2pjCAE/Oeg54ECtyE6RFrvo8tQ/GJkexBy5oxDp2YN3yGhmJ3FF5y/ndRHBADN8ItxX3G5tpxaIWc90PALoUwWEd+Okr7G+Mfk0BB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346734; c=relaxed/simple;
	bh=gGD3sgWWKsWmZCbwj23CZ+mFd/H5NaRSFUP35PwpXX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuSDjkYtaylObgwapFCUQWglEzp8jQiWUBCO5JMPDi2h61fvRepwotonXPSQjsxCBOzm+nlAPV+QSDzEyaUD9Y0zYoCOy0nGlB2IH8gVtrPUW3YJDVIYJZyD710F2Osxvd9ryJdgJjhzsW81uvwYQ9hOqgf6xma/h0pKByrvKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQEskSqI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso122076525e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346731; x=1736951531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jujrpOc62dfLDuJvGTA1l4Fb+UZ4JKp3nDe8a+P2YU=;
        b=cQEskSqIkCYogRispOvY+BP9WkjqcBLyxLWSedpo4eO7XgFVNghjYk9fIDaWOQbzkd
         Qtn6aB/2wr2h+YnAspentgUl7qNwBNHL/OFOdlpXKPkVjFPICz77GE6NH0L9Pgu196wg
         NjVTYp24XaCxhzVaD+1Y5K3jrxix8jgZ+vEjProv/su0XTVaBwn1y4WChY5Ta0QRQWVV
         /Xql1aIyo3FjCDkQpfqQfac01U+wY7mA2m6DMDuN7bgDdUYs0fKcE9fDRtKplYv0VLCQ
         5nh/lQW3acwYqasGsvbyVcKqSZWi/jNEcZWOZ+fps4KZRzzGN59xSCUCJaQypde1aV5t
         h0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346731; x=1736951531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jujrpOc62dfLDuJvGTA1l4Fb+UZ4JKp3nDe8a+P2YU=;
        b=QgFZd4+ymTh7MzMeO+NZflmybNj/VDcG32huHJI1BffBIw2y+0yP3mEL2KVtKzPA77
         whYvK/Abj/ODTbzl0b+0fgJ6i8bLw4ZdM/hwKr2uNUd2IFZq6xkXDT4AKWpUdup3sVNO
         RbRJyfodEdve5wwroPm7mIqxh37NQTPvTQzLTanwF17a0WNTsFVext/2tPT5nurOevzQ
         GaaClWVQuz4JNnbOowEG7s2J1HpJPEFC4sSFumY3Z/ck9F0cXar1LY+GZ3ftLkmt1QPm
         IPrcqt7EY3Euy2bBcN14zWP8/o8J8OE0xborZWBLjda3z0vVQZBY4+2PoYkUmSQBk2Ne
         bOvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRelVivPiSqN/vnIVtWzVq6smSfahMtADuWZkq6lQUUEKO3i0zQWeJ6+9KCw+7Rcut4mx2IgajUZTYSwEc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6J5hF01OLM5VxfOv2bnUmp6tqV2wjsKTUvMtcS7VYYr2poGxM
	eYmD/VHChiWmJfWSpR3Tg/0PG83DC8k7/9dSb+eVyy/o4GUwgBauEBNw+y+t6hY=
X-Gm-Gg: ASbGncumK/rbT9mhgoe36zZrzsTHFoS+Wv7SX54cXkAT2x+J1aS/9sNdiDg/uzmnGoo
	sA9HDvBEXxSRSNwbDHMyKbARRWYQUzudowSHQv+p14RaPKYs90YjqQ6rUGUiVdy/jG1SUG3RZ2l
	LnkZ9p6g/vB/lhkda8EafSKtdsrpUJ+xuE1lYc8vEY6Yr2L6vE1q1rFF1ekCwkTyDA7Zx9GKgUH
	yHRnCGHl4QyxI+zSWcQaDyl7nxhl4uw3ACDaKQEwh5fEy8RGJpQvNy4
X-Google-Smtp-Source: AGHT+IGaIDQlqPS504o1O/zyLX5qhdWguSocQGDnOn2wpB8opY97HAItR5eD/SovsojJHKkwgRdW4Q==
X-Received: by 2002:a05:600c:3ca2:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-436e26e5159mr21957015e9.25.1736346731434;
        Wed, 08 Jan 2025 06:32:11 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:32:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:46 +0200
Subject: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3405; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=gGD3sgWWKsWmZCbwj23CZ+mFd/H5NaRSFUP35PwpXX0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxgHIDfMJj0b2BEuxIl+LhVXL3lTbbVduy2B
 j5EgHydbryJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MYAAKCRAbX0TJAJUV
 VpwBD/9NB5RkB8wmNALPhbXeaU3+pvYY4I3FGE8tvFKBNxVnnnGHblZOMbHU6z2WS1s6WVZ3OsI
 ngNMet1tVi0j/SZLy1Wmu1rpEt67TAHUkEQlBQLhRjbNJWsj9lbAkQPR0jlwiDjzWADUqao+wW+
 b09Hrco7d99sYgCTOEikq3DM/MpQf6AWrh/K9KflicTrEQ5b/hg5CC0CN+hwmhj+WBZJKHtt496
 kjyHDSqWmz3a2TbkknzfAV/7nklR8Fm8ip6AZ6cukHbB+CUrXyZTC5MmOH8bSLq9Mg57mdDOOyH
 +Ps2ncVdMh9svTKquhUopu+ydUxMYWrPFcS1UqAAVMpwKBz/jr0F2M+b4VvUhkVZO7enCSE0Rh3
 qfFwchwovWHOXn53ezc0zFGCBQ8419BGTSXd/hw+uFb05HRHwLIPn/Vh0T0LR93LoVFvIZQFTbf
 FsFBUiOKPrsOz0FXc1ZvJscYM3ObR5X6RwgdOYnaFIdgUWV+6OiJ+j6viy56sBIWpVW9yXGu15d
 OAekrCv4810gA0mNxtqKwZhTT4WVCW0tKEuTKXVz3PQ9Bk6Lz13xIplXyVvEhBuFGWYv0YYrtHX
 TQPdQwbtl2PUstj2MygUJkbR4xUtGpBUzLq/ySJNXub3hbCVV61ykWSakKBQC3laYYedTZFDfvb
 HkAeeBmNm2sOaDQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	msm_dp_display_lttpr_init(dp);
+
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1


