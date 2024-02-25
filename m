Return-Path: <linux-arm-msm+bounces-12469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93283862A98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 15:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003701F214AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 14:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CE212E74;
	Sun, 25 Feb 2024 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2gkvpxf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A43125DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708870372; cv=none; b=kXyW2r+dDmPObBEpSl3sPBaUP48WSSnbf1pzfm7ZZX+uNE2TBSxnqi8rLKFffy5JJkhfj1ATJorvEeDdGQMKkM7DODIgyDJ3ogjRqFbAe3PHEFKrcWgLg89ow5ro6vinzyLANKkJchLGD0qmq4ElBeloWz+cn2Gx8/EjPnB6kMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708870372; c=relaxed/simple;
	bh=KOC17kShUQKZuxuTXp3eBvMi5MEvpIBdA3gtxscdztU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=coOCZZZ2iIzPGkzlhdsb95PipJGYyjTWueZJVNxmss1p2dFATAaLgGryYowu/LnqaV8p80uEb9vDRgyKy4uMNDjNbCUeYEKhQDkLPpAxJd+koa8vArsAfxS4Ll8jw66wyMpRz2658RmgvYeeXJN3XQKgU4pi+Bd+fp9A6jKgY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A2gkvpxf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512e568607aso1981908e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 06:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708870368; x=1709475168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jp7b6W11oTt4eacy444Z/1g5qUWokbD1FKYrflZ4dE=;
        b=A2gkvpxfa197tacI+XrLMYh7ORjRFf6g4xSuUuBYfNjFvA1/+dx6LNx+pmOIUF20ik
         +mOuz1fd3IYRo2i2EojpP0ws3im3G2oW7NRCakxSsaM7iVGdZ2SEH0vLFlWXzINI+kit
         1yIvLJ78pUfftDDeAFFsUyi5CaCLJ1bNXdT8spHf/k+i8IMfUSse1Z37NaKl2wE2tkRu
         DFKfmIx//5clhYToSWUZEx3Ul5SBojoEj3adJIT462wXSdWdqEALLfP+iNF2PjiPev1A
         zAbYZqqfJoEZcWtlz+l1eSJ3wVAgQhwbr8pcMzCMcUtr+p79UAb6QY2W5S/kCZiaWV0P
         3CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708870368; x=1709475168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jp7b6W11oTt4eacy444Z/1g5qUWokbD1FKYrflZ4dE=;
        b=B1GyD7Gn3yRhSPaZK3fOZM7jTDjbO8StaWKplbKWQu97Fnn/GpSzNrGa97xx86Te6B
         aegnl+NW7+oW6V5KNVY8MlEhloy60sFxqFXFrS6x5DbEJmDgbWG7HCmveJW071YSS5Xq
         reWX50yvzpXbIGV3iai532ruU+t5xwdO1XDVFMsoCegjivHih67Ky8JbqZv8PrzKgwG3
         SAh6+OOIkpKrVmDcFaquQpVADVBwUveeO2r3xsU4/7nv1MTA7z+jmqXrR5efR0ybI2eG
         PX+avOwySrlYjIPRHw8QEEdMGiLURU7DuajF+lI4kjLjZ86D66I2uAZWOfGKjbmiJOjJ
         YX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZlV+jpidyxDUecI13KfA9DsWfQZ+MToxZ/xZ6PE7tm+D3+SK5MzhvC/M3xc5KAVlowMhXKPInW2PSxReQiT8wmt+oQowYmYuQ5yQgXw==
X-Gm-Message-State: AOJu0YxEgPgLAvqNpbRS+GDwl+W7bp14wccEZ2fnVyxc3DYUteJXDibj
	YV7jVr5ZL2iOORlIn7+oikAuieJJTNW7PN4pKkLfWTZlXiLVW4GC8k9SxCsPM9I=
X-Google-Smtp-Source: AGHT+IGfKXH23S9pVnVMEvSXrYDgDTCkZCTqXbY8PsTS2t4khBBuR9Nipefet6np8QYGfQ/u019p7w==
X-Received: by 2002:a05:6512:3b99:b0:512:f68b:69de with SMTP id g25-20020a0565123b9900b00512f68b69demr1507476lfv.45.1708870368483;
        Sun, 25 Feb 2024 06:12:48 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 06:12:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/dpu: debug commit_done timeouts
Date: Sun, 25 Feb 2024 16:12:45 +0200
Message-Id: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1K22UC/4XNQQ6CMBCF4auYrh3TFtIWV97DuAA6hUmUkhYaD
 eHuFjbGhXH5v2S+WVjEQBjZ+bCwgIki+SFHcTywtq+HDoFsbia5LLngCpwFO85gsZk7mOiBfp4
 AK6Edb1rDVcHy6RjQ0XNnr7fcPcXJh9f+JYlt/QMmAQKUrbSSxpSqFJc7DXXwJx86tolJfhTJz
 Q9FZqVyFddONNYa/aWs6/oGUhPVA/8AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KOC17kShUQKZuxuTXp3eBvMi5MEvpIBdA3gtxscdztU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfF+Ce8/b+rwxO9i085gWzGPOjk1Ty1z55/
 p/vHHN8swSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1WFWB/0RI4QxaBJJDCkXRRz4JUQw4rpV3NyPXWfuMOmXh/wKqGkPNZdkp17kjSwd8f7zUJ+TiZ8
 0psZLdDPQDomXTqCEM6R7gN0/rYgXQFjxZO65S5gPORP54iJ6pKy+gI1wKIAtRlG2NLokVCYeUn
 LPny3QhF7weIIJdJaqugDuYLEtbHDTIVq2OYzpxCaZAzNxx5UAGxovX7t7KEbljSQuUXxm4qDCS
 FoLlvXdVKFN4+TeEnhi3+lkHgREOECAaVE6tzCwIuhvSNlHICVkCPvvlb+oHCSBaGrS2O61YFJo
 /TjublUJ+Lo2EN6NFLCtZxVqY8rjRQWnqc29cZ4M87ZJ4hWn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to debug commit_done timeouts ([1]) display the sticky bits of
the CTL_FLUSH register and capture the devcore dump when the first such
timeout occurs.

[1] https://gitlab.freedesktop.org/drm/msm/-/issues/33

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Capture the snapshot only on the first comit_done timeout (Abhinav)
- Link to v2: https://lore.kernel.org/r/20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org

Changes in v2:
- Added a call to msm_disp_snapshot_state() to trigger devcore dump
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/dpu: make "vblank timeout" more useful
      drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      drm/msm/dpu: capture snapshot on the first commit_done timeout

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 22 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      | 10 ---
 5 files changed, 69 insertions(+), 50 deletions(-)
---
base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


