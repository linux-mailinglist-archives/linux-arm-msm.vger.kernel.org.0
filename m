Return-Path: <linux-arm-msm+bounces-23977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA099150D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37247285D95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310F61A00C3;
	Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Za9fL3A8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369819FA82
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240439; cv=none; b=T+VMv2XqNp9uPObGvkOF3+iq/0h+WK1pqoFl0YKcDKjYgdUhNUavzjXDyp1jac2CA+CkzV6VpzlvEsU8hlSbGDEqOVEIkVL38cvU6OBfDRG+bmhn+RFtug+jVkDpbyjb+llRVoLfPj9rh1vzUhZkda2GtBZGc4t9F/rrq5q30qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240439; c=relaxed/simple;
	bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+c9ympeCeU01Z+hAQ89ss1JDKyEqkuevFFe6rPciI+glElUZTcSlDCTFcS4vLqa87uU3AN5LuCvxfULlyy4bjNPlE5hAKg+7VOgTdepPLMit13xaDRK7vtDQwq+i5xvBYMmQFmR48PcGDzZ7tO8Q4d2DjpfVcRmHTKlpRwfIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Za9fL3A8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso958122e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240435; x=1719845235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
        b=Za9fL3A8f7Z/Mv10pidC6FcqewZK3byvpdykNMA18B84Yb/DG5yKGWddB6VsDDWYOB
         vNTpva7JWSKU9Sxs396kV6hGsOoFXY8B9I77ii207OQrjkU2D+etBnedH7XLEilcNEf1
         fGFknrhpPP0h0gwZFp24fX+RmrH//o+q35EmIQA63we4g9JOC+0RYb1JUPGDom/Oh3aI
         piCUSb9NUimFyg27t8OYNwp8OiQx0qdQqSjxdEy/kYBzEiuKTxPnTCvDRZpq8Mt93/Ds
         eb+WteWT50DoUCzNj1aG9PJA3SM4xuyNZ57Ew06lTn99DHlhoY036qPCuKVau+6uSA2C
         Ytbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240435; x=1719845235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
        b=iXRNgWbd+3HDNNYtq5Jyjb+dO535TJSRABfGYg0COdtpHxozYf9RqEHTgbVYW0lHP5
         izmOHm1Wr6IrCVEaQzpiNPTfjp7EV9MKNjOTUy2c89jRuZkC+HG4cL7fHIBmw7fZwjgE
         raVbWL2AJPAc5Ot2IndiHVxpzsJycWhAKH2Eyn8TSXY6v3LDRttmLk8jwyagpAp6mAbi
         dVx6+czFnBcmGDcD11d+YFVED5Q2mlcRCGUH6e9woY3u+7PmMep4KRO5O976cw87g/rR
         KJsNjp68ZWWTR/XpEw3j24ymBGuCMz0DLSD5KQCBzZ4JXZ2YH5jHoYb8rSgtSe8xFC+N
         JMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUonCsWaZYmeG2Oml/1JJkrdU7ZpXzdE03zyCdQyNFTA4Fd6UtILbUZ8pBeIePx2nijjd5sEQNsLw5TF+1KRKlnNglggTmhF9Brn0HaCA==
X-Gm-Message-State: AOJu0YwtPPaueHrrDY641y5lBVWGW+dsRlA3Btn8y2dbNeTtmJH7PQ7X
	oSHdaC5GpPbn+gF2Nrb7qahprE13q6YrmeO4yJY8qtu39SqGaCNnSH26TxTZUmA=
X-Google-Smtp-Source: AGHT+IG9XQZH8vVq5U1wPy03/Dvvg6G4k8zrzQteJbpTunyDlaiRdE1Gt9CrbeLQb42jxx0g8S8k4g==
X-Received: by 2002:ac2:5323:0:b0:52b:c08d:2da4 with SMTP id 2adb3069b0e04-52ce1832bb1mr3251520e87.25.1719240435499;
        Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:08 +0300
Subject: [PATCH v4 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-2-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbuJwKa24N4M3csWqmLjl/yvXWGrIS5Dbxc/
 fnHgz2KVlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7gAKCRCLPIo+Aiko
 1etuB/oC/397sgNrRpSvQW3fYMrq4rjPdn53SDAEGzYshP1DLO0GM7Axckw0GgwOGDG9SKNvfrF
 wA11CMfdcB1BCrgedxzmu25sDLHGQIoIB0H+a5X6fnLaQoqYt9H7jshYymwHugSNClQdSODpDJN
 VK0oUzbNSL8X2OwxmpVRuU2/KLdH8/BW3yc+AJL2lnFZGeGKGiSJXdjug/fz5DyVp8J/mXaa/Ek
 bReNuzxc5kPlv48WomDg9DjdoMUU/Lg5/FkX1scY8zojVeOsJO9J1h/u5sxuOS3zFxcTVVway4H
 u+f2MUbBxirh6ugA9Qyf+T/KheEQSaVndcrCZ3MJaw9EtRzC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. Use indices check instead.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d205e09cf45..7613005fbfea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1186,7 +1186,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		if (i >= num_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;

-- 
2.39.2


