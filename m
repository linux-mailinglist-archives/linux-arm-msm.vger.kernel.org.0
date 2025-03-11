Return-Path: <linux-arm-msm+bounces-50930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE3A5BC39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BE01748E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0772238161;
	Tue, 11 Mar 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ofB2xKzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103E236A62
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741685157; cv=none; b=CRYX+4VrgY9GMZnuJt4+Rgq5fvipWTqk7HHPGcfFSr4MmoPTV2JaWW0kqc98t9MpyKxvrHosMdKg8iO7ITF5FeEtmSn+5OKIUjvaGR/I06qOuGDO6gJiDtx5K3AXXR7vzlGVxsbCRIrfoWToA7pYF85ef4VtQcZgyzptkuCpMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741685157; c=relaxed/simple;
	bh=ufjgBriFPO+A7ho0VTKYaFG559C+e9CDQm4Go78wAzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsBUh5HP+jKjKHlamJiKcU41kw+OLKhg6Q+S6hct4N0ClfIaHO1RZv/0VzvKIRLq5IOhX5695zECeC4KRq25e1XcNY8jG0bSWVRCiaNBxlclVxcI7soY6cP8mPqII/2lJMPlEhmK0s5LCD5Isx2pg0VFJ8OJ6GZSgz2yupuM6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ofB2xKzd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39140bd6317so1812292f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741685154; x=1742289954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlFvuuZEOrpJeRtBEGpuQTKmyYbAYA8BV9Jv1FjV/XM=;
        b=ofB2xKzdYQiFvgV1x4mQjlnStbqVHLJBWn1IcU+1xIeTcmBFk0JbZFpjBe70V86WBB
         tH6jY+jmRUslERIKSwXNBnJkbUTJkIjzP6aGKWYsavZE5MsDAdKw/tbFF1aTaBMqnYdz
         1vvZTwdJpox2HPMhjm7AT2A1G6C0gBa2s6QoX39iSIKnFWO5/7QoAqqx8agtiqBy5hNb
         zAZW0ERFjN/fCf/geLBScBRIKYOiYCIf2rGPgMZuPunZyH36ivtRewgpVItlC4O3TXXA
         Yi+NeJBlZ3PpWI/z64PLvyOu/ZXAmVDpiB2ZiDDSihVvzvhxvMsWDSSJfEi/P8kQ4WUs
         tHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685154; x=1742289954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlFvuuZEOrpJeRtBEGpuQTKmyYbAYA8BV9Jv1FjV/XM=;
        b=X+f5SzYhN9P7wsUgdYHAToi1VJHHM2O+Wu3gt0c6vyrDQyOfhFE26CMuumWEyOeIoy
         BC38NEybckUAjyziO+a3TwU9jzPlbL3tDqcGWUz+pNk74MKLS09OYm9IHKhQr/e1Fz+R
         o6AjU9lr4CVv3P2dIqUZvKnRZztg44ef8oSVG5AfzZp7GYwlH7zQCH714aWNMnCT2Nw5
         H/c/Ge3/Wos+mrkSh8Tc3Z72jiHIwxmMqxlxt1OzpowHXb+37CVgsX7ZTO8huUSU/xwm
         7upRssyShvxAAGShhcu4HeCHP878LXuRevTyRhv55SzgfmeeUNXyVBTdtCQOvR4Tu273
         WsOg==
X-Forwarded-Encrypted: i=1; AJvYcCUQKY2eNaZH3On9zYmnewe8v5ckgOkxSwT4u2Ub7vqG4ztVskJ1rtTvNxDo+I+Tts2zRIBBcqDEro4Jqgt2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqv3bFVQGY1GxUgspjY++0rb9FZu01R3KMbwEBaI2VWRJ0GV+/
	luK52v7YfqknejgSGFlHdlzgOfZNuyXZzgc/ZTV3N1qPV3RIAA8kdfsaE6P24BY=
X-Gm-Gg: ASbGncspItv07dTeik8YJFSZJSMjCjoRGBDy3O2SpkazqUAJOP8r3lX6eLJdEU8Oxhd
	XAfMkGQvuXgJ8Hlh5/YqCB+dvVLM6sfdnc/vj/dsdP6dzTX+7QHtteyeNliBrG4xowyA/6tt6Mi
	HlqzIKs7teVXTjMPv9niXkwEPCunHTBn14WNJlX+eJXX3lSZ1MpQPeMMtIaTYFN6uIwEwcZUpXB
	aqoBXRWu8RWU+/ZtGMJ5KHkPl67ck+ORqooOdYbwFjMI91bafYDEEp+y7cEJba4cCw68xT4Rr/Q
	JgiTSAUERmqB03CL4ldlkrLYfONeNVz2A8Tj
