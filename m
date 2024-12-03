Return-Path: <linux-arm-msm+bounces-40052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1BA9E1729
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A40A28288C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FA41E0DBF;
	Tue,  3 Dec 2024 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t1Ik/Gsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489FF1DFE1D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217599; cv=none; b=WpCB1D2DKccKYr0HvB5AvyW2XnG4KYPFspsAFWaS9m9JK+cpUS4xaKIQKYyG0Y9ZugbyIRTQK5ekKFZhiH0QcitIhLSEUw6fbyv8MJ/XlUVvMd8W+nHJbgkgze+DHmp/NGlfe6v/wydm6d91Msa4SINNNbeiKw56FpIT5G/kNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217599; c=relaxed/simple;
	bh=+VpEigVc6lxA9LKBiAOInc8aR+tM26asXGWOiNd0c8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaSkIZFXXfNb124zFZVmhVk1EqEIbNjve2Ce7is0RFd9bCjALsjqnpvpxj9WLNPhHhxAUrubWBgiMJHIDz9sBJOjUWXNmM/FG9Rt8S7EtJYqv5JiluB8zbfenixuQu8POhilhwSts/4DxtepKzFSzZN7lAlgavrlJoIXivosdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t1Ik/Gsh; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3000b64fbe9so3594821fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733217595; x=1733822395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8j8u3Wa3a2CyIsUGNm4RzXAyNu0/dvUGsIrzSdp+VkQ=;
        b=t1Ik/GshkkyNCt1kIu2A9r8cEdVHmXfxzmBJZKC9bssCx9hQaUGsFPlAYKfy/ma//L
         rMB+kzp1cGUghRUxRDskGTAF972pQbk9URNOcF+GXylIZ6fyJpADVmV5ouAWdS0WuD5O
         GoI5mD4l4Wk4wLk1mH11k5sc4wkAumLun9G25tkqMbUvob9VNR1SFUqhVPOSys37LL08
         5U4msGUFm3nHM0W7J1iZnFxcbyIdWJ8+wXhoyTJtN8BbfN3AZCfniGkBZfww9jbjobhR
         fAjZlQcDvNfFdr3WZbFMAjWIRfcv4wNH7T2tVSefJzDoAA18nDGQ0wMhluiFcZJQDCIK
         bgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217595; x=1733822395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8j8u3Wa3a2CyIsUGNm4RzXAyNu0/dvUGsIrzSdp+VkQ=;
        b=DXXmOSdOv2wM27dbhWK832ud46Oj4pa4Us9cq2KwerdeJVk6IsJXyjA/0R8Vf+fLuj
         FtanAnG3sa3mIWcMtqmeH87sDVBc9NT8XDWQheSlcM0xRn4S0lqZsxggAAOvNj7TJ3AU
         ISNo5LGHkL8OSBPMoma0YP3lL1TbvCflwIn6OQ6jnrW6VuK19zGw58moFwc0B5UIIZcV
         Ygauua4cQsveXtxOBYP/z4WiswpDpDQpJN48xxdZYK5cnPEKPvuGzvgQ8AVe19SM6cep
         wWhzq6tJn4xex9GxROeZ18kbmSQTTl7TIc35WlKUUbUKm2ZACI6PhKWtmkLFB4wtiLvr
         RAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Wj0F01SoD67pzfj+4jdBZ1C6NJPl+HS7hBM6UFc43Xs+o8VbAuoelAZGwxg/szeLY7pb8ZTu1L7rXBXM@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqIZ0Qol0a6s70SWaBvYvaYqb2Q3Wi2vz+baRpNv4Kby2gf20
	4GWYCnzWDwmXiq5M7td8X8VtWRxsfmISkzm7FDPqQKt+ngdMi+coh5120oUdni41dU1MCTVTx8U
	0xgU=
X-Gm-Gg: ASbGncukhTCBzPqAyaSJmlGLMUU2tjT9V0D8LG7eYH7eVxWgpl4HRfaSSDeL9gO8h/M
	PlwKwTlLtm+suxSNGWEGDWuwaHIYlD8x48S9G/UM5gkxSn3/1pt3x+/8GHdrudiSu8Uge/BEADJ
	h3J/tPmJ0nl2zPVkUPhaO7G/5GeLGZB7dumC++Lpff2AbBUEFhZHN1PtlH878PA88b/ZG65WSL8
	JGyeYlyL/+R3TfhDqfEVP+8sJI9xtmwwzvFA5ijCJdxu9HgaW7+0ajqKWSDJQ6h7N4dTlte1892
	NL3uhMY=
