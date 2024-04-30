Return-Path: <linux-arm-msm+bounces-18855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AB8B6756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 03:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C78A281415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 01:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C417F5;
	Tue, 30 Apr 2024 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLtUVfih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834501843
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 01:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714440014; cv=none; b=ZO7By3uwq3Ru9mN+Q3FYBciPx92IOXPSi+rcGi3YCxtj9UM8bIGi/k76/2yM3LF6ohdMANKK0Nda5/lm2Dw0I/G+HITufDUcwf5qGbjuk5dh42YTvZgQsO0HQRvgjxVvLKmz4t+ZblHcne4IP8ca2ewDXB/iDCy5JhjFDiB4OEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714440014; c=relaxed/simple;
	bh=ZbnkF096dvQGlLCSukEfSJ0VKpmFN+Kk69iSZdj9Crk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fGw8yi/wZmcvUdOJJOKh9MpyBV396+OmFG4zCAAHrxQwrOt/QXDixzmkG7DnoDBxGNKprCJH9n8gWYWoJNVs3vyBMFaRdCdsM9AJOxD0jfuostehlxxz+VIK0sipfazErW4/qf8lQYdnrUkMYWv7g2fonfWVEXJ7vrwbg+L8fmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLtUVfih; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so8502923e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 18:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714440010; x=1715044810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=wLtUVfihCU6sXUgR6fZL8WKdToeF1GJz1rUMM3WzRH5anXO4Mse8K2UdXxCNlhhAnU
         wrFkEYDmQbYYVr30rjFpj9vF1P5q+eApRB2xzREU7xQy/LlM1/lBasgL2eFTKIXiH+qN
         DmyhQoZXxofEE0EWqZ41bW9AsjmPxLK408EdYGgw7jsv6FKogqM44irerZ/rVHFR4e1E
         qmZsv7ckNsuX8BEUjtKR+SHc3URdQwwMXaVKvvHUEiheiMPy3ErSgY/7oYSdMwNeZYxu
         q+L5JBlkKq1O5+G9E+9MjAya+FE9Af8dOJLimxQWcrhFlxZTYYlyMKnQm8lcJmFSpGQp
         pjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714440010; x=1715044810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=QCS96lUPyy+rCwtMUQkY9O/JF+PxJKjC+aZEyWFfjJbpJTLf/jBK16IEHIxU9JYoD1
         qGx8gEvhkPBkcnc6UqFrWby/01aWi+um+0E6wpkv0h8EvHueJs0qA0RIn73DD5oCl7BK
         kh6584l2sYSPlJpn5a3+dEkT2JzdkptcZHgsQs1mKgG4cvH10bohq2pAgDSi2/r4oOvu
         uN7pT0tI06OcZdLngAApeZj6w2pKOGZFtMWcHzzgiZEmHFZhU78qMURBPDz7rNBmH2RI
         XqgQ4BjaWGwgeNgxxz4DGE0eG/+DqU+JwQ/zSUNLD2mR2hEX1RqEpsL8hYG0+E9ZjEEm
         3cAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Mr6oFYhGhVuTsQbn/WefoKIuwjggTxNEO8jyZdspRS0NcZvgpL/nxWiQXUJQ3/eTU/2aAWiYLcDQgyYK7TyLXv6PnyPY4UTxBmUELg==
X-Gm-Message-State: AOJu0Ywj1hxsmtwOQKoGq13QBvu+CpN39CEcagl8H+ow7Inaq2NOtzmv
	ndvrnTeoZR8PaRaHjr56Jk62FKEwhBeaynn71SrA8PQ/d7AyfSNxf0Xb5/FT3T4=
X-Google-Smtp-Source: AGHT+IHy/+7+wdcnu4lQzSdwUSERBAyvHPjfgBGA0phOMeLVzen9GztxNPBiBqZ3MTl5PjZ7HH1FfQ==
X-Received: by 2002:a19:4312:0:b0:51b:bb22:f21 with SMTP id q18-20020a194312000000b0051bbb220f21mr9520404lfa.38.1714440010228;
        Mon, 29 Apr 2024 18:20:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b00518a01fdf2asm4322096lfy.144.2024.04.29.18.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 18:20:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RESEND 0/2] ARM: implement cacheinfo support (for v7/v7m)
Date: Tue, 30 Apr 2024 04:20:07 +0300
Message-Id: <20240430-armv7-cacheinfo-v1-0-e3d1caa40dc5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZbnkF096dvQGlLCSukEfSJ0VKpmFN+Kk69iSZdj9Crk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMEdI5yZ32njDEk3YOGHJxMW03EdEduauAfduV
 RXmmcrsiZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjBHSAAKCRCLPIo+Aiko
 1WhyB/9HpnavWmliWCzk//NVD2j75fcriXM8fVHnd7tXMIRj9XgAL9c6oRxj9RFHOe2o0WvCmyN
 S5lxcycwN7EZ/9c1r7ZJPmleCEqW+/X2HC5G3caPlROjhRuI96pPXRhex950ubRUfZTZg/oV9p0
 1xAqOg4lT+TWprIzKz/GneavfN52ZtJJEechQvdHzg9aCr1HEr0pnVG/2CYX/ie2ukrg2QQTfIL
 hMwMOch0MNL3MiMZnaAq3tBbxiD+E49YMc2utFUCjOQUwtCtVg1+ZgpIKlI0docjL7wN6t53JTo
 pB9HnPaq6V0B5YMtELEcxbmXxIf1zDkslX/FeT9SI5t8D6iE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the ARM64 platform and implement simple cache information driver.
As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
limited to the ARMv7 / ARMv7M, providing simple fallback or just
returning -EOPNOTSUPP in case of older platforms.

In theory we should be able to skip CLIDR reading and assume that Dcache
and Icache (or unified L1 cache) always exist if CTR is supported and
returns sensible value. However I think this better be handled by the
maintainers of corresponding platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      ARM: add CLIDR accessor functions
      ARM: implement cacheinfo support

 arch/arm/Kconfig                 |   1 +
 arch/arm/include/asm/cache.h     |   6 ++
 arch/arm/include/asm/cachetype.h |  13 ++++
 arch/arm/kernel/Makefile         |   1 +
 arch/arm/kernel/cacheinfo.c      | 164 +++++++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h        |   2 +-
 6 files changed, 186 insertions(+), 1 deletion(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231231-armv7-cacheinfo-9fa533ae371e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


