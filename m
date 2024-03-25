Return-Path: <linux-arm-msm+bounces-14984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9250988A3F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461892E305D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7027181BAF;
	Mon, 25 Mar 2024 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mX+EpAHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7AF19668F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361054; cv=none; b=P03bqgywdBJSyy3hrG/En5wgO+016J+ktlZGusJujuVLlkQTied2xiXTAZn413rsgrmY0H7mZAiK9swHUyxYWbqQmgSqbg7Gr+bstIDQbmrw8ZdzGj/k40993Ee2yPfSU8mPKIzuRH4EkHqAwj/c4pisCJeJsQyWu5CHjxSVgRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361054; c=relaxed/simple;
	bh=Xu1f+RPnvEjBRa3DS5LFCyEe2cJ9nWGA+wJiNMQI+rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bkn/KZp5+c/BJcSZ2mxgJ6Q6hQH1jhjtK8JJs7fNKWhX1/+1Lds6x0GEoFvX5B/ZqaJyZbYveuzxMSLF/cHiTSBiULoj5m3rJteabCXfYPrw0/rEb7Jvb1g4Jut5vdDe3kLVqf8pb2ZLf//wOUFPTIFg10gVEexE44pqFbemRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mX+EpAHb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2910288f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361050; x=1711965850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fl37vGRYSy2kvf67OGkupfqZ+uqFGGpfw8NF9/514Q=;
        b=mX+EpAHbM6wART6kFGrGyie3b+83UlT/m431IWSyrQT/ktQ/hCO9Ba1BqfJcCIqolS
         zgZMv5hQUNLDor5Ef+QgPyRQWGwhoYdkBdYjH1ZDYDpgQQlCq+mbfO86gAhxwmUPYcDu
         Y3z9W5rINGQAEW0biEnfQ1+g9I++8ts3ybxh42oFRs7/JWzy2cH0pdYz3GOwOMaOG9Nd
         I0tPrwYypTQHXpTUfOwj+NsZBsb0jfv+tQ+EbDklhXUrp1qP075wSm5pnoNMHtd367e1
         +Rt6v+eg0Q2i0j5T7mIqWhjHRIj0YouDTZHX5sfvcYTTN9g8II/SHK/XdqZcXRp/DUDR
         PA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361050; x=1711965850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fl37vGRYSy2kvf67OGkupfqZ+uqFGGpfw8NF9/514Q=;
        b=bfnJqWnSdxnVDnjUsYyJS9P6p4XvfVQMl3iBZO2+iYL3IyMVAtCcQZ5xlVGHoZ1miP
         bJ3axySHmpvn8+UuK5fLMEfg4w7SlO/h+pqcVZH6xZU+I3iv+sgKwr9nc00ZL3Qkx1O+
         tGFdT/xDh9P5A3WYRmRw1E4oeNmhX35o+/WlPNdWoZsyvjJI5KMgH7lsLE6WRaCvr2LA
         VH7FWQX2UvKkVASG2ASPYV5KjtxmroDw9ph1Sp0x5AgIYkfplmP24rJYaVHXGISVi5bY
         TTXi7xaj/GYL4d/G18854/LO27C0I4Xj8frz9y0VBT36Deq59Uy9Ejodu6D4BGXjqTmB
         Rc/A==
X-Gm-Message-State: AOJu0YzclLevV4fIUAVs4V7iMEIGVeb2bP1+QqQk+7H1gGaucBBcq9Sv
	NJ5Aa+MD2YoSl/JsFboOc0JdE8K7VEIUVSOHTmGXUGRTWlaak4A8Q1oDgBxWjRg=
X-Google-Smtp-Source: AGHT+IH+hhp3hOA7UiKIPybzE1EoKjoYoyhlQKM6glQr3E4kR6w3ftf3S8vD8LlexgRD9oDYqvKJUA==
X-Received: by 2002:a5d:4084:0:b0:33e:c924:5486 with SMTP id o4-20020a5d4084000000b0033ec9245486mr4958754wrp.46.1711361050341;
        Mon, 25 Mar 2024 03:04:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v9 05/13] firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
Date: Mon, 25 Mar 2024 11:03:51 +0100
Message-Id: <20240325100359.17001-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325100359.17001-1-brgl@bgdev.pl>
References: <20240325100359.17001-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index cd47389ac80c..de66319cbfb9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1200,32 +1200,21 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 		.args[4] = data_unit_size,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	void *keybuf;
-	dma_addr_t key_phys;
+
 	int ret;
 
-	/*
-	 * 'key' may point to vmalloc()'ed memory, but we need to pass a
-	 * physical address that's been properly flushed.  The sanctioned way to
-	 * do this is by using the DMA API.  But as is best practice for crypto
-	 * keys, we also must wipe the key after use.  This makes kmemdup() +
-	 * dma_map_single() not clearly correct, since the DMA API can use
-	 * bounce buffers.  Instead, just use dma_alloc_coherent().  Programming
-	 * keys is normally rare and thus not performance-critical.
-	 */
-
-	keybuf = dma_alloc_coherent(__scm->dev, key_size, &key_phys,
-				    GFP_KERNEL);
+	void *keybuf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							   key_size,
+							   GFP_KERNEL);
 	if (!keybuf)
 		return -ENOMEM;
 	memcpy(keybuf, key, key_size);
-	desc.args[1] = key_phys;
+	desc.args[1] = qcom_tzmem_to_phys(keybuf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
 	memzero_explicit(keybuf, key_size);
 
-	dma_free_coherent(__scm->dev, key_size, keybuf, key_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
-- 
2.40.1


