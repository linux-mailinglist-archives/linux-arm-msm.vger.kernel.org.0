Return-Path: <linux-arm-msm+bounces-7755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78303835F7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2259FB27037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103BF3B2A8;
	Mon, 22 Jan 2024 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sf+HWofg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3E3AC26
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918934; cv=none; b=kML3VT8xNu9diZ/GagxFFlls3svEbHjn6bz1ry6/aRNbXq6TT0iZGTm0+o5fIKl1Mti5wojboGnT9vYzFfQWIgxpgbWi5Id0inj//cLF0vHVwdAaz76A/od8vqYtjf5aEpXh/w6KlfUEmpGklWOBlfLIBgcf6a7cE9JeRbr36JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918934; c=relaxed/simple;
	bh=RcKQ75xoYo5Om6NQThsRZd4P2ACDxtfbHJ3rKoRtNvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SWbtW3XBVfM9LP6sw4d0EQ5r7yA+lvZqILG5DxgKqmPCKIGvMrY5nDcLHl18ViJ4VdePC95i3Us8CQUG1472KPmLz7YpyDG7iitZEDmZzX234MUvKs9I0QhAJNGAoNS5K1os9vFbOZYaEZBiEs2FVNr5/wozcohBvOVfPew5ItY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sf+HWofg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33931b38b65so1014636f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918931; x=1706523731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tupJ2FnxBizYD8gOKKXQjNXDQsDvYn5mQ/R4h0dASo=;
        b=sf+HWofggNBFNjTRM6BP6Pu7JpeXh+II7F0V1s8jYzZasOZYQmze4xDKXCSpC+j4la
         wrvN/ZCCOmUlYoLoSbQ+ABvpaFZVv0T5T+nyyamdRfpl5YNmYHJnDR2LrJuyu9r6B4AF
         6fkJa6m9rVRyNg9hRCCWe9jDqgXT4WxUmfE9DCAGdeeVzWoWyGOGSog3InHXwWrE4CD7
         WRSXCEix+4Fo8fIXhtkRro1wotgbpoIexfK3FKZHyMO5nwTnMPSL+q4+nmMV+8LboA0B
         muUNJlfpstZUszWAVp3mqnqobMMmvzkssNvQ+bHUkM+hlj7x9sYGrDF5CFCjIwxx9sY1
         3GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918931; x=1706523731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tupJ2FnxBizYD8gOKKXQjNXDQsDvYn5mQ/R4h0dASo=;
        b=v0SpUCsN+ZvCZWMfYTx4qUWFb+s6wHzBUnf/Gpl76LLCZ2mWc2WGlHlnG3o5Yg0spy
         0OaeFKOr2lwze2jDXDjzHa2o3CrR2gS7zeEYMEKgvSyg0Y2GO4L/KXrsrQLKHgnSEaSX
         Pnsl8EMWjV3YQzH992xRSzcrbVWTpthB1YX0eYu17n6tV7R/sjxJQr+BfLqxGo2SmTDa
         veBZfmN4+QgEN/QgVYpzL17UZdzhksk7awjIHxXxGcgGpxELzIHdeg6hm2T8bmACiCQP
         Q8s5cQw+V/n98zaW6a0NDF44qrWjDLemI9bZC6M0ZotUPkl9T4Ex0PPvTh/fQPtEf4Mz
         u/IQ==
X-Gm-Message-State: AOJu0Yw57Xz45ZKzmiQohF39PQp6HA4xGt6gFXMDYkU3vDwx1m4gr8gL
	VIF7stKJh62/3CXEVDQXxx1KL80z4FyJlbirRjl2SCSuKh5SOjIdsdJjyd5TABQ=
X-Google-Smtp-Source: AGHT+IHo7nxQqV7rDJpw1IjEjwkuHZwdD5i1xwHKtbpOagmrOPEHHHS36P+daOmrbwgOkTmUqq/oig==
X-Received: by 2002:a05:6000:104:b0:337:ac2c:cfd9 with SMTP id o4-20020a056000010400b00337ac2ccfd9mr1168674wrx.196.1705918930810;
        Mon, 22 Jan 2024 02:22:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:10 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 05/12] firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
Date: Mon, 22 Jan 2024 11:21:50 +0100
Message-Id: <20240122102157.22761-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
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
index 754f6056b99f..31071a714cf1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1197,32 +1197,21 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
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


