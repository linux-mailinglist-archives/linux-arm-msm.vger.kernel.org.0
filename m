Return-Path: <linux-arm-msm+bounces-80591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30260C3AABD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 12:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609B7464A3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 11:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6D7314D2B;
	Thu,  6 Nov 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cozPM+gq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D1A314A97
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428880; cv=none; b=FAUbRxYMrWQFwdvcT7Li2rvjSNij4H3sKlKRNRBwOGtVge04es/GOUah9JMDZ0Zft/NelwHojURuZfM1knaxqLHf2cWDyYcB/YESrmzLv3492srHdCoE65fo6xI15ZqKklAMN7MpESzv5THU5CeQjSr3UsxjM9HuyO40isd1Xpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428880; c=relaxed/simple;
	bh=/4QBhPILX+5X6ezhag3LzaL8aK4X9XYd5TN1S9llZuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/+9ar1rRTCulKb0ymies2/Ifi1wr5FMx0FS+LyY2m66G9mmZxOmvCe2gIscsB1V2fkaX2scBcMVRqsh3pTticWJA0m5EQJdfStxn2ZEDChFVB5OVwa+GMBqlonyDVXUZLDQw/ZSEgU7Hdzgdou27GbiMSdVRjLcIH1w6fo1P+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cozPM+gq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso4511545e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428877; x=1763033677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZCZoXJ9tyVK56ZhBsaXTFl9gWPV9NIZVv0TaZjVvdM=;
        b=cozPM+gqPF257/AAvUHF4OUxs9MiaUza0s09GA/T2VQF+ZDJfF+s4G4mFRla2dnico
         2hGpS6k+8aqcy3L2Ye8kxwNnh6/n97WFndnKlZQfXhUyPejsFPKCBKXjJKcke85/zH1H
         YvbaO5vw8S+0FO9zHLCgjK/EVp8wuO8aNKAiOWM/bMX6DOnjHs//ulByqcTOPbWMdrvk
         TUiV74CdJCUU6oYc8hf1ZXHsSR8ISskjKSmSgfhPJS0Fqhj+HrGKVC2QXB0jeTCWFjAc
         R16U528dhCp3nKEEySIzWXmVZp+zPCS4gqWphggPx2hl5yZ/BS9U2DoIBgKUPopZVeAC
         DRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428877; x=1763033677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZCZoXJ9tyVK56ZhBsaXTFl9gWPV9NIZVv0TaZjVvdM=;
        b=UD1rLQvdVw7qz0GHeEVi7fgmkfq7tam+hXru/UaaRBYnqzcjoXH7XOgWkyj8KlPTk2
         mPHVht3P5AggfUmfEDYnPpHdnL5hHcqugPVMAAJek4Kq5h4EiM2hun5NT4axDxxHHi/u
         WPLnfzus+276mJ9q/AO1JDQQsN6DByLFgXGX7xNdZdYjS6UrmonIMCPhxdqyBSKghV6J
         K4/9Yl3k/1PDqK5XFSyEQ9wPJmyUsY+30Ob13OI1q4CUZnhxlwGWkZwjFtoKEJnXrLG4
         OU6chfwWvV/zBG/JSZb0e86IHTUl0O/MOVugVJhYqwn+AvOtIP5zfExuFCWJ1eu3whMl
         l4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeRBQTi+WkYPJx17ix+REBgwOCHc0dz1cbB+DoPiIP6+1/yTfTUzUBegaKsdCoCfg7QkMdPBLyFHbMKyca@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1yKKrXhX1ilaUumbAgVZgTWuC00lK11ghmawNRm2Fn0wc5IT
	fKQlIjWKsh7+Wo30ZLoT0C626l2HKOGw4fmyGrtUCdi/c4T/vKP3NgFR1K6Eq5HwdbNsJjCV3UM
	SPZhPzl4=
