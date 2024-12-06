Return-Path: <linux-arm-msm+bounces-40748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4849E6AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07DC92844B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BE41FCFCF;
	Fri,  6 Dec 2024 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM2Y5oD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D04B1F4727
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478211; cv=none; b=JboNbb8xHRt2FB6hOJvQ4DKausk2js11EiycRjvXd3e28A02xwtccehazm6en2KdjNcoEEbnchmzP3+N0AeOGo72p2h7XZ1fDv4nFgsygSWJVJp1ooTNT6D9M7h3T+5SmFRK+flSp8WGJJjIATpCRj/by62mzEpjP6i3LK+h+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478211; c=relaxed/simple;
	bh=tgOWbzXmlfNkUNlgKabtbqj34BDfcm3kqO9iU9YutCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaSNk/YBamRwuGoZzSG1KMCuOnWQ6U2cSwYQ2dmX2rTs6hANpj3znu0xvLWckRe8WKTAuZS/EsfR4alz0pMFY9aLOA53igv/t9kT0vKAat4dSnWje9l2oT8Gx2foQ3c3IXENMT8EGaVrludHb1pusp6nfIsqX9LuxUCDMJijAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM2Y5oD8; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so16088841fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478206; x=1734083006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gezQjvgIcYxaejQ8BDd64CZD9/Ck9vNVcEKNgvbZ4wE=;
        b=eM2Y5oD8FlK36+aM0ekPBXwYUzbNAZIYfrmLPaHp/glmF8CzoJpXwoFppi+vP5Okjp
         gUd9Tf97pVGnc4sXScOZ7z0K5AwgCCkNvVqdgMuvO1XIM7wHshe0+rE3rzcftByEL1Vo
         YjQdhEdZCTlQZ0Tx37Bo6tUMyX9b0XXrQeN+oRmI1Ul30Mp30q2n/tqDvddwmkNPwvxO
         pBmduRGm9zlvk6XAq+q53TM/LD9FUyzhRc7lJUw7Ynu4SezM4ESU873GFXmEkl8nIuNF
         opA9EFK7Id4NJKG2/wA8GD+yMMq/zfM+myGOB6EZO8YNBVffT/dCpxcKivLIvqneqskW
         sPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478206; x=1734083006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gezQjvgIcYxaejQ8BDd64CZD9/Ck9vNVcEKNgvbZ4wE=;
        b=Z/s3g/zZpgXBD7NGRl+k06NV9FX/7s4sou3hbKUhuFKxpi39PYwmCw0SKnaBygeu+R
         BDogaVApKblr4REtGstFx8mK9h/5Xzb8MHQN1PiuRj3iv+C+p1LsGbMQWkmMUWfOmdGl
         zJJ43FX7H5mkIvG7SrHuMfuu26s9RTrFwjzZVREwbn3OWGv5Ogkcp83r3ilPqw22mToE
         fTrj6eZJMsd/vNaR9LLEniIUTD1J8XnbzFey8shtYtFvO3Yh1+ukdxRUkleIJRpboADj
         MZtlTs09Fe+WKkUI/gFyeU44NZ6DivRzCqEtdhoYt0o+5Dp/PAzy0OU+JC87blRxy4uJ
         M3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWJxvPf3bFMn44y2/Ufj2q2UZ7t6UlMfof4sCGUGbCWfy7XYnbsFr0VqkdM2bc2GH+ByIXq9oo1SH2xiFSH@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbawQA1Q+jY8WZwWLmgC2hy7b25AQesHUkSJIVxIacf4vcu8t
	OQb1p9YEQa9lNuQBP2Zmx5PV4LmDL4DiEooOAO6YC7TUqWFpV+iIHoV4TVXG7RA=
X-Gm-Gg: ASbGnctZz18pnXB1+0jTUpZH2g/8BJpZwjAzQ6c4KA9ZfVK3nr8x4oeXYlIbLh2quNw
	yuTteCjp1qLUu6hhQKVfoO/fM3UJDw4/daFhKKaeK4JJPgYCTLhZeOlLmFQRA0kZNK/k3M8WkV4
	hkzgF9WpBLP+lvDAmLXqbszEdhqqRkKs0UNyXOT2mrNoozU0qoBLWiqwPa0g8vSnGDXuBIkEvcJ
	09Sww5cocCP4nr0VfD1gP1RcIG5uWhIZfVZruwN8tboT7HLHT2pcRa8Bg==
X-Google-Smtp-Source: AGHT+IFIxMP3XivqZCXghDCnZTnDDHCeTBksUkUbx72OhyJC9NMw97gxwKXoTkYomD8vLYGmPlA77w==
X-Received: by 2002:a05:651c:150b:b0:2ff:c69c:db0f with SMTP id 38308e7fff4ca-3002fd14d81mr7610671fa.34.1733478206004;
        Fri, 06 Dec 2024 01:43:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:09 +0200
Subject: [PATCH v2 06/10] drm/i915/audio: use eld_mutex to protect access
 to connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-6-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tgOWbzXmlfNkUNlgKabtbqj34BDfcm3kqO9iU9YutCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuyv5W8v1YTELbuHmMKcJNbiEngJDs2MHEM
 hFooEYTmIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1axkB/99cecYxR+X5C1zAyfkKFkvE75Us55r2gVNp2BPRSD08mYQThqr5+QEsx38SPihPleo366
 eaLD1hT6L2kyK6wdMq+Lkkj0kbXEPPTe9pj1Aad/UleIfoTG7Ps/uhFSFLdKRs0DnQaSZQME+VQ
 M2v8AFXHFAYJgM+8WPJgC0HTtuPSWfqBz+0JZQvtJgjoKRndMOmhlxr4vbN5xbJVZBgEPSDBujk
 kmWs3fgGh1o3Yx1/EyUv6Zz4X6sBrwrTlNvZNOSrOmgizBJLo+cBQyXqidSxYnZIp1DqJdxMFo4
 Qq7ORf/cwV/dZd0e+mmP5jB0ifPb0a3lavlzcLRDNPRaca3O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 32aa9ec1a204d2ecde46cad36598aa768a3af671..3902ab8431139c3ff4dc17b841d94b6d3241dec3 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -699,10 +699,12 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
+	mutex_lock(&connector->eld_mutex);
 	if (!connector->eld[0]) {
 		drm_dbg_kms(&i915->drm,
 			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
+		mutex_unlock(&connector->eld_mutex);
 		return false;
 	}
 
@@ -710,6 +712,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+	mutex_unlock(&connector->eld_mutex);
 
 	return true;
 }

-- 
2.39.5


