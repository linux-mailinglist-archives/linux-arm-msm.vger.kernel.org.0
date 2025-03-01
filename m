Return-Path: <linux-arm-msm+bounces-49903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D46A4A9EE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 10:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4EFD17453D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 09:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5D1C245C;
	Sat,  1 Mar 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQSrPSrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56578189BB0
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821103; cv=none; b=HS8AosllJRm80/K1jl0HfMqVCG1HGpfrw+D5gqjS7BgELgzPs7JE2I7Jw9KzBCtCdb20PGK2TxU997ydjsfucZ6ePWwSS9pOJYbTCxHiWfNekxwavYhyjZJznyog4dUel89D5WQ4DsjITJ3+UzBdqyB8/i0XD0Gnb6qJ+ZOu9gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821103; c=relaxed/simple;
	bh=GqOq9rkDu6v4PggutY2CL3RwcYuHkk2cBFFkYzV4MYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cMPQ5UVh5x8ZiYG5V/6Qexjk+hSY+ZClNlvjL43NlePtQsTWvi2pzOINtM2Koq3yuWD7zZRtdSSqLYJKbP/YuruGKGgFUbkkm4I0dbrJdaKdpM+TxnHC92S5xCFDadvEMoQ/jLqSEEhl20GUQgCIDtFrUlj8xF1eE1Kx5FylLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQSrPSrM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-548878c6a5aso3174691e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 01:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740821099; x=1741425899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
        b=wQSrPSrMrRcNcMf0nFrC/x7X41EgqCwbZ2mDxzMvOJDNeGWYilwKH8IAOcplkM7qby
         woR4NtW4+F1X2NufcUyvBLmm283AoTJ4CyS0m0XSUeHYGNbPlGsHE/3EeKROUtlKOuLS
         wpOEYXGojkMnzkxpqfAwQPDiqX5iuiKX/guoIzBGJePVXMzhhCyHQrM53BGm2NegI5re
         uw0CpAbISLS+/BFy9/StboI7l9Uh7mhC/TNllO4Q6Vb0Wb83Rk2cm4aU9zI81hQGCzX+
         PWPlGddn5ydBF21btGJy39t/E+6hMUoVdjfMJODCCsptOeXaGo8XE8J2MFeb/KjTSfpu
         Xt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740821099; x=1741425899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
        b=v9v5yY/GOClU40PjY6jzN1Z6w4NfJsmvm4gSQwtrUx3Y32UdIGpXlLAFm26qPG+G20
         pCN4p9C12QYHMkxF0CcJk8tRFyvm6f0fuOYxtZWw+s4H7EgQt/eqRrfvsaA9LCAU1z9W
         mtEvZL751KGeLFh44u0/3jG280Wop3DNUsATxmKEBi79a9cdc4eQHyYyZWYNMbLPElJG
         trZBAjE3vQ/OCyVS5TR9vCZEWwb2z0zpMIpzMK4jEd5XRVpJtfsjchG8VAVI/ogDaIVY
         yjVxbVWlm1nkAQFSckmGQ3YTepaHl/GOU3wokF1bw9M91iaBDIwYURW6r8snxwPhUE3X
         Qu0w==
X-Gm-Message-State: AOJu0YybXWcYI0tlnAdlA9f+JojxqHtBGlqI0egr6MqyaD6MoQGVwjaW
	L6seylFU2E/k4sUaS85DaUeIAWiiFTNRbeRG17bRd8VIHI8QP85OegUhiq+AmI5zlZ2pvMQE2OL
	5F6w=
X-Gm-Gg: ASbGncuL5/mWtUho9Nqb0areargc+2ZULd6OsSZGxfPZAQgHZs4nubEsMIvUVcj6K1E
	JEPmlJS1i/fDJgLp9nOZBrr+hrqdo1o0RPfDM29/2/SwQjwptqO+xSNRKKh7h/Tnus1pq+NmIbi
	yfW0a9uUwYxU7MEn3RMEyrOemOsSErn6zpEcyolmVRCvw3gseKxkpFFMUtLoS4z5TRjQq2hreNz
	CjymcvdJOAW41tZ3rRX+vdjbNU7OhN95K3feTTkm03pJ1UFL4lNkN7Us5H+NQGeLtDBzGGLQKwq
	cJdP4Ri2TfJZg8eNHgbjAR791ZUTFZOvugMncezmC05zFENuNxRX
X-Google-Smtp-Source: AGHT+IG/1AayJVp+qm5RXrxUhbjPYPpH8uNl8/6SF/4ZZfwJzrYVs2UolooqjFryoLYeJuDT1/fK0g==
X-Received: by 2002:a05:6512:3a90:b0:545:441:52d4 with SMTP id 2adb3069b0e04-5494c33089emr2269458e87.26.1740821099342;
        Sat, 01 Mar 2025 01:24:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 01:24:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sat, 01 Mar 2025 11:24:53 +0200
Message-Id: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXSwmcC/3WNzQqDMBCEX0X23C3JolJ76nsUD/lTFySRjZUW8
 d2beu/xm2G+2SEH4ZDhXu0gYePMKRagSwVuMnEMyL4wkKJGEd3QLy8c+I3OrGZOI7Z1560eHHW
 mhbJaJJT6ND77whPnNcnnPNj0L/3v2jQqtKrxRIN1ZOvHzNFIuiYZoT+O4wurkalurwAAAA==
X-Change-ID: 20250228-dpu-fix-catalog-649db1fc29a6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GqOq9rkDu6v4PggutY2CL3RwcYuHkk2cBFFkYzV4MYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJn2qMf0VS7G3JEN+uWvtBRgvvIOldnrQcYS
 k7crSZsssOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSZwAKCRCLPIo+Aiko
 1e0HB/sHdFdwVnCgI6jz4PMEGkIyskrbhGqY3Hqwu8/2I5ecn5HgHXqKgNxEmhAwseUs8bRMoym
 4fn8fkRTrsmTSihzFm8rom7vUKX8po4+Dh13YIGBfhBugH0Uvsb42HOAOq6bCOJ6YVJnl5u8SkM
 Yv9QaHmoQKWeLG+PsJck7cp5GRXF41+7G6rN02fpQ0QaP0lv/NjfbtSEUV3OEHUPv3HYSgVTqjz
 8M3RhzQQACJhts2u77bNT9Zm2N915NZFfph69mY6YiOYdtljBt5LCoftEdUaYtxZxW5+AlHG3eA
 1NwcGGLIHnLk/CndkDteu7KMYCaQ6G7oG3gfKRv8Ic01evLE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

During one of the chats Abhinav pointed out that in the 1.x generation
most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
didn't provide DSC support. Disable DSC on those platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed commit messages (Konrad)
- Dropped TE2 bits and pieces, they are unused in the upstream driver.
- Link to v1: https://lore.kernel.org/r/20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: drop TE2 definitions
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h    |  2 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h    |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
 10 files changed, 20 insertions(+), 46 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250228-dpu-fix-catalog-649db1fc29a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


