Return-Path: <linux-arm-msm+bounces-40053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEE9E172E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B0C1645B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452DA1E0DDB;
	Tue,  3 Dec 2024 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0ZD6NoMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2891E0B6F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217600; cv=none; b=WJdSk+2E3Vers/ZQ7fotEDLLm03QxqORHosYUA1bsfhTTVOkDxZnynmbYoGu+L7vpMZ3+hlgVjzqa9xlcNSLtqXPsliKasKw4Q+PDeDLhZ9geQvbyCr0z6U8qOOmEth9Uiwg8dwlUzJbeqyqDbJbVnZDinyecbgd+paQ4KIU5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217600; c=relaxed/simple;
	bh=NJcpYWyInZqRALglY6KsrQLHat0Tnpu7cK3AllLDtRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTkf1RX1H65jWMafzXGyAkxxwDVQLGNyEe+PCRP1J7ggnntgukueTFvcWPGY8rj/NgXTWNhFHzNUF9k4qHpt2gHn1CVsDW9jIvwhFEFaSgilERHVXbGMh22EFL1h+TXRtZWMRn98hRJ0dPM70SIWDuFpXZVxLnFjJPUCxnBQYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0ZD6NoMH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffbfee94d7so43911681fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733217596; x=1733822396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibyeqRptd4mJK2k4LjBPbRDskyZlzeGNEtvsESQmAbs=;
        b=0ZD6NoMHMovOPCGOFx4RHwLdaQV98OlTvSemVQlwvJSKrD/ywnN/B49hVUfBrRucfS
         CIjnv5HLGp+TT1XXcm9tmMrnAjxpUKz1SZ0PWDFdlL1/7uLEpbBEEKNp9hsywaviuGYV
         +1SkeBuk9t0n7CyREGLfX3lOLLtKiO2+4t955VH5bWJUM9lFMT3Hg36gbpYXz/kEd6fY
         sNUdaZO61HDLuARAQHC6biH728DntKMoFKcjbUzSAmWy6KxEQtYW4WuSB5wSJp2M8kus
         Ih/K6V12Khu0CzmfvQRlTlKOS8YlDOJxvGfueKZKYYX9qVAp/wkzyxXsprLusB/IKgMg
         5MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217596; x=1733822396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibyeqRptd4mJK2k4LjBPbRDskyZlzeGNEtvsESQmAbs=;
        b=WyoZK+V/zfFGsW8h3KL+OlI+s1yvEHoH641DaGk0VJKk1ImjlbePcYLNN8+bAEUwUZ
         78YS4xAH7JR77sZCMhzgNve97j2Y9gWc1wWOe0YAbt6okDCL+wFypMwqvKGR6fsPVZpU
         VeIIHc303obH5Xg0THZYNr+Ouo09NeDhM9XRKb7m3slEDZ8nsEngwJaQoLAYhs5cRQL8
         GboD4KwZTmcDTwCX5H6Br3hppSpgQ3iF3uQw5VEntFaebSoK/7LizcUHywUCou0pMRtq
         sSXXVtkw3or9zlYvL+H75c5yKn993Lu7A+nivVeFJ3N0zhunx+IANepGx63VpESry3jk
         rhzA==
X-Forwarded-Encrypted: i=1; AJvYcCXdnzqDnIRWymnVwXYStPusPbQDJZlP2Nt6OAT9sJZZ8QD7MSXPQ1PLOvY7xmxOHSFmZXlMpduepExzSZxj@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8pMzbcuk6Vwqd6Hx/g7hEV1c3dCTnc+jYNV4rmHUtMZkcG3X
	FuCLH972svdGOsnnbtV3YTclvM8m2vh+/+rnd1Le8XiHuXfW5YFzAYHosLOgG/udd7YZEqXgZYz
	6rqo=
