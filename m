Return-Path: <linux-arm-msm+bounces-41481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 722139ECCD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99EFA284C83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A892336B2;
	Wed, 11 Dec 2024 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOXl2GZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E411C548E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922280; cv=none; b=X/K5qgEjAeZfRcxy7VVvnlBD0OUrMqbD3odR97+ckFoGsPrFskDo8F0JBfM1N50FZbYtMeBk1PsgJN317isyWZXQ9njPgPHpjY10dNn7fXsVh9iqHvyNuOF7cy1YJixM1P9dsa1XnMtGYRdLoJsLlfLLMHeeXq9PICdaVxFbxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922280; c=relaxed/simple;
	bh=yJyF2pRWoU6DoNOFceA6M5EvvSsiRr5WvZMjlqLU/hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y075mEVP0V3EU8pHUqEpHVagibZ+k4vL97u7RWRZ/smJZ5XsPqTgKaFfpSoZhspQi6iAw3WeIId+oFbr7uB9fm3RQAeekVEKud4FznUv1eijNPYuzrbaXoqe2xzwubY2M5GUTvmC6fRUIWLC6DLIke0gA8RcxQH0oPg4rmXRtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOXl2GZb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso7315555e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922277; x=1734527077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28bZGkoWiLyO5A4XpJ79KUw0LbLMW2C62tX+fuihWns=;
        b=dOXl2GZb/ObuhnlEiggOyuN1VB5s4qtO9JYrEijmZ0D6//4wIshBuk8YqnR3tPTEJi
         2p+dJPGMw4ZHuSrmFrtEHqE3je3AFt+FJF/tJqxlRElRwjn/DaIRKR10vRMN2HjFuRLW
         4YFZncEWoS0WfqnRwGiUK1B/Xn5JDq+GGmH44UjEbMXUyP9qmXmeA+ppfEAOGTypjW9F
         JBHeeN3fPG3nF8XDBcw7WIIXzOsOgJc+mZTLRW0Qf9YJY25jdQlKbT1tHWR9U7M7x5XP
         11HWJpQ3SMWV4rBKZ38BZXfeBXIQ6c1c5JA3hwoPjqJ9m1xKQr9SIGOWAht/HykETYhK
         XVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922277; x=1734527077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28bZGkoWiLyO5A4XpJ79KUw0LbLMW2C62tX+fuihWns=;
        b=DxFmlFu0acmnDymxlm2z2hJEa6of50EA92XB4TVYw+hXViU1n3nV+BFC2itc5vJBmC
         P+Z2DbeDyAC4Vnm6be1UbObeX29gWG36Qme1S8zZQqk0cNYCCHjHvZGNUopLlsd7d0L9
         ZBdBF6P9bB+Dm/z0NEr+kx4//IB0D+HWG/9ju5qtU7+LsGtyIQOy5E3reJ9jngpUneMk
         EuaQpalYL+c1syOhB2vk5uZ8v+ashRNCVbhhXkSr+PprHnU5IOydf4TyFIx7VAqGsoK6
         97V5ViW3V8RMZY/d4lVtB6mCApvET0gKEDWJPhQIATC0GzKMMetb3TPBHY6SoLKprC2U
         Neag==
X-Forwarded-Encrypted: i=1; AJvYcCX5V8i3P6tf17EWnikJGefi0dEYcMr/eJJLUbQEd76VtytONRpGtExzvSPKheEth0ErGnPNt3xE5x+tb4IA@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDWjzLzxrhlVIFxxPDXGB8qIb9AIBiHKNymlpn0LQ8K48FxqR
	NtgghUdaZYtaGaaiF10DnREZyFEH5WOf5Hm7jNytgF2lVSy5y39kd/ZvC9Hozlg=
X-Gm-Gg: ASbGncveUOV0M09VxHQU2SHijoJK+qxxZA5YzGNsCdvwBKdqX7b1ijHDZZiq467qb2b
	Xms5ufgQflWwdC0YMTWZbR+UjCV5P5RYA64Dr3fPBdkexIPD4UYXD1bFS5uK5vyEKVxFUQN2pMu
	juSKkRVi8CJuEEdQzxVQ2dZ8+ERiWxfdE8P6t04zn2Jvac8njb4JT6m9eiXHC/g88wXmZqsbxvJ
	tMcFLCwBuAbjNV0fpEEt9XPC2IhAWVL7xc7HAo1Qmri85P7iWxBLw==
X-Google-Smtp-Source: AGHT+IFZXSfLm1b/QrF6/gmf0rL4rQkDB8lDObG2xoYYrC2PbfvXR4plcwl4l0GsTbAHftPRAcd2vQ==
X-Received: by 2002:a05:600c:3b9b:b0:434:fa61:fdfb with SMTP id 5b1f17b1804b1-4361c3c6dd9mr21544895e9.18.1733922276963;
        Wed, 11 Dec 2024 05:04:36 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:04:36 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:15 +0200
Subject: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3196; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=yJyF2pRWoU6DoNOFceA6M5EvvSsiRr5WvZMjlqLU/hw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3ZmjK9nP2mI5vRrJF2OoY0F6I9GZVuOIkuE
 U9JJNJfAXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN2QAKCRAbX0TJAJUV
 VqA/EAC5MeQnOtUM3E6JKASMby2RnxPkjX1cJM9tj9E1A01ZNC8qGF4pIjpJImpXaSxPWi2XB1O
 10dxLgkhDegiDtFYJ2Z1U/fL+hi2prXQccQUrALOPl9VBvg/lqLGigcJNcj51MikceOQOifC9la
 Cpwn9N4Qss+kTr1IlOz0KjGeIqZpGT4+EoA8Ti2Ity8TVRneorf7FXdbwmeawO1SXX15W32DI/e
 C4+4xVdQmeE3Aq/rZXCxHnHNhqv2K2EYqwebsVbhbjAEg2yIRK8BD++k8a9cnROEZ2HTd80wCok
 QWUbs1jiNHeznKyDQKUe3nb4hAXGisDXjL467VuiimNUnZ3ZEvhzmwYJGxA30qmrvf75NPeEW6m
 gUKlIQHk/YmyYiT6a8Rw9Ja5DQjvRKdjE1vyr0dzZqhIW5969Qo+fvSZySqymcTrv0HX/Gy+Frs
 x7KogH+1zd8Q5ubpPrTpvv/2Ntxetgey1kr9o+WhfBvDz8lEenqhy4voXOTrDmZlwQBbUkApbRD
 e5u52Wm0mfFYYv/klst3rYRyHusbQ/a8A7uuLRoGnHU5yjlwOiBXNgpVw20k5AXuSzcdyyZqfoD
 g8iFwlwnWlptrdtgsQ21zXF7Mj65ksD9pukcnrM+e3e7uJe/bHgFFkY8yQ5YjJ/FvJiVzQEkNWc
 g9ko+QTKP4o5Khw==
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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..a8d5563538bbcd83cf88a159dc86080e2c897fe1 100644
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
+	int lttpr_count;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
+
+	drm_dp_lttpr_init(dp->aux, lttpr_count);
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


