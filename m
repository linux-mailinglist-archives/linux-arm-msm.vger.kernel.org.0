Return-Path: <linux-arm-msm+bounces-5087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B8815CA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 01:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711AD1C21165
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 00:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1085C7FA;
	Sun, 17 Dec 2023 00:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNyFHyKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E857F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Dec 2023 00:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50c0f13ea11so2187356e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 16:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702771319; x=1703376119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
        b=mNyFHyKSVrXGO0h/auAux3C4U2WFFKZV44Y2W3nJqp4h92R3PimQrtWCm8eMGu6ajA
         PwVdmg5/b4R3woO2tHQTNToGY/5xL83lXmyjNSpojf2nd3dTPNW6cXKpCO/OY4ax7oC3
         F3n7T2A8QrEghnaCEoeWuoBQMO50QN16jUgZsyhqbdls14OrLyyD/vwymZ+wQhZL3f/s
         ezOdf1XtD6d7j29uo4JN7yRXeRVzBHZdE2rw6DQj2n4Zqbzsl85bwP2hJHzR7FZ4vMb6
         AaMNdaTHdL6ctvqoDSkw2ZuT5wMJ6KzxtjuXhXhZHxVBmMmHnK9Dnm777m+yKL4RHYmv
         +mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702771319; x=1703376119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
        b=GAdRXS/oF02h2ecNA+epjcVQGDr4qKEp8t+X9dc9BMbVNNm+vC78g1H9y1FzA5SgQ6
         LiJasHuwOMGASAbJNgRKpIjwW0IunKUFDyqVrvGMUjHMwNELyv2y1F6ZhGpXQKEvQL7E
         oMWHLyt1IDq8iH2+8wWrHVg1spij9cyOksis8nltbo0eKOv0uQfYkSwWKZmMhBdSBAzs
         v4q7GU4iFpRybycs/EFQWi3G+OfU0Mw0uefgT8YKBBQ5MkOvMlPpVeILgDbwhH5rs/e/
         7r4Hzf2JsrzA4AvsD99Zg05Npo26KLFN2vffenNyUeCbYvXAFgjnaobo1RhtEnrbftdZ
         WF7w==
X-Gm-Message-State: AOJu0YzowcB+4YePmBn2gBWwM04JCyx7g25asQyFy3YNaPLgFrlwKi8R
	iSujgPvLSbR0tfr7PYJCpHr+VQ==
X-Google-Smtp-Source: AGHT+IFzE8rG8RHeKf3trBTPvFqBV9VmDl0XIPR+mfv5S97Pwe963Auef5azXGURAwcyY531Rm+oKQ==
X-Received: by 2002:a05:6512:2211:b0:50c:a89:a70e with SMTP id h17-20020a056512221100b0050c0a89a70emr7926725lfu.94.1702771319064;
        Sat, 16 Dec 2023 16:01:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25141000000b0050e356b61c2sm30387lfd.179.2023.12.16.16.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 16:01:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dpu: drop obsolete documentation for dpu_encoder_virt
Date: Sun, 17 Dec 2023 02:01:58 +0200
Message-Id: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83380bc92a00..f2b82ca5efb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -144,10 +144,6 @@ enum dpu_enc_rc_states {
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
-- 
2.39.2


