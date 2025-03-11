Return-Path: <linux-arm-msm+bounces-50927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1EA5BC2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF4E3B0122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD883233126;
	Tue, 11 Mar 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kJNYxgSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32B233145
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685153; cv=none; b=XHUmIkkNjbeIOXoH3K6mILbOkHJcAak5SWONpLbpUewCJMaYWvjMagxGVTW4ndbtBLqq4IUfXI7pa4e2Oi7vRkhsgColxJBfd9eDB8x10G8jxlnVg1vRMMKwU/3c9exD0fbt7OtprlhF9mPTZDo5vRPV9Aw0vO+PS615L0rlnUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685153; c=relaxed/simple;
	bh=bCBTdiY9gpe+GjDTQ9nXaL32tLWbU4XYtUC4YeXNwR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXXF1G/W4g6LfJXMICAE3JNlUqRFWdNi/8Agdd4rsJe/3ks+UssLnErpPMOHDtlnA+s2hcaO+bQXkzaWHs9bqTfXzFJLb57m108/HT80lgT7Rk+vAZVVbcVAI+dvig4XSmW5wXD/SNnw1IaFNgXv5TrlDN8OOs94LazHZxsGY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kJNYxgSJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so3134195e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685149; x=1742289949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9l+f13mJPHrOnkggdATcJ5QYvscLs3l7oAK0s7GLCc=;
        b=kJNYxgSJCmXsB06S0hbrnzForSwgtwjq4SvYw6NaUrT2GsJkQj+pMPLrTMT5ofxpzt
         nsOejdDa3eOPxYURJAHJXmHmv7tFLedk7EVQG5OYyjhlXvvyU2k0OkDrbqcEF/Dj6MLL
         /3R2i+JPjrsHComIOrN497hpEK2GFenHkvEf44A17jVUuHzyp7tDRSwywAz0FBprHHTO
         3ivdbFiXciNLMtA3ozJCzeBG65l8/egpxq5yN73zrACcZTYzf02Pkp8ejvNZ97DDGmBa
         1D1mpg3/mmyK+/aSdaT5wYM+GvdkagN9qilJpijQK8a+A3V4oZ3iBtiMa4/LApnagmi7
         eX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685149; x=1742289949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9l+f13mJPHrOnkggdATcJ5QYvscLs3l7oAK0s7GLCc=;
        b=pAbJP00DT1S7U16o43ATCMu5qNahqD0Wcm1jlBUF1Rw6BGSp0uEsrdEunQUgDfvdPy
         iMmU0baP1hj680I8xCVpDjGMFezCSIrEiNuqBd/Fi0+7msgFEKOXybJKwm6xLnwL9vGk
         8ard2phIeWlQIXjoZTUmjy5hH9l1+g1OlUKtSSbrqFbA07A6Z3+E0Bb/E67ivGtq79wM
         qXKrA0TftoYpeok1CPgKhHfsbaMZqpJyJWUaqCdO6pncsFK8BA/k4MlLNpQhlrgRTrn4
         +rjYnF2u1+m3VYIfLxtLZA+y0w+g8Vuoj1hgOPyAYa5eBGKQYvNRdU+jz8GAtrA88jPE
         6YvA==
X-Forwarded-Encrypted: i=1; AJvYcCVwGyd4ijEk+An2gcAlvhsAVAV1zvhOHJOZ6nWs5SIqmPo5itTzlyId4nil/46Yn+gqBi/N0v9Ij+Ueza84@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuk3akLNPOcA30j6LeLDuTJG6A3z01Z/5yBEwPTyVolPLrmwJI
	NcN0SBjEUH59oX46t9CbW75gtnzveFUYfNGhVvXC7iKBQfNjh1vuVIhwnghYcNA=
X-Gm-Gg: ASbGncsX98PYxlHyl67pJs7s9W+bFK8t12rY/xr0pd/BcJNrikZxx8e24Jk3quhHQef
	N5NkNTmSt6spppGI3K5RRZY6EBR/dAD78MQSlBEq8a2CD+TE7SMD8LJtlLu+sdzwQP5vBfeZFxG
	UcwrfbKiKJe1bJW/7xvgtOMHmioZja9GGJuPMdNNbcRkfJ3U6ley3GE7YRy8iuGu0dqqFxtNeVA
	Egn4uBJaBldINm4I1vq1haB7LNIEWzFOr7WERuA0Vc8ONZjtZU0iGXhA98fskqu73eh1E6qfngG
	v3NMsQQ6ZEUL4z8eAFOTuEu3a8IChH4sk5Ek
X-Google-Smtp-Source: AGHT+IGEfyAw8lpsLkp1GcaKZsAIlWvd32NXVDeLfcXx3xz+a2E6j4imBlL6Bk3O5pZpmhsKNDWD/A==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43cfceb0aedmr71012795e9.11.1741685149316;
        Tue, 11 Mar 2025 02:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:36 +0100
Subject: [PATCH v7 5/8] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-5-db613f5d9c9f@linaro.org>
References: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
In-Reply-To: <20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3050;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9sPBxi7WcEbGhZ0zJXrjtGJm1E4sIIJKZPL3u1QqT70=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGWE9pP2abtJs+cO7NhWomGNMzeg6/jFNn1m
 ety2TFhJuuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlgAKCRARpy6gFHHX
 cpSSD/91fZUju4zUV/ZekXs1tZBoKMTQqJ+czHlnxT11MLiRsg/LV4MsJahOedMuSoql8s62r/W
 8yv/rhWQ2jJu4dFi+7yUsgOuzkovq3C3I4LBY5nOIHGrzndfMDLRKKj+MmcQtgb++A2ARlFYZQj
 OonHKfEbymseprlvt2ujCmqw1Z1erF7SUTJ5Qcve1IZwxDOUx+Jcjsdek+iZErQJp3N3MzyabIg
 rLOltvTYAaSAv3mEVFjvQzPXDdJwH/XItvbz/kWPwTxNEZ7IPYOCc1xkmBfHGYQAJwZaZRrNetr
 EerORctn8YIZ4Pu5/ReqMOpPLCafLqW8DNVShzhXQmsBr0NCQMQKLhqGoywMJZh53eoYXlyNQuG
 P4pRaPRQk8OXUg2UQ1j6DX40dO4CwcffVbHGKY2b/RpkHzmC71oKQ9GperypP6I2X8NJOGfLag6
 9Bh9KNtjmNKNR3NAKJu0VmW7JnFghbETHCCV75FEyaoJOkvhggnLqZMjqoh+4hK4fUypbac5h55
 hT8Oi6+Qz8mXQwQgKwpUjnnNJl6KKx6MGu+6FpKrmlE9bG+r7GeK+Mp7eKudruwF+IiKclRg7eT
 ACvkewx/fYjaU0HcoMsSivLwCXRXH+e0FDxMHzaT3XW2nYcLSBiOJ+62m0670IEyarKdEOAhV4b
 dSs3QNcfVaEhSwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Md Sadre Alam <quic_mdalam@quicinc.com>

In preparation for supporting command descriptors, map the crypto memory
range for DMA.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
[Bartosz: add kerneldocs, fix DMA mapping leak, rework commit message]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 24 ++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  4 ++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e95e84486d9a..b21c4ecd2034 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -187,10 +187,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -200,7 +209,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -246,7 +255,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a..b86caf8b926d 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -26,6 +26,8 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -42,6 +44,8 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.45.2


