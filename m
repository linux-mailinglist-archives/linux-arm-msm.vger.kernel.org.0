Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD8FFDD47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfKOMSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:18:13 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43264 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbfKOMSE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:18:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so10441518ljh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EKKyPkgTIrUgJLfJdMi3ez4CUNaFpld4hIHRZMCg8t8=;
        b=vy1vJB4N1Afx8NhpJeEBnSR0cw/HleAoP92rEem7iYYrvxLZnzNIXlWVL5HWZV2Unq
         VN0Oh0tPfXotXABobmT2vd2sB6RRYvHlGRi4PJBCLt8aEYiF644ZRUwGpdiRjN+bRx1R
         xXYvYVsusGIMVYU1E53jvUhQg8Ulsuuzle+kgSYZ2GGofnQZYE4tlVffFUrAhG+YslzW
         mt+IF3G8GGbVGJpJWrimUxPKQ9ZhqlwfJsaySAQSz9p45HEmf0Qi17HYAr18XZWDAIG/
         AD1iM7XZ4RGsomT8OKw3stAH7P71rqqufUvrkSjGzD4Z+TzolbGjwgmn0DB0iygicw6H
         G2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EKKyPkgTIrUgJLfJdMi3ez4CUNaFpld4hIHRZMCg8t8=;
        b=YcPCXE0+/9gM1H2c6a3dK2rp3R44KMTqJSMmiMYbHAgrE2yNQbIwiUoXxPzOtiUeLQ
         Ds1g1EqQnv6GyD0Ilv+8sCipuwzDp/L+fLc1Kpmv3g6SVe3XKyD3sPT/X2IbiNHsoBJw
         nXYgtTtZ889FL62Ez/UxdLnhbkyb67WvzCSVKKWjjooInTc3b2+foFllogbwSBG6jIxm
         hutPcwn4wtQZzHxnSVlgSYx4o1wjNFq3l2La2JRwnieaNyKjiifi4GvTL00L7ntMOH9z
         peiNs8Zo8p1WWnTGgA3EbiGbgcgfUW8a+yYXRTivg4kNOFH0FZKFaKiJz8UxHPU5fdLK
         aSBQ==
X-Gm-Message-State: APjAAAUbQg9W56Fjiwco2a65Ol83H7Mm03rit7psi2+XBRecpHO7A1WQ
        ggNBiyvwpkFS/GNBc5nK6HvhRQ==
X-Google-Smtp-Source: APXvYqyc7/njB2TOHQ/xxoQ3GlfB7ZlZuoZFAdFYf7PUCmHsOp/ClIPMEE+HE5YoWIok2S22oIMusQ==
X-Received: by 2002:a05:651c:20f:: with SMTP id y15mr4870369ljn.31.1573820280621;
        Fri, 15 Nov 2019 04:18:00 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id c16sm331070lfp.93.2019.11.15.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 04:17:59 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/5] arm64: defconfig: enable CONFIG_QCOM_CPR
Date:   Fri, 15 Nov 2019 13:15:41 +0100
Message-Id: <20191115121544.2339036-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115121544.2339036-1-niklas.cassel@linaro.org>
References: <20191115121544.2339036-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_QCOM_CPR.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e76b42b25dd6..4385033c0a34 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -438,6 +438,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
+CONFIG_QCOM_CPR=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
-- 
2.23.0

