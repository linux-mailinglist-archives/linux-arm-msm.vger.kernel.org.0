Return-Path: <linux-arm-msm+bounces-11944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9385CB3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3C40B22FE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB41C6BB28;
	Tue, 20 Feb 2024 22:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoVDC0Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F64154C15
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469862; cv=none; b=rtfTpVJgO6Xs2tICyf16MfQG/QXdJvYQ7141FgUksjcQC5K7gB3iVI7s7/zACUjfekPWNbHyP6pH6+Fbly2rLebFzbE3LQ7t8jc6cYJMrXI+zB1Vg1zD7Q4paYzozlRRsePR2Um9hX3upDYK4kvwMae1aKScqegK/+nWGoXmGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469862; c=relaxed/simple;
	bh=ZbnkF096dvQGlLCSukEfSJ0VKpmFN+Kk69iSZdj9Crk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i29V1cQdXn4pKLQJjpHUx04pAFwC+nAYl8mu5FggIoGoiuoBaujce5c6wGnniEFJd3LNsIPLQS8iOE0WHUSwEvYvMl3yQcudok0xuPk/FAxNo9h7k9wubHuHUyNxO+ZN4JY0a+TeyMJgEcLiM8CoS+NnCB1hBJIANXcgAUKvy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoVDC0Pk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so52707761fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469858; x=1709074658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=GoVDC0PkLizt3M2hwIckL5O7P6d6lkJqbCbdvs56xr4DLtZZXMyaC77m5FyRGyjRg0
         Qloz6HFpl8y1DM/z3mjEqy6LR+ueeUy7tFFrWDw+d0PHqXA1T06zaZMGfM286WXCNN12
         KExRaSfvMsqLFRFTa8tQk8U+0NoEoF0picXu6dbpVgnSYxSxNVVOuDEqUhCbKJzZidWi
         0Og2NlIaQ3A6I45JGLPbW8SQbBx2297XYunJMV+jRQiqxiHoU9zf/0MFzVuI6K9aU5Q2
         3riuFqk2QR5XkoIQjR3WmZaRdorbCwrmhuGd08iBWJlwGih/iZX+aAytgBixVWP7PJyW
         cBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469858; x=1709074658;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=RLu7wOjZWQPa22ACoKpVtQUmCIfRmSSvB+qLvMxPdgnNjHgXNy6Wo+72/qQM4VOQjD
         P6aDb7/A+kn7T5XKFAYrZ7lpGLOSYfk2/vczCaxBCWchYrQoXjSIitJwYeUQjxci/Iku
         Kps0WwuUQE1gEaAuNtiw6vOHG5dxArOYtcUaXWkTJH5MQFu7shArMN0YG0KOCZKQEpJD
         LPJQr8ZA9HB6X6bvtY2I+SO5gXWv251/2QsOzm9hhJL92oKKfqqiNGD9uaMjySiqsFi3
         nZ04nW9501a2YcSRjp9hqiB4bCFJJOF+/Pm+dXxD2i/1b5wJjd11Nvd5BOaBGUAGCXx9
         H86Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUs1POlH4C7iOr7cHAWy6CcEXogVpntBEKsQX70PMZqH1NjyS4QxxSt0eH/Y1vujXkZmy0vwbxRPxEdHgNDAY8p8/mDcF1h5O4z2KUPQ==
X-Gm-Message-State: AOJu0YwX7xJXqkAviBWr6HpeWaV9BtJpEQQ+4bA7MRG0Ng8ZYRnd3YJq
	eD0BJWC+NfnMaSJkMf36kGHD7ak1B1iGdestUjOjdRDFovN6Z5Kytwv7SB+LBdMQPfKcBGvTCsg
	5
X-Google-Smtp-Source: AGHT+IFoLXOAkjnxQnvI4XTt+GcfMct+p9R8gxe/651CcJglxhUOMHYOmuXYMhjcaPUgNYKrSnDctQ==
X-Received: by 2002:a2e:9907:0:b0:2d2:4f37:7800 with SMTP id v7-20020a2e9907000000b002d24f377800mr1458129lji.26.1708469858295;
        Tue, 20 Feb 2024 14:57:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020a2e9688000000b002d24de76dffsm277990lji.100.2024.02.20.14.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:57:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RESEND 0/2] ARM: implement cacheinfo support (for v7/v7m)
Date: Wed, 21 Feb 2024 00:57:35 +0200
Message-Id: <20240221-armv7-cacheinfo-v1-0-69dbd7f20d04@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1S5hN0FsuxyFwjzL6x7MI/ivbGR85lrPsIrSp
 S5QDh93T7CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdUuYQAKCRCLPIo+Aiko
 1XOfCACpxpi1idAk+77Rs9FS8U5HnXJ0NyJvUgQdYHU+GbAj9wFeaC+3w3YAbP8HuEx8+Lmg+pT
 ujIdcaG7dwNygE5zVtjCPFbpI7TXEgMMcQi8iTIeo/vaVlqTwY8Hf7UVAt8CFmLQ+bLnEPZBIwZ
 cYRdubTJUBw2dSZ6cRlRGOHju3wzv+BH3+rH7MtCUm82wekzeYoF2dSf+5Ju6oSRz7zZujRlgM5
 v3KRMBNIDfeX4t20lAqXvubJFK/AHa0kVjci8sAJCE1BuTBF7lsKWN14f0qWVw04o3jIQAzYBR+
 6DsoSln8ROosyCKvUHBab1VhF001tHtCU+fPXJZbOq0VGaBq
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


