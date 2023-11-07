Return-Path: <linux-arm-msm+bounces-60-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 213637E3AD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E2B1C209CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8BA2D054;
	Tue,  7 Nov 2023 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnKukXWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0E2D052
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:14:18 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE08891
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 03:14:16 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c51682fddeso68853501fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699355655; x=1699960455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zApwXx3neP4r1a11TdYT2Rbt6ZBCaXJpgGfrnVx6vhU=;
        b=nnKukXWPJh7jWUreClukI/NBGZ1r5u83CcJXgae3TC9Nq8mKY17DCD17CigOJ690Yj
         IfP4UmOEN6DDfJuG1OqOFPMuxIwlnJEqtm9rOOk30Kth66gDqabWxeVmtSCIgSBYfxfj
         HDKUbUYCyttZuaOBpmvf6Ro2gQEXgbC20Y2C1ayx3vtHt2R1KilZm1fJD/V0RHdXl5yv
         PpPqQUmztN0jejlBJekaDjeXDFSgFs9uKGRam9PwPVjMYaPp/laOfvajJr/Wbz1VCgDJ
         dvCyqCaStQzf4UXHfkESv+OAmP0okL4H/MCdvgwCUhpE3/ZR3SlGg8N82J/FJGlXeMtA
         VElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355655; x=1699960455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zApwXx3neP4r1a11TdYT2Rbt6ZBCaXJpgGfrnVx6vhU=;
        b=nP+mCdbo01AylBTwOjwhKNj8fzJKvcpj51bHWB+z585gGWXi97e9JE15V1BB/oskWA
         ksLBSmUKajGSajJqheRH5hzdx75RA9uegvCbexFZpVUhCSsgMqVQiZwMLcXJsjvhoGa9
         /HlloZlEcAyREKamGMmTYjSvnc4K/LdcXyM9l87nXdVDuAT6AuYT3QX9r78gjLab5Rbr
         DHWWS5gdtMrMVPAOCgwIsL49L+6aJ0kb3NwjQ2cS8GOPFNBEh6N/FvuzgTriNjHPIjrk
         hlImL1gi+s3af1+nUoU60WgKJz3sbXHPuzBPDl6Tme8gfd/DFTozjbxJQOTLUS/bHb78
         lVyA==
X-Gm-Message-State: AOJu0Yz9qYGhHYTDmFu7VfopfcKcs8uTVauM6Z9o9isXXnlWC+MzvrSt
	lTaXU9XIyj0xmSEpgTaQeH+IZg==
X-Google-Smtp-Source: AGHT+IGlC+Qe7O3Dsc//34fEfEFsFCFPIeXzj8PbY46sCt3KyWk2AdZkm1qf9H6r2LzbPWRh/XMXVw==
X-Received: by 2002:a2e:990b:0:b0:2c6:ec37:fb5 with SMTP id v11-20020a2e990b000000b002c6ec370fb5mr800852lji.10.1699355655026;
        Tue, 07 Nov 2023 03:14:15 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t15-20020a05651c204f00b002bfff335ca1sm1484399ljo.79.2023.11.07.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:14:14 -0800 (PST)
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
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: remove exra drm_kms_helper_poll_init() call
Date: Tue,  7 Nov 2023 13:14:13 +0200
Message-ID: <20231107111413.2212942-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems during rebases I have left a call to drm_kms_helper_poll_init()
which is not guarded by the (priv->kms_init) check. This leads to the
crash for the boards which don't have KMS output. Drop this call, as
there is a correctly guarded one next to the one being removed.

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2aae7d107f33..3f217b578293 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -288,8 +288,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	drm_kms_helper_poll_init(ddev);
-
 	if (priv->kms_init) {
 		drm_kms_helper_poll_init(ddev);
 		msm_fbdev_setup(ddev);
-- 
2.42.0


