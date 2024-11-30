Return-Path: <linux-arm-msm+bounces-39757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6ED9DF41C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 00:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D041615D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 23:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01CA1AC885;
	Sat, 30 Nov 2024 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5QLTz5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DCF1BD509
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733010950; cv=none; b=Cg+JtVmLv2NOPwwq36elFXacrJA+ItrIWccOod1rFsIwpEqtf0peiWp9JFyRhlhqD1mRN/s8VkO3FNGoYdBJjwPCCb9YuNBEMeiwIQi6+hxFWEiV07ajFthZZ3sc6DMZT+9at7Xctqt7bCO8pyIFBvZDXccIgm8CnZccd6/Ixoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733010950; c=relaxed/simple;
	bh=k/sdBeuIX6ZzNNN1qtwuMpr5v3fWj5pwQ/L03Dq+sDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1bVxY5Nzoh/Be9I6oYOuQAKOWARAAshQ5ojlggr+m6JGH+aEgGNM4qKHVD+A2uOIua7oCWlCwZICXqw2w6UxERHvkYV2IoFmSRsCJf6iEqTHZ6B26mnmSnjbafvm0K1G2ASEBBaVBWCMZ7baoNOj6cs6Q4UyjBqzj3EjOXpGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5QLTz5y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de92be287so4395897e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010947; x=1733615747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB5LaU5I1hAwk5eHmDH3lOZn5FvnrCwCeIdoknlGoqs=;
        b=t5QLTz5ykNqfySLj39B6WdczSsH+goBQixBV2IUgHiqwMaEVjfD5CoAma2Pr4KHCwg
         NagWWFIfdTrk8BzSkYj1+755D+KvXJ7+kabZhUXp5vmjPBPBNWdMUdBnqSmSEWquxx5L
         1LGDFh0clH8F29BZLB2yE/ieKbjSsV7ORNc7HCm52JbzFdJNu9uc7ZqLEfYEKVmrPCJD
         dxVujSANfo4N8yu6nZkqTf84JPWWmZA3Vq1eKJ3VCvGRKmgVDlCyEnu6a3MC1XKFSqnB
         EXspwoxtzoNEcuDynyW+0DsjFxCbubpwW+ySrk8ROJHXpsc/0n3U3B1+AG/taXtuYjzy
         6nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010947; x=1733615747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB5LaU5I1hAwk5eHmDH3lOZn5FvnrCwCeIdoknlGoqs=;
        b=u2UF7Wvm3OC/FcfMFex291FcyhphRe3972rUabJSI71HE4VmnX0lKgTL7WHyUk0c2o
         Qdn58aakflX/HnqBv6uO9dTO/IPRDix9uOi5BiassnaQljmvjCwTl6kQjx5gbH+sOJVZ
         Tg48iZHqRlOFCWGRULLlTMEzrnl+iAf4YCTy7cgZtVZJPXfTHv7H8hq1JYMwNTgtWERE
         1Sf6H4RRuLTtI6jDB9+9lQifuRAfQ8+OfDdHFAbMUNFX86Pe2DDDmItxws0TT3HfLI+l
         8tovxDt0OV61LxUsDnY0uof9lyzGWzuIfgBtiyfzJJv9N9OmLWzqujj0vZucstwNxsbW
         00hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmWbsXWpZDpI4h3mYPY5Nl0WaQe2fjsKZEW2UJmvJAiEy0AKBt/oXRpczT9t9y/Y8ct3Xgm1GmUx9zZ2Oc@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLEAbKBuPqfGRCp57GwGcCegxwSNDrlVy7VSuC3weIkO+j5Aa
	g23xDdvt7tcuzWZFofRjzj4CSjhrRTpyH67qdsoUyig7+B3qpyaFgDlHBVCYWFA=
X-Gm-Gg: ASbGnctoQWzRNsV3zZC0wkyYY/jWUXAbLGdZH38M9zYKyRGX+EkdePNEnDNBRieOqCW
	Iw5+vEv7kjHYq/u7u4QuxPDdRz+0Lo1cR3VGBa+HeH5Zc+ni2/oSx0bs9rAtumZjvUem71BeWHp
	xOOKBN8meidznbMa/me9uOzqmOQpY8MiPGvEbU8QeWpr4LgvXE0bTB/irSrnvVg+Q08AAJtaYwG
	jjMddh+5pZyOLngYYvjRMOJd5aLp1sCAub5bPsdVoZODmscu9wij80vog==
X-Google-Smtp-Source: AGHT+IEnSvktg0pFWgXq/l2+bx5WK3xZBCs4AgqZphc3ydAvUjOE+sdIjebGqlor4oQyehHElEBbzg==
X-Received: by 2002:a05:6512:3c99:b0:53d:effe:591a with SMTP id 2adb3069b0e04-53df00a91e3mr15018922e87.3.1733010947102;
        Sat, 30 Nov 2024 15:55:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:24 +0200
Subject: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=k/sdBeuIX6ZzNNN1qtwuMpr5v3fWj5pwQ/L03Dq+sDw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xu0rcXOn0b4oPtwTlM+q76z8lrV6nasm4mB
 qYwkSdVllSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1b8QB/9U7VqcSXJZcqnwzL14LI1Wm8fa0Vof9aggdEKIguYFSF6mBJxkKrcGEguEcmRWj1g76O4
 hIPh6905NyRZ68dga7ppIwiH6+nuI3at8WHRyunXXScVm9yF0PsQ8bUDpPggd+hf5CS2nij612U
 DTBvf4gwViH4u5cxRfe0AoiK1SATjJXbJnm/r609EbOJDGSVy+bbt4lHoU054mBGEovBV0eVHbj
 4VVam6isr2QpQJrTR4xtpKiiwUpVeFWoLxtsqui/lAqHwHNlRcqkZSMaeHh66xeCZH4wQ38Jo1O
 fdJOPzrGvySmqm3sGjUZSaZeFAPrET/XsBL1IOzrdkLgxrMq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index a599fc5d63c524474276f5db98b05c7c512f332a..61952a0c49861efcb5e7c0884fcb85c040daf9ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&dp_display->connector->eld_mutex);
 	memcpy(buf, dp_display->connector->eld,
 		min(sizeof(dp_display->connector->eld), len));
+	mutex_unlock(&dp_display->connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


