Return-Path: <linux-arm-msm+bounces-42157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B09F18E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4364D188EEC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9921B0F20;
	Fri, 13 Dec 2024 22:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbiye48n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7B1F76B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128152; cv=none; b=WKFDiIuB/v8C5xAxWYDAFDE2eg2IRcSynADOmKkrW9b68exuGdzJnMcdJZu79nJ9TaGTuE7vFSGDxIfJKovHJ9QiT4wifpABuck3o3CPmuER26H3I10VEx2OPYFhp6umL7KnEDNEZRtD0Shw3cdtOZRiErcbn4j56VhCIwtg2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128152; c=relaxed/simple;
	bh=hlCOG/IMMVZjQpDe5hK7mWJQbmUOCcipcbOQSkwTM8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+MCB0ngywrESIMbYt0QIPRfMH3qb+DZECjKm/TAIp+g5mjWEc3sKqAL4kKqmiKmraKEGwOtEbPiElUBQgONCzwwR9Gm5cUzTjmNxcKlzG9j0rFfbUZcNnyA67XluRycZXTzi3mwnKHoFZeG2AoozE8apJISDPOYl12J7kg3BXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jbiye48n; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so21884321fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128147; x=1734732947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8CJ5PyGkkM5Ge4k8pgvd7rSlPr0G4VhT2YhYoApx+0=;
        b=jbiye48nhJWTe882inxJXzxHVU3fPkatD25SAcCiUmmz2ZOmZ6lkYlahoLvlM9djd4
         UykAUuSUIkNo1jHHYs7CdSdl5EMkM30EkJ1Q2CeP04HJ8T9cSb1aNGJz2/7trJ8vHGfL
         CbCXhFyyX0sbXCaLyw4xznb/DY+YvXop8rcQ4YQXf8TUGRxpDzPBomaYJPTjyXuFihzP
         6kZQfhDjh1U/tjxBVsgLp7da81TQeD/m8RkXQ3RfticByPluAyZtDNm50EkyY9OY6x6i
         4WP77KEXaVKgy2KfOOjo5Krv0ZXCtmB5OTqEldV/i7k+iywhwYuMI0DA4I3jeudbnNoG
         5jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128147; x=1734732947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8CJ5PyGkkM5Ge4k8pgvd7rSlPr0G4VhT2YhYoApx+0=;
        b=aSRguB42j0qEWCJ/gC4zO8s/tz4sIhA9ubvOzvhdmDbPx+KtXGlhBzhK+nhJBL4qFR
         rwJtKL+UjjVX6o097DXDBXSs/lParhPDC5/JV6NP4R5seX46QcuE09tFQYCzFJhvpFXK
         8MlSldY7MqU/Ph2bF1U39ZfFhD6OGg4tNeahNRxR54gmPfJ/embmRKSmbuJs6zB0rft7
         dxNoZZsm7jmwFSfcnOc8sySw0Wqp4X/IlO88TY9AGAkoHwVgKAt6wUuM7rA7HH7f9WNn
         ceKT5amOY+IH3oczVogvNTabd1NccEGXbsZg1DV3rZIvRyp6jSmRwkaukIkLg3UUZKNO
         e7wA==
X-Gm-Message-State: AOJu0YxVj9lHeDcMf09Z7NciV2ECeP2ExFjTSBCsGeF5o6aNHrC6RoUQ
	W/t2D0kkAWba3rPfHa9E3bcHIGz4iZH1zlMb0vlT1KIQylFfyhB+OsVCJ7YmBe0=
X-Gm-Gg: ASbGncvORq9JbA6qaX2dVFWE2l4wIotsQuPe/Z7iCmjhQgGs3ZhsqCy0/ZgV2QrUcsd
	IPUZjfvtWDb4kNwwO9+V+Gzj7CAIOr6g/uSTLsOLZgnDTRkhDF5a2oOewglt7kEFNTImExtmuZn
	R1Pz8CFZp4cFIs9ZmOcY22y+s+6VlQ6TsynMXcDsfTv9rA2bwdV2WLZEPFA0J09P3rpCpG/e7cb
	jsYM8a08wfjGQ2mxC98DUj5DubsDrfaptrlUXH8pmpKyx8bBYSmzsFzQLrC8TsX
X-Google-Smtp-Source: AGHT+IGvudpnoHreCO5KIQhK9qwIa5L6cho7TQJdvBqPzj2l+x7eTsmEjbphk2uP/+FGeeeXkorPRw==
X-Received: by 2002:a05:651c:a0a:b0:302:1b18:2c06 with SMTP id 38308e7fff4ca-3025454f5d6mr11743491fa.17.1734128147557;
        Fri, 13 Dec 2024 14:15:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:47 +0200
Subject: [PATCH 31/35] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-31-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hlCOG/IMMVZjQpDe5hK7mWJQbmUOCcipcbOQSkwTM8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHIdKb5IbiCWlXlzhohjog6fJ8jvk2mR1h3c
 HTkOqwlKaGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1SVJB/0YyiYeGnl9rwP5nT9T++SfpIT+VYC5j3zaEY83RzxKkMjVnZkWG48601WHyzHBtNf+eM7
 PlTDH5WkWsy/Pk10fKH1iYynd56f3RNnt8eLrwsp4dd3FW/wcmf+o9m5lndxHLPHbf5f7s9jL1e
 DKXkhFxoZpM7EUo8/kuc8BDzGLncnudWMHDzDlsLtKsQJx0ZOq6jx4nFWN4tWzLZM6ChP3eco8/
 vvLOzKUqhR7uHhCtbsZtaPpnfPkWUUWHjdRK7tW/dZ+FCG2b5jQ3HQLN3VoqL3teZMgjZjMI/2Q
 1ZNcSfs23kcsR9wbXF6ExDeARq/Qgp985O2EdHeDCKycwmGx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 178c5440a9f4439b3e53719aaafa9458e353e58e..3267a145d8927c458545668607bfc1d82a6b028c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5


