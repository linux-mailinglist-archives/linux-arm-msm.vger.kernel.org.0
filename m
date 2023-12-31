Return-Path: <linux-arm-msm+bounces-6183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D81820C33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 18:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C91C20921
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 17:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DD98F49;
	Sun, 31 Dec 2023 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqY8+YUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F28F42
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so6107872e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 09:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704044340; x=1704649140; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=fqY8+YUJvoC6IzPfbqMAbdT1A1BfXt/6rT7E9EyOvn91WLT9232wdkdbUxSEjs5r9U
         meg7p+80slQIiUQeDQBpwuLhhWRb6NM31b7WrAeb1HGuNOb2bV4K2Z06bjYHACIIpSns
         BTmVqX6ZoceR4Lw4w4j6VLs1HrqAtaq1XydNyrI7IcclUuKA7ApAeCb4HhbXZMmgwtCV
         stMNnDY7/r/DqvgGm9nXZsX+UuAJohJF96avztiqnu4GnvEqEVev1k6PHLwgMZTalCc7
         cV0nz+/CNGH1OvJwZUIPw8t1yVO20kaB5JP6BXqDPAGpYbVpB0SC3SBOmIwroqu0P+MA
         yxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704044340; x=1704649140;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUYroI/6ZskYJOmbOSs8RYk5gRIfUp7UoYG0GxO1WAM=;
        b=q+nx5hKBEafkmXXHp4xzleTtK6BY4venCIrHpe3JARTUm14r2jmjNP5cPmhiQzlIKI
         F8avMfGuRlw4boVypV05dW4jjQBr0p9WLmbeYijz5mi87wwz4miTZCwSa93hIkbKgvGt
         t8lDKBhSazzztnjaeJyE35NaoaAOConcYP3FP/MFgHTR+/pdBcMtigM3uoEPCK4R/XYt
         KiVOzgCwFPSvD6MX/LoWilCNJt0lCpXXRBbcpoBGJjLCzGvjRFrcn+8RLWftvHevrJ0g
         1DY1L36k5YtolopZDqOXikM/zIXIdIFmzWV63XSRYevjWYsqNoHkfEifZA0wS5JAslIg
         171w==
X-Gm-Message-State: AOJu0YwB60pAx5tKE6WbKiZmoVLUp5yXvbGQcQ8hJVJAQR+NaSno03EY
	ce3jowonazDQeUxTKzc3ERTZwOausswL4Q==
X-Google-Smtp-Source: AGHT+IFY/Zh50AzzndWvUFWaUuz63rVRCNSN2OErP8kxIW3iJeJjid1EtVt8ySwieUtRtLxSp6bf0A==
X-Received: by 2002:a19:4f51:0:b0:50e:6d4f:6915 with SMTP id a17-20020a194f51000000b0050e6d4f6915mr5508938lfk.47.1704044340345;
        Sun, 31 Dec 2023 09:39:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t27-20020ac243bb000000b0050e798243a7sm2233233lfl.177.2023.12.31.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 09:38:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] ARM: implement cacheinfo support (for v7/v7m)
Date: Sun, 31 Dec 2023 19:38:56 +0200
Message-Id: <20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCnkWUC/x2MQQqAIBAAvyJ7TkglpL4SHRZbcw9pKEgg/j0J5
 jKHmQaFMlOBTTTIVLlwikPUJMAFjBdJPoeDnrVRA4n5rlY6dIE4+iRXj4sxSMYqglE9mTy//3E
 /ev8Azbr0AmEAAAA=
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZbnkF096dvQGlLCSukEfSJ0VKpmFN+Kk69iSZdj9Crk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkaczSNiTf9HQFVkXjC/zbvwQY5RW4pEXfvDET
 Zjntl+IzneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZGnMwAKCRCLPIo+Aiko
 1Xu6B/41D9u8tN4na0LDhbVVyfTej377cgDODkEVyEHduVEo/AEyVyQPYN8uWDYPo2l93g3aYPP
 hFo7+yLhDY4PgLP0R9vkWTYlPvi5oA1g5z9jRs4ILBscMUlOIg59ppcsoHQtkMjU9ZCEHUcRv0S
 zx7t9gH5HEGaqJn8fTikSAkicb0NXSnOgLiW6xJ+/5t6IxOEXcbAxGg0vn2GtFj2O2yfcOZyV6R
 2YhdrrVfzFgYNI6a6zxDw3RBt9R+qh5N9R1EExXyzYbLppFRrJ4UUCmwQdfpYTyZbrP+Sibrmo7
 eZ5+C+R/X18lWk4Pdm61biT96U8ly72apPuV+JqxIr5pMUSi
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


