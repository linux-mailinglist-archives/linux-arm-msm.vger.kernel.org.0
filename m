Return-Path: <linux-arm-msm+bounces-34342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3250C99CC01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB8F4281DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8D31AAE06;
	Mon, 14 Oct 2024 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lw15VpqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADD318453C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914129; cv=none; b=Q+yphEhybTP3BtjMQqE0BA7Ibn48UdtQ7g2ZDuIbCVL7i9yCBYzz8Xd5AQ+IU1xdbIX/eFL6yoEmmDn67U/SfkyEFGsCHLWVZyab9QphYeRLVtTxKgTXqgaasrhCN8JPDxo8UVQvTSOd9tm0Ga1CobdX86qxv9i0KrDStW50MNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914129; c=relaxed/simple;
	bh=OB3yO9FQv0J593fU52zHVnW8M9sIKaaudWV4PCqWeY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APDnIfOzQLImnFbxKni5L3BR5Urokr4mEjeRLgbOFSKf0L69gcV2bPVkRH21JuyvTaGerYEQ9Ak4j0tF1R13NAPKZ9tL1rpGACxgFLGojzwhRF4tu/jPQPtxWBVjn3WeeZoBjspvKPXXLh2TOxHbTFtsRabCYpl00JnzxAWNv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lw15VpqL; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3110b964so32611791fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728914126; x=1729518926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOBAB4fCN+OYdhF4Gj278BY1JY5UgUE5qLDzZmKiBEQ=;
        b=Lw15VpqLztVfCUckdCH2p/oWcadCfGzQquMTEwxjJtCyoR4A4B01BzOBtMkd59/3+r
         fZTjmyWcnt/BY5GdPrq0Dcrzzqs3tKZEPGvYs+e5Jz9DoXp2ppA5skUyl23U/Ox8c46Z
         t6lEnsY8Cu752OpHytfVg8+pzsAz94YarUY+AotXf6mLBaQCt33r2VfLvmI2jYL1vVf3
         CxJNFZT0rDVmth/bMQl+WuhzYthYL1VYLdeETcKBNLVu3TRC6FZKGprtfoYp5tRDgNT3
         L19AhV4JY/lUSByEx6uy5kg/hgSSm54Iv9Ud3xQU3hMNowXM98mIIFQ7RxSpgmHrkcqd
         Hw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914126; x=1729518926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOBAB4fCN+OYdhF4Gj278BY1JY5UgUE5qLDzZmKiBEQ=;
        b=hxNlJl2amJ7n06C1Fjkam7W/2Yh7+6gHNtlhKgarlQdf1qk+HY4oJwMxfHiKtdHL7r
         JEWGB3GXice45awNp1cXRzrmO7ey/KS9sttDCndSz48ZDoFhtAlcPzK1dtbHLCsXQzQ2
         RwUwZ9bGBxioAJT5M0nRZaH+ZCl0Yk7aJIHfbOKta8foN4W/VoltpBKSY3CyBS6Nt26D
         AA3EPesv/9gD78J278pm8lV+aNTk09s8vBcpQAfdzR07+0NqV3n5mF7P3QWbR5Mj7mpP
         luTtYEzgPOy2NPKA7fE8Jq0qXCNKi0UnIBJSQeBHr+3/YAoZlGpwN0HQSNyjs9Timuvx
         iwQA==
X-Forwarded-Encrypted: i=1; AJvYcCVNys6S2X3cxfQEX49ilxgntyqWVPwsXaKLiZ9NG6qNpqbbI/Ij5142qKJTGEr6RwRIZlrqwIrR3AIpeckL@vger.kernel.org
X-Gm-Message-State: AOJu0YxcrScXW7/Q2+Ewd9gFkiiPqRgSUqws9tcQlccOGkvB/czrj5sr
	NUgQqZDCGXovpF/83W/9u96YklZIhqd8qhQRtLi7g8bR2jVGBwWjZPI6iAP5bm0=
X-Google-Smtp-Source: AGHT+IHXfxymwMuBTLIPhj1IILaLlqCN68Kc44a6pGyIrVl/vNinMfPWVaScDLDhzz6b1w5Xu/CMGQ==
X-Received: by 2002:a05:651c:1509:b0:2fa:bd30:1928 with SMTP id 38308e7fff4ca-2fb3f2d1b11mr26316081fa.32.1728914126119;
        Mon, 14 Oct 2024 06:55:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb438c06f7sm8039641fa.55.2024.10.14.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:55:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Oct 2024 16:55:20 +0300
Subject: [PATCH v2 1/2] ARM: add CLIDR accessor functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-armv7-cacheinfo-v2-1-38ab76d2b7fa@linaro.org>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OB3yO9FQv0J593fU52zHVnW8M9sIKaaudWV4PCqWeY8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnDSLKtlJv5vCrtJr/cNbUxbxVvYF7NDouakMt/
 W1CwyiX+LOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZw0iygAKCRCLPIo+Aiko
 1eKFB/wLj20pVDg44I5tdPc6vbCK41LLd742EI7OeUQjip1Myn2p+pnpfgShdMzFHwpnhcVz+fa
 Y9D5UQ/73fOaI8EMt/CO//nyZbPZlu9N40Zto9dDrzK+0X726hn/F3prsFNMv006TFfUUzKYSzU
 7G7WVg9nkw7wJ9druObfFR8Ph/b5ouw6tq6gXI4w25YtvTtKs+SoMxlYODeBQzKY3yN9T/DiEaX
 rPj5MwtIYfX/H1HWKuGJ6YyJMq4TSNGBmW9OIOQJnYogypC1bmE8+mgOFi8cFX2ys+jFvJybFtj
 drlm+eQF1wGx1JzNAnDxx6gtSNqrx/CUJIU4EW/pQZYEIABX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add functions to read the CLIDR, Cache Level ID Register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/include/asm/cachetype.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/include/asm/cachetype.h b/arch/arm/include/asm/cachetype.h
index b9dbe1d4c8fe..b01c59076b84 100644
--- a/arch/arm/include/asm/cachetype.h
+++ b/arch/arm/include/asm/cachetype.h
@@ -83,6 +83,14 @@ static inline unsigned int read_ccsidr(void)
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
@@ -96,6 +104,11 @@ static inline unsigned int read_ccsidr(void)
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
2.39.5


