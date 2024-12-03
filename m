Return-Path: <linux-arm-msm+bounces-40047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCD9E1717
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F512281440
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDC1DF73E;
	Tue,  3 Dec 2024 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EPQ+3M2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AF1DE4EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217593; cv=none; b=OcPKTUKHAgmE+jW2lIDocJCfLhaa9VMswaKYK7WVpIubQxTHUDCa4dYhC6BrnDe+D9q5HsAVRF/DEIPYyDzMXWsnLPM53UkXuhb4x7fkOOxrtPCOri6KNsYsiYbVcxZ4+am2xQ0vSHxcZ+MtH+o48rKKj8SgPr6BVnLUyfhEUtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217593; c=relaxed/simple;
	bh=nLThmMAA2N57J/MS2sf+bnzXenpNMRykKU0iA87ZQGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X02Dp8CaUO1BwrHFy8dfix6ihS4HH/q/NS5zraAux8jES2Ipe3x3d0q1XstJ+TUNsSZABIocEsjmjqRYT1NkDo3R/hd46uM7e4GHdRThSZyJCgkJj1+levLHAZa4n5fopn5V5PwXK6W5xTvQ2TOUoL1aTIFRyYliCLNmcbzMhMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EPQ+3M2m; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso53418911fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733217589; x=1733822389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJIGF7RI3yQ0jOMcBQ0mbBInLSfp4wTYHHtbYsIeWVc=;
        b=EPQ+3M2mV9MTR4TAJzCzgH/ZEgJACgHshLjDeMKxTri8A5mbkVcf7PEqyfujq05wWR
         CauXwlgwDaw8M+UxmRvzEXkK0p7MTvFQrM5JwSi3j50oNf0ZBZZttfpmBvhkTBqfTYS8
         meDzjPL8GOlhRXqM6kMqd00ArW1UFeF7+Fw/crAydnmC87Z37bCWBFHuClmVozXBGOki
         OO4Rmhkx5i1A+UfBWmHDm4Ms5nskUsx5eHgU5ZsqeO/CTuFEx7fyUCLuNujpdO7x56tE
         l4ESI9nwkPDxCRAEcpJA44rraPpOYnzVbw2n0EzKWoPIYpDwzzh0pOZ9qpbgOPt9dm8B
         iahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217589; x=1733822389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJIGF7RI3yQ0jOMcBQ0mbBInLSfp4wTYHHtbYsIeWVc=;
        b=Vc3/0mPu9ZNs0ZR6Ad5RWZ7ZStjgVFT5u9u3UOFw1Ou3r5t5CzTqn/DjKHV52nw3Jc
         P1JeUHFmRmG/PlT1yEjK9MaarsYclzyk6Ci412gT2KPIefVD3QmZwFLUT308aFfHhN/u
         zXm4UEURT9CEQhc1mOhCGZGRYOduvRQ4ULNKTarjYTU5etES3jRRUuDInmtZ/NaKyMSS
         AxfJk7zAmi6GExx2P1Ctt7oPH+JlrP+5Vd+9Tab/dmDfHQaT+EmSA0mRSzvkYOm+rom9
         92exjAVIdG0YTQCLmyyn6AbN1bOVcSYiaD9AxFYkWICdx07XPvFTSceSJnPmZCoY3q9u
         zubQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYVYSxByzbHr1AbjY2uIxFW73U3QRyvGDJ5uXrJ4scOMI0R6IJu2kqy8qettJdE94we+w8TzQNRrm2LWm4@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/sUxtdqVO3q5NTjg3NwevMV6uxhHvn0QMCvPEmS5J4RNnHfO
	q2hFKFul5eHAZoWaDAkB5+GxkMN6PvpYIscExTZFRiqRN9gvI9SsMNKDgSQYByztHD3whc9BA01
	NeMk=
