Return-Path: <linux-arm-msm+bounces-11945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5785CB41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F77DB21F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB11154C15;
	Tue, 20 Feb 2024 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jK/haAh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EB154C08
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469863; cv=none; b=sN1DWPbZiltkd6j5khSPt4xYKk2fcdYXYZHSVpcUEOy9JkX9jIuvzaqK+Xpvon2cvVH4X+9sDEgYp7UM46dq26Wg/taVbQnGPy9R7ZvonQ8E3XFoNUXYn1iW1adzZQ15rNFxSAHBRyM+hXFYh397JxoyTuRQ6Ahg13PLm0gk8iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469863; c=relaxed/simple;
	bh=t8WE1+fA8j81+AJkUCcorxLRWwscCfXSF46thI/6wwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5iSNyrIkXEE3pX3KPU9kwrmwZm5gQAw3qEK5lF4K9Kim51orZ85i6sUF9AD5932pJ2GrQ9pLZbTix5W521rVm9STM/AHvynMxWSW+LJGhsHoZ04h5o39ppPpiWUDJGXPCmkSfXtw4hLrV/ETf7z3EZ1gG/WZYyFWQGiQyGVFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jK/haAh6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d204e102a9so77365011fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469859; x=1709074659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=jK/haAh6rfzaf88iFiEvId2m3RCUc5pg3j5MCA6uSsGSb5OEt8R63cIkoClQU+sRY4
         +RUN5uJufjn/8E0gSjzifnXabwktlQe5DvoGp3oZxJYFbf7pdXlez4Yqcu9sPf9uI8G/
         09UWBsSzhh7OYJ36IdU6TEAQ1wFE+tkjUUBnwsTVhKZpH5F57wq6HelLl67aj5OEK09W
         WQsU0YjnLqiVvTz35WZ3X/C2h1mjMJdXdvZ8QDkfH7/NVReafvGSjAgPZgyazNBzvO/s
         abVr4GBPJ/nQKuoIE7fV4fRDPGH9R9xOL/HP2tQTIlmM5reVibKy0tnTUcbxWATADC0s
         xx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469859; x=1709074659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=Lsy1/IiiI56iPltGggN8HbdMlZdoBmTAsFo3xsJuYmj4HSQDs/sIxmH/EOthOTqyDe
         nNpWjzMMdq41ynIy2YV+Zq+L8V9tV/c3W7is+aSxLaFqXC5IWiFD26/lg+y3hvaVUGjR
         u7Fz1M2xoITdm3T87bCAIMMnrt9bPs7zezPXRj5DVTjqOpUUWy2Mz1S9MNZGaLsJGFoY
         L/6o+0PSg1ucpa4QxrM6qxLEcbw22i85bCB99tm+TF7FQKeZ5I4q+Fjj71tgK1ADeY3K
         9BU/advqWmISgMJRPPXnljwf9BeWVgrDN+P/bHsbg55q9EF+NOlah0B+/kVFr+TjAOf4
         deOQ==
X-Forwarded-Encrypted: i=1; AJvYcCViO26Wl1zTCW0QkAjvpyNFATMdBIYW2CbuFUpyPlTtry1NqXABQ8jV8EmTrZaW8i26hmVpe69oBXQYTvPsYqVx4CQqHf00rLWXOBtNlA==
X-Gm-Message-State: AOJu0YzqcTypUvx3/SqxMvaBrv2jyH0AeFDOy0Wi+o1/7XG9hdW46/rj
	rY0ar2637xyJtxbMy+pv78FMWihIfBs5LtjK8HAVolpxviW3JbesZ4nyhukMtWJnfDGJJDCdRDr
	w
X-Google-Smtp-Source: AGHT+IHyLvSv3R1ZfAIiRwhujC/7SqVIDqdpklKlQWTaD8iLqVdQ1gPbc+GsMOY2PtIW2Ox0PmMmvg==
X-Received: by 2002:a2e:a545:0:b0:2d2:3e75:32e8 with SMTP id e5-20020a2ea545000000b002d23e7532e8mr4077614ljn.13.1708469858968;
        Tue, 20 Feb 2024 14:57:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q8-20020a2e9688000000b002d24de76dffsm277990lji.100.2024.02.20.14.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:57:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:57:36 +0200
Subject: [PATCH RESEND 1/2] ARM: add CLIDR accessor functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-armv7-cacheinfo-v1-1-69dbd7f20d04@linaro.org>
References: <20240221-armv7-cacheinfo-v1-0-69dbd7f20d04@linaro.org>
In-Reply-To: <20240221-armv7-cacheinfo-v1-0-69dbd7f20d04@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t8WE1+fA8j81+AJkUCcorxLRWwscCfXSF46thI/6wwA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1S5hrQqywysV90XIPIec3CzG65DMLy1p1IZ+m
 JFGMLPt8OqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdUuYQAKCRCLPIo+Aiko
 1XyUB/9fcr+ssXTBs0xyFgXSZLdfnWArU07R1WxcaKc4SGofjSH2cU7fgWJwOGtBujY1BR4/vke
 PATVIYgVKhIeevkl1BYO3nLjBrdCu7imAIvQfHCpSUcXFWg8gQDSbdSYfUmg5Q/BarV2+iVbDtn
 LgI6C5uwkFcFs4ibvOs2cZkc4O7sDKs0FJMC/EALdDkk4gFsgCBw3ClMxjiIE+/LhN4/Ms2pKPq
 Jlno4AT2Kas5CQkPzVTfQ1J8lmW68w3prLGHjdxAoKez9nb505CK9gG/9zg8F6Qgw/aomGZfm44
 l4DRFDlJRGpqEhTAcZB7j0+nyrsavOxMDJPkBwGybdtAx9s5
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


