Return-Path: <linux-arm-msm+bounces-43176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC3F9FB933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6912A16044F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDC613C9A6;
	Tue, 24 Dec 2024 04:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0+Uz5Tn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF21392
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014323; cv=none; b=LfapIonEkAtQlFWR7g1sRYICKKKXPooplc/nhdJUNllQCH6ek+b5k2Pp5U4x2XOY2WDhZUI9uf7ByIjUolg4pYEJOTYtI+A/YBNqtNZdhxVd4iScIejMef1TKZtPO2pGzC5ORo2sc0phygIxc4M4bHK7bec7fz8MXZUo+itk5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014323; c=relaxed/simple;
	bh=gq6BFJO2Z13VvS74mOpqa6wf1Rf4YAnetLXcK5ujg9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oKbIMEyExCaodUUARiNpUoaLyL6kVJJ4BGBS4W+4EfCLG1ajCQgP4I2zutWkZF5twp/gsMVkJB42byWiR+IWPPILBrPo4JgcF4m4kCJKvKk+k96Q5YjBslGajs39dkr+mZPgV8i5L6oXUoZKtXicyFm4c42fdTgmbp3n1duvZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0+Uz5Tn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso4307233e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014320; x=1735619120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ygTRY5V/n/SAAqBUXqoeY5AEFJKlUU8dtvqLtn/i2bg=;
        b=X0+Uz5Tna3fcG5TEqJ2EsFifGC06fmQ4l/FxB9trCVUKxebF+YkcA/m7MaqVANKAq+
         vMX+pcWDt7lj1VhilcmBLlCj/K0za8c981OOmAGkYFDbV8rDAMckGPfL7JoDW/3mtCxy
         QmYnNHqSYQ0OINIoxO/55+QgVsJDIDcMXfGRkL8aUAd1MOR7QTLCw51qBZbj1FNQyOCo
         h2LcVZqCTMvrWWzuc5raVtrhOxNuBUAg8+XHp5isb7z7pd6bGf+6dXlz5lpa/lddp/rY
         qFAVOwOCyhd8Gb1ZKgRrf/0aUqnqnP63mYExMd3ruhRguN2YbiVHTwtNm7gSjULOrQPx
         cy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014320; x=1735619120;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygTRY5V/n/SAAqBUXqoeY5AEFJKlUU8dtvqLtn/i2bg=;
        b=r4CtDjGE1Q2asGBeavA/t1yXfpoPWLy1cDrqVdbpjPHjxAcdvbOxyJO1UO3kQ803C1
         +p9w7QdExOWVnlYXIJfM4ozJVRpstbYrrNbfXDwQfFDu2WM3gtC6XKS9FGPcB7X/lajZ
         dCD4Hc+Z4zABWN9irB7BNr6MO1wJrvgzaQXx+QXVjUgHkfF7bCURyN3jOxl5rdupRQTB
         fp0xN4mDZiMTw3TNn1Cchkxu/kWgoae0YGLBY5yCYudQyv6SIbvfVVZIrVWW5L2ryx1q
         /eX4/mkwIxK06mP7Pc/bWeg3WTrTQykBrmPzooNH7iCtsV/J5rsIUgLUqfLtwyTawqtL
         bIwA==
X-Gm-Message-State: AOJu0YyuKG5nrffe3BwN91RTbKRqo0uDFnltREGl5WaFzORFaG2o3MVj
	Kr0tQIXj/kzf4G2Z+TT+Ljh08fqkbwW1DHi3sAE9tETuAPpzRgx/00xsQdN6W3I=
X-Gm-Gg: ASbGncuhjdeFFRLuCx11VidDDMt+WtJQKiMv7PyYPccSd8hA1h7lqCacaByZRspifbq
	90BnKrTaa3hs7L/a9Kwz7wgqr2rDbcOBXEPlJhLreiKPitK5icGNIWdtsSD/q9VKI75t1fDtjj3
	1ZdhrnriVakRzL52xg/m+FUPxl+DKQym2nLULZy3fSfpfdYx5J8dcaQnOwjt114EdSaiKrG48Sk
	A3Sw1pay6b+2WRB4D95TXavzfkscvuFPGEmvS7KyYxn+pfcptGTWOUQ5L+UvANF
X-Google-Smtp-Source: AGHT+IEp5Eg8UDn8J7Q+aIPpw8Tmmk+o5v43IiL7cAbC7wYDJuehAgVSuJz+4gAvWvPOmCv0QJ019w==
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id 2adb3069b0e04-54229533d4emr4784103e87.15.1735014319761;
        Mon, 23 Dec 2024 20:25:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Date: Tue, 24 Dec 2024 06:25:16 +0200
Message-Id: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKw3amcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NT3ZSCUt3ElBTd5JRcXYMk0yRLIwvjtLRECyWgjoKi1LTMCrBp0bG
 1tQAxzxS+XQAAAA==
X-Change-ID: 20241215-dpu-add-cdm-0b5b9283ffa8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gq6BFJO2Z13VvS74mOpqa6wf1Rf4YAnetLXcK5ujg9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajetcQ+S+sNXlJrC5q9gY0e8Gy+fq0pWpu8L4
 6GrF9L3RlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1WQtB/4xX45XjF9jsmXuSbk/Blt1rUfmcBvQNFyIgqSCfAMJLi9Xdh8LilxlQeIj2X8ht8BMplg
 TffcWdUktLrcQKpOf6R6HBKVueggrrpW5AN4Up7dZ23dM8q5xcf6zPkCy5wxa1cm7YoRxAJ7WjG
 SORkOHC3yIctmtE2S6TuCdYjHsdER7blHv6ETECnKy3ROKtcH4Bc65U2+fpNE3fGhpG8/bYtMhq
 OsJejc27PlROri5r+KGgSSKC6ed8zh5zm7KPiVNu1esrNKFxOkFo8mURVE+OTS738sEgjAFNI/4
 R5ut69967Ysd5e68375FLtyce6lU1h/S8sP5c48HB+V4gHFM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CDM block on all the platforms where it is supposed to be
present. Notably, from the platforms being supported by the DPU driver
it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
(DPU 6.9)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/msm/dpu: rename CDM block definition
      drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
      drm/msm/dpu: enable CDM_0 for SC8280XP platform
      drm/msm/dpu: enable CDM_0 for X Elite platform

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
 26 files changed, 26 insertions(+), 4 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241215-dpu-add-cdm-0b5b9283ffa8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


