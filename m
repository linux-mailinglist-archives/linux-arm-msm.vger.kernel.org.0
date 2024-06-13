Return-Path: <linux-arm-msm+bounces-22649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FD907F05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1700B1F222DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A7913B5AD;
	Thu, 13 Jun 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFIoNNBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152215533C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318190; cv=none; b=DKIlGZ8KC+B8hhmDpCsznmAhm0Q28+7NK6Jh4suGgXJRLUR5HoRnv9Izz/xnXwSr2Lrra9p1txXOmdp7yhdTkkCHNrrnGdI3A41NZct2FojsSCYxKAwtknTju/LPhoU980BnrsHEjefxZtqSDwtP/VJOhKW0zwTIIxOH80+3afw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318190; c=relaxed/simple;
	bh=pZ7oPyGWmHw6VCc6/ttt0AWUU5hsQuBfozUKcZ4IBFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iMQa7Y0sKFwRbF9KB26yDj2bouYcdgSmOC7nhaddCcex9me8GrvY0a1Ghahftawcj7SJR1+kgwxKtaMDct+5KI2hqgVxOqvcuGjQ/hmVJY3bxcls9TnNTHQLfunZg7AC/73kg1VuJrgYnddVUf2hRdcHLOq5wbbKSUzpQB6I4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFIoNNBD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e724bc466fso17750341fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318184; x=1718922984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UIwtLBs13vfBF3EvZYQsM2dOhlesEX9MFYzkb8adGI=;
        b=RFIoNNBDbCLGGbR3zCLOCuwiQ6ZGEnHwZxxYjtp2WM2harAyyEkpXNRzRY/N9sK5f1
         306gXJlnMYqot1qXMgoIftOQVj4RtaFk7vMEawmTG4mEJOI1fh08uxLntBpyxZJft0+9
         vRohjF13doLFSjQ38Z5SvUMLYYG2NQBCELMAEzX1NuHK8mmXYkrYdedDcKExJr1XBWDk
         r88BpR4KO2cYuiRvc5OgyYpwvhnSHlzP3etPUXUU/pMsSFmBNlE/Vb3iS37p7fKxvpEb
         NndUisPHoG9s/JjTthErh+a62TXyPsx6fBJ71BhRdHIX9S0toFKM9oEOCyBLhK/uTI2Q
         19KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318184; x=1718922984;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UIwtLBs13vfBF3EvZYQsM2dOhlesEX9MFYzkb8adGI=;
        b=kZ9cu2JGpge2Wx6QpZvP8Dy7iHntkjrGwXizYbxOwYOIzE6Zva/vV0IJCZ663UL6i9
         DpBN/jBrryFp487E6D+nO09NdyzVFLZY3ricqzj8aMiIVkUqa9rxysAVYLuek4ISNPTW
         ZwqimUVQkPo+EC94M3n2f2vlPGLBJSQQ+THIQ+c1v9SvvWdaSBbo3ZNba+2NyEJyUe+S
         tgaMG6hyY0lRkRnZS09AP8FwpwaQkcOigIswWNJeSsqpOY6MLcLil2TZN/cmAhM1eq24
         ElltoxwaBjQh1vcGVJSGNv4BRhHugj+1JCu05Wkmpug9jwc0cvhirI4Ri2XGnTJ0nL6C
         8iDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjC6IHUdS2dvT+un4nvbhwjJyxxPAptD2TNyRpOQgjNfhvNkt2o3PUE7cCpj7RvYB0O0L62uo8EPIw5LeKZfOVf7dj1jSQU4Kt/tD3A==
X-Gm-Message-State: AOJu0YxwSfzOhroAc3Kx58dsLDgMp6dJLfMp6bN4c+tTnMdyJIme+i7u
	j31EJAat/UhoH3NXdmijZ6dM7odCyZ3bxVnkTgWsJR71/5VwC3LZD+O9dJFJyGkd6hoPsH5lkol
	m0QY=
X-Google-Smtp-Source: AGHT+IGbEE3Un1z7f0FGQa3HX31yMrNdSY9J9K8qSEK+iPNDl2FkjBxgCuNEMC/b1GBxBKK2Yq+CNQ==
X-Received: by 2002:a2e:9bc8:0:b0:2eb:d673:bf86 with SMTP id 38308e7fff4ca-2ec0e5d1834mr7855851fa.25.1718318183880;
        Thu, 13 Jun 2024 15:36:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/9] drm/msm/dpu: be more friendly to X.org
Date: Fri, 14 Jun 2024 01:36:01 +0300
Message-Id: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFF0a2YC/3XNTQ6CMBCG4auQrh3TH1vQlfcwLgptYRKlpMWqI
 dzdQmKMC5bvl8wzE4k2oI3kVEwk2IQRfZ9D7ArSdLpvLaDJTTjlBypYBWZ4wN0bC43vHbbwRDN
 2oLgyoim1kVyTfDsE6/C1updr7g7j6MN7fZPYsn7F44aYGFAw1FlVu4rVjp1v2Ovg9z60ZCET/
 zGKii2GZ4Yp7SSnspRa/THzPH8AaQKlWAIBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2446;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pZ7oPyGWmHw6VCc6/ttt0AWUU5hsQuBfozUKcZ4IBFY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlUNVR1sM459N6ky8gwjmZz7CGIh1kqkdYd
 uYvedHtUMKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1WspB/9G/JRw0RyUWD0jXdHNlUrSkbWeg5nxsvnZ9tQPDlxWV80K0DtwJBS2EO9E4CqEJ8bGbDY
 UjLg17MoCmJzl09gd0VetrRJbAECAcLIqtEbkXy9i033RtMj5nUq8nhwVt+WXyo8bM4LwqT5p8K
 wS+fjO9m8tgTA/dMIvpxZKhlf5+50A4LkcOtWyCOrKEKGV20qAE7wVrXPmiQVqRomJ9laNLvPZU
 RHIyOBWI9oR/GSS1k2sCnAfChjawMcjM/pq1zr9zK1jLEl2oJ9+NUaqpQO6H3wgvzvBSgcdeZH5
 rGVbf+Qm1N0nhMrWl7bOqIDTD7xzjdT7JFrQH9ZkGleIK3P4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Reoder the functions to pull up a fix to the start of the patchset
  (Abhinav)
- Rename the _dpu_crtc_setup_lm_bounds() to
  _dpu_crtc_check_and_setup_lm_bounds() (Abhinav)
- Make dpu_crtc_mode_valid() static.
- Link to v2: https://lore.kernel.org/r/20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org

Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 32 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 91 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 24 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  6 --
 10 files changed, 91 insertions(+), 126 deletions(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