X-Gm-Gg: ASbGnctPqhjf8w6RHWnWIrmL/KMus8cb2bhj1uGqJylsrXfMQ5vlSMrmuZ6lTtrmm2G
	JpHTDr3igQdAkscHzPVPR/TIhGu4PWYM9kEiNgrPtwzsEuKcrNFDVk/qUNfZXxlLtg854IPwHaw
	IEBVQLEFoOXkLC3ei7BH6Eu8X46TuNWRuQdW0L7YNM0u+aXu2/q1Du/Hi7Xn7mSgMipZItagT68
	e16wSd2P+HSS2TcJqEj89scVqmAJS6jz22WWqfnJyYWNu3ZEKu6y5mT9LqkO0W15RbHs8zhONPH
	ElMpoY4=
X-Google-Smtp-Source: AGHT+IEfC5wjdly2Oi2VTsboD7iJTTa5MEqGX/XpE56Oi78cwJFI7MJEAubiWLgbkwBOanVP+66elg==
X-Received: by 2002:a2e:a80a:0:b0:2fa:c014:4b6b with SMTP id 38308e7fff4ca-30009cc80ccmr10990311fa.41.1733217589521;
        Tue, 03 Dec 2024 01:19:49 -0800 (PST)
Received: from [127.0.1.1] (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm15591811fa.19.2024.12.03.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:19:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 03 Dec 2024 10:19:29 +0100
Subject: [PATCH 1/9] crypto: qce - fix goto jump in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-crypto-qce-refactor-v1-1-c5901d2dd45c@linaro.org>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
In-Reply-To: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YB5a3XXobSonCeqEXm7LbV3WosWHg1/Yxs2aSCuvkxU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTs0wYallq8NjSyGqGvvA+foSvpLbFYIrIvrHR
 woqO06Z3q6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ07NMAAKCRARpy6gFHHX
 cs2+EACJKlJsbURMhP9mtuBKWgdQiwB8DpCV0aASWdjnwswK4VaXJuGoi6yZLhXIOszQAhb5I5M
 ZuaDUbGbqSyhNXGQJlSGUgnfhfOTTl1BWx8XEfSNSAcCCvrqkBs2s3z3Q538FmOUZOektwppCXY
 MTYq2BTyXSFM4z/1pOWQ8AJIJIBZCy9SWkRpcWDG0UQbYzwGS7QIEv6JTd6KJIxxYnI8W6/W55G
 WoOPBOrVx1EOvYhSZlbXb2OlcThLBo05+QYmNKWzgo8cxwyWN+T5IqU1jUXwWBoKYaVjZqhu3l2
 BKNq93HrcXUPvLwZRiKZpx3DK5gsnOvFsZmodCB9zS9fkXcphUKCXud7Jukn5Ung7+qpCozp8qQ
 LX6IxG0WpBdkFoqmK1Av0peZiE7ejVZVuEkmmmpGogqSm3n9WPcE9igdf//67Sea6noR6/VJhlt
 Gr4Oqm1vcjX1fGg6+/6DjluspbZ0/1aG23TJqVFWhICMmCVtl0BTZ3wBMkyMgVTl450JEtldWlv
 yXHED3oaixiRzibBBnMvGLsQLl5UWvYkZcsfAbcd2Qq7OfgmPBpXkzjqp3qO7ZiSPjvQShHOjIN
 k0KPeN8d0bZGesxwudYEmmZRuLwS2U45kfT7oB+ktNm0Bo/i0fz3j5pAYSS6OvvR8IDDe5h5EUX
 0iUqsU1PIKPr9fw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If qce_check_version() fails, we should jump to err_dma as we already
called qce_dma_request() a couple lines before.

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index e228a31fe28dc..58ea93220f015 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -247,7 +247,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 
 	ret = qce_check_version(qce);
 	if (ret)
-		goto err_clks;
+		goto err_dma;
 
 	spin_lock_init(&qce->lock);
 	tasklet_init(&qce->done_tasklet, qce_tasklet_req_done,

-- 
2.45.2


