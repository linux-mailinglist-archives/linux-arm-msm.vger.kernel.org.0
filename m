Return-Path: <linux-arm-msm+bounces-10972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9708854420
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 09:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51441B224A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 08:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B9A613C;
	Wed, 14 Feb 2024 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GG0wKB7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B09524F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899833; cv=none; b=QBpFAQXCwECXu5qChyam3N/DP70ATNvkVXc4GgVeUjybppJ5zN2xh0Yj4hF8gRwyuKsOV17Nx9oda8jU6Fkt9uZNFBSL109JqYORWn7pOa+ZAsBrxnDYh1EJTBcVJUa5od6wMMqRPD59wLVmy/g30xMfcZxqaxpKd6GrsJcMEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899833; c=relaxed/simple;
	bh=3uwlqKW5D+J+hmJy9OJ91X209LrojQJaG0U2NWAPUCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MUiabXo0UXJAVm9Yhf2hPSfYRYnPDbLoBKfPbmNidfYoHW8aZ4UvpvlIaE6W34d3j8VvszdLeQDllqcHOkgz9vTiOWyUxGdogZkK1ppvK8KCDu82N5F0BeJLgyj3L1loamgvfpup4VOGp10wGzJUjhypUf98qD8b413KMxEMptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GG0wKB7X; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so20647751fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707899829; x=1708504629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNyVYl5PFuqcAOEEMT/+9lJuDqPpS3TsSRcu66K/yHg=;
        b=GG0wKB7XoY5CeH4yIu0N9OWIN+sKzuWJbp2wzDdnVL3lbU/MpAlUjzVccDzIL5kpn9
         9kTtwBKHXfePdUrbZ2mm7TmIhydXll2KsRtFjL85Zy0BHLf7SG6agFy+xiIJttDu9Svz
         IOcvBRtlyOUwcSXFOlv7ct32v+nnHbfnNbEL9yoKpOsA2J3WvYQkX5XWDMbYYVTrqhBd
         EXi3D06ayh3zvQR/8R5OXjjLZVMLTxu10fg8gq3k4bYUxym0KT74Oc/sA+iY2hRS13uL
         WNuBG+jUWQ+fcstBRwLtj6nxPxHKtIlhjjJCV8NlYvGbS19r/u1AwKqIyFx+//mNvu9g
         Op6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707899829; x=1708504629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNyVYl5PFuqcAOEEMT/+9lJuDqPpS3TsSRcu66K/yHg=;
        b=RQGybQyuzcWRJ+UEZ9OhQIs8kEeCcJ3rHNi/w9Y45v2b1D0Ftc2txXVK/zLXjG/hpx
         WZh6vlRGS8HgFaPFo3WCA7670zWy9ges/o73bGaHF0JLesNxbhw6JKu1uhUsLHluzlx/
         ICBpLSiA53EVlHpRL0jpRhNTYuIIXhpw5kPJDMljc+VBtxSVvaoyxyP0y64KC8KzlxOf
         eW0+Oi49g1ZsyLSkHKbYaM9lgfjOTPzycZSdULQvezs7OBPXtT12ChQn4sPp4quI5Sed
         MNkjVQeMZ2kpzYWww2S8yXkLP01p1RTMiVRC19Eo6JcTPZ1l1LUvtOAp52xUSNJzFHw/
         Zctw==
X-Forwarded-Encrypted: i=1; AJvYcCXl4Z2H3v/cCSyg7IXp7erSgf/w/wUpfaXEcom93KV3L2PanqjYBx6q3Z2zfkDkD1tEUIrRMkKO2xMexf1djcsRttUnhtuKAb4L8viQ9w==
X-Gm-Message-State: AOJu0Yy52lnhG6Us9wq9WCp+DEy6c+e9r3SDBeNixLzJsyA0ocwjsWlg
	V5i9v0PnBWQSacjgXBTq7gGmPQrWmvjxklhp/CEWvgJHbGFSjoqLrYg300VLv6o=
X-Google-Smtp-Source: AGHT+IESjS4v4O4IHu7zLNFREuyQ+kQhHPlDn4XXTnrj7CrGdmKCVUDHMgznemDujddsMvwh+7i69Q==
X-Received: by 2002:a2e:9dd3:0:b0:2d0:cd24:24c3 with SMTP id x19-20020a2e9dd3000000b002d0cd2424c3mr1418345ljj.53.1707899829397;
        Wed, 14 Feb 2024 00:37:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg78QslHrsDT2+naoGhAfKLkRKLC8r6TiToOHCSZbeIj3fyJZGhzBaUo2CP8B3/PXwrBX65FVyCY2US5pEt6U8YBE+H+YR1bTIoixxD7yAtkFC1WuSfTIYXLDRrfL0+mJBkhGApnL4xMRhiWZEcTGCU4vrNTfZyEyhdFiwdq4CF0FVTQRddcemlmCOUnSeGKEeDr1yP2uoQvxKNP9O0LbNHHCgo74wZ3WS2Bw2mvRgJe7A90+LcYvbVxIswlP6jXR9rLTsJLmeNsdCWGGatlS73uNaTBBtyuNT+Nk1Egzf4M1/hTrR4IMEAEd0u0q4uYmRuJlAYPt7iutspQ4cje82GwRaYWrH1VQ2osqrs9FQ8u2351oj8zpqKmJDC9mLtPZiSL8yRa8=
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z28-20020a05651c023c00b002d0c14e4f94sm793294ljn.74.2024.02.14.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:37:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] drm: ci: use clk_ignore_unused for apq8016
Date: Wed, 14 Feb 2024 10:37:08 +0200
Message-Id: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
built-in, the clk_disable_unused congests with the runtime PM handling
of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
fail without completing any jobs ([1]). Drop the BM_CMDLINE which
duplicate the command line from the .baremetal-igt-arm64 clause and
enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
work.

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475

Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v2:
- Added a comment, describing the issue and a way to reproduce it
  (Javier)

---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 7ffb620d7398..e64205286a27 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -119,7 +119,10 @@ msm:apq8016:
     DRIVER_NAME: msm
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    # disabling unused clocks congests with the MDSS runtime PM trying to
+    # disable those clocks and causes boot to fail.
+    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
+    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-- 
2.39.2