X-Gm-Gg: ASbGncv54UK7T5ALtxIgc6dQ/2XZF4qnCbK6EuvgFnVa8tfjBnxqS8DXq7FslATe5FQ
	WIjf4uhcx2cf7PmP1Nr0BGwS5CnzOPczseKnyxADdajqd+njsMdbzzi5uaQJd5HfNAZ+5kgyjCp
	5NnaeE9GtWv7v6VSOr+5llSu3yKGRB/dz9kbfzeQ/fEbU+gER3Csx1VitInwcl+WH7IB/PYjAXv
	MKur7/eEngQVXc97UCIO3TamrbI8AnDH+KnHgJ+MsXaXaK03IppLTTKz0TvsN7aHEEd3w9RyYIh
	/h3aXLosQN+H62RIvmIOjvzz0x8FEgKiBJRpt97vYqKWdzYPLiw43o0sb/we4Zchs7ZGxIiOAgi
	VXX1zKaq2P7+0IPlONaTTK6Wvm5Wrsvd2OqA6pel15x3hTYxbRvce/NKVPAFSUbNPDUHsp/IChO
	QApG8=
X-Google-Smtp-Source: AGHT+IEoXAUh9y67MgtZ/T4+RHHzxUkHerOKyg5NFcea653MMAitTHLap8TN4SHlWCmAxqH1lFJlTA==
X-Received: by 2002:a05:600c:528d:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-4775cdbe164mr62433665e9.4.1762428876702;
        Thu, 06 Nov 2025 03:34:36 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:34:03 +0100
Subject: [PATCH v8 07/11] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-7-ecddca23ca26@linaro.org>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
In-Reply-To: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KihkhkXsgDZVFVp7bMRhRGSm4F/l7kYDlH9NjlkYozI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe8Ry42D3ryUjeP0c/0Pmqoo9z4r8wyiSqXR
 SFSlEAdOBSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHvAAKCRARpy6gFHHX
 cqF4EADO++008kQ6Q9EDWBZgxlmhMZczuLDY93SmZLHXETOPEMuKPH2bcqkP4XJ0tjidhHLsrJu
 SZLvk/98dkqELZlj9RE6wdE4r+BmgqFlt7l/LxhhCkDLxoC47Ngi+XsQqxG68SP+RnJOjxdQc/f
 wYpSlMwh+YH2oJ4jI87elMTWEWlH/4t817TWLTp4fUnDFmpKSiv+LZ17fAsJUzOxlK68/NUovbZ
 s3MH/9Z5JIXVD/npEUUTrehWYIBybRRTeZ+svv4RHQ4xZr7DyoszfO7E+XGoPopxta3Q54x60Jr
 QgpV+SNqpf6VKViBoxMg+9hzh/uRfu+K0PcesR2QblmkuB64DTjxb+kB/CaVY7LOsZ7k+YPDkmB
 LTD5WVP9wvlCZ5uWwqcMSQK6IIC1chxJjdne5bzVwyuK8BP8s0pl3lQS8uiRcEraD6/O64w1Vky
 aKrkQRx7J4UrZUV7vwUz6NOGMC/2jE6fBGvieEpk9N8zHbqiHGm6fJNy014mxwQhTnFJoM4anmC
 o2SZh7XqPHrXLlN8Tk6PJnqo8gjojBGIY7aF1QuBWEaKudcfKkMJyceOHIhOTMXBFiX7MujpA4M
 /hhQ9G4+TZDJijq0LnhvBPNCjAA/FfmwjVy5T8DOcpi5lm0+hFLvEvXZdd68hslsmL3XgqkFFx4
 dDGrrcS1dexY/5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/dma.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 4c15dd8bbeb85f6ac0e463d7b9eab70faeb2be94..bfa54d3401ca095a089656e81a37474d6f788acf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,45 +12,24 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return PTR_ERR(dma->txchan);
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = PTR_ERR(dma->rxchan);
-		goto error_rx;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return PTR_ERR(dma->rxchan);
 
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
-
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.51.0


