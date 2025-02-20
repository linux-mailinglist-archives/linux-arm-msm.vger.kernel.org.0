Return-Path: <linux-arm-msm+bounces-48643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA53A3D692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 511811897AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9051F0E42;
	Thu, 20 Feb 2025 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9l10Z+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC01F0E37
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047184; cv=none; b=FsEQQbV7gqTvUUyDF72johqqED/tEFpVqPcU/YdSAGA41wbBFiWFahshNlJzHP3d4VTTuisrYmvw+4wsewyEnrUqk10w1t2XsTEA21sGO8TF3m5syOEmF9vo6ceYus2aLZw9Bs/7xA0ADhl83fXUrF/nroPIiUh6jwYFZPr6L7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047184; c=relaxed/simple;
	bh=YyvVU2M7joMcm6kj5ecMLcRcuQdUfBOt7Mz2QmcKpMA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C04mgSKIAm090iw7EXtMtdmDyfZlq4Iw2nauRt+2uAy+iV2WEz5jBIWT63z7hxV06hrDUKO7HhsQaWndM6qyLmiTfGE+gkxWKl6JfE9yFXVLzr9+J1oAtJI6I1tMmXH64e/Wfmf7aO8m6ijZgO5aHFY/JytCbsz3sCcuQI3LL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9l10Z+F; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a303a656aso7443031fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047180; x=1740651980; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7kUm1v64pAlfTNgHXT9+jQTHsgrWw2Fb+swiiw/lqg=;
        b=b9l10Z+FzTAAYlK15kbOfwBESMpkv+nNgfW9yJfAlu66ZyBnKNojNVrs6O40olSxWf
         c2xS+J+yHH3JWLyWOQ9x8BBAWdLX/yjp8vA1Hf/Gmw9KKa23C+zpWaQ5VyicTQLklUik
         EmORM9RjngWqNYafedwPayZF+PtRWyRsQZO+RSU52qfi+aBrN6wZMnxMZP/cRxAqUql5
         yz89d/awrX27r9ZRAicswaRpEuysHaQUWxhU1NeTi24vD+pOzbGbKnxiCqvTnGgwpnCF
         yqzEhXWCc9EnRbCbs/YsAFKOw93fkFAheXQgcdoLWc0GOAAyIsgEmRfp+XHte6/L/RhA
         cpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047180; x=1740651980;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7kUm1v64pAlfTNgHXT9+jQTHsgrWw2Fb+swiiw/lqg=;
        b=EYIbBgYi2NXDcEJNXGH8ZBvA2yyjDavGEV1Itx3NYWuy8y9MW+OQzDjSGLbHdE/ss/
         Rg7S+yu322XWtMugJEbLXT01VjhmtC6HouGlvMTM0HnCgqQrde9xCxR2RbqUVvzSuVNS
         R0rvv7GeVvNMOLw2gdAF1zDxlmCalKfPfKeciNvbS2h9yQkXFcPaiOmo0Pu5p/Wqp7bh
         OuMJ2I34fELOapzXHEfrTbZnaNG7s33mOc2K0Yh7QDrRFzO41v2bt+hDDJP3mBlk0TFD
         l58oVN9BNELkNaAWLekL8LdfnjSkfC0CYJSxOv+0A5C+k7wjOYbuRTDE2f2YP2500S00
         DStQ==
X-Gm-Message-State: AOJu0YwljDU8aFaC//71FC/iE3VLo9VhF5wip4v7MneTgYi+mccws+z0
	A0Sml8YptWPE8HXiG55/BlpOD+rqMFTumFS9LbA0l0CtRVAuqeD3DfTVP34Q50M=
X-Gm-Gg: ASbGncu0U4EvpPXqVos1KVQXY6HOR4H3yokHDZCabDWvEbzGJ6pdvZsC4Ao3QwMm7GM
	iUiEzJlec+k6JybiD//YJr2XlRl5Hz0rn4WYlHLjBSwO+76AyBP3QQqjdck8UFxPR18hY67qPue
	giXz+E+uEoCQHxUXktw2olAEtQGwVVimvW/ej1QjH3QO2QSsg8HhvzSRMj6mVrYRLpSRhSwp7nh
	SOi4MypcIYcAqPkSspu0TgeezLw3JwUiInaEJ410+iFOmftmSxcdyds+2eXidzwV3sZlYQa+UeM
	YRNd+osYVyXZqxqNxBp9qFE=
X-Google-Smtp-Source: AGHT+IGlXUzn3hUtO3qI4uZIYQwTOom4ZNCtperoIH7T9iwqU09YHCrm1fmNkZnNsMT0VEKdIAouHg==
X-Received: by 2002:a05:6512:3d28:b0:545:f90:2753 with SMTP id 2adb3069b0e04-5452fe65418mr6812551e87.30.1740047180139;
        Thu, 20 Feb 2025 02:26:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:26:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/7] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Thu, 20 Feb 2025 12:26:17 +0200
Message-Id: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkDt2cC/x3MMQqAMAxA0atIZgOxKFSvIg41jRoQlVZFkN7d4
 viG/1+IElQidMULQW6Num8ZVVkAL26bBdVngyHTkKEW/XGh41NvQT5XJMvsam9Hsg5ydASZ9Pm
 H/ZDSB7a1VLJgAAAA
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YyvVU2M7joMcm6kj5ecMLcRcuQdUfBOt7Mz2QmcKpMA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKz077CpwnHsET093pRfGyj2RJD7zbmGJM9
 MlqG+6ye5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1XSmCACCpPXkFLHWeGP3ru9CD7CIQa+/GkF+9BR52tm4Fr7Um5rFL3qRex3TPMfI8cBBY/PO+oH
 lk+HugPCgmD8QAwrqrQJjbyyLtTNhd46sBP50hhpLzQapJHQiUanAb8o6S7yqNXeuP/qSCvoku6
 atL/fSRrZZ5vpPqZ4s3saodLzO12QfdpBIgOJnNHM1yR22wCA9yZR6K3dqnOfG5hfFsXdCP0P+O
 6DCM2YASFcARwe8IDUzeyKAHoKow9QSs71o7sayKDSshDtqUmxfDIxHRnbynaXsniBYLChvZ1+x
 j1sdyqSsZpkGCqjmtMBbWcV6JiXesfFmNnLe5q2U+wcg+898
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h    |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c             |  6 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 11 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h              |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 17 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h                  |  2 ++
 18 files changed, 59 insertions(+), 39 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


