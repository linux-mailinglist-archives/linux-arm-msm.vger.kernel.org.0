Return-Path: <linux-arm-msm+bounces-11422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A1858780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 21:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9E9A2902B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 20:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A971E865;
	Fri, 16 Feb 2024 20:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY5bk0j7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208061D690
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708117016; cv=none; b=iN+DBEydGLlr44TMxmUDt/+zsaN1bNEjS8lASil3qgvIW3Ev0fyLWdE1eQqk+a4zk0+2zY2ojX9zXwjccBHOx65Ioe9s3t+lKJty5oLhT4Ig58VxwlmfOdw3oJq0TSYKGh4afHwu+fiyibiTvHbmMdRVQzPuXDZLNXEs/nCbo90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708117016; c=relaxed/simple;
	bh=0uUVsl0sxmiBy33XXwW3O4Nph7OjXL9LY6B28sJZodQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eXILna4f7mOuuQaHrHdMHdE1/el7SSHNIydD7k7MjhGOpBvzYzh0Nv+LANCgzsD8nZdNEhBhpCA43T7uCXFAf4whk3IdT8T/1XGyiT1POrtBvk+99c27Q/9CrbYiDb1cDA1X1XY/6lb02+6sD8wztLYNRvPT/bXhtJFAzCr47ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY5bk0j7; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d09cf00214so16008871fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 12:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708117012; x=1708721812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xYbkxmMMrwdBVoQTAnpcbDCTQJDagUmUMz2Jfts6Ho=;
        b=fY5bk0j7ZFOknb0HaoVeWjTLRm1bEpYofCGFLbbaJg//JU86wM6XImPr7xWCW1DvpN
         PjEW/6YuIV4yIXN/RSd+VWsQ0upqNm4ZUSPcPsmR7epTCwOB7OcM/UIave112FBla653
         u5rpSKJCStwKNbRSP6LhflKeB18Gaqlxri+eq76LW41w9P2v5b97HDT3Cvf1ft/qlrPO
         gIifDn9M2WkkXqk2XHDa8pNnn/kB5SHSOv+7KkoKcIPW7MfCCm1DBM0IiWFmFRLeq7NA
         semv9rM/B3tCbZlEjJoKxaUrDkUqBbs/dnfaCcPE0Cu6bHDRMR3lAh9YUEwhOSFUpNV1
         vIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708117012; x=1708721812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xYbkxmMMrwdBVoQTAnpcbDCTQJDagUmUMz2Jfts6Ho=;
        b=hEp3pPgTbA39mFxqsbcAuEs57imkdijcCNenEQgqbvShI+yoFor/LX0HugQ2uDYaKV
         h7/7idQXrM85GfUHzrbNuEg3ZBSXPns2mubVnKZCdx2RACmgY5YKxCp93zghEq/E26gf
         4O2Xdu2utUztzqbQzDRE4ffPo0UjgH5hSWTOb+DLXYdpkf5Ld011KiANvN+SCLdSh0sN
         ftA7F/iYq1ifNAcPdnqYq9rr6B5ny6iwNJOdUHrDyJh8xpMgwC//NuzIG0OuqQ1ItkZ0
         rKDsbMY638IUbzJDOoydQ+RY4k3OSjbe55Y+2/jOmm/Mbjy32ueIQAE/oG6Z5pzrX3gU
         hOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWjWQLhScZmVQeScIsc0AjgplGb5xrWZ3TkH4c6d/8CLvC14q+WR8g3Ta6jRdAnpXWk8Rl1BTLPkzhYocwMJ5vKUNUQR2xfzEGi39aqAQ==
X-Gm-Message-State: AOJu0YwB0/Lukrrv07e0QwasRpuIcR6dBnVwRiSXvfQSmCAx5A+H1SlW
	VgAg/oe4ZKg6Ob2Nz+OtvF95Oxo3wKGkICsgHNjCRiIkFVGL/xN+B4iq8CI5ZUc=
X-Google-Smtp-Source: AGHT+IGrTctNJyjUXCP1oMJ5jDQJgWyno/PfTuIM6XxobEQJpt0zug9PyFFoIx4M7PGCeGN1zI14Kw==
X-Received: by 2002:a05:651c:11c7:b0:2d2:1bf2:ec5a with SMTP id z7-20020a05651c11c700b002d21bf2ec5amr1563846ljo.35.1708117011926;
        Fri, 16 Feb 2024 12:56:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l13-20020a2e99cd000000b002d2236952b1sm73758ljj.121.2024.02.16.12.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:56:51 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/ci: skip suspend tests for both msm-sc7180 machines
Date: Fri, 16 Feb 2024 22:56:50 +0200
Message-Id: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
dropped the msm-sc7180-skips.txt file, which disabled suspend-to-RAM
tests. However testing shows that STR tests still can fail. Restore the
skiplist, applying it to both limozeen and kingoftown machines.

Fixes: ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt   | 2 ++
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt   | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
new file mode 100644
index 000000000000..327039f70252
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
new file mode 100644
index 000000000000..327039f70252
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -0,0 +1,2 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
-- 
2.39.2


