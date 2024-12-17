Return-Path: <linux-arm-msm+bounces-42533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 442229F4B09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF6716E0C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292971F1312;
	Tue, 17 Dec 2024 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KT0HcRjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD51EB9E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438948; cv=none; b=botL3PFRBGl3g1jItK757Jr7sQHICFqGhN2RMyDmNz8kFfTrovMy0ZzW0gOlBalgzWMpq6JKlmhMKP+eAwyAMIE7VipxaP+0ia26Z1KUGKeVlQ8lWcxMUiyJar6tXufIZe/ZagmffO2mV5/O+ErAquKzZcjqFy/vbXWZva+Q5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438948; c=relaxed/simple;
	bh=P72G89o/YCMWCzZLIM5D+qksevbQkKdaRlhBYiPrFaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W426q2wAy/UzFsS08qLUzhGSp8Xq41qdd1o9yG0OkdYsX99G10+eYjX6BAnSd4n0+3R4okP08DuYy2rb/PfTQWqSCfjW4Kn/A0qfvDvEln5lQPHsVVu7rXPsOAFbMfmcuPw4Ljn/5zDsJHbFLW+eu4gsgyL0a5jSRx1PQLjPoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KT0HcRjg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4991708e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734438944; x=1735043744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
        b=KT0HcRjg0/lRZnqfdPDXJywYbz644SaV6pZeTj+rlc6sAEihGi3YxQb1Vt4xR6A6Bn
         07tAbUvYY6VDvryIzhJJZiFFEKYWg0JuKx3eGTu3+NjAkQLKlQ4CwfrqoRqctnTD3HMe
         brO2Abl5/jzCE89DiFuuZe1h2xd7ERatpD42tqypGUO+gi88xhbNX9y+v07sJtk5iCmF
         2Ql1QlNEv3IGIjKCwDrIPPH9yiKtoI8rkPk3D+iEHkqOIi8MCQ725UVW8wHog9OPUOmd
         bJnQLXz7TnGQ+hsd4Fu7f4emsgpkjXS9rqgxUEN6D4ruIkVu1gQAnUj3JG74A0MuaERQ
         xI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734438944; x=1735043744;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
        b=RMsKUT2N2A9OkCXI8S+B0AYw3zx9NglH8JsUcwkeAZi3/LkolVrFFgN3GH0osvv3ft
         6jigVrHZwkVSDe1bJhDwKDf2bMPQKOOv8JwK2C1yVX2a6nRP8j1IGShfxGoo58Fej5CO
         Y7wyGDfezPKFRkEXY3cdSkCJ1VQOj1ASgBCzufdyd8tA+fbfIcSq6iLFhMCVQLWcePcH
         5lS+bMq5k1xnqBGG9gtPv0AK8E+wTL/T1p6ipctWHCiuE/W64K9gQVOOdhnyFk87IBhb
         5jx1vdG8vs7dIITtU/ZMTsdxnP5i6ieoIUvn3wvYX4ryuR58ESWaTOfHmFuBZ1VonJct
         1qFA==
X-Forwarded-Encrypted: i=1; AJvYcCV4Po4FId39nhikJ2QdQfQ0HMAHYKgXPoHsYM4+XZwBw0kg6FLVUF68YBa2owMBrJ74TxIhJKaAEnibbSBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8SYMFEEapdg1VNXKoYWkJWvi0MYF6jcKtqb6KHwEmf+RJo1FJ
	8ygHfqbQXSfA3YtRz4VCBnw1b6doEdb/UBAcNFcfapYjmOArlH/PF64EAuanACo=
X-Gm-Gg: ASbGncs2ABnrc59zn6ijef+zamWQmJlk56yVuckzJoAMyBZL1O8eEjcgfdAuszbHVa+
	EQXq9QQvXHULrzLwra1vD42KjGkg3Q0DCH8zoRW9JDcfNzqfcyUhuSRarOL8sKO0XarK6ajFZdy
	Xga46iyz/S0WQNKaCIsFJBswzY2mVijQUmztoROACjxUvJsYwfreQnDjp2MkpciTAYJri9nE19n
	vuaWmiY/TcWCWQRK8FS3COAE/5RgRnaLWTJTgjnx6pJphuBi7WL35uTteXYhwQn
X-Google-Smtp-Source: AGHT+IGwO6ExXNEcA0R2FoxKWS83ev2naGxk2+ZyD+jgIUG5jEqO7Ox1e2tGWV3q6r+L5CxjhdwD1g==
X-Received: by 2002:a05:6512:158e:b0:540:3566:5397 with SMTP id 2adb3069b0e04-5409054f33fmr4655941e87.22.1734438943729;
        Tue, 17 Dec 2024 04:35:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c164b1sm1137065e87.223.2024.12.17.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:35:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 14:35:40 +0200
Subject: [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
X-B4-Tracking: v=1; b=H4sIABtwYWcC/3WMQQ6CMBBFr0Jm7ZhO1VZceQ/DgtAZmEQpaZVoC
 He3snf5/s97C2ROyhku1QKJZ80axwJ2V0E3tGPPqKEwWGOPZMlhmF4o+sb8cHQySF6MP9RyFjZ
 QpClxebfgrSk8aH7G9Nn6M/3Wv6mZkLCW4Du2Is64613HNsV9TD0067p+AYimqTetAAAA
X-Change-ID: 20241216-dpu-fix-sm6150-17f0739f8fe0
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=P72G89o/YCMWCzZLIM5D+qksevbQkKdaRlhBYiPrFaw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYXAdGjNdaXabT0YqQhED4A+ccplPzuyiib3mB
 0PMvSkpahGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2FwHQAKCRCLPIo+Aiko
 1ePjCACAduQzUrmv2UvoKsCLEFcnmXD4PjXKpskER7W/cYTmm1XdZPXFmTk5RY0EqzMl5GaIMEW
 VRMx14YUs0iTTFUk9ihEWyZ+bg2+N9wownr+WOw57pwuHLR0/0BWQJ/9rK5oDGsIn0Vvj6ZnpGn
 X+ufNaMY5tVD6tGqy7oX5g7wD3VOQ6Z28aIYIW6bNu3dtC1VCIEs5mmqBsx2TJ2kfF/XHekHG94
 /CzLIy973QNfb2sk7/f4rwsq5LuyOOmMuTBrzu5L4VoPRVYj1CJcwCxjlyHBASAZviWPlTPBkQP
 b+cqywM+uIjO4zlF1MYJMPvdy47FqhyjBc7UFU7g0/8qTOaF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
split the screen between two LMs. Drop lm_pair fields as they don't make
sense for this platform.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped lm_pair field as recommended by Abhinav.
- Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..d761ed705bac30d9ffef3c0c9140e5e8a5e930ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -116,14 +116,12 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
-		.lm_pair = LM_1,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
 		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
-		.lm_pair = LM_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,

---
base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


