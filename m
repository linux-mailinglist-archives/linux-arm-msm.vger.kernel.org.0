Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6C84A4C78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379619AbiAaQvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349408AbiAaQvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:51:00 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF087C06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:50:59 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a28so28084561lfl.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbazlGd5ZzfYdkAuyQfFJkYXtb1nbweTFWXytUoVMew=;
        b=uzxSDxFm1hZXQlqmaAR4US5PBiUePbXHvP5VUBtYjSgTOLHBL+UQ5LtyCYB/CUriQu
         BrbSsog1qfDUd1EuG7M2+UkkNV9979xaBjJJiljTgnKRAHNPi1za67bxTf9120juJFde
         9GXz7Bbum4UMPCus/qKunb1/Eu22z13/jeQvtjEhjhLZsgaEwWSJGUk6pxIDLCP49YHd
         9VgPPViBTaEpmJk5+tZ4aGxZ+lwK4nyL6Rt57m23Q4PnuGzSgBKJrxnCoR1TFsLCRZl1
         vC8FpEpGDWz6tx1DPR7xEzcBBJthBC9fq8xxmzP5r2clmc0jPJ5XXuClg+uI53m9WdR4
         ZjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbazlGd5ZzfYdkAuyQfFJkYXtb1nbweTFWXytUoVMew=;
        b=XIZ0ZQ0GTB3KgecJWI2FE9JRJdE1BL9ZqOgEXMLZUum+3qA/g5oT/ZYw3YRKcAFWef
         406FAftYH+Chh9M61dgksIr3rHAU8Spf39S1Mx1Q6qFDqo13mZyi6Ev3EsbsuY+zfIuL
         m1Vci/5MrMOeNvrCMsMC8nsUbdDUdK9u2lCaO3XlegTF7r6JfGU89vIzp4o0veMd4Vds
         KKpjhrohTNHyGZp1X1+zDJ9qsz3bbZ4AI/6EHsmbYJ/mITVHVjq8bAQhYQNt8jKmKPOI
         xV58j+yN6rXXEZ2gJZ0EVDbn6gA/c4B0urijZVnQ8BInIYaDwynYu49Gq8grgXbIJQpN
         E6yQ==
X-Gm-Message-State: AOAM533s30Qv0I0BJ+rrhLi342yFoZggzuDf8O8Y+96g/9+TErwUYC7M
        nAhQsNYT64WnJCcEtdJ8/LqhLw==
X-Google-Smtp-Source: ABdhPJzLWlp++BpwoG7Q/hCcP6zTLKzd0xOJ9CW62UtrwPRwxQg9coovYKrMc0cRG5DHYsYzpXyHpg==
X-Received: by 2002:a05:6512:151e:: with SMTP id bq30mr16030065lfb.139.1643647858330;
        Mon, 31 Jan 2022 08:50:58 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm2749853ljm.51.2022.01.31.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 08:50:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] arm64: defconfig: enable ath11k driver
Date:   Mon, 31 Jan 2022 19:50:53 +0300
Message-Id: <20220131165056.2117434-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Atheros Ath11k driver to be built on arm64 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ab1920df6c27..c72ae4a421d7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -382,6 +382,9 @@ CONFIG_ATH10K=m
 CONFIG_ATH10K_PCI=m
 CONFIG_ATH10K_SNOC=m
 CONFIG_WCN36XX=m
+CONFIG_ATH11K=m
+CONFIG_ATH11K_AHB=m
+CONFIG_ATH11K_PCI=m
 CONFIG_BRCMFMAC=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_PCIE=m
@@ -1228,6 +1231,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
-- 
2.34.1

