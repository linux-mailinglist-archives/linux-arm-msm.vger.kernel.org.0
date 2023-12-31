Return-Path: <linux-arm-msm+bounces-6184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8B820C34
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 18:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43381C211F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 17:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C038F57;
	Sun, 31 Dec 2023 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjxHTaEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A418F48
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7288a6e1so6448144e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 09:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704044341; x=1704649141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=JjxHTaEvHXnA7gB3XPnej9S34KxFgbXiuI4qYtqkw9VqJ4n8sXQwz5bvmNoV3lh08p
         aYxP2nUTMYNd54U+URC0k+BCk6uOIE4gssIdRxWHjCnAY88eCP9IgoOg/nB2xtFjkTf+
         XfYrvEqb2TSj7JI4lesePsuQLn+/MNjWW9F+BMcKILXvkmDwjzxix+GYOLLKnta3ptBc
         79lOFB8aXghTa4W65lUKXkJ8/GVbUg2Rj5n57fs0JmC7UO/AOHW1h5IJxSQegShf4W/x
         OYz3SnYfngoJFVfozRVGj5w4bavbDS6dQGPO9qnsbwq5E7v45u9S1wh0NTO5emIaIXls
         syIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704044341; x=1704649141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=n5YEp+dDGAq7Br9tSaLBgqoCF/vKuTWkeSiXwYNNXqKNVkN53TmDISJTTfSNbROF86
         PGrkpv5NVitmiE3MnlUJCHwJw1aPBblb9mNzAGmFiiy301K35NoutYs7peiQonl0Zy3a
         D8K4kj1ry14vwpabIEfTYSj2jjbKJ++CYxVKbSJNDTowFymuayMmfob4oHY+SBEMmDyG
         1wyUdGCsXGmUd/fhhI+p5yYehe9LJ8dIe8WTX3EjWrIOlvhk/pPzYsPEinUha0zNZjV+
         UvYohZ8iWwhiPnZpeGk9v2TFkpCk+wbNUkfK/4/qZvTscEQqWe7uH+6pJPogCOrJgsX/
         7iwQ==
X-Gm-Message-State: AOJu0YwbfTd4kZHUUABdd7V+t/BSi211Vp31tKiO8S05//+hUn/ja3xv
	Ay1gaYjJucA4agXuhbOZwK22Ed5B1Ua+8A==
X-Google-Smtp-Source: AGHT+IHdyuFseGAB/3R0LnFoRbrdJQuMSd8IMRz+obw9EM5eNufHv6X1VrfVpsujn/vrHdDi1MOobA==
X-Received: by 2002:a05:6512:2089:b0:50e:7add:9864 with SMTP id t9-20020a056512208900b0050e7add9864mr4044786lfr.136.1704044341188;
        Sun, 31 Dec 2023 09:39:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t27-20020ac243bb000000b0050e798243a7sm2233233lfl.177.2023.12.31.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 09:39:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 19:38:57 +0200
Subject: [PATCH 1/2] ARM: add CLIDR accessor functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-armv7-cacheinfo-v1-1-9e8d440b59d9@linaro.org>
References: <20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org>
In-Reply-To: <20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t8WE1+fA8j81+AJkUCcorxLRWwscCfXSF46thI/6wwA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkacz1VRVujh2jeGLFI2bFDRFeAL+Qf8WsbLin
 YZGe4LHn62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZGnMwAKCRCLPIo+Aiko
 1Z6MB/961yERcv+6Qiq7sBMKCeFlc760UR919fahlwsE28S78pSCge1cZZtBpnfeHKVr2NgjsnR
 NNDc5YCEQ+R32kFgyX1CiyzWjiFWzSoX9dLjLN1pa58XrDyjgLLNl9uSxbuBaC2OyDALkEKCFyC
 cPjmsKPq6gVL0MeoYKHJodo4UDqimRmx70ZeJ5mzD1BKpENPoLBh9hsRvO7hoWxP3ZLAtnOu5GH
 R56FHgeqadtv2tDnOuLJlhopblr4t4tYiw2Sn88jEC5aqvvtMVLi7cxHSnmhQaw3ll/aDtYkki2
 VgSDXSX37wyj9i7fDi1uhxUSG7byDefhhjSAzqka2Z4uRFat
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add functions to read the CLIDR, Cache Level ID Register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/include/asm/cachetype.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/include/asm/cachetype.h b/arch/arm/include/asm/cachetype.h
index e8c30430be33..90203a6d7270 100644
--- a/arch/arm/include/asm/cachetype.h
+++ b/arch/arm/include/asm/cachetype.h
@@ -81,6 +81,14 @@ static inline unsigned int read_ccsidr(void)
 	asm volatile("mrc p15, 1, %0, c0, c0, 0" : "=r" (val));
 	return val;
 }
+
+static inline unsigned int read_clidr(void)
+{
+	unsigned int val;
+
+	asm volatile("mrc p15, 1, %0, c0, c0, 1" : "=r" (val));
+	return val;
+}
 #else /* CONFIG_CPU_V7M */
 #include <linux/io.h>
 #include "asm/v7m.h"
@@ -94,6 +102,11 @@ static inline unsigned int read_ccsidr(void)
 {
 	return readl(BASEADDR_V7M_SCB + V7M_SCB_CCSIDR);
 }
+
+static inline unsigned int read_clidr(void)
+{
+	return readl(BASEADDR_V7M_SCB + V7M_SCB_CLIDR);
+}
 #endif
 
 #endif

-- 
2.39.2


