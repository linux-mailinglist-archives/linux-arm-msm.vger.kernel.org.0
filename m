Return-Path: <linux-arm-msm+bounces-10942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E330853B53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 20:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 606CE1C26BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE1C60EC3;
	Tue, 13 Feb 2024 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jttI5dGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0860BB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707853176; cv=none; b=pwvMsRzsJjMSOxZsMXzzxA8WGl5K4jnNF7xTUgztVhJ1WKX9L0SPSNk3KGPCIlrchcDd0996YktqLQEQ2hxYBM0TqY5CAI182XBucdnXi/7fZIb5/cpEjIALIT0fPZ5QeuAsbBL5ZRCvM4RrH+WKNlWMTyioUZEDfpO9QLBJr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707853176; c=relaxed/simple;
	bh=ZCWaPHv+AaOxbLVNNVw00IWalv+UhDSYgNzbs1eQva8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ECJf/+AixqkK6wXHxu+gUrItN1jb9Ao+QZ+ozAJuH90Cfetmv3Vk/bX7PBND8W9p13dQ9/OkqAI9Bi7+JrqAVUhslX0Kj4WjywUGOqzwT28Fm5yJoF9nkkD+A++Qe8la4X0hT2VH2W8nGr64Y8q2HOBxhXrWK4ptIbOFDzMTU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jttI5dGL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511976c126dso1579267e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707853172; x=1708457972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KS+nZriVXEOlOUhqDmz6bynpER81YQ2GlHfDyunox3A=;
        b=jttI5dGLNW1iC++q64qkArHy7UJx2dFRNDczekJ0Z8Do6EfCwyAGBbZnMzB7fiS8LR
         AwT6NdbwpXp6TzwgQojhPPfcne3Q6SoJCnuYEX6d3AzkVWJOmkz4xLUFK8dDNwKiRJ31
         P47T/FSDwYmQJB5S2vDcO8HRFI6YrunUP/496AnMKOVL98Ou4gq/68ep+XNx7GaiOwXf
         0DX5pp9xl7Z1HtEMDk+igs8ydWJxWvVIHTJFi2GUvVjP2e18k37MzReEi+wAI/nRNyE4
         ULyzdKrjazNO/zNkmrYSlg43hTRuXwc+jwkJUNDLKFU6NY4xThqSDSFMT8/kGiNVy07s
         saog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707853172; x=1708457972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KS+nZriVXEOlOUhqDmz6bynpER81YQ2GlHfDyunox3A=;
        b=d0sXmmBjIBZT5BIqL57BiH5OpAsuyj4VTq5n27Upw1JFSxNb+TD5+7RjQFKRDLOXUM
         Jl1/loYkmK47aIh71b9ASHszg++Jzbnc4Kkgw+UgotPg2ZyK0wIl7hd8QnPDpIgf5HbC
         lLfIvAYUdnfMFdcmvvDQvvpQvMNSMuRTgyoUa7c+6FwdpNbOSssYXQTFCnuxlZdxUhKH
         nBXl3Gce4bMRWwqJS7qmD43MTKGhM2X8ThqhNs0IbW2X1qynPRGY3sEyHHqgQ2fmxJXS
         lGGPJBUSFicnIMLYrdfNDO9xSsSL2tCUxcg2aQXJS5Rp93Wr+ATftMPdOIUjA2fqi5ky
         9Mtg==
X-Forwarded-Encrypted: i=1; AJvYcCW7aREQ7l+lRs5Rx8TKbIHlQM29twnB6vVoMpXXWYUAJq8AZahbeB3n5i4snqPf0gZmWHpe5nApNpFQ11fnOgms+AQ0OqhFqOv0pxb/Qw==
X-Gm-Message-State: AOJu0YwZ6MLxy3/yuWs2PdP/uhbjVpIU+nkz3jrrdUZkqIUdXppJfmWh
	erbfUFDUN4Vn1aV6Y3ft/wFIS348SN8DGIbqRtUATUZU/SXOYdD0hD6W4zpeYhU=
X-Google-Smtp-Source: AGHT+IH7dW95cPuN7+RBRc/qxtYwNeyEb6fJNfD5rZ1ck+OTWOfqAtrkhCjcxiRkuJE0+EJZ76m0cw==
X-Received: by 2002:ac2:47fb:0:b0:511:4175:8d16 with SMTP id b27-20020ac247fb000000b0051141758d16mr311735lfp.55.1707853172142;
        Tue, 13 Feb 2024 11:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX50LG5uJynhzj073kpTvcvBhBl0Nb3LkP4QB8K/+QvnZXWX71PydWeYYhwBRAFkXL9Ap5jxiWhTBRZfxVrOxlMsT2HzxBsikuJDvE14kgbHs3dce6qyBO/0SRnNgFDkb9k3vdJxhe5kyXbRNGrfawY/q/jWgvUo+jG7Y7w6NYnIoN00vwyciL3SLTNtZfvIyR40qkW7CuzOseovz46cMUeaFBQVKZTnOAJ76VGmwXXp1aWYfObc4g9ElX79hDMid/N7xIeAU27XmQb8KUtBkFxJavU7P7lg8uydCZBWqDf7QEv0hbmW/AEnJwylsH9+IKH2HES1tlQhnBhknwbWeohscii/xHxICUJoq3vxdZApsPu
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020ac255a5000000b0051186931619sm1181823lfg.146.2024.02.13.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 11:39:31 -0800 (PST)
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
Subject: [PATCH] drm: ci: use clk_ignore_unused for apq8016
Date: Tue, 13 Feb 2024 21:39:31 +0200
Message-Id: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 355b794ef2b1..b9f864e062df 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -119,7 +119,7 @@ msm:apq8016:
     DRIVER_NAME: msm
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-- 
2.39.2