X-Google-Smtp-Source: AGHT+IEW2hbCbJVhm6WHYg0pBOgMh7R2XmGC7pabSYhUG+f6aJX/Eh/0v963WXxGj4Z1OSHPW8JyfA==
X-Received: by 2002:a05:6000:1f82:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3913fde033cmr12119389f8f.16.1741685153661;
        Tue, 11 Mar 2025 02:25:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cea8076fcsm107436465e9.15.2025.03.11.02.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:25:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 10:25:39 +0100
Subject: [PATCH v7 8/8] crypto: qce - Add support for BAM locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-qce-cmd-descr-v7-8-db613f5d9c9f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6057;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mrvGg9IYidCko0IY95KksqDIDUmheB3bWnzVDjWoezs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0AGW3z/MEW+57clZJmFBlWb40oPbtQUg+R7rM
 RG+pb3potqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9ABlgAKCRARpy6gFHHX
 coa+EACj+s86pmH1/FV+U6jTKbWslnLU5pSjxSz1J1xTIPXHByRw3DxuqMVwyNyB0OVctxAHYuU
 WUfeNHgjhkY7mdhu7ruUxgA/DbpAggoCPnzd0T3EHbSRGj/NVsalYensT/Wzx/73Ac6HIeI8eEQ
 s0746GNrevv9VM+ZIa6vfd6wSEsiY0QC9CpQOVWPmIzJYjd5XOkFTUgLrGczu5fvZ1fACWGp7O7
 FQFiged/bW9zhEhdXYwQ+mX5Fv23kl1C/2VDsnqN/o1xlTZwe17rZkJMIPUP2wdJNXoiY5x6P0p
 tovPkf3+Mt410WvjsQLNZGF1CGQg10KfG37jX2rbdtlXRtTbY0hMXxnbVQkErvynLnNWS/GLVZM
 tqsoHO9lNg0iS4CCZ+gsXI+sS6A0FkgqNb/jjYWmZ+FyqGWdBpyLqXnmmpfvUmniL599tbxIIVr
 Xf29NF721nqKzCBuYyRT2IyCoSkmMLGiVoWffuAsUCntsp6LqXr+hRyfZqCqw2dDC6sW+xx8hn+
 09zGux2N0SaKZVwC/PkwySuWxufy+/0wcLoHV0esnnXhYeFqMTCBu20uaC5sU4joRbK4vwGRwCk
 JdSCafXkHVRTe/CW7HdQgTgYAEwGNTTJ7YYeyGZJQpjdbFmCTI0MjGstjMtZbaF1iFB0QWOIRMs
 GcJc1JMeyE0EXVw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Md Sadre Alam <quic_mdalam@quicinc.com>

The BAM driver now supports command descriptor locking. Add helper
functions that perform the dummy writes and acquire/release the lock and
use them across the supported algos. With this: if mutliple execution
environments (e.g.: a trusted app and linux) try to access the same
crypto engine, we can serialize their accesses.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
[Bartosz: rework the coding style, naming convention, commit message and
ifdef logic]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/aead.c     |  4 ++++
 drivers/crypto/qce/common.c   | 30 ++++++++++++++++++++++++++++++
 drivers/crypto/qce/core.h     |  3 +++
 drivers/crypto/qce/dma.c      |  4 ++++
 drivers/crypto/qce/dma.h      |  2 ++
 drivers/crypto/qce/sha.c      |  4 ++++
 drivers/crypto/qce/skcipher.c |  4 ++++
 7 files changed, 51 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 11cec08544c9..5d45841c029e 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -63,6 +63,8 @@ static void qce_aead_done(void *data)
 		sg_free_table(&rctx->dst_tbl);
 	}
 
+	qce_bam_unlock(qce);
+
 	error = qce_check_status(qce, &status);
 	if (error < 0 && (error != -EBADMSG))
 		dev_err(qce->dev, "aead operation error (%x)\n", status);
@@ -433,6 +435,8 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	else
 		rctx->assoclen = req->assoclen;
 
+	qce_bam_lock(qce);
+
 	diff_dst = (req->src != req->dst) ? true : false;
 	dir_src = diff_dst ? DMA_TO_DEVICE : DMA_BIDIRECTIONAL;
 	dir_dst = diff_dst ? DMA_FROM_DEVICE : DMA_BIDIRECTIONAL;
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 80984e853454..251bf3cb1dd5 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -565,6 +565,36 @@ int qce_start(struct crypto_async_request *async_req, u32 type)
 #define STATUS_ERRORS	\
 		(BIT(SW_ERR_SHIFT) | BIT(AXI_ERR_SHIFT) | BIT(HSD_ERR_SHIFT))
 
