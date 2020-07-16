Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886BF221C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 07:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgGPFsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 01:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgGPFsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 01:48:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E9BC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 22:48:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so4128276pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 22:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcjGMlvxaLvf+5Qx9y70nhyWvIrGkWz3MBzmHdjFud4=;
        b=Y73DZiGCNXSiY//N6sNgC0Yv9LqzR32T9dyDXTCVjQrypbaV0JpeZJAsu4K2MS/iA4
         tVRE4rgZq3p+sKM19YapD+CGtv0fD/DxwQe94rgpGqHG+ZOtE8DRH5ue2hgEx6RvjZq9
         Eac2HuNPK/go9BP0k3m2crj1jUADiUZKf/SrnENfyrHMFLBJBCSXGFkozGOxZjl/iyBA
         KelrTBPlLFxTWKNTtRsPXEuVBTbuwIonBER9lQVad7DoZ543VttTXpnNVAoHJc2U1FST
         z7PECvJpjoiHRVAtBuQpssgp38dzC1XrsrK3aGkFeMcUZZACKXMfk7y5gu5PtjBKUF1h
         Op3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcjGMlvxaLvf+5Qx9y70nhyWvIrGkWz3MBzmHdjFud4=;
        b=PPpozzoCkaLsrQWqr+7U9ZeRt3Swbz8QE/yMH5ywKBN2KcfWdW8dl3sUAihQaRVmCf
         FEBD2B9cVkAjWLmOITWt1pY3UthrCTaS0zJHKRuKRO8svQ2fZobOD5laN82me3toe3va
         FMzN6L+D90s065qfQbMBL3ZDnRfyx8YfveG88QdIVMgGHklPJsADECuFsYeA+cQ8AzmT
         akumPomr7F2LjQIQsOF6/iC9LVXpGB3ZGgaIYrLEk2wuZw5/0SPJA/rpTu2ifiBJEx3e
         ccyD+bdDOnCe7eBBSBMVOt55zd4DZ9P3Q5bwrs9r7flSoyIUjGIO9L0bsOD69A68kazs
         hUpA==
X-Gm-Message-State: AOAM532FHqrt+3DfnbegAcHcq426Cc9LOKEW3k2llC9t7lTqOUYEFd+e
        TrOqO+ZP0yuhPpbcu4kyB0J3ew==
X-Google-Smtp-Source: ABdhPJxgSNsrdonyiZ4TpMu5c5IjfTLUQbvfXYif2dVLhugs3juB7O3pgeWaVE3XdMP26ZR+yCp79Q==
X-Received: by 2002:a17:90b:8d7:: with SMTP id ds23mr3267380pjb.148.1594878498322;
        Wed, 15 Jul 2020 22:48:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o4sm3707657pjo.16.2020.07.15.22.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 22:48:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] remoteproc: qcom: pil-info: Fix shift overflow
Date:   Wed, 15 Jul 2020 22:48:17 -0700
Message-Id: <20200716054817.157608-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On platforms with 32-bit phys_addr_t the shift to get the upper word of
the base address of the memory region is invalid. Cast the base to 64
bit to resolv this.

Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
Reported-by: Lee Jones <lee.jones@linaro.org>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_pil_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
index 0536e3904669..5521c4437ffa 100644
--- a/drivers/remoteproc/qcom_pil_info.c
+++ b/drivers/remoteproc/qcom_pil_info.c
@@ -108,7 +108,7 @@ int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
 found_existing:
 	/* Use two writel() as base is only aligned to 4 bytes on odd entries */
 	writel(base, entry + PIL_RELOC_NAME_LEN);
-	writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
+	writel((u64)base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
 	writel(size, entry + PIL_RELOC_NAME_LEN + sizeof(__le64));
 	mutex_unlock(&pil_reloc_lock);
 
-- 
2.26.2

