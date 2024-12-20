Return-Path: <linux-arm-msm+bounces-42882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 280849F896E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE3FC7A073E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4B62594B1;
	Fri, 20 Dec 2024 01:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMyFCSr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E746BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658116; cv=none; b=luAN1N1e8isIv0bT24fGnkdClTXaRscnCcDnl/4XNdK/q1ugQFYxOb/tLpkoGcZ6aL1nfEUz//RgJHQw+uM6yLc2nXkjVpHRiyqmCBN4b6vg2xkepXm+3YBxvGknUobvXbicP6xH/AJEyvUkbLHUH5NX7FJIC7TuEJp3Db8tO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658116; c=relaxed/simple;
	bh=5aSCx0k8LhOK5y8eZerRNLzFjFPkZ0DBXazZ+khNng0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDGVWO0NHhBqlg96W6lDQQDbVx+q65GkEuvg/1ipJzWauS+BtzYpVhkAjgzLyUdvfg27wZ8PQMW0QKrMBmbCnOT/ep/9P9l+I5HOzUayCWrKH3GKAF9LnaM4f5BLOT9yc4ZFEsC+BJC590TM+K4VkQwN4hh9gbvPlbZ4XtcA7pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMyFCSr+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so1418710e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658113; x=1735262913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZqz3kYMnmiLR7o48J3cbcxBhI/4j/BPeIiFeEsL6FU=;
        b=jMyFCSr+qfNGAlSvz+aAjr/YxrW6KFx3EARA9yQ2SPPDW4LwrFvRWCuxYJQvo1Krxt
         QkPoQrOYtGucsrL/xMmtTpwWekcGGhahBs5rtfGn+/SrTFuUJFiXMQMHp96NrtaM4x3B
         ISorrV2KHxvOuCnczb+CneEeJVjM+9rsasXzq/6J+iF/BjXZYhZu4OCPnYD24SuT/FsL
         8GWf6Ma905XVG6Wx8z6kpp5PH176yDYOr/v6EEzmfWLRg+JSELlsdSB82sFv4QT72vzN
         vxaEZ/moqlgPaviqNkqFBYUqtq6SecuOlkNiOC4u/hwhOQ8Occu+xv9lKczXE9LUckWg
         fYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658113; x=1735262913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZqz3kYMnmiLR7o48J3cbcxBhI/4j/BPeIiFeEsL6FU=;
        b=YlEJHFMvurH/aLo2bPRMx/ys7wgqiBllI+Eqykseg16Yb9/Ayyjstiq3sZ3kFdKC9/
         49zHkEGGkup2KmCN2m7tmuxuwplQLrSLo2QjNrqRfX82RVECoKW2N/DlgRkX+Il+mjVH
         uTck6+mKzeU5BOw4VuyBKaCcCgSv7ok71KKnnJx3EU9dJk4mX8ONa69FfwwXGemynPq8
         g89qUrEA3FefP+cp0nTrZP7tDtpc3VEOoiRgxu8HJfY9YYN7I6+lwn4VNV7D5g8X+xZQ
         ODSKeipjfSqtj+WtdrqO87pvxKOSwtVhdTDqRkRucD6uKlOXj1Jp2HlqEmkj2or13DXV
         L4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUcVBTKetPgKRhiws6KmOdXFiowVHnyvLpxYy6FkTYGNVhRIBIBez7hLGffgu9CXbrRTmZLkRoUAkmduCD5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VaGl+4jzvxUKB1icGxaY+rwxHQ2MSbkOfsTRje3L3CWmmvyR
	XC0o9fHkxnrAtypcf24DNGyXOW+5JmvdcQLRJM2icx/twv3/dwsSF4aZwZwQaBk=
X-Gm-Gg: ASbGncvMs2OzJixf101NOSYYBsHTf/2+IOwujcA3PwWWfWrCRc596xZVjTPsrqo9OCi
	WxFn98Qqo0uDr+PboNIXJHA8WANEq17w+3SJ4lxR19KVifARiLFq8B6Wg3V0sH+KVB7zL8V0X+S
	9UAzkML3OMZ0ho9n/MrLpECU2RGHGZz7ll0Obix9GD1wuMn0pMrZzMATMRtPqKyG5Jldaqry8R4
	bI6657GDkOR6Vj8raUSwTK08j1gS3/daGJTte0raSgZ5mQ6Q6u1L0dB84vmP0Sf
X-Google-Smtp-Source: AGHT+IHu7YykZPfaTuYn0jd54qZX16d6ZpG1nlsMRrSl/j+R8LpdmSPs/7qbO09uxjUjWevtudEyAA==
X-Received: by 2002:a05:6512:15a8:b0:540:2542:6081 with SMTP id 2adb3069b0e04-54229533e1dmr192582e87.23.1734658113140;
        Thu, 19 Dec 2024 17:28:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: catalog corrections
Date: Fri, 20 Dec 2024 03:28:28 +0200
Message-Id: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzIZGcC/3WNzQ6CMBCEX4Xs2TXdVtF44j0Mh/4BmxBKWmw0p
 O9u5e7xm8l8s0PykX2CR7ND9JkTh6WCPDVgJ72MHtlVBinkhSS16NYXDvxGqzc9hxFbpZWxwhl
 FHupqjb7Wh/HZV544bSF+joNMv/S/KxMKpKsZxF3cnNHUzbzoGM4hjtCXUr4ZVf8irwAAAA==
X-Change-ID: 20241216-dpu-fix-catalog-63a3bc0db31e
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5aSCx0k8LhOK5y8eZerRNLzFjFPkZ0DBXazZ+khNng0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+Ye5BfK9stss01rwvB80sz3ZLaspC31dvO
 nXccUP4Q5CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1b7iB/9VuVEl5ukn0DBd5Q5ABA4WuWvNSv1YPMUb1ge6CP4OYurqKos2RRNvRThDC08jflHGsdN
 I7LkL6kl6cDKWalDZv2sJt9YJnJDB0mpHPrDrgxzu66zIF/zHIJiI9RuhXL+VBz+2fFxoKNwD5Q
 mb/FoALFIPmJjPUnzePbZgj6OJ6Y7NpnmEnoAlQqmiQqVwpNMorDtLVc1HakOeHZwsc78hZRh0F
 GC0wQR4b/3lyI2ohOrBNM6/zx2Hs594/Z8VU5IyyvwEXsiTTeMLZaEh1JHXgogIqsUA0jnk7qsA
 LdC12gJgQ/cioxtCkjm5SET83js6BsVxDsvR99UZLa0POBfF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

After checking the DSPP units in the catalog vs the vendor devicetrees,
link several DSPP units to the corresponding LM units. Each correction
is submitted separately in order to be able to track and apply / skip
them separately based on the feedback from Qualcomm. I think at this
point only CrOS compositor actually uses CTM, so these changes do not
need to be backported (none of the CrOS-enabled devices are touched by
these patches).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expanded commit messages to mention the resulting effect (Johan)
- Move the SDM670 fix to the top of the series
- Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: provide DSPP and correct LM config for SDM670
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  2 +
 8 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: d82c9281189d2b27642ede2760db495379503b86
change-id: 20241216-dpu-fix-catalog-63a3bc0db31e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


