Return-Path: <linux-arm-msm+bounces-66718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B87B11FE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 16:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E371CC4064
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D82A22DA1F;
	Fri, 25 Jul 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBebP9rA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D811B87C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452981; cv=none; b=PO/Kxp4ovyDk83SQDFTkBHbqJ19jACaKOvH1wOjDq5Z9XZpbtdxbqp4MhQaYnBx9n3JjEj7Q+QcTbYalX3MDQKZZ+UiZDJc/s0j2fyG1zfg3zxpVHEwJ7kV3rSrQFrLy/7fOscpsFhmqAdeslgoiDyPeR2Yu3jkxY1HSbfIDv0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452981; c=relaxed/simple;
	bh=8AW0wZtIdMTOecI8zEy7or/xRHq/+HDNB4Msky+fi4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F7YGUZjJkw3Nvt91P/gJikNBkpd6eT13dQmnSiftXErgkSmMk6zy1axbxzE86/88tj8LGMBupoDluQqN0XDF0CwM9FLB8bAEkJkiUM8s6oBD8TynzvVJqcHX2JIo0h6AR4+nR61vQyRNTnsLoyWlHWkGP5nIHZPvdQmp32YOKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBebP9rA; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so4646742a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753452978; x=1754057778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0GYrZkLXVXcOZgbWnPr9ONxYHIczwht5gJlvJdmNzQk=;
        b=pBebP9rALtTAJKnpPJpllQiQY9VyHBqULO3QVOWmJ5tHTNwIFaXLluiQHWXyiL6Xy0
         PhL6Ido0qCPelByNCaLUEzqA3kJel/6i8NBKeOVLVA6tfG6fWetUM75BBKojyvH3CemT
         2aD6LpUKdXpATcx9W+fWh9va6Rdfrk+2QKO7HDcLplrwT+N4Eh6Ncv3b6qJyPOeKCoa+
         3aXEpODFl5Y5Vt/SowT0DixTR1wlN/snGgxQ5cIYPuGCXYMlUqdnjTMObT//AVbIJjNa
         ngCDvW/QKYOCyittTgnCCR7/Od/oT4wO9oTXE/PejAjzg7k/7gtTB8rV4kPMUUnkgjoj
         /zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452978; x=1754057778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GYrZkLXVXcOZgbWnPr9ONxYHIczwht5gJlvJdmNzQk=;
        b=omkb3hH3ig1TewxbqfDvPKLhG4uTl3plueMDOXwQZ5VuejTHhJ0NeUxY/fO9B0X09q
         Ek8akzEuhU1ryyNVvhpOE/MYWGQ1wbZmuWEOnLlZcS8teCfzUZ/Xmi0DSE7YT7CmDgXQ
         mT5q+AFCNpjKkuF94xrMGbZOVjHrZUh5JS2+iGAv/W/J5WtsbpN7GiK8/7iNGseNzdKr
         hv2eoFQrEuNcoMQVX+VVMQoX7QfMJJnDMYDU+rvyNSQu34kipxICazYqrhlmrQJzNLrN
         ibCI3dycBGO1fHfMm92UhxH65jdIw4cIFOOtXnQuYFgc+ZaTIuu46uG4pIiFxzSqsxSu
         9iNA==
X-Forwarded-Encrypted: i=1; AJvYcCWlab2lfmXPyuUBzVP2r97AKSkf053ws4zZNRGKcbimIOv7c6+fyBGdoGBmVUYwz8sAFdterdeyGYXhLTJ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyBC5XIypwOyKkyfUzSD0ZyZ/wLTaI0iF9TvkkgHM2PV9UATQtR
	V3UKxEauwf87OziAbJJuMI5EMryGenuQgmN+QKGeNR5mWzdfHhNNb5rtNY4R1PANzqw=
X-Gm-Gg: ASbGncvyf9kSTCWuwoaY8rgIpfXzdcjQ4krWYi+xnVEkZTlQXQQ4GNSdhIsxe9xRaGO
	EzGgkDYfD860UI03w9OMftVhmYd7xXbO5BGFQ5yv5kzbFTaKHXCGBdjH4LIqYgl1axut/W6g6p/
	g682EC4m8EBDYfdl5ppFgtJnQCzOz8s/V/IkmuYdv2QeC0P803NKSaSkE2GKgvoUgrpRSO83mOR
	mwngd6AU6ARygqStZQRqpNiG2rmM/kvvjAA+GWP+WSXydeoreHzdg1ZpWIOTSkW4x5QC2Y+PQSh
	22yNAlFuu2f4Xe0JNAd0Qc2utEOye4GbNVJJ2HCkAXacU93WKelb1cf7zNfCDiDQQJeynRTZbvM
	GAPo/2hfBcMGIHxtSH5vQL4FsleARnnIs7vR0ORUOCofw4ANBBlpypb7dtRutmCU/lBBnEF7S7T
	2zDK2NNQ==
X-Google-Smtp-Source: AGHT+IESxxtSVuTR7JcpPvCin5sJRXnxskX5QKzVI4SQNZf89ZEV5qKL5Ev6pflyXfFUSgm5m/ZQVA==
X-Received: by 2002:a17:907:7205:b0:ae3:bb4a:91fb with SMTP id a640c23a62f3a-af61ef2e6demr228089066b.59.1753452977655;
        Fri, 25 Jul 2025 07:16:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f85e60bsm278398966b.96.2025.07.25.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:16:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] scsi: ufs: core: interrupt handling optimisations
Date: Fri, 25 Jul 2025 15:16:14 +0100
Message-Id: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK6Rg2gC/13MQQrCMBCF4auUWRtpJ01aXXkP6SI0STMgjZ1oU
 Ervbiy4cfk/eN8KyTG5BOdqBXaZEsW5BB4qGIOZJyfIlgasUdUdSvH0KYxWBMOWeBFjJ1F73aJ
 TGsrpzs7TawevQ+lA6RH5vfu5+a4/qv2nciMaoeWpNwp972u83Gg2HI+RJxi2bfsAJzI6Da0AA
 AA=
X-Change-ID: 20250723-ufshcd-hardirq-c7326f642e56
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com, 
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

UFS performance for < v4 controllers has reduced quite a bit in 6.16.
This series addresses this regression and brings numbers more or less
back to the previous level.

See patch 2 for some benchmark (fio) results.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- patch 1: new patch as suggested by Bart during v1 review
- patch 2: update commit message and some inline & kerneldoc comments
- patch 2: add missing jiffies.h include
- Link to v1: https://lore.kernel.org/r/20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org

---
André Draszik (2):
      scsi: ufs: core: complete polled requests also from interrupt context
      scsi: ufs: core: move some irq handling back to hardirq (with time limit)

 drivers/ufs/core/ufshcd.c | 211 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 152 insertions(+), 59 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250723-ufshcd-hardirq-c7326f642e56

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