+void qce_bam_lock(struct qce_device *qce)
+{
+	int ret;
+
+	qce_clear_bam_transaction(qce);
+
+	/* This is just a dummy write to acquire the lock on the BAM pipe. */
+	qce_write(qce, REG_AUTH_SEG_CFG, 0);
+
+	ret = qce_submit_cmd_desc(qce, QCE_DMA_DESC_FLAG_LOCK);
+	if (ret)
+		dev_err(qce->dev,
+			"Failed to lock the command descriptor: %d\n", ret);
+}
+
+void qce_bam_unlock(struct qce_device *qce)
+{
+	int ret;
+
+	qce_clear_bam_transaction(qce);
+
+	/* This just dummy write to release the lock on the BAM pipe. */
+	qce_write(qce, REG_AUTH_SEG_CFG, 0);
+
+	ret = qce_submit_cmd_desc(qce, QCE_DMA_DESC_FLAG_UNLOCK);
+	if (ret)
+		dev_err(qce->dev,
+			"Failed to unlock the command descriptor: %d\n", ret);
+}
+
 int qce_check_status(struct qce_device *qce, u32 *status)
 {
 	int ret = 0;
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index b86caf8b926d..3341571991a4 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -65,4 +65,7 @@ struct qce_algo_ops {
 	int (*async_req_handle)(struct crypto_async_request *async_req);
 };
 
+void qce_bam_lock(struct qce_device *qce);
+void qce_bam_unlock(struct qce_device *qce);
+
 #endif /* _CORE_H_ */
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index b8b305fc1b6a..f3178144fa94 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -80,6 +80,10 @@ int qce_submit_cmd_desc(struct qce_device *qce, unsigned long flags)
 	int ret = 0;
 
 	desc_flags = DMA_PREP_CMD;
+	if (flags & QCE_DMA_DESC_FLAG_LOCK)
+		desc_flags |= DMA_PREP_LOCK;
+	else if (flags & QCE_DMA_DESC_FLAG_UNLOCK)
+		desc_flags |= DMA_PREP_UNLOCK;
 
 	/*
 	 * The HPG recommends always using the consumer pipe for command
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 7d9d58b414ed..c98dcab1dc62 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -21,6 +21,8 @@ struct qce_device;
 #define QCE_BAM_CMD_ELEMENT_SIZE       64
 #define QCE_DMA_DESC_FLAG_BAM_NWD      (0x0004)
 #define QCE_MAX_REG_READ               8
+#define QCE_DMA_DESC_FLAG_LOCK          (0x0002)
+#define QCE_DMA_DESC_FLAG_UNLOCK        (0x0001)
 
 
 struct qce_result_dump {
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 0c7aab711b7b..4c701fca16f2 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -60,6 +60,8 @@ static void qce_ahash_done(void *data)
 	rctx->byte_count[0] = cpu_to_be32(result->auth_byte_count[0]);
 	rctx->byte_count[1] = cpu_to_be32(result->auth_byte_count[1]);
 
+	qce_bam_unlock(qce);
+
 	error = qce_check_status(qce, &status);
 	if (error < 0)
 		dev_dbg(qce->dev, "ahash operation error (%x)\n", status);
@@ -90,6 +92,8 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		rctx->authklen = AES_KEYSIZE_128;
 	}
 
+	qce_bam_lock(qce);
+
 	rctx->src_nents = sg_nents_for_len(req->src, req->nbytes);
 	if (rctx->src_nents < 0) {
 		dev_err(qce->dev, "Invalid numbers of src SG.\n");
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index cab796cd7e43..42414fe9b787 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -52,6 +52,8 @@ static void qce_skcipher_done(void *data)
 
 	sg_free_table(&rctx->dst_tbl);
 
+	qce_bam_unlock(qce);
+
 	error = qce_check_status(qce, &status);
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
@@ -82,6 +84,8 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	dir_src = diff_dst ? DMA_TO_DEVICE : DMA_BIDIRECTIONAL;
 	dir_dst = diff_dst ? DMA_FROM_DEVICE : DMA_BIDIRECTIONAL;
 
+	qce_bam_lock(qce);
+
 	rctx->src_nents = sg_nents_for_len(req->src, req->cryptlen);
 	if (diff_dst)
 		rctx->dst_nents = sg_nents_for_len(req->dst, req->cryptlen);

-- 
2.45.2


