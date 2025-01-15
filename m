Return-Path: <linux-arm-msm+bounces-45076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE1A11A20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 07:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14AAA18893E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 06:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B28F22FAC4;
	Wed, 15 Jan 2025 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDj0iENJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6A1D5ACF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923981; cv=none; b=Y4+Nz1VxG3p6sGe1/vCzXciDRIeLAThESxo57/vy7Qw9T6LehHzwpBRi+g+Lxj3/eAV5vFmcIcQOm7siGicPRq+PFa9wV7auxmDLW9HO+AFteYP6mp6n9YgsQHZgJ7Yt8wTXccmqjZGXQSsqIYg2mZVH5VJEFKJqOZ6oY6t7yko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923981; c=relaxed/simple;
	bh=79AOjzcSmvn1KXMWF7UxMCpdAsnp+D3NfbR+NPlMBHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYFlSmM5HGuxvvDG5CbAX6dHgalGO+nc8pTmoGEUuuvXO2vplSkHuR09cC4xMYcIm35guR91issLj5tWDG5Xch31GWVXIO5F0XeUrr1Q9z59vs2UPjy6aCWwyz1U2MRFmFbhK/ZykZRS+8CTL3ryN12T1eVakAIxVlG1m1J6k0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDj0iENJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeec07b705so1001528166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736923977; x=1737528777; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6bWf/tRxO2NkxvH7Hh/kmozinexYUxPVUzSd/dk6ko=;
        b=WDj0iENJIlJbaz1V8SG3XPzSeYeR6lxFDU6XJV2n4IuPmYnd3CI3v0E0WS086LGmsY
         dfJDNWcu7NcAubh+pFviEKFbzSeCJwFRRhPZRQCesztcGtAljIIaSG1Gvg35gZT7H6st
         kj6fPeG+W24dZQCMfFyYZt6ZckHFr2S7lmYZr6Tg7NTcb49QYhtM92cjjJy5xDW7Yqvy
         aT6edbLFcc+CLwL3kwNp5Srpgwn1pQnXKkvmIHKZWaDl6CMnN63YUb7tjHZFJVfnDlSe
         bSeePRCCb5S9VDN/swUKyp9ZSJCYzdRBUBb7VWcjkqevwq/za5+sld146GXtJhM9hS8J
         Exig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736923977; x=1737528777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6bWf/tRxO2NkxvH7Hh/kmozinexYUxPVUzSd/dk6ko=;
        b=BKTYEs6dsCFTIeD05Wn/9y0Wx0ApgPDU3od8WG/NkTsM7IWUM3wWqldyEm2pfM7Inv
         I8bQQR1ELESsV6mhcgPvJ5CK+af3nusprp1MJw6F2tFKxJNxPjLRSdaR12zPZAbrO5PQ
         DQycSdpwj0Xp3nKyhYgzxKTZI2UcHPksfUKHeSpSpd+g3hFkw5XdM6p18bZJB8c4KYmp
         9TZtolbAJL0T7BrrQlxmBwUEOIOVGFfHMRvgDdxUoccvYSjGj3UwwlLTkWTM0RYqnf/L
         VWoqG/uN79CvSck4bOguDauWmcfPy+As7ZqxyJRYMHv6FuhBtRqJiQW6mfVLTFZ4yW+7
         Xyzg==
X-Forwarded-Encrypted: i=1; AJvYcCXm7SPGjkGJbcOYE8euqtnM9qIvrfNvenrTsoP+SZCVnm7xBcSN9GRR99ROQV3PamHejhXiKIYfhbtRzJ3G@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/rjONSH6yeTBijAY/1kXxb/uJvvAvQ1O29V44FyicWLgmiM9
	CkW51b6PUjW1QodGmByiR4m6nYWQNxrHAm7UHh2P27cwsMY5sLCRo631iieCZl4=
X-Gm-Gg: ASbGncvyaRZbrf9xyAXTMlMscB3hexTG2jOtHgo952Os4fvPQtKDCqXnqgx5TvkmZPS
	1QX5h8HjEfJfyGem26P91BBATU/EpD/6vX2GPC1Y7dffwlXoeOy3aBIBAEEPzvg0Wv1uNx6/aj1
	pEsE858cYQRt+e58hzykYg8u9kr0W2/gmX5hDVwgh06V3M7f+zJbRepwHHdXur72c0FunLqF4eN
	UuA7XHjCW7QtmYxL+R/sCwy45ovD40FweCCcoUUUQ4MxPgjLkZE8/VHc2TO7g==
X-Google-Smtp-Source: AGHT+IGjJatczNH0yw605WtpAu9naajkVinTdTUHVkZjtvdCrzX/ldBhEFr9TVzUdaTAIFmmbt2l1A==
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id a640c23a62f3a-ab2ab70aeccmr2468597866b.19.1736923977532;
        Tue, 14 Jan 2025 22:52:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b1ccasm716907266b.158.2025.01.14.22.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:52:57 -0800 (PST)
Date: Wed, 15 Jan 2025 09:52:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: qcom: scm: Fix error code in probe()
Message-ID: <a0845467-4f83-4070-ab1e-ff7e6764609f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code if devm_qcom_tzmem_pool_new() fails.  Don't return
success.

Fixes: 1e76b546e6fc ("firmware: qcom: scm: Cleanup global '__scm' on probe failures")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f0569bb9411f..fc4d67e4c4a6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2301,8 +2301,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 
 	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
 	if (IS_ERR(__scm->mempool)) {
-		dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
-			      "Failed to create the SCM memory pool\n");
+		ret = dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+				    "Failed to create the SCM memory pool\n");
 		goto err;
 	}
 
-- 
2.45.2


