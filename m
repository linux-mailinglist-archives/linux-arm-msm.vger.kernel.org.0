Return-Path: <linux-arm-msm+bounces-83874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6AC9402F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A3CE345BF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED77274FD3;
	Sat, 29 Nov 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Edb7YlTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948930F538
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427867; cv=none; b=oV3sMcDhlis+VllkP1kRCakauWUY/Tk5Dtbu34gubz9kw7Eg+4UV+e9V4fZOhXBy3l0A23lLmIGsJ5HCbh2rgKp/Av5gj7ZjYe3Xh9wFmn/5AY0lDWV9FlLsycmau07jFUJmLTLmS+qsYP2zAjLceh7qK81PV11MafTZmGzCXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427867; c=relaxed/simple;
	bh=X/RTVwC1oGN6z5Dka28hemcDQEwsfiKSfg6YdtWaW+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT5rkeDezA9qWwmFrnpDmmO27wFCQEZS4UBvz6sMWuzaGZQol/5kGpXqlElg7/v6beviCh6GUeoLT6996o6hsc+jgJRzsYpsvRta/RGxJgjhC6xbwy1zQOCtRmYf2x6tIlq2itU9z98kHqdLFo0Qy1IjsDSEJf17GAQzUGLv6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Edb7YlTM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c4c65485so2512453f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427864; x=1765032664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3+pjSj3t+U3wmCCuCdgSBWbp2oqy9bpefHhTr0B/p4=;
        b=Edb7YlTMKW3UOrRT81YS5BSR99iJ91d/nQS/bgTAUfcE05sG/LVymlvwCFxWNpIuA3
         zGXTsdAZDAobQ0D0//VpI5OINXNMGFjLqr+C+xle/Sw6zUd+vpFTYtnPNmw53KJxMTEA
         54vIEUB5Obth+i95O9p8DGH+2hmqwwQoiIqTILAR8GQ1Pn5nNRN46PH/mR2A9E07u5pt
         ieh2/qft8jTaczN2bbM9pgtn25azuQVtybOGwdzGotO6U6pwcNCawY0XElWB7gh/TqDu
         NPwfXWrQ3s5XdWIBxGO+nkwEQgPYVIaQVLUxlR9kdQPZSonkAjEXtN57rSwWf7Dyy+gB
         TWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427864; x=1765032664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3+pjSj3t+U3wmCCuCdgSBWbp2oqy9bpefHhTr0B/p4=;
        b=Y1RRXksxka6RKJzBNgKgkyewcpph/5WOvCRT0Ab95Mxbude5UYu+Y603A8/Cu0rtgT
         VHqt/+fCWoNhL2j49lQHppl8oo3+Vj55/gJPgBOXRsxbUHEbKZ4QTGe7I7MqGRAGpHxC
         waP/efOaUpQomtu9pF6jm1T+KlKikqZbdwX3pBRFzfkeuilmMRyW/hOXY3DvLNBauYzf
         y1AOlw0nroZ8lIY8ba5cT5NnFk33j1SKLlG4fUh/Bg5vXYIxALUaUBjA9mLjhySbmI8C
         RJSbWirFOfMNWhMtTBg5NZGKACLYii9YJEt7tkMpxzROlUbL0PrWBNAGshQ07qCjfJl3
         ZrNw==
X-Forwarded-Encrypted: i=1; AJvYcCU6gA4XBBli/AZ+M5caWzH4Njhhj8hEdJCaoQWem0FDHLbLgsDfhfpn2Dp6E1rOKuLxc7UbBSpqjbl156C1@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxmMfVDOg4cUxIKAdiiEJp0FRAun7ilRt+pOOHxIfouL4jJNg
	K8cqGrDy0sRAKOZyKjJZaas33X+OhrSrirFjQf/y2+Fex28M7j5Z0QPuCGO+YEk79is++YSIJBv
	r053w
X-Gm-Gg: ASbGncuRFCJGvQ/mCR4wpfBrKuGoqHTHPCu5Vc3y024tz8idU9A2V1Ux3YO2Xo/mSsw
	L2RCcZzfA+1AsaxM3vTXoojB8pCxnP/RFUPnwgIUXpbeNHeJ5eH8UzitcSIa+aiNtCYGEKMkVYR
	W6uK/HzZS5v7Kzf2OnxWFYAj57wEyVorJ6ON01MLG9vSmecRxdgjjVbXGdUvaY2Q/tcLxoOKxOn
	RGFkRPdDfYmOxbO2PFkcWhgD0d9O0A2mlEsBXpTdh4ktiC6OY6ZTvOsyF9Nk7CWwUQTu5SFdbpV
	Ij5tT07+IgiQNUF1Fj7IGNfp88jSmCEdMRE09ODxAUsC2XtASKuOhsHZ4zGCDSvlVCCZ9IZnr04
	N5GB71Aj6bzyYxVJkNB6xGaGmgaSIGmJegggX9d9FFhmfh85HS6qtoPKlumASifq3R0TdIee9M2
	PWzUmmaSeNlSdYzUF/1ywUJ4KL4mg=
X-Google-Smtp-Source: AGHT+IFXZI+MiyMb88/2TV0PWTJHmmEbApjR91PzKlDmX//1XB5OJjcUROKOaS3odKI4ruxOcHnq3w==
X-Received: by 2002:a05:6000:2681:b0:429:c8e4:b691 with SMTP id ffacd0b85a97d-42cc1d5239amr32341226f8f.55.1764427864191;
        Sat, 29 Nov 2025 06:51:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3022sm16478970f8f.4.2025.11.29.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:03 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] remoteproc: qcom: pas: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <0599691acc394d9390da8fa0b5de3399b132b187.1764427595.git.dan.carpenter@linaro.org>
References: <cover.1764427595.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764427595.git.dan.carpenter@linaro.org>

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the checking to match.

Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 609df141ecb1..52680ac99589 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -559,9 +559,9 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
 	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (!pas->mem_region) {
+	if (IS_ERR(pas->mem_region)) {
 		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(pas->mem_region);
 	}
 
 	if (!pas->dtb_pas_id)
@@ -576,9 +576,9 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
 	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (!pas->dtb_mem_region) {
+	if (IS_ERR(pas->dtb_mem_region)) {
 		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(pas->dtb_mem_region);
 	}
 
 	return 0;
-- 
2.51.0


