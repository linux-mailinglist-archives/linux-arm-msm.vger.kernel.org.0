Return-Path: <linux-arm-msm+bounces-18026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C937C8AB951
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 06:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03861C2095F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 04:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE14D520;
	Sat, 20 Apr 2024 04:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CplZr03J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB49883D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713585678; cv=none; b=O0Ob/dPgl6Q4SMxju1YTrHoYznJ2mIUnUwaR2xf2ZbtPa3SrWl9fkSvstNEQsGdZ+87+m1TG2enEOH7O1uqqM6uucIeRhiEMGRVBxlyvooFFW002E0uPdQGSvOkT0uWTiO9Ay4NX5vSwqYVbe9m6OaSm6yhp37t/vFICzrFIR4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713585678; c=relaxed/simple;
	bh=rKaZDNh5kxx7GJ2yJxrftfiGZtSLdTIFtoRuKDDePD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FjsA15bKgJ7PWIRLhI+i49RNufQCTshh7DxdKOsYRCMWn2lGMt+kDxpvvsLE4PjdVwYxVWHIklksPnQYzXsUWNa7A2Na4QOSfAv9aiWtUZE871jax2bHZ28NnGklkRhHCbprbNwJOrEzvp/gDBVl4nFcFMc4xDdMed7bXseT4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CplZr03J; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so3235801e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713585674; x=1714190474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7zMmX875gSAYfPxrt2gup6kdyziGB5KH+g5wBsmz5o=;
        b=CplZr03Jmbx/zPonAe1q+OK26cmT+lhGacqfQJtIZm6zU5c0eAHg+UGbFIN6VGAZN/
         IVh1/HQYceYudGM3yXPMVpK7Cc8elFfH8m67A3J2bhFq6BC3ltThLwd+teOm3AUXKrG4
         74aXiU+Xi9qM/FFmQ8DKeWixxX9+9iniZ7o8HoyGzqDGn6Gb5Kcis8gKpKMZu35krkPQ
         fT0wg5z0ivYHy3yy9A8DN6K1fnDiJaw91A1PMy/Ermf+K+0htSuj0z4tYSE12EcqSZZ2
         FUxkAVQ7Qt8XLD/MMzDUt242Fh3AxsZreE6+++4lNTYpIW3LjFT2HWrrAUIISg6vNLLO
         9V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713585674; x=1714190474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7zMmX875gSAYfPxrt2gup6kdyziGB5KH+g5wBsmz5o=;
        b=jP4xVC9LtrWPtiLcVTGZcfWh27f0w5+sg+zCQf9BvnPEc9twKfxBGBrz2T7W/FzK8O
         hd524mPSLqRqvxaOuo2ogzzU+UIru+k3jrkKmuMpcXysFjPe0iapsYFKAEhP50cvQHMT
         67NBAGCtpPxvs7Un+uSYMeID/1nn/EgGJWXFbIwKwFfYS7i9dXVtKIlzqkVKq9DWbCI8
         T4rWnSsDvdyv18YR1LgESJlmBmxUcrTZKcloTYrogOhd7MqSlrRi9q9CUsg+4iJMjcM0
         J4vEgl3xEmDdsxmKPSymFWZ3pk08cMaCDC1wbImMtr0YHTjjklhSRbxlY6Vd6VrDkQGi
         M2AA==
X-Gm-Message-State: AOJu0YyLoS0JoQ/jxaE0fWyHktX9bIGVB6cCqvxwKPjexsEPzWfdalsL
	FYC6UXRZ4O2MidrI7k0fXlrOIr+sHkHXTXTRm5FfeCmndA5ZFWmTFTWVTKUUBaY=
X-Google-Smtp-Source: AGHT+IExMBZwNO2q828JEytFfTTwoyASRHe4cwU14b4d6yyMpKBkYpHI10gdQdohpz86O1ZDestIzQ==
X-Received: by 2002:a05:6512:548:b0:518:d08c:b44e with SMTP id h8-20020a056512054800b00518d08cb44emr2476060lfl.10.1713585674258;
        Fri, 19 Apr 2024 21:01:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 21:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/9] drm/msm: fold dpu_format into mdp_formats database
Date: Sat, 20 Apr 2024 07:00:57 +0300
Message-Id: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPk9I2YC/zXMQQ6CMBCF4auYWTukHWkxrryHcVFpCxOFkikSC
 eHuNiZuXvIt3r9BDsIhw+WwgYSFM6exgI4HaHs3dgHZFwMpqlVNCv30xphkcDN6a0xr1bkxPkI
 5TBIif36x2704Shpw7iW4f+Kky5CulbaVJtNY0qjRDzzLWj2crLl/puX64tFJqpJ0sO9f12Z6Q
 6MAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rKaZDNh5kxx7GJ2yJxrftfiGZtSLdTIFtoRuKDDePD4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIz4Hz64i1wyEy1v1J+UXyvu6pBnDRO6iv2sSL
 aousQ/DgKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiM+BwAKCRCLPIo+Aiko
 1SQ+CAChq6lq2Ix9i1eeXVe4bbp6TIys8qnGZIcV7rulyB9NcmA3geYQzcEmjMDPS838uViykRX
 y8c9SZaJzTIrmjjIK/xGLQetzGHO0wcETBZQtSbC96Gy0KfELQR+7Zm72p537roFxD4qFq7ISrJ
 6UHv3M5v2ileMnRxFPW4AGb/g1ST5nuynRWfLa/LuhbGsCFwQBRH6GqM5rmlbr2CeALPLs7vCjj
 FObrvTzRvWUDJ7ih3zq5BHpLW+2+cQDzpAd2KG8ts+a3WcgPBZWjyzVvEIKMt3q+wiUdccK9UgX
 eJGoTcI/iKft/16s46OeDfQ7+vRAU/Eq9109CwV8c9hx3F25
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

During the review of [1] Abhinav pointed out that mdp_rgb_formats and
mdp_rgb_yuv_formats arrays from patch 1 are directly based on the struct
mdp_format formats array. This was true, because MDP4 / MDP5 drivers
used their own (small) list of supported formats. The DPU driver,
supporting more formats, had larger database of the formats and their
properties. While we don't have plans to expand MDP5 formats support, it
make sense to merge these two databases into a common dataset.

[1] https://patchwork.freedesktop.org/series/120377/
--
Changes in v2:
- Rebased on top of msm-next
- Moved all formats data to the new header mdp_formats.h (Abhinav)
- Dropped the alpha_enable flag changes (Abhinav)
- Link to v1: https://lore.kernel.org/r/20231202214016.1257621-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: use format-related definitions from mdp_common.xml.h
      drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
      drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
      drm/msm/dpu: pull format flag definitions to mdp_format.h
      drm/msm: merge dpu_format and mdp_format in struct msm_format
      drm/msm: convert msm_format::unpack_tight to the flag
      drm/msm: convert msm_format::unpack_align_msb to the flag
      drm/msm: merge dpu format database to MDP formats
      drm/msm: drop msm_kms_funcs::get_format() callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 658 +--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 124 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  75 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  86 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  95 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |   2 +-
 drivers/gpu/drm/msm/disp/mdp_format.c              | 630 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/mdp_format.h              |  77 +++
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |  18 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   2 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   4 -
 34 files changed, 913 insertions(+), 1075 deletions(-)
---
base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
change-id: 20240420-dpu-format-d655c60875df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


