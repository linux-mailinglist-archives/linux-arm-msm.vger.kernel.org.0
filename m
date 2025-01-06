Return-Path: <linux-arm-msm+bounces-43952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81AEA01DFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5456C3A43F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68CE7081A;
	Mon,  6 Jan 2025 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nirQnCyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D13D69
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132864; cv=none; b=bXGGDP5HneQacqOZlx6XJPaDCa6ispgXxpANYZN4Y2FC2zhvmpZx95LEvgKq8gkhZNDlBniDpkkWCFAMdPKVSHr0CHtmj6gm8YkAFa69Ws8QPnSTA7J2gVEoW9p5o0/XFWofgTAvSj8hqwrp+CQcJ2TIHU/6coZcdcD4me7unkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132864; c=relaxed/simple;
	bh=dALmTtc2mWUw4GY84rD8BKfxs/DyNv9YyAPMHK/HkI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JiEyglIMCmIAEw+hMa0gJLCiRKqz7t3990Ys4CwQ1lElurgIUMitIPaYCwtrJoRaV3PIbH7rSvIHnG6m95KKN8M6p4JcWr7TWOk9VYbluzyN1MLXzdyRFaI7uVZ0zoCFm9nQu6h5ZMVWbVXcjhzDZ2CFlcDCMv1MwT5H3AIVtH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nirQnCyu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso15092909e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132861; x=1736737661; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLK759iPI3y1Wi5RFKaCu2VPkX4DkJ5X5ePew9Klx7Q=;
        b=nirQnCyuajNl2BAbwFJRfIf45QRaJdy9QUqP353U5NuVxYhGpoZL9qi0qERGBxpUzu
         t4K2aVEpGk+AQNjddXcj787vDVG7VAYkS+PLQl4UX/XqpPJiMqCpO2/S1na594tiURDd
         o+nu10kceeVfLagUGxy0bsnFP1mUUgHml/Dv3Kl0MEWKsvRl8F9YspYDMivXKQgvTHeU
         p09kWyb8aFKTXbPiESi7Fc0ufNLn9guct0vgPy8w+gI6GXNDluz0ya0iW1EfrF80K/kU
         FLy5oIvgrUj6fsysLWhNCcxEEkhzy+2DZGjj9+zL8mvML56kcL43CrT40r14jAzhJ2G3
         YbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132861; x=1736737661;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLK759iPI3y1Wi5RFKaCu2VPkX4DkJ5X5ePew9Klx7Q=;
        b=Xo2LXt1nihpMhwrmQd4Q71j7x2Py0fbUxmH2fgAZpCu7L4Z2mvPPM9KCpPLCJ3HFOt
         /4N5UPnZ8U0VsO1a0A8iLG+mCm70Lhfsb0VlB/qE5ZffkA4NqBaiURZODx0QtPcxZjkx
         5fAMKTHT1J91M+rgab1YUJqn5wMxjH9SOf3i8FXnmgjBbT6nfuj+Zvl6BFjmAxy2Yqjx
         PUgNYFW6qG0NCuQy3J2CzaOu1bWGT1TIolnAs3Y9wH0zDiEPvd98ddOJ2L/B/iXaDAUn
         4giywKB97BDYkfQg7dY7jyFK9+BPcM0xZLVXLTynFqZudBV2TBb1CKVX2trYYLVkfxog
         pWyg==
X-Gm-Message-State: AOJu0Yzxh5UEEjfDHoxqTWZSBROu/40LfAUcyxjCl4CTmVUMGZyxn/0Q
	1rvl3ctLjic4ZIJSKlYySkkbZ49DRsb+RInGUfIbTwId+iBdt/Q8JtoA5SLpnyw=
X-Gm-Gg: ASbGnctaaTDBSypPqP3m2+6zvC+i0jomqgBuYFHItUcIEoXzzvjhaWkNyFVwcuKIBGN
	O/Gl70Wza0e75M1LjovQxS0erR2EcH18xOoEi47zOBuPa58beSp47gvbqlOx6FkKRQDQndW+7So
	CdM0paM1gYBa1mJFCeIWmTJpU04nnU8K3W0VJCzKZDk2pFojzH9HnK7e31U8eCAdo5GSxpb/tuh
	/TKbJWvbwuBE0NV8AV6SCnPlvf/hIPVIXBsSy9KZE/X1tzXiN0cC131LKNhgJ9G
X-Google-Smtp-Source: AGHT+IFBWpRYLbrMN9ZcJZ7WAJg0q5LHtFYQuC3pXOfl5O5NxecfwSkdYJShHfj/CKimfuqE6PEFFw==
X-Received: by 2002:a05:6512:6d3:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54229530096mr18988616e87.16.1736132860556;
        Sun, 05 Jan 2025 19:07:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/9] drm/msm/dpu: rework debugfs interface of
 dpu_core_perf
Date: Mon, 06 Jan 2025 05:07:34 +0200
Message-Id: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZIe2cC/3WNQQ6CMBBFr0Jm7ZgKhaauuIdhUWEKEw0lU0UN6
 d2t7F2+l/z3N4gkTBHOxQZCK0cOcwZ9KKCf3DwS8pAZSlVqVZ00DssTFxKPQq8gN7TG985aS1f
 dQF4tQp7fe/HSZZ44PoJ89oO1+tn/rbVChcZ6p0k1dW10e+fZSTgGGaFLKX0BbYYYw68AAAA=
X-Change-ID: 20240314-dpu-perf-rework-97fca999eb46
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dALmTtc2mWUw4GY84rD8BKfxs/DyNv9YyAPMHK/HkI0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j442IKuF4EGUZMO6EbwdHXodDWgCJruTRNt
 uK2rATVmfCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+AAKCRCLPIo+Aiko
 1Z/6B/0TteXy5ZL7BLc2TunIMn5GXqXDyUKyWV/z7tz9HHVj1hx1hOEU/6AzVjuaJm1fm4thjEd
 IfQCgLDtuk5jm0RcTxy7Ef/7KzNHTL0AtwNPBdoql2JIFMdsv8e4+onMqpMumiBxg3Yp4AlaVFW
 70OGTApCMtu4tIWLXZ6A00ZBCP7y9EMlDc6DuFFoa6yjuz+3O0K/V3Hh9WgMJBmi4RLhsMqLSMF
 a/DGorWkRYk+zOPlcaWiBMM4vKTZITtcnctCN05xwUnurGAjgIOaqy9GZSqB1R2C3PD9eJPJhl4
 FKPkYXTlKjOwS/3mJffMR3/M5i1INa3s0i15n6h0Pd+ppWRf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Dropped core_perf: from patch subject (Abhinav)
- Fixed indentation of _dpu_core_perf_crtc_update_bus() (Abhinav)
- Expanded commit messages to reflect different questions (Abhinav)
- Reworked existing files to specify max allowed average bandwidth
  (Abhinav)
- Fixed u32 vs u64 and KBps vs Bps values in debugfs interface
- Link to v3: https://lore.kernel.org/r/20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      drm/msm/dpu: rework core_perf debugfs overrides
      drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 207 ++++++++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   5 +-
 3 files changed, 62 insertions(+), 166 deletions(-)
---
base-commit: 23ec7472e8aaa96838a61819a97882b5a7e17e42
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