X-Gm-Gg: ASbGnctq/1OJ1TY6O3dkqhNrZMBswvaV1LTV3qXKiiQRpwj305mfwKoYvnufEN/tNj5
	K5eH3HdTRIM1AXK4Kr4pz3DgwMuG8RXWwfWLDllGBjg/pNAC75ULkAIQtBGPfV0bGsqnAl6jdXt
	qA3pZ8/mmDx33us0y0xuuM7VfvXRgNyz9XNu7dfFLec3DyJmBoE/BBpKIZEgSOsmZfKO9V3xk6B
	jGe/CLaCZveLz3EyNezcyns/5hlc68G89DT342EkqkF8vE+YHIzHEwYVz/zTCzX4t2wcSxtOgG6
	vOHmKQI=
X-Google-Smtp-Source: AGHT+IEefCq+oR7ETFY8rQcEIbWc0+3MFXkcBFau0VlA7vyd8gScWVSJW1iFlI7ZjfJKrqYCJrpmmg==
X-Received: by 2002:a2e:a781:0:b0:2fb:407b:1702 with SMTP id 38308e7fff4ca-30009c0b0c7mr4723261fa.20.1733217596110;
        Tue, 03 Dec 2024 01:19:56 -0800 (PST)
Received: from [127.0.1.1] (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm15591811fa.19.2024.12.03.01.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:19:55 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 03 Dec 2024 10:19:35 +0100
Subject: [PATCH 7/9] crypto: qce - use __free() for a buffer that's always
 freed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-crypto-qce-refactor-v1-7-c5901d2dd45c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ToF/xAKlSmUpzxuoLyjBFnBG84QwusKuXFLF6zjeK88=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTs0yLFudVleOu9sAuviRn3AuGtiZibobrk6Sq
 9x/HvQyEeyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ07NMgAKCRARpy6gFHHX
 cnsxD/9NgrACtnn9VoEEsk2ViZMl50jeio6Co3oFr2jFnYJudvDZ8gaiRH5ZdGFP+AkmV7wqZWD
 Nq9reMo3oAxIiBOWI+dmcloRKRoPvAk9H0iO+Q9U78UtdyLlToKnxdgNJkorjAjWHqRg2irzp/X
 2M74v8NKLmR+SueDHf3u2fLWwnV4aoHzsPbAS+3OWYcJmb+/132mPcPla0cwiIbPU+boQ+MEzy5
 fUAf39OLEYbbs+129Twr/hvSK8SgdugoQbalnstV/FzxxeJBLvzphsP7YIR9DY1UfTVnKuNs1Ki
 bEetE5y5PnfPdIxC6FwMq0cVfBGo27uA8OOIzZpy6pJBlcrFVWyKZzihXtVzArb5Tc73bkvQP1C
 VFFUKW3kEkKFuOiuPBTA9yysEkHlMgHWRgmolrOfHATfn+EPcEyCuEDikfTKke9fxGGGwn/1PYN
 XfbSYy0GvrXF+Zf/AIWuC9CAIRvEbwWg28aUR8yFLsnSegJOy6+tZ5EP5hfjjUuXD6ypBpsWpVO
 fUJOaMUqe739riMXfc1A17NOh17rtt0N4Ciux4C90iLiOMZrDd+toLHICPsj16biPVcetwJGmPF
 Ls7cq0lmM+Bql964apoYR6+LHhOcle5Bb6/JpydHN3CO9N1WBDH1VUxciXkumZ+/myrsysRcPF8
 KFM15RixOoEezYQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The buffer allocated in qce_ahash_hmac_setkey is always freed before
returning to use __free() to automate it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/sha.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index fc72af8aa9a72..916908c04b635 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
@@ -336,7 +337,6 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct scatterlist sg;
 	unsigned int blocksize;
 	struct crypto_ahash *ahash_tfm;
-	u8 *buf;
 	int ret;
 	const char *alg_name;
 
@@ -370,7 +370,8 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 				   crypto_req_done, &wait);
 	crypto_ahash_clear_flags(ahash_tfm, ~0);
 
-	buf = kzalloc(keylen + QCE_MAX_ALIGN_SIZE, GFP_KERNEL);
+	u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
+					GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto err_free_req;
@@ -382,7 +383,6 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	ret = crypto_wait_req(crypto_ahash_digest(req), &wait);
 
-	kfree(buf);
 err_free_req:
 	ahash_request_free(req);
 err_free_ahash:

-- 
2.45.2


