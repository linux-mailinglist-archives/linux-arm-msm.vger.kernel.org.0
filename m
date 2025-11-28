Return-Path: <linux-arm-msm+bounces-83764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55EC91D88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76B033523A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8E3115B0;
	Fri, 28 Nov 2025 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ibdT/QXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014D311C27
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330268; cv=none; b=ozR8j7zOEG/dfT+MiKR1Tp9dfBEKde4xWdDQQJz3JC6NCEXVCkielzTnYVm1cSB9eyUjrceqeI+99RiKm1BH6WzWwQ8uz1ylebGN9iC8pL3eKN5p7cj3RTvNAQbxVcuudnE2Yr1JpWFcRZ/JlySW5uaS2umfGfyMS45yhbnnczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330268; c=relaxed/simple;
	bh=XImptFJap0oPq5WrKW6CqR31kSzqsIuoWmParQCd2Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLtgGzVrussZn2qhaJzsDerSbPZturf8XtjWBSqK5/8CFyaRQBD0/Hcgg0o+c2bb3KYuDtu4oXx4xvF0i/7ZPEMCJG8eTFM1hEEorTuk5JIWZ+iyZq7DCF0Otx3JTSiLXYb+F8pEm2uYnhty6RH1yq4R75LrJAuZ3p9sIWNoP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ibdT/QXl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47789cd2083so9215865e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330263; x=1764935063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ2RVnJy5oJsAwMm3d/sS5ZIYEn59yzd0SudjeWcx/g=;
        b=ibdT/QXlMxBOSDhz5pyQpm7OQJxIHMfFgWQRiQn/e+4sr5t3CFy6H2mdp37Ab+48qq
         eI3vFX0igTKM7mzf4g8amcPht8qpm7EPi3JR02TYL9xQ6tqUwOQHJMmf6dXp5aAKLZ8l
         rGZoZTBk7UTscRCsj3bGK9MzDuprIFZoLvYuZ1C7lVB2yb7AARZj4P5d6SRsBEyUubIm
         A1XRGQUFvdfRYigmzU7WaFJMTHI5oOrjD6CSdBVdx1xAlAcgJn3QV0+g4zWeZ7xCBH+6
         6tecMLxVkhT3VN9q9CZgDX778GQizHB59DK5S7FyWMcEb2LCVh+hYHcRgGYkJ1yYYFx4
         qe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330263; x=1764935063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJ2RVnJy5oJsAwMm3d/sS5ZIYEn59yzd0SudjeWcx/g=;
        b=CN/nIfqWgcKQl2YCtAmY49Gx6b6fe83AX3Ntghm39BLH7P7asUVEfvRVuNS0mwgKFo
         L+qP+iXfnMgYpgooKmtb2eOaXrrH0ig+Pbs8nwIxjAMUbvgAIDaG/4RNk8ln8XOa2o4r
         XiR89sRdf29AepXL/o2iEs9FWxdOoTeoRP/q9X6PpNr92HOJKBA41nqfwzpvz43YhX0J
         21/M5TRqxVtc+Ch/OqiIZxdHIXwpOtzFzd75g8w63L9Bs/QpClYLXKFm6ZgUu23a+CWV
         CFqgxUzKyVkfNuIKftGIiwcvfyvXOSG5O3NFUUlleZXg14LYyF07r54tdMOGyTieuXDU
         gbsg==
X-Forwarded-Encrypted: i=1; AJvYcCX9EyJU0x3/BRYtRrc0/OsiEOnq5EvH/93aoIa6tCnwOWIv5KeiBUabtnpsEYAEn/b3BOlZrqtXhZoaLSPe@vger.kernel.org
X-Gm-Message-State: AOJu0YzadITLkIDm155DD7VsZxQ1qpaCS8EWa4OpYXrdnz8Eppyg9PJX
	yhEiyf/SpdQvw7Nq61K1mjN05e+8f4EheKUYZwuUlJlup7SewZgK2oaT7+l6Th/QXvo=
X-Gm-Gg: ASbGncujwTcQaS44owS9NTPTQozbtAMRWjuMphVcwN+0Yw2kZEfaUoFy1FbxPq5+3c8
	6ucvp9qwDsoJ3K+967ZbXw+N4X5TdO7sx1yeu/+se/Z3MjPwH5FquVfS6UYZ4Ia6AScxm4qzyrl
	ZLJ9p8HOB0HBBJRs1jFVgO/Z254m9hrluvcK9WcVxrepoTnNKggH7HAVVgrJZ3R5734aBsUl+9G
	EUyVcLozmap9GwRBrCUclM8yNTOtUtppXuG+1SNOFHNrXJg01cvadvEJ980JhgJsV3NeelxnEg9
	u5Mf45qF1mXhctDZafTMtgFenEoVSG7KaRQWYmiPJI1hh9YsjrsJeChkIZuzr54YJpu8XeE4/Km
	r0uJI9Y0M+RRcrFSel/ikFFZ9/luJOaxk9PCVAfmKnKtkzpaBga68RF2LozCAm5asGKqkEwE9Tl
	7W1Xp92Q==
X-Google-Smtp-Source: AGHT+IHhhS4/wCvbANF7Uuf+oLjy3xxv/2rDCPnr+ZbQtZO8GRMgWdt+QrRLr5yvheEx+Y99myaphw==
X-Received: by 2002:a05:600c:1547:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-477c114307emr300576425e9.16.1764330262944;
        Fri, 28 Nov 2025 03:44:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:05 +0100
Subject: [PATCH v9 07/11] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-7-9a5f72b89722@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0HNGOpA5BOBppMRD34n6Vlm9z76LKmywM4te9hh3rgw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsJ6qql8IGnaHnHmPWao/nY0akeTfuJ+1g/v
 ANx/BW1yo2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCQAKCRAFnS7L/zaE
 w0LsEACmw5Al7p+VtiKsgT5X28Z0MSlzU52WUmT5dx/6YTDd7dz/8kG8oK/u0E93LHsOTINuET2
 YJX5F+mPovkmeV/TdynbCAF24QTr4d7hu5SnA8PJuHiBVOxhjovM49bT+baQfr1QYOjBqdQdIkc
 ZJP/eTUkNKr9KdjFwHJ+fd4XsRYSDuH+8Ossj95FzBr9feaRqGEvc806STtH3lftApVGRMwKLNF
 wXx3vQe94hl3JF9Zi8UamBVDmRubXQHtyOUpHqFyvzTDwX34uHfz1AMwxkNj6/jxuEIuitfCTHt
 UeKgKbUCdzwbDlTUHHuePv3SMmmBedKEl7e2aILqexcQADv8ozki6HJUrLIt4/7CjiI8WtaGMFy
 bN9uYzma9L/TvgWBbI1NX5a0wo4VygYxhn9mpXbwLsnoKLq2OTbo3E1gjHMoKZoojkh9aGXn6js
 VJ2rhdkgwxW++u1iy88Jj44VbMEwUZCwCtoYU5cWZQb0n0gFgL5XodxcLR6JAg99P69NQ0nhY8w
 bLVn8Pxan3DlErnhzZvSW0jDUW5ckhEAs7cZ3pwbjMjJc8YYbdS3Nj//jaNiUNx3JArFodjnLlN
 ARCN7iyXogCqURuExIR2b/2jh8XcxJe7DOgy1n/QBGtzM7iNPQ3sV4qOAfdI4OtVwke82hidYyH
 fYnVGVf/T5IPL1Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
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
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
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


