Return-Path: <linux-arm-msm+bounces-10195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857784E3E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB8E28C71E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54785763E1;
	Thu,  8 Feb 2024 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdht/fDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0B7AE53
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405647; cv=none; b=JkbaKwcFm3eVTNBDIegCc9ZHRGTGaH/Cqv+1D2JKDNlP9Q/z+W4Cwgj5BvNSj53Jnw6lvkZO+wkWYgz8ciGF9N5KSmnGcLhqOP6/IW8/5gJ1OcZlFgS6VNNdsSbYULCfQ1GIGc0R0OvOeye3B5OI1h5LxjeHsWwhaqkKksFHV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405647; c=relaxed/simple;
	bh=JFIWmCDMQIynCPGMnsCsVOkJ33fjcDa/Z/yzyhFjNKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VC+wh0PahQGiy6ynzpcFBH/Kmb99CqY7kVLGbLa1DyH6DccguXuslGDZgLJsjnU0R0V3IJvO9Gr4yVg9e75CqGTFeuokHJ5BCWWqiRKydmoB2OtJA4eyHMWryzOY+qiQppDhs+8Xh175teTh0G8zAk24PVsNnkenLb1fEwjFWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdht/fDA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d0d798a33fso4559281fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405643; x=1708010443; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wW3An6HrSaw0YhyE7xy8Z1CJLHiWZKPi691yAJpdg/o=;
        b=cdht/fDA5luTAM2G45UyIpg0mna4rt7+UNvm6TStaNfmjeRtYWI2nXdOhvEMQ2aVQ5
         QT4fTncaZqpR1rt04EaPOElqOzlm86FT7t7KuSCyjfgBKkpmCIlJ2XxlmShxAKiSrgjd
         UlmI7q8iti7caWUQXeXq5M2nHon4bmPLnK2nxPkBuXgRAwKxb0BO5rSfZFCOxBX/1S4K
         0xpPHM1UTL4Q0T1hDhiVuwib8l92anQe758tQaAl+z1glZlHgfvldBbKVT36fFZUX4p1
         nD2mZoznAQ4jS7PCXQoRAU49noIeexlP+RcK/W1/pmtgsC6qcVQZHrrpd7jpdCZRfFjS
         zf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405643; x=1708010443;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wW3An6HrSaw0YhyE7xy8Z1CJLHiWZKPi691yAJpdg/o=;
        b=LUT5C2rfLC9m2+jaVRpxZu+G6FDFIBT4yM79UPBSeRr1CsrQCIWFir/bNHQnJkUtgM
         yt4vSfpZ8razWKO7XDAoRCOjj+GfANS5mAtv8L8sjfF0JK+kAkffqu6EAe17ynWG3luU
         39tahJQ+2MNsvH/F/hEexaMe+tUdTELrqJcTnA/f52TFabUbZf4ZEUoL15HeTXFWubID
         qgM/vY+bQxzrOxDxjJ8sIXeU0yLiMGXApVtybZWWjFDhYJUGdAYNkieF39S8yHBGQO2N
         lOFtLRo3nKetJ3R5E4lb7eutMmB5tpBVEY7gek/EOGJkgFn567YmXbvMCnswEE+QCADr
         8JHQ==
X-Gm-Message-State: AOJu0YwiT/u03Tmkq9MGoZy4hjzGcYd1xEUqIv6QabpPF3/i3JNoPioX
	Lu7NodqZC9t8rYq8fpBxf4QF4KViKsYY9CA95kmlMQ6466Blpzu2ir8f6bvFnoY=
X-Google-Smtp-Source: AGHT+IGmk7M8vXorynWP6aBSxtUG2/+mks+u8aKy+hPgTelbsRaZ0gZkQDPvVrZvlClgPgp+hamwnQ==
X-Received: by 2002:a2e:7d0d:0:b0:2d0:b291:d017 with SMTP id y13-20020a2e7d0d000000b002d0b291d017mr6155329ljc.15.1707405643140;
        Thu, 08 Feb 2024 07:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKV46Gypp9pGoMz0wPHepVZ9E7VlzEZgf4M/OQ2J3tLa8HY4B6xcPaBfaX0nGp0mDScpacIAHqi7wMiSYjjR0Zy0Yo2h78ieRJX3AvpguI42I2ksLjIEHRuQU0LpFRXpgvTi5LQaMUxf/yqx/zUjBZtF00r55Y6GaBoz7cD28BKg3SiFHaWxQqJgSMjz9PEsILd84CBgYJSvP2Dz/9i1kwE9u7kKqE6LTO0Cdh66FOS6oFZQZbf0dCZ88SvlF2cNt2fMSJ9doOXas5R7ykGdv7FygpIHM6Qb7oyQyeUbjEcHdvLBMmhqGXu4VKOtFgdDpyaYYMVVGSXsBjEGs=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:20:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/5] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
Date: Thu, 08 Feb 2024 17:20:40 +0200
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjxxGUC/zXNSwqDMBSF4a1Ixo3EJD7aUfdRSojmqqGNV26CV
 MS9NxQKZ/JN/nOwCOQhsltxMILNR49Lhr4UbJjtMgH3LptJIbWQouOjMwQBNzDrvEeDazQ2YfC
 DCejAREjc9q1o8nrVapZDK8HoP7+TxzN7JAw8zQT2n1aVlHWlRFerUjX1VUvNK+6CT7SXvaU9z
 i/c7m+/WMISaWLn+QVB9SC2uwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JFIWmCDMQIynCPGMnsCsVOkJ33fjcDa/Z/yzyhFjNKo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFJk7hoNuAjC8N4mFHXpO0lvew4h7DwMeM9y
 u6wOqYNnCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSQAKCRCLPIo+Aiko
 1dM/CACdL8cSSa/oxFXhj0dyM08P+pNscinu1eikDS58R6FzEGaLhzywX+94TETxWC8dY+nvEqC
 DzJkXtAdSpf3CswHskdBjB1ly+bXdjmyRhbz9SeQQpd67ymszvw2QrAbSOhL8RXIGyxaZWgrYcs
 BVd4SImYKOPNh6Plwx53YOsX+nu3c2y8Y/SBV1tLSXsMtxanPnOVMHV1169pJRzIy8nqF2r88MZ
 7btPOba4qiUsKM/5g3Sz6PtInY/2JeWDc/TtatjYeRjTR/2vkEQcPrc2h0YGsALMCWUKSPu/61z
 bHN8MyVZQ84JJm6hIRRCvJ2JpnWUZSm+BNIk3jeDmXR7fkJK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Changes since v3:
- Fixed the crash in dpu_wb_conn_atomic_check (Abhinav)

Changes since v2:
- Rebase on top of linux-next
- Also incorporate the dpu_encoder_phys::atomic_check series

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (5):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 94 ++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 15 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 95 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 59 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 88 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 9 files changed, 270 insertions(+), 224 deletions(-)

--
2.39.2

---
Dmitry Baryshkov (5):
      drm/msm/dpu: split irq_control into irq_enable and _disable
      drm/msm/dpu: split _dpu_encoder_resource_control_helper()
      drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
      drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
      drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 94 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 15 +---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 95 +++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 59 ++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 88 ++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          | 74 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 +++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
 9 files changed, 274 insertions(+), 224 deletions(-)
---
base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
change-id: 20240208-fd_remove_phys_ops_atomic_mode_set-ab706706b374

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


