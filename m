Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAB826E6D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 22:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIQUjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 16:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIQUjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 16:39:22 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4277CC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:22 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w11so3679137lfn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RDl9NmYiLlZSv7QwGraKBizlLPg/Gdr4byNVfeRgNB0=;
        b=Gsc48rO5rrBt0NNOWgaWcTqG3F3M4YLLRBcQvq4oNd3Jqc3LQ9aKI0UXxOZauyBtyk
         RHdI0ZZEGWWAL4ENwNaGvqrRgvSnLA3B1Y13/q4h2rfXGTusORdYiHAoBPUbjfpvlX9p
         wfNSJj75VzNfDT9la5Vr0r49eDGNPWfm42f7HFPZskJGQD+FZrCS7i4lAEHrE/I01E/G
         5fOFO+6XsQiQrhref/EUA62WBH94GPVT5lNbohAzcvCuCOF4DlGSClheg6lpgjt4g0y/
         EDGhT+nsaZbh8SGsohGnorlaEmN6l7jNk6z293jAEMqpDUsCgDy2z/Nk6qn+HvOZOLyS
         hsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RDl9NmYiLlZSv7QwGraKBizlLPg/Gdr4byNVfeRgNB0=;
        b=rUi30K/94Ib75kAalu80SF0018nfktEyoSwtzdYXy8bTJb6SsBECKyEQQCCDTMSxCw
         iNhaLbBcfFUwSYOpThUBSGZ7zkcjGAMaZtslGtr4vC4kj+Xi+UCJ1OIik8mql/JYaMfI
         yJOE9F/JmDTMmRmbgg74wJbKWLyfYUh6wpp2gfwnGya4BvdY87v9JftOAsyXD04V0T4z
         7ckj2D9g30vhB4jbDwG2WOsI90tzPWP0vv9p3niKDKRpZ7L8ul6+eQkCT5kCIAsvRUfQ
         rdEBkgS3sRDUYyGybZQ2J1W5X2WzuDofTDpyVcFNLM1NgnWTbbIaGm+LtU3ZMPu5BsMO
         HKBw==
X-Gm-Message-State: AOAM530NnqUnjbnTuHCVncYhMgbvac7d74lQ6QPyEyx2x+ZNcK/1nl5s
        0/491xtOg8Y0dZmBV3ae8YZ4FYWVFDMX7w==
X-Google-Smtp-Source: ABdhPJzkH/Q8sZETHQqf2qO4o4jCqpS2VaHAMcv1W64ZErlPNTBMlfKdd/JTcQJRhxVVyD68qefuOQ==
X-Received: by 2002:a19:df53:: with SMTP id q19mr9620958lfj.119.1600375160699;
        Thu, 17 Sep 2020 13:39:20 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id d9sm128192lji.87.2020.09.17.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:39:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: defconfig: enable Qualcomm ADSP Peripheral Image Loader
Date:   Thu, 17 Sep 2020 23:39:13 +0300
Message-Id: <20200917203913.3250205-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
References: <20200917203913.3250205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable Peripheral Image Loader for the Qualcomm Technology Inc. ADSP
remote processors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d0a0d5d27c32..30037e02110b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -909,6 +909,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_QCOM_IOMMU=y
 CONFIG_REMOTEPROC=y
+CONFIG_QCOM_Q6V5_ADSP=m
 CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_Q6V5_PAS=m
 CONFIG_QCOM_SYSMON=m
-- 
2.28.0

