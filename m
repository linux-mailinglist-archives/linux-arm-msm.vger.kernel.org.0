Return-Path: <linux-arm-msm+bounces-48648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A793A3D69B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA7B1796DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FAA1F12FC;
	Thu, 20 Feb 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Emu/dR3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3E1F30C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047195; cv=none; b=iXOzybuf78MS24lEUyQTfpatMm7EVjQPnsVBO9bVLW4zeSM5eCtf8Oy3jAGEDbEo7StIqZX/6xs4guNSxNzsdgxneLEklOazLmTbfNn1B61CF6ShY12s8lq7HCGwktEugOxIYPWp2xplvHGDvm5d6AFG2sYAv+EPIl1tOCzsnds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047195; c=relaxed/simple;
	bh=Mj6W/g1cQTXrPDSCV2G/UAnCYQZDcnBUJoxZDb1VnZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLQTxdawLh9qtu0fxoMkFHGfCtjuJMcRdgtoI98JJFmiMNNtuyMRpD41K6Frd1NToEsmmRXFogM3wfcl9x4GLCo3Dsf5Eo1wKGNVEgzV9SsWnASadSbuWm2mRrRmPbBs6UYAYI9wXMubOR4OVu0cifKWU2fVWwvkcYQyejRi9ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Emu/dR3M; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5461b5281bcso739870e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047191; x=1740651991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
        b=Emu/dR3Ms+30bqAlriqNt6uiFlb2cIJEZT465faxUXmi5fifRKF3Uk0yBOZCHllBKt
         eeqUHdPOtCrZoEfiadbIeeKRXqQ4FcSUpNA7Nm6zbSCvHntOyAbnHEgQ+dVMFHTfGxM1
         y01VDML+fOHrTT6ZcZ5kZrj7eaD9MzpVNegVfHYvbjGPmt47koLRkyFH+o2/4UFci0eX
         3WBTJMgT1HYnY756eoM3NzSkxfZxxSKXrHw/h96l9g6qRKzfPkr+/BqektBXNZ2sJCCE
         QfuhI/HTa3zcV+EjycEe0j69i04fb9uGqctJ33yN5S03GGMcBX5t7UmO6o6YMQx8OLcw
         By1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047192; x=1740651992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
        b=UWT2ZNq/mmn+ZGLT3hT6jiI533XGJbGBPZjm6S6F1lHu92pod/hvjyHtnPXmkyJsVe
         0siwh50r84sEtB/z057SqbWWzVC4kXUobCErmLZmoK4CifEB2/TwOVSajXuei92s3vpZ
         M7QBHeLR79JtcVCW0vAGBF965yju7XKuNwf/wo/aNp73kYOyygkgXn1VSFj07L5ctIEA
         YEx1NsRAdhBWr9Li82xeGbfIRdZIa8ZY3fNxrHqHWzQYOF2vFeC5Rl6VW/3mhunb09c0
         MrTTZgTvSvGJZcEdczziBSqwWD5Wx+z7q5GRt7I+NeMOnEqV4aCPPKT0Kk/v+DMT2Wc5
         3p7A==
X-Gm-Message-State: AOJu0YxTOtGncD6+IJkgmbLCcEqmCa2y137xvxALNveisV2FkBXApkne
	e7SNApsfRECDyTTrmv6mTkA5+uMA4QyatyaBSxYwqVZs7pAY1AP60puG60T4w5A=
X-Gm-Gg: ASbGncsgEwbCvgvkbGEE44MR0cyImaQGBJe5q4TTzbSz6Jm1vnUB+YAByrPtDDuKKvI
	ogxQQ9omq6ai7uHm4FyZ8eMV6D8DPas97VTqOy2GE2Vyq+UKHqpVYQYUE4XBp6nlOPCe4OReSQp
	Pybm8ox7VLsm+nJ+ueUjfoID+F16KvImpX1u9QLJdlldzYOeIxoOR2YbguOk48HnVeQ1pTFt1/3
	RnqB0n6GpDjCQbn2wJHDstqkbLYgrgsO9oJI46M3VHRW0GzM2dzVzQAZnTgnk4+C6NMIe20/v+J
	eHqqnKrR9e4lIz40b8dkLxo=
X-Google-Smtp-Source: AGHT+IFT7l/AtVtBLArk2SRlJ/wJq5MyR0YALvIDoLeckr+vIWmad/Qo311RAVJkfTcP2k498cUn/A==
X-Received: by 2002:a05:6512:eaa:b0:545:c9d:ef26 with SMTP id 2adb3069b0e04-5452fea5da8mr7575910e87.46.1740047191589;
        Thu, 20 Feb 2025 02:26:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:26:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:22 +0200
Subject: [PATCH 5/7] drm/msm/dpu: don't select single flush for active CTL
 blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-5-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Mj6W/g1cQTXrPDSCV2G/UAnCYQZDcnBUJoxZDb1VnZ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNLSoDCJhBaYmL2ldFx0C1L91FbiV3nkagNu
 zV9tG1YFlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSwAKCRCLPIo+Aiko
 1Xl+CACrEnvEy3oMgM9VlWjdwvKg0hXcZYrjUorlyeRUYERUk9dlZKLpH1zwax5tK0rUBc6Eq47
 A3Jpti5ik0g9bLxSisjpAwlNEgK+js56CDJ/++RgzCxWtZNligajW7lTnYDiWekbR1DngK1HBLU
 RZtrlTc9BE62ycVDxN9iwpfzyZKNi7Odk6UAgnA1RPb9l/WBnh5bAqytMKywl70PCuDC7N6XkvH
 kKQhlVaF5U+ZYU8lYwds1aI8QQlXAQ6JtpeoubML+TUyeONzeyyJICJcLrS6Dqhec64HUfPnuGi
 TPufr0KlKKM4eweQwpOnN2F7QE5k4Qt3bfsUPj5sfEzj9JkU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(

-- 
2.39.5


