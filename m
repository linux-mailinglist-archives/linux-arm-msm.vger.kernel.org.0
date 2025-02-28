Return-Path: <linux-arm-msm+bounces-49790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E28A4902E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E98F3B291B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1DC1BD9DE;
	Fri, 28 Feb 2025 04:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCzvX1cv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA461BBBDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716066; cv=none; b=PabNFaOgxvfatg2qTzxsZAVxvptPFPQ857u+SIouzqUeHUex+ePuVPCQ891njUvxFRkD/YX+HUH1lYFa4f8hdfFENWiPXhk5mcXsiBklM587mSZUa2JrvT9AuG/0vvyYN18vYayutadfXZCxTXWV01pLQdUVau711aA0q1NwKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716066; c=relaxed/simple;
	bh=Mj6W/g1cQTXrPDSCV2G/UAnCYQZDcnBUJoxZDb1VnZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoRcPLg3XQF2wLGk8eIODUC9pSDErKzaUTC7ZwLa8rMG7BqnOLJdY/i0HzdStizfeRkFdGVTvqfsMAToXjz/PTXT4HUXOpDTOW5W/9t5qI/z0zl1y1UOfxnXq6PpiVpjs5IF2MrdLvKV8RX7wq9bUQTyMjGFaiJ5dDB8k9CSirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCzvX1cv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54838cd334cso1886294e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716062; x=1741320862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
        b=JCzvX1cvB5WyqDebFFS3OiY4LSL0ijFp+UjaKNkgZV8SvZb5vDcm2XmQCqN9LZxADh
         3vjLhNYWG2FvkAl0dklhve8wfPnamp/UXJLMIL9XfC4fJBh661iemJsXg1R3U0w/x3Da
         sG+8g/0dHzjRbgVXBu/1qXJXPlka56uPQgHmPkD4OuTEXpLXf1dtzkdSmEeM43faelgL
         6vZYhhEqGAF1emODI/7lZRc8XzgHsWSVK2Db7GARH9/4YSt2lxusHeYscX4dYjgqHlX4
         OD/5e0hWQh4wke4ZOY6coNFb2gmZaFzs+5izFPKqfhjxFDI/LRcIPlKDUl8yNghdBH0o
         /8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716062; x=1741320862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
        b=KVqXhIa8hziSAU89U7/y39rB3vJu80gmj7NxND/jmyHLsDbG6EcsLKurfhSp/Mpu2u
         JPovh0BLZdqCZm7+kv64szkfyjnzok8HNuu1uKGBKqbgXFPCtZWm50rSWq/WkrZLw/Sr
         MvF45W1cWh1mFkT24z1r4Pi6RuyQi2m+yErs7YiBJg2h9eHkvihJ/E6Ia8denbLt0FoP
         bpmPestdbjr6p8T52LawGJKlb79mxMBU9oB+fT0gMpXL4qNra5C21bEV5zRNEjm9mgTY
         fNHMNKM+gHNdb1JqRk0kCuxX1t7aPxIH4sxJb/YSU2CgIucQjIB/mT929D4oljxgJs9x
         YB7w==
X-Gm-Message-State: AOJu0YwKcvcFQIcmwV60IasThdLIKnfukx8tmleFnze73mfOQe3nGXo+
	dEeEUxRdoC2WRrQyrh9Xb1vg0Zl1MK1CTEVTQ+92E8qVSFesq3pZTil663lPQqY=
X-Gm-Gg: ASbGncvbS4IDF+YsE5RTMbgX+s+2XNjyupfrWyhQ3Xky7MwNB/sF0Ys6G0WOUmqSydK
	0wloGn6j7dTeRBtOa+MS1t8Ba0N50wHM408yT0X4cuUeThWcQyXKfHtBj79OwC6eBzkHyiYzvaC
	socQbFtl/HTko+n/3N4yLBG4oLFhSawgIazk4xK1JmZr1qJnbQ4E4OS2TRkSrUhzW9ymWHq1UGV
	JrS1lGQAf9pErgJTJUDjhcHrMQt2DU7fsNs49BTkqmPJzNT5yrqLV8uxSxFaaxxCODsCzH2XEZV
	1C2GSI8QfW1vsWd7Z8KS7zrDg7jgXp/eUg==
X-Google-Smtp-Source: AGHT+IEmKR7512b7rPCxOxH6Leo8TXNyRwalCUNGBUQoHUipqV75M6jxF5LcurElBJTLK8KR7bcGCQ==
X-Received: by 2002:a05:6512:3a90:b0:549:4416:df02 with SMTP id 2adb3069b0e04-5494c332da2mr711075e87.41.1740716062588;
        Thu, 27 Feb 2025 20:14:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:09 +0200
Subject: [PATCH v2 5/8] drm/msm/dpu: don't select single flush for active
 CTL blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-5-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgP4KRcHBqD2Y7auegS7rtZ5I4melMFiEZdK
 0WuqCAAgLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DwAKCRCLPIo+Aiko
 1XA7B/4lyHDEWi+MrQa5obFMN7alj9kvr0s/v5T0MSenczs9W5rOlcwWgZwtTlYOZ0DwtObtB8P
 1X2H6gJTY2PPKPmSET/iTt/PH/cf4ey3p1+ho8iogaBa9aykS5QeNavZpoRvwhTYv0BbdB2IinW
 IBtEFNuQFymgDrk7J5xvTIRfu7ncagUaFRgx/abgr2CDHIYmqI6tx4gmx+bIGmIliknpmSVh3lE
 TCqBeu4QnT5pa1V0XSZYs0uBErCBw1ukukGyaffORJx51BxxAqyO7G8K934LDptaVpm43kF8wZq
 lMZRTp6stKw5JrcxfjzZrZmv9aCoJ7AQw7s4Udj2IYgbVShB
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


