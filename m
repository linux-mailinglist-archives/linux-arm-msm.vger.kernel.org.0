Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5886430C0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 22:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344540AbhJQUlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 16:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242922AbhJQUlA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 16:41:00 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FAEC061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 13:38:50 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u69so21616230oie.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaGvfY3IqblYxtF1dOKvBwFgcky9hdAU3fQd5ouClr0=;
        b=jmfiKiG2pafs8OTavdnFa3dbfQnrKWuAHMls74HqLywnGVAgK225o+wyB8E1mE4pGw
         zMMvxmZY70xNizzbXjGuu4ocLBcijCsuhV9Rn+Bzt8XcOhs3DTuhoAmWeUlYlD6G+ung
         jSHFOl1NNU5RjXDwVHoMGtVpNKuF9ss4neXegaSEDnDnM4eEU3ZNX/28nk01xj48wwrQ
         ek0ztlbthdGUPt7ueLgqziTOrk/uLkSYX9Gz3CM3QbqGyVB1TnwnTzd/BAYtqmP361wf
         rmgM3EDGrzY19dZfrS1OSyw+qqL1LPC+mFiVU3Qn1MlpV6u23rC8SiMh5rlosnkbQSvn
         VnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaGvfY3IqblYxtF1dOKvBwFgcky9hdAU3fQd5ouClr0=;
        b=ol79YqX6LCkIvl9F946ja1QcH7XbZp5bGUeEyuL0qbxp5cc3h43En82LPo5JHO97pq
         qm2MRF48HhaZrGwxycG/YayIP6OalmtwpW2OANDZKvMsldlRkXvdi+4YQblxaISSN1G3
         a5f0Fe4vqmji4yhBGoREMk7edz0/eaAk6KXQSmANkt4HnmKTT2RUPZqhPbq3F013xEBd
         3R8wliLEcsBtjMS+z0cGdUN6i6XZsTFcGPJBhBirUa6ZBb0J//2U1E3uRsL/LywzY/qc
         4mt0A6GzERz2DMTmYJcgKQRJwX+xQygj66Z45VThBnQC50FY0VsM1Nbt0/xi8VIgWVKH
         PxTw==
X-Gm-Message-State: AOAM532DO4JxGeKkMk7H0AR5s2M62gh+eqDDCxTcGpL256F1lPOTtL0a
        k7c8OvB6y49e4dsdH+2b/J1A/Q==
X-Google-Smtp-Source: ABdhPJxWNhNj+p/C8KWNzF6gwqtNUJl6DTVLWdnaw2eblaWmG+FNum93/5Tebybr7P1cRDBSAWaPPg==
X-Received: by 2002:aca:ad45:: with SMTP id w66mr17048263oie.148.1634503129850;
        Sun, 17 Oct 2021 13:38:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id m7sm2382010oiw.49.2021.10.17.13.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 13:38:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm LMH driver
Date:   Sun, 17 Oct 2021 13:40:36 -0700
Message-Id: <20211017204036.2761122-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the introduction of LMH in '36c6581214c4 ("arm64: dts: qcom:
sdm845: Add support for LMh node")' the CPUfreq gained a reference for
the two interrupts from the LMh. This means that if the LMh driver isn't
enabled CPUfreq will not probe and there's no frequency scaling.

Enable LMh to make CPUfreq functional again on SDM845.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 86224aa3a74b..0ae6cd2748d2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -577,6 +577,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
+CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SL28CPLD_WATCHDOG=m
-- 
2.29.2

