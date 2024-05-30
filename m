Return-Path: <linux-arm-msm+bounces-21040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC78D4283
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9EA1C22BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C225FBE4D;
	Thu, 30 May 2024 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfOCw/vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385D10953
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030284; cv=none; b=lTQwTkJp70kKHTc7Uv7e9CY7G1ILMLBHss67Qma0pjVp99YteHkK/e5qmdzXVLdDtb4NqEelClhJC/nY4RQ7+aAMc09rKjYDaz2TXzzddp0M5866GP8Nm5YSRrvMwyisWJD7TGukwbpxnEb0EqoER9Ix4v2T66eJ7BCpFRfGMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030284; c=relaxed/simple;
	bh=qSscqI2jnEaKNqN3eGGmydizc4eKU3xik0L5S+IZ06Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U5Q3djrx0kRbx8wZwSTGZo5uHEVDCAJbA58rJkk07MLPiSIRmc5JWFeoVh7+RPfaKfmCyN1MeLTwV3FjSfBYapJTuFzwyk/V3yeEzNVg7mH4crCA2XvavGRfMeMLtO58TslmMOUzN4ybeWkS3bR2KTs+2IqMU21NgfAJ0HhKNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SfOCw/vZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b119986f2so372751e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 17:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717030281; x=1717635081; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz7l99uPeINg02KJ5xTzBJjdXsp8Ze3vOgXKzSKH2IQ=;
        b=SfOCw/vZgONaXKqfUNbD5Cjd6GL7yLdt6oUMm+AXBf5ieM6UUdYwc1wJS1DmnrtO+I
         T/JjYvGZ8Otc9htnuv79MkCj3d1DAN5QQsP/XjJxFJKJIDdHJA6silbVQ5swEcWvXEwg
         UTcLBX62jsOhcQPHbwGkvF6TNQVXob0cbMcmhvJFV6d25LHbS/rbWdeYnjMqS0JpbvHt
         DjP9yvp4lnMYOAyQ34YF6i6YL29L0lcZxt3BjN44/LIm7rQdn1M74olvoWblwu7hs52A
         45LaIWTdoqrM57mihuqgIf1KO0rLZard/rVY7OlLxezVclPELt+3URrIuw/e38slf5FN
         0UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717030281; x=1717635081;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rz7l99uPeINg02KJ5xTzBJjdXsp8Ze3vOgXKzSKH2IQ=;
        b=Grhz3N3BRR0jcQod+O8DGqhznVbzL6wIWYUDzE+g9wuyYU4lqr119QMrlsSb3PkFRl
         CJx3kVuWB6c6MEdHR1mnBXCQOEjmGch3Gx7EaboHkYx/5HYxGH60Px/jRsr8tXaxpLJy
         zms2ICWDkB6fYPIwEIGizPZwa4AUKGaVq5tk23XFnVAZ05vFXQsRWgyspio2gJriNRkQ
         mSyay0T69OjbukMvX/UXgCvkjoHuLDpc1ZNqx1Zj0fE9IfTBj/ZuCV1o5jAglQESYKbs
         TIaAexAlmb0GAlonyiyjQOSHxHhtYql7z5pdw1R/qLxCeUHaad88toiHp2qC9/FvNtX/
         wafA==
X-Forwarded-Encrypted: i=1; AJvYcCWWM2k9pTX4QLke/z0MOwK6L+CaZ+VdQYbSiI2E/meYeu/IGyPB7v17Mz8CH5NQOJ0q6JqbxXosp+tH5FMI/mbFngYRotFwf8TfoQjjIA==
X-Gm-Message-State: AOJu0YxrgwUr4RPSdnahDCZtyO/JSqiwqzpb9noSUipwDoQhH7cgHBr1
	4alJTNfVkPnmY0EbVDPbRxTTrKYCOqwh7w8eEYYmZQVC2AOfwaSj7WtYLj3zG9g=
X-Google-Smtp-Source: AGHT+IEIQngqhGpjdAJ/DjkazcW5Xs4Brbjw8XK/yqQEIjBE77nR1RptiDJjg9LmtRHYLmq1pdlJhw==
X-Received: by 2002:a05:6512:48c:b0:528:9d15:240e with SMTP id 2adb3069b0e04-52b7d47a523mr332225e87.43.1717030280909;
        Wed, 29 May 2024 17:51:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b233sm1396534e87.135.2024.05.29.17.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:51:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] arm64: defconfig: fix config issues on Qualcomm SM8350
 platform
Date: Thu, 30 May 2024 03:51:12 +0300
Message-Id: <20240530-8350-config-v1-0-d6e871236ed4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDNV2YC/x3MQQqAIBBA0avIrBNGzaiuEi3ERpuNhkIE0t2Tl
 m/xf4NKhanCKhoUurlyTh1qEOBPlyJJPrpBox7RGpSzsSh9ToGjVC6oxUwKiTT04ioU+Plv2/6
 +Hy4bV0hdAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=584;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qSscqI2jnEaKNqN3eGGmydizc4eKU3xik0L5S+IZ06Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV82Hcx4jM2awZXO5tVolhFR9cQtF7qsw9zQpb
 pYtL0c64LiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlfNhwAKCRCLPIo+Aiko
 1aRaB/4rYJXXzW3dj87Q9Rq+egkSpvErKwTcQlpQKJfS0VUhoXAO17JGwrDnFCH2nv0bdEG6Me5
 A1luxqzKPRw/m1/XCm9TgB9PQD1bPckn6PBerRIqRtIOInhcNJHzauMuGefcINd+b9E5qOjqA/H
 rLQErtAYXRVZNIpkXTirPKpmUs6Qu/eabg9dsRZhwt59T5zABx9J0nGtMzoP3Jpkn9en0uza80p
 o6cgSyazldAOF4G99sxxY8fE9RY8RGI5EjTWj07AXsbedlKWW/snoi9vIjhkLzxwdfGJVWc9C8H
 mUeB2dOkmPOLFhYv0vcC42y4A6I6c07zJEbyMSl/Ahe74XnB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix two issues observed with the kernels using defconfig on the devices
using Qualcomm SM8350 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      arm64: defconfig: enable CONFIG_SM_GPUCC_8350
      arm64: defconfig: make CONFIG_INTERCONNECT_QCOM_SM8350 built-in

 arch/arm64/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240530-8350-config-1af193610ee2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


