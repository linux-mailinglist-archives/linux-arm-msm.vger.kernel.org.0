Return-Path: <linux-arm-msm+bounces-83762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E516DC91DB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36C484E24EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BC9311942;
	Fri, 28 Nov 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K/eqeP6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC831062E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330265; cv=none; b=JumVoFot+aXSYluIEygcRY08n8SZfmb2Jxi/0Vm/8FpCHogplr5o3sou0z9fv4ooPKf2dzTZjxSOk0yC9AwvCXWKpXbp9bmgdaWW+1Iji/W0rAsgGKTu0W2L7pBwZWfcjw0nHSCN26reFMWicoHTWOrJLa2V6/JS1/aDWyjMAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330265; c=relaxed/simple;
	bh=gP3sHPK8gXmSIAYj8c0TSwKZzT5w2oMcR+vB+mLVnSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwCAOb7RSoTRVfb1ndZQ+52GHrGO4YHwm3QodEAwFHPl8GXGQIxB8x0onCLzgABo8LrtXjyJTFQdYIxufndXh5UUHzxUmxy2eTos0CHyt26eo5ca1Oji8/yaaaekfb445cGiYVU935fHwWo1zLZVKXNeKhSLwmYckU9PjG5bXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K/eqeP6R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12322865e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330260; x=1764935060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHD4rZPwi7RiLdWPbbS8FZM0CItCJ2sdBfbEOh+hWEI=;
        b=K/eqeP6RUZpyLY4r8CzO1H19dlzZgMz8va+OUPO+E80Isu9FuoJFmxegIB4PD4DcTH
         dFe2Eo4GxAFG04jqdZQDSeIi9xBNQclZNFoAh8m5eu0tg6OxiMyGhLRJRSA9YyJM3lFp
         vg08GdXqBEyafj5QyCG8xztCTH3OShvv5wq19Le5r35BpUECcy6eTF9ktt8RCfq7qgJd
         2myci7CiLtlnyqX2UToxd+VcpHBN7a1g5dFM8JftDW2oriqbghZg2fRxDvl8VppEngYQ
         B7p1t5lxS0lOtSh5TnViRSkhAOVbRfMB5QRJhhdT+KPdbwkVEVpGklf4nBIid6Wl+UH2
         6BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330260; x=1764935060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHD4rZPwi7RiLdWPbbS8FZM0CItCJ2sdBfbEOh+hWEI=;
        b=tPdkGnhEvZlfYs9YWonCAG5Ki/oU2q7YCCwmBbD1yYUDN4itqNttAAZhrAcPSHKfux
         KyUcYhn8dtHI3JK7YsU17EbMJAJYzZoFzBMM2l8rMfFZlbLjWnOlEDD0EHtVN+Lezg2P
         YVuGtvTzwXkOC62GbnFPJDfTj7F1tEn4zfC1ggNvsn6qI59EbuzXPzx9tjdblx8gqBho
         0tYf0yfkIG/u4e17oGYGOW74+JMmT+6MQTY/YOnFEixWkXefTTo9+ccZZjzfB9E6u6PL
         /Wq3TFz9MAah3bBQhesZ6UEk1I4d7JDqNKO3gOijsqUNb7yWCBluHwUpj3foA0XCiWNb
         dHJA==
X-Forwarded-Encrypted: i=1; AJvYcCUKAbFN+WAX44VVtFXG+s8H3DLR94+iDVjNH8kYx1/DPywIS7K8ZlnqWM1CWmoJ/XzVUSmcFruqS8y2XLzg@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9PBsSF3ZyVwFgfERs0cmPabZvU3aUiT2A0WspQDVVEAKUIIi
	pMRt/XAax+zOEzJdXNUv1ebDiLD0rQYXszxhDqh1C6g5ceGUmg7cj52zwLSEqv5QE1U=
X-Gm-Gg: ASbGncsktnYhxQ8WwIFcr+INhAhsVnNY7YWjPiWY3e9Y41uWiHZKm138+napWlyduMk
	cLX4cFOtjeauNBL/tlcFCCch/lhbonr0Z7QjBNykQ3deQ9r6RmKWJsA2p5AR7yAQopADfGwDN0w
	E24TE/j68TwFt6G5wriJp6aZ7iou31IWs6fPMDkDCTsFHsiWNneZv2KP01OLLwROKIaJwzk9uO0
	7Hncl26OQ9OnyzTBfc0PS4D8aMEbxYlYpNriKabt10vNlZwkTYX5fpHpLoVfW9MYT5LT66YFfHd
	ip8o6RbGdVBFnAO78RU+d3nAnLEZVlnkrLjOnqLGzoF7vDwYKL4tdi9W5Y8jgqSIwgdT0wlmBhL
	bqCX75TZJTz+HyB55LlxRVvMce4EjzhBSHEXH66/6awfKhZVN/SunB48c2IJnQ5GhcIFiQOCLs/
	GQ3nvagQ==
X-Google-Smtp-Source: AGHT+IEZEY1h+B91Cn4WUb1EKEGKqMtgbbknbuwNDpzOB9tvypFejJKMiqNdltD5wwnmIJndrvc33A==
X-Received: by 2002:a05:600c:4eca:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-477c0540a68mr312273545e9.16.1764330259964;
        Fri, 28 Nov 2025 03:44:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:03 +0100
Subject: [PATCH v9 05/11] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FPE7sVoSIw1wtmIdKZA+n/AK2oTfpfwCQfrZgNyVmEY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsIseksosC13SJcrBsMoK/GzT9RjKMGRCE6m
 ROxqKj11UeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCAAKCRAFnS7L/zaE
 w8cGD/9VTcW4bLk1by06eHZI/KaNzbm5zKGNUTn2ki3t86bbPtA68kg40hYqXLdv2C7QJUaKWLJ
 c7ZLSCvWSp2x2qDNwveLKOHSKZn71zgu5PiLf0+WL5e5K3BzqK5lrQqexgIe9o+SzV0Qr6vyZL8
 VBS+J4i9ookFkTLflRvBTEDcYsmqIU3rPb6h/3S/do2tct240HGf69aJkBrWb+hyb5j/k3KQ1EY
 VbryfbHdUBaMvULP1pj4kiwLhjo/NofBIoAj3PMN634Iz5Ubaz5o+wKvoBLt6vykch279HqKTb3
 cYNl6tncHpd6YeYI4kJARYuzj7dzzAZeqU8se68jPRe5UB+M4vbZ4qW5rfHVdb9B+kXlaG+YINm
 3C+eH7rKiFUZA93JNi1BpHFWf/dLkB1Bg74hjhL0xIGspU+ZZGb9VqvS7lkhOYt9noZ2fepxJci
 alzIFsYX4j/2V64D1O8YNq3cnA8s4k93PwiPn2+LPgzEPBbgePi8V2ks+2uvZPRbRv9rIcOAV9W
 vVwthqBN9s2IfwISUCJWx2Pb+krbaeI27BhQRjkmcuvHOMAs1bDApdEzY9tO7zAzSNNp+yoAxsf
 zMi0koQkGIU8u48FIjdeGYH7arHa2qf1nMYOIiYIp689RpRHxghf8TZ+l2nnhoVLXNei8rxOIoe
 JlJ3y2kTMNl9KDA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.51.0


