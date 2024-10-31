Return-Path: <linux-arm-msm+bounces-36570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F709B7E05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B921F21462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D5A1BCA1B;
	Thu, 31 Oct 2024 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCH4f4Tq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBF1A76B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387607; cv=none; b=uYh+JNpqxGxStNuobO9OBSHspihczL5a4B0xftIOK5AWzYteZeRp2I2W7laGCyjIw/pQioP2Yk3SGksTgpkEz0IZmdvStxbajt3n+Vpqq5ipgNfgcAFcyRoz8PpcJGuYOUXzC8abJuLunf05opj1D2cVWQwUkGizqMmoJ0ZtoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387607; c=relaxed/simple;
	bh=qRn/jvW7tE4OUa9xySn5pIJn3QDJPl3Qlp7ZmkluObc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsOx8hlQ6f8H2O1n9xs/7HD7FkStZhh35RZbPYTlse2ORdQUSpk7K0mcnc86dF1ABh0s2HbQYpx1+F4kFb7zg2XPmpq9qO/d0WmulUH8buxX6u5NnQinPMd0qy4VFhjkOt+0URTi7RFvZDDjsgfvhyYLeJztNBu01QFy4JY4afk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCH4f4Tq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso675638f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387604; x=1730992404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsxO4tXj5cYVX5ty5sWr+rNFnN2giGJku8uLhfTXghk=;
        b=UCH4f4TqdH3n+wkkaFpUevJ5PRfizuZwIoGrFGr2i2Td35uEeXrHWCbvGk7MMhR72p
         qjZaIwRNPATwFm+QZQqWCnEUFgBNWffUPzW/q/kFz1rSKLSQkBitOCkYogbQ+hAIiJ2R
         Ms4XW/TPmGHenHz4gVOyFwXD5ugPU/FWf0BqS1UyAoXhRpAFqfw8m/WLgx7fmPreCxRy
         1W3yi+gkJGJhSbYG0YTZ3BrC3T2fBzmNk3vIwElAibQOpv1StxCQ2/WOs8f9TzWZlbV/
         bblxnIW0GeBdoAm7xrWJup+iXl6gVm8JJxRjEf23wCnj+LvD8LvCsm3uIGm+gxtyk2sf
         5yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387604; x=1730992404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsxO4tXj5cYVX5ty5sWr+rNFnN2giGJku8uLhfTXghk=;
        b=Ygd7D/Et2+7aFDsBDh4uWuqiC/4WgpvmI4QzkJpd11O83bIOY8HP0+CBOLEb963rpv
         xcWPaYeKTAfDMLqNp1YuBcUdCWXgKIOo03diq8xOSO6Wh5CAJYo6HNUkTXo9wxp2Ow0Z
         IGGf5rgU2YrEs+b0c13WVcYCfbocdRPGoIABEHndwpmjlHPOHTuDxJEkwHPjSB4L8eL4
         FzqYOnTV5BfFvjVY9NGlYK/aSsy6eexrUP+67HYqagbZv28hIolgR2UNt1oK0BZID3E0
         DBq8P1+dWZ9heHYPzA5EGFPhKVKQXeElpoSJcKhBpKxjgQGIwMmXYSbxpLCzNb3ELZbs
         aDzg==
X-Forwarded-Encrypted: i=1; AJvYcCWXaUYWRelTHMYhOIj+tk6JlNHSn3LB48UmPO0UDBA3vh9mNoyuy2rQqhLco9l24yU9OrDXsJj5a5x5ps1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBqPmo3/sdwK+g6+B6OD+OpQdhHYuCd2ALKfIZyUh+HWSXJwd
	JPpSzwq/bLuuA+IK8pYPnJfU0GdfPVzQQvUMSpP3WAN78SCQ56HFResxvorudzE=
X-Google-Smtp-Source: AGHT+IHmbLeS2jvvSq+XcHXIlfUKhKFp+lBKs4Bd0dZD1Q8Fgqy2HDTwkQq4YF13r1zeXwVZveQWXg==
X-Received: by 2002:a05:6000:1c9:b0:37d:49a1:40c7 with SMTP id ffacd0b85a97d-3806115a20bmr13878276f8f.28.1730387603921;
        Thu, 31 Oct 2024 08:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:13:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:48 +0200
Subject: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qRn/jvW7tE4OUa9xySn5pIJn3QDJPl3Qlp7ZmkluObc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI55+9EzZOthRgX0FpnvhwBMl9FxxsDYIWqjv0
 XvSV6RJHv6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOefgAKCRAbX0TJAJUV
 VvZiD/45XA56D5YG0qJfIzf5NOwxDGg+R9f/jAazsIdYIb1x2Ob3QzjrmDvDHw0D7VOXJTWaZgA
 H7xLZgZTKPp1JeDPSWDc5oUnbMyiNZG1S9oa+tQ5diDxc7xapCeGNtbgXBz6ZyiKsjXAMn6MHEG
 yLcXzNNFOnwlrGmnYFkzFXwEchDmltJQVGLZhCpG/xSHtuyh8bjnC2QnHJI/kr7kLhHGKdRC0l2
 Xhkfv8pPnbokGW7JEw+40SeY+hxNUJQQywuWy836FkEgcV/4+j9jf6GQX1wS9bTVt1xhjUXGXe2
 YDCcpLkNvnruvFIG/jvcwsta8HMoi7LvKSiF2T4vVdohzqqDaT1e3BQvQTAFYsLlSyr9rPgeBxH
 G8WEtmTrNcP8rv/398u7KypnUsTR2uYPcR/F/fWlsk8brk2a8/AEyORANS3dwMOFlNZ+GXh+TTX
 tLtrYw5fCaV/ufD0oPnv04vsqrnd3dfpi8Cyz1ReCskjlDQEp49RREZ4wAt8BMewluN69ZN2kD3
 vxUELo7KvPdPW3TZ1+zJDXE1cJnChx8AFdCmDDcY6kwbedKV2DTdZ37zuvSL6zgwlVdzEIVwZce
 g0r8aezKvu5Mtlnv1rtcFbtim552XAdvIGM13ljZklYgMVtzhTH79QiE3Vwraw99FTQRCteSUC/
 iER7CQXfL8ValJQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct dp_audio *audio;
@@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	return 0;
 }
 
+static void dp_display_lttpr_init(struct dp_display_private *dp)
+{
+	int lttpr_count;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
+
+	if (lttpr_count) {
+		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
+
+		if (lttpr_count > 0) {
+			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
+				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
+		}
+	}
+}
+
 static int dp_display_process_hpd_high(struct dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	if (!dp->dp_display.is_edp)
+		dp_display_lttpr_init(dp);
+
 	rc = dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1


