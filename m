Return-Path: <linux-arm-msm+bounces-39754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B99DF412
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469DB2814C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346651B6CE5;
	Sat, 30 Nov 2024 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0bRe/dc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B017333A
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010943; cv=none; b=i9N8Fjhweh4t1Vc+UM4yYYpoO5ryaePImfLePrbLhmnviUgROn4K1xk7zHnA9nDjSqOqMIhWrUiu30hJNZ9Q6BBYPw6D4Wto2uGsspkYwpzmlHcYHa9NGHBdlSkKikyadV3P4+4YvBYHGMFGgxQD8rPe/eTzkpblKHK46nyWHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010943; c=relaxed/simple;
	bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIftr4b3TyfEJ/DbZeG5Hgmn+pS41Qe3p48PEWZfsvkEyxxx1H/POsh2TKuE5jTGg60F4YPDhy7R2AI9HGqms8iEi5Rxh7Dvg3umVOso8HwKXnR134XeBu35AB9sWdpC3rY7Xs2X0OwSY6a97ehnkcSqfauuFKUCGucIrJLyNtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0bRe/dc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso3038043e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010939; x=1733615739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=w0bRe/dckUa15PVW4A7JFk3k1MLklX7jJLUIQMNaoXajh885W6XYIyt3JX/qqAWASk
         ljaUFcXL72U0NI6n+sRUb/Vw9SjQap2wDR5nZqQfhqtuQoVPqIvh7GDi1crEp+wNPwCx
         zFQNAangiaWo6SOs1M7B9CAZW3tIzsp9V/jOv0D+KT8qttvIn+acP12i3t+ftbOWgPpY
         I6xG6egcrW0OvTGbck+7xMxuuhdT5JSpQhyVXH56AYa5UHgD86Xvc0MgH7M55IuLp2Mu
         71WlQpt1CfypEEJToE6T0nuBl6uEa6ECkA8lgkqgLt9w7yYBlqa7CAa+dRyjJWNuEce6
         aBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010939; x=1733615739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
        b=M3WdHKjNnDtC+6VcWHpE/+flCArk2mpVmc0rvxMAFeDw4oNzHNpiCE2VQuYu4fUF8J
         ZAnj7B8E79NWIqXxnx0ekq7zdObRWzIMlczjR6fQwUGZD/IEguxpy/sL02uaOCFEGZjX
         wNC+hVQ8MAo1/MXHFtT4nPwu14hlwIR4XZls6XzGCetmq5+/OrLWU/tZJrRz+/f9dlJd
         90/63pmZmtQ/HJXig2FHYTOSCvY5Hs7D0bziweGDX++gtG1DILW1TuxgVI4YzGxGJFbs
         RXvnJt7vo9JD/0garppmz/YHjW0682mVjPiPnVCX0aPadNTwYZ7lFs12fZIopp7XgZ48
         7irQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkZn5Ubg9RlRw7zvx0DTDsJk+bMM3RzA2W4JRJ2EJzqYKAtCycrPCA4sNxPBjc1o+ODQcTzK41eZi+/h9D@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVCEbDd7jmkICwuCN+EqVSK1KR1bDRAUgKquR4T/W/tFRXD//
	NaDkbGgJVAxrRKiwdwLg6QO6SbbSXliDWmNlTv3xF+53/M2gI7/wN6qDfl+RJVo=
X-Gm-Gg: ASbGncva09mD/+qSUOKSljKelYvgbUj2h+qPnL7bI7C1Ood1HGAfyvDHiyoGJfFTTm3
	UWoX8O3OamntoPCVS73yElEnSzWp1ArxIihLUrPPOiJBHWbBqB8RaJ82IoqXopW6GdqxAzaqUsk
	KKSq9vCUcQ8bbVvvki9XoOUYfj6soDbSW7H4xNqvr25+U02EQgFXngHzNanEcQsJdSKK+6Ynoqr
	iLv2lopJwxwt27mBV8kC+recQCLgR7/hNdh4D5KNimwYMam8RWI/7ci+g==
X-Google-Smtp-Source: AGHT+IEqhH9kCuwXPt69aMI3EvWDASBu5c9Vx1nORTc0e8euAsFhVw9NvHYYoIvx2navJeV6UfeSbQ==
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53df00ff7c6mr10203616e87.35.1733010939471;
        Sat, 30 Nov 2024 15:55:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:21 +0200
Subject: [PATCH 04/10] drm/amd/display: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-4-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtKnM5W7YbjO8PfgAgXIKJMU347EHoG7pN6
 bC7slgMtUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1UpAB/98T+k5U79sPWHDEfdVoK/uxOqdWekFRUGXmaXz8lVAUaoc1w3Ob2vgVsHEmXEpRZcEqWq
 bqDqWhVxSkMp+nC/KP4LYMkzeAhQdwu6z7o3M+cI/LhyEPck5mRwoKlsIKia5ENA0q+YRaJX8R8
 D/MbaqjEkVX7h5ODRsXt0b8del0LoST99BcdJPq6yynl2AInKf1mwGTeXOm09nkJ7B6JX9D3N0r
 XnUieG4H8ZtcZAOSBh2bHBQePXm7XUKBlvFoHDklRqI/YU7jyKDWow4es6KEqLKgoa9z5zUayj2
 4MDN8Hi3OJ8XFsnfXmBTUuMae75l5OufjL1fj5yqKjhqazvg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0bcc62f280f8e80f5d174cd2f567a8ec616e54f..2843283375551b0b85f5f897acdb2aeab652892c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
 			continue;
 
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 
 		break;
 	}

-- 
2.39.5


