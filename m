Return-Path: <linux-arm-msm+bounces-83763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCDC91DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F1A64E7B28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930363126AF;
	Fri, 28 Nov 2025 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l9semmwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA5311950
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330266; cv=none; b=MFNyGFFy4pBRFUrzAy20yoj80Okc5WJRT2rSN6qo0f7RnO31Ez8yRI+2Q8nil+Gvb7Dbm+F+lSdHG9x2bVESzlxaldxP8g659wE60gFU3G96/tIUQK2kNoaFaVyXk6VKoJE7zyXGdIQqM/ordIdimpIkbrlE4Q0pm6VwVjjBEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330266; c=relaxed/simple;
	bh=jjPbOJFfXgc2j2M1nzFoNpgu00yiy6mM2ewael8rYJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuVw8/wwAID7yQgGfaD8COTydjbqC3E5ZMo0GUn65HQEOG86lkNyuyfyH4gYtvKuyMC/h3b9SQMf2Vh1/57mWSN+VPPGlYZQkOLhEnik19jDmShDrArzSu1w25ypYWwHoqnFhwEeZh27DgskCQNQGbZPE414liemv4nEuhYfxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l9semmwd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so9388115e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330261; x=1764935061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CZU5ZuvBdXmOknsghzwIXQPJm9VKwYk4mzQdsJqW84=;
        b=l9semmwdPbTpHmUqboWGFt9O+8mUTTMYTUNra1301ReM1EZVHAfpmZogyozTpyrLoU
         0xfu8KrxoINeD+pMfoa3YYJ9Vl58EYNOTvel02uEt6dgTTbvWhwfrnaiJoW9W+vChK0x
         OzG9V9gwk4Oonjx5ZFPurWnVQDYnWgWkNwNFNxuMJJH6yW4Ux41nTEaSXbYcCgFupq+X
         ASqgatsWPsLXHWsxCAVOh5RU6UxG2reJo8N0fHuLzmztVHv/9sN6v9OXfmgrdDHOKagm
         Gz1mhZxaqI2WYeE5Nfo5W56kNCWamLbzd03ODSZzg8PB7C1Il6og9lszCeIGfU8FmIkd
         s0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330261; x=1764935061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2CZU5ZuvBdXmOknsghzwIXQPJm9VKwYk4mzQdsJqW84=;
        b=soc9sezwKPVRwzO5IjFu+LCUlwfM4M8LEr5tbXw8CapD5gzs5RwL36ULGpbvpmefXd
         Nlwnnhzq/vfbMGdiOISzoe7ZHxtOWs+Erk6puemKcDhhfsHvzoLe06ihGy7f7B/vhClx
         d/cLyX1RXwgEQ+5XNVMF+dA5gtmN8a0zsIVWp7FeHUOqEvFp1nJcQkG5vZG5IWnpsEC4
         xinOCo0pQm75fbvu7fGRJCx5yMrRO0tDolU2S2ZTcio/y2kJ6kXrPN5j3TpEtT/F88sf
         jUSc2Vx1RQEQqIs3BcPWDZFtrLh8SLkeUVsGfJe6QOsIzmSwO2/YLZrcNWwYLNXKIXRG
         aiWw==
X-Forwarded-Encrypted: i=1; AJvYcCWS6TlMjR0xVijA+OIthlS43rYI6neveuX6xxllxLmfd6gfC7wgEtYs/qJZpyyTAx07SnlKw7ceKv7XEtei@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjmhF3fa437f+IopWumHT1z71tx5PiwozdSeE2AylgSAvQYad
	B4ylNX3HZ76LSCmItYU+WyVSjeEoJYKh+muWosn2acQnFEwzTw63VAbiVrTxV0Rt59c=
X-Gm-Gg: ASbGncvZYEdu6CfMhxR9Jo7h8CkVJSqvSfRaN1kc04OdnFMQEcL5KPPFHpkhdKIX+Hk
	hYRS9P5QEQe+4rmwyHl2WoAd0boNnKoPyxglfBBNAN86vrwJMiz46uq4t3ECY4/LaIqQ6eA9Np9
	nTG2Ie9MI6sdLawRVrQYvA7eyraxm3IpWaphuqM+YuPFpBVILR0n0UwTiJGsmCad4zLsie5y1AJ
	TGY6T7K9Vx1HRr9B1BIItG2IyIl5dZrc8FAUqT/Gd03GvDogRT7LbGzZlh+A5Kw1am0cqz7GdbG
	iWmMfDBwS1JfvoCG7zlRQzMAdhj274Nlmq4booq/gQydkPmmnPo1J8Kw8GDmyMaa6Wshu5rBzuN
	gU6BZXWs/nbY3sj89GOChxAW67qXaQc5Qhm/oNlnqOzaFnTbskELixjPLY9tYQI+bcb1sC6oYR9
	QtKQyBSw==
X-Google-Smtp-Source: AGHT+IHFIgYlBpxn3c9paAciRv5NbWK6ivHWHM+DP/aH9NlaBNBySq4rTqL0gyyvo3eu5I/G3vNnEQ==
X-Received: by 2002:a05:600c:4ed2:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-477c0162dd6mr259757175e9.5.1764330261434;
        Fri, 28 Nov 2025 03:44:21 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:04 +0100
Subject: [PATCH v9 06/11] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-6-9a5f72b89722@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Tu/2fgD2kuZ/5Q8ol0x7uSkKfyxWvVnr1Z7r0zJGsbc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsITfzj2E3jRweFoyHTvntofAw93VWl3pQYv
 s9g8B6Y92qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCAAKCRAFnS7L/zaE
 w+RlEACdr0H3twl7t3Ov1BXP/Wk4UR3tn9025w6Q7VABm8js7X99DLz1p2Mm5o8+KER/O3mrpNW
 41hAeQKVYETzW643dzTK+DyzCSkuuDe+bMfnzBtHNphSwm56ke7t0yoEvnu65v4ydVytj2M/hx9
 csSi6NoP/KEeZe7ohcLwpvin8bUQhcffH7HoPERF3ev0Ei9DFHXnVyCMUx/GsUcYRcpOuM+ZLod
 Xcwc2bldC/5hv4XiR/zsupnbY4p2/rwP3PkSC+ILTzxNTtepYXNGcFmDRPa0kiFAfoDwyL2fzpt
 z2f/Y+9c2voEoFttvaZRNoNOX9THGQO8CIR3YPiSaEw6pMlsDwIUEa7Qzvorcw8LdVCXQpDQT8V
 yw3+MHGZB3w43fMKy1Zai64xa27Sgb+u60twXM6GLtjgxRGFaHZNtyzvtijpO91Ol+CdWIJd/6d
 UK8fkB1Qe9JGDZqUTDH/7x/oWMWp/QMsbOyU03n2so6mbaniXsVvQA8UXfEzRG49nQzLocJ9CYY
 nzAQjNc0DWWlyiOjMP3wiAWZE27qD/e04/nNDLSm7wwREyHpTvEK8xs8OzkRav7Te1yStyyb6lb
 TZ7wrGj8z1Cua67BTQJUOIk5nGUVrc+w0v4zqLVZMJ2vKNOe0T28QoVWKPLMC00xmZzL/e6EvJq
 hZ9TET8WgkIWKKA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.51.0