X-Google-Smtp-Source: AGHT+IGTRPHLzsa+Od2O+5Vq5r0Q0wNcJxcWkB+oMesKwMmytxjH29mLGq29QHRwrq5YMCpTL1tlZA==
X-Received: by 2002:a2e:be88:0:b0:2fa:cc50:41b with SMTP id 38308e7fff4ca-30009bf6023mr9288611fa.5.1733217595149;
        Tue, 03 Dec 2024 01:19:55 -0800 (PST)
Received: from [127.0.1.1] (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm15591811fa.19.2024.12.03.01.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:19:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 03 Dec 2024 10:19:34 +0100
Subject: [PATCH 6/9] crypto: qce - make qce_register_algs() a managed
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-crypto-qce-refactor-v1-6-c5901d2dd45c@linaro.org>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
In-Reply-To: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nbVED4dd7+CBe0Mn4liIw0K/JKHlGMvh5/n4LZbE1tw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTs0yY2lAugX/APXTAaiXr52sczuy5mBqSvOr1
 A1zuRZ7nQKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ07NMgAKCRARpy6gFHHX
 ctp3D/4kRDqo7ceRU5VTbMDu5cHGuKvEQk4HFWugzwXQIkoWKFUvh4YLEBDGEKm2JRgijn4vvzV
 Bk6TxrOGczusyAdIZFdL/LvedFKBH4XsalF2V+qYROSB5sRBhPXWgpVfq+cLNyYZ/LECMmvRXYv
 U+qtM8FgrfNqwrVqon2EJ0GD3hEdEatVif+iS53g4nsWqVQvjPA+yzzQ6V96AkWYvyjyyEkuPHg
 sa2TnC73M0z4QK0fOFIvFoKT/39vqqpqHnkNXHziHTpv75xGKayrLSwYEUToXQ2UEeMwC35DV8S
 bMSXFOMKN14JbV8Bn2k3oXjTyuomyPmjI0EWuirUxfdeME3f/MCJWM3amBQKrNlaEDlS59Eg3dZ
 95gBOvNQzESMkHSYvMq8tbgshlhOybXbUTQZ6RCyxToP5uWqODoBuf4HuL9mbL+MIlEef48qcb3
 Qs6tvUFi0XS9Mwrq4IsefHGwvlmiPxsxRc628xwXJ9KtfTPmbXV/ryZPRm9idByg3EhDiAmA5eU
 KiEJR0jEHxQOHQTbHH+HtcZxiQeY5LwbHSRRtAqe44shWSqhH78uK25Kr0je2CDp7GqVKwKsWAA
 LcYTuBQxy8qfHhG4UjMHKOmlyCmotumyOhKMKfXFVZKG0vtR5bPu0XUzAXpv0FBAoPsuMArabad
 B7KdDGSu8v83r9Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make qce_register_algs() a managed interface. This allows us to further
simplify the remove() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e2cda24960f63..5e21754c7f822 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
@@ -37,9 +38,10 @@ static const struct qce_algo_ops *qce_ops[] = {
 #endif
 };
 
-static void qce_unregister_algs(struct qce_device *qce)
+static void qce_unregister_algs(void *data)
 {
 	const struct qce_algo_ops *ops;
+	struct qce_device *qce = data;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(qce_ops); i++) {
@@ -48,7 +50,7 @@ static void qce_unregister_algs(struct qce_device *qce)
 	}
 }
 
-static int qce_register_algs(struct qce_device *qce)
+static int devm_qce_register_algs(struct qce_device *qce)
 {
 	const struct qce_algo_ops *ops;
 	int i, j, ret = -ENODEV;
@@ -63,7 +65,7 @@ static int qce_register_algs(struct qce_device *qce)
 		}
 	}
 
-	return 0;
+	return devm_add_action_or_reset(qce->dev, qce_unregister_algs, qce);
 }
 
 static int qce_handle_request(struct crypto_async_request *async_req)
@@ -248,7 +250,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return qce_register_algs(qce);
+	return devm_qce_register_algs(qce);
 }
 
 static void qce_crypto_remove(struct platform_device *pdev)
@@ -256,7 +258,6 @@ static void qce_crypto_remove(struct platform_device *pdev)
 	struct qce_device *qce = platform_get_drvdata(pdev);
 
 	tasklet_kill(&qce->done_tasklet);
-	qce_unregister_algs(qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {

-- 
2.45.2


