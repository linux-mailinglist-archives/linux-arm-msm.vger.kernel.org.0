Return-Path: <linux-arm-msm+bounces-39756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764F9DF419
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB4AD2814FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5437F1BD020;
	Sat, 30 Nov 2024 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTooo6kD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF51BC086
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010948; cv=none; b=JvRyobJGqZSgLmgrAIWbYuAT3CZdh2DD4IF2rXlYXDP1shE2eAk2jIZeFg+DQgB62mn11DRXSkU1zDaIE0My2KnI09X2Mb3qY1728WRwEZGGbMP+lZMSdzm7A6jwYRKBHA5OBdrFuqNuWGEql4kNk8g5gMApe+B7j6RqHpYR3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010948; c=relaxed/simple;
	bh=ocQZIy+T4sFAsnN5vtnQkv7E1kptjCde/MaB/nCVvag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfgKwCU1IIChvPMHJwmmLmrMtaHq/9OwLM6pd01F0FO7BLD9zrcqDYbfK14GDBgnGqDToYDkqPZtu3P8OElqbzU3MzSIH3LE4ntrF5nRUuov+bUQBiZSVxWzW8s6DX3GNFISxyYYX1eAq0+1U+hajOZbYaVRTjpltHVQfkHSV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTooo6kD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dde5262fdso3328364e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010944; x=1733615744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36yDOxib/1gmocQMgVorj80a3sqs2EFrrs6+X9Hy7i4=;
        b=jTooo6kDi3h2OVOntfmk5sKmi9NPBNBzdkhGsOKRjXmfWdDXY/z3s2eIKQrrVWyKWh
         F+4W3zdzVGw/qm/8cRSLz1SDDs8uoiMo9gemq7McO7VEwnmGrU8kEQxEqu0TP2pUn3kg
         UOaE7lL4G6GNVuLATucVa6llweRfkVKMLtOhV3uGLGyqrCHMhB8Zwey0nNrxXYsOSdAP
         rqaXQ56OBa/6Me2WpnGvGavPbR+eUG3/vNZz35izFUIdh71FfTe3ZAvO8Je3zumHG8Nm
         0s8/GPXk17/0C1UeQccp4zt0TJbwWp3IIalK6ndMco9kDIMUqVRYe8g1BtatoqcUVhdx
         HSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010944; x=1733615744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36yDOxib/1gmocQMgVorj80a3sqs2EFrrs6+X9Hy7i4=;
        b=t+2g7gfM6ltPPW6gRZF/OLaebOVXB+dpej96XjfK0FrqlZS1MMLqoYiJnU1SWRHQNb
         PplAOTG5rRbBmNN6IT5wM0nHaKQefcH8LiqEmM8GumbFC7WGzKoU6ARkbjLUD3Pcq5p6
         LWFrVvJp/VPq7niAa2vyvDraNhUqjpNlCLmtHsJdOUWQQVROH2EA5YQPGLUpMrOr3bF9
         Ab6tDd+rd/P2kgVpx/7kx1ZCIPDpV/yNFGT8aSShOA80MOjKUL97mcV/cGOh08Ny1IIh
         F5W8zH3/tZfp21z6Z+1i2uPQToNn0bSBIUeBXfYgGjeGQLbvmq5PHINWWtu+/dkgjWz6
         DtdA==
X-Forwarded-Encrypted: i=1; AJvYcCUq1a+K2xBkD7Mt9MaJyztevaoROvJmfuPeSXdfNIIRFLvYE2kv9cX/gyXGRIxZXQkSA9xdZDmnDeiYEbLq@vger.kernel.org
X-Gm-Message-State: AOJu0YzECsFdPIw95OkqJb+88OQmYWxV5rg01/W+HqgunasSCpLwxG9f
	ayrt7jpOIuzoCf7AMDiQe4ZS5Xx5RXdkuLnhO+UdvK12+togurnE20gWmispbeE=
X-Gm-Gg: ASbGncv5unmNXyD1x+XaKlmZtbz62nb5ZbneOutGLt368DXutLqVQXugnlDyYS8WCPF
	D5NS3j/EecIqUI3Es0RU7Qum2LVTaaStKg58nEP6yPzDLUu4EVB+eBaHaGiBrFoSNnB5ZC0aO0+
	9Uft/7AgTdHE+1FcdjOxS4PUH/SWJ0BfDXbTd8d7SxbPkSHSv2UXVPB9WuVRxCdhhsFLdgTlTpN
	A9N+7k6ObMxpA//68G5ihqSgAxPiV0PUSKO96QmZa6k57ug2WoHeL731Q==
X-Google-Smtp-Source: AGHT+IH1Dd+tGUe6sC5VDohyZs6YM5bJlrw02OG47IUbMBnDEhuVmgxIpQdpIhppnPqJWxsmsvhkAA==
X-Received: by 2002:a05:6512:3c9c:b0:53d:e544:3fda with SMTP id 2adb3069b0e04-53df0114865mr10496986e87.55.1733010944592;
        Sat, 30 Nov 2024 15:55:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:23 +0200
Subject: [PATCH 06/10] drm/i915/audio: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
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
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ocQZIy+T4sFAsnN5vtnQkv7E1kptjCde/MaB/nCVvag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xtmjf6X7lDNnSYnbN8EtG+XlG2iAcozEYaN
 vKRL0ru9MOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1YA7B/4nI6CxdNCnT52tQHBg9M36pI1GVe1vqRtK5C3wJVqMCVhoJSG54VKPili2oAyP9q7Y5SM
 wfFkEzkHUs2iCBzvmcSxgtU8l7GXrHr4G37JlP3I6B3mtLZs7nUZ9Uh0WxA3RWI3Mvs0QxgkdOt
 d+fckwL/7V2GpA+I74A7OYQiz5GdF3miJBFmjtYL0TbdSjNBXXtzdj187qJpxJ5kogVYysHQ+Jx
 JRXPmwqhg8MNbZs+6GsTbv/A+sTxNTCEgU7RZ077JdqBKJNYgCqGX3SbCj59ZG+wd6EGcLw7COJ
 TaQwbVrLdRTZHn6/hP9VyBUkVHX5G7ONl7SU4lh2FjAe8VoW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

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


