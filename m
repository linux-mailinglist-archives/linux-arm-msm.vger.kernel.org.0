Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF0429BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 05:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhJLD2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 23:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhJLD2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 23:28:40 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF511C061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:26:39 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x130so7454819pfd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHHwrsGoY09KjGS2vtOrPmLf2afjNsa5iG32r2zDjY4=;
        b=QvbtsrsHAUIWklgtzUpkQ2LOQO3HnlOIYDGNk6ZShxTSz5fMzrMmaU8KAAtVKMJuf+
         /UZzvHspUYE3eHPRRdlhVHUeQe4qg1Ad8Y2lZIXa2AG7GT5JNSsc/MDwhxxAdKtt9ny1
         lBfCXqSQazloAumpfww2OaJSIcmuSdLm83icTdJryiXsjFx38rCHHKIsug8FarSKXIHR
         kp6+BsOBO4HwX7KB8MK8kHgl0L5vx4DZaLref6IuToSqrbuCGYIbZWyRp3HHZaGfcpr/
         uHMAuZYrqYWWihAIg1LTfprrAJiXXRQtice0l2QqGOWZgbagjW/T/F9BFh1X/hy5mDd/
         bp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dHHwrsGoY09KjGS2vtOrPmLf2afjNsa5iG32r2zDjY4=;
        b=cdLTy/alIjorco0dATtqYcIGZC7gKn0MiTbnfC75k+6eIpoCwDV6gGLT9v8VN9Ymbx
         sxdQpAdY/cuCwkIAP/FeTEyQWEq9a1E7ICHWLnZfqT0nAogC4pnqzCGyWYOiwKGbtyWk
         t/nih4XedaIeKq+5gBiMKXUsZue24flO3kecMjk6syyvo2qlnG4/LzUow9a5t6JhJGl2
         3QivAZZiFJizd1rTaFvc1NSvSu5quKsljPmcRAmSIkrPwxlMwurwQchMwgp0LPjrgA/H
         blGXwSh9xrP7jahlK9uTcAwpqZWti218Raym4GEwXrCCsUAYnPoqPmRlHF7gBJJp9fB8
         LBPw==
X-Gm-Message-State: AOAM531MXvxKUD6wKkbuiioGIziPxiqnxoXw8W3yngkhnphyQ0EYtXpB
        E8Yy8R2VLnvKnD2KHzEHRTggnw==
X-Google-Smtp-Source: ABdhPJzyHHdi3XrbSyUElVJVoExTAE6S8BIyM8etv1e80ONk1GLiz7rx5KGsLdo4S9RUaDmgJBMdyg==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id p16-20020a056a000a1000b00412448c89c7mr29286065pfh.83.1634009199232;
        Mon, 11 Oct 2021 20:26:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u3sm9241071pfl.155.2021.10.11.20.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 20:26:38 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: [RFC][PATCH] iommu: Kconfig: Fix missing config option for CONFIG_ARM_SMMU_QCOM
Date:   Tue, 12 Oct 2021 03:26:33 +0000
Message-Id: <20211012032633.4169364-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 424953cf3c665 ("qcom_scm: hide Kconfig symbol"), some
logic was added to make the code depend on CONFIG_ARM_SMMU_QCOM,
however no such option exist.

This caused regressions on db845c (and I suspect other qcom
platforms), but can be easily fixed up by adding a new option
to re-enable the newly conditionalized code.

I set it to default to ARCH_QCOM, so folks don't have to
discover this new option to keep things booting, but if folks
would rather, I'm ok to drop that line.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Fixes: 424953cf3c665 ("qcom_scm: hide Kconfig symbol")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/iommu/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c5c71b7ab7e83..e674796b1174d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -380,6 +380,16 @@ config ARM_SMMU_V3_SVA
 	  Say Y here if your system supports SVA extensions such as PCIe PASID
 	  and PRI.
 
+config ARM_SMMU_QCOM
+	bool "QCOM Specific ARM SMMU implementation support"
+	depends on ARM_SMMU
+	default ARCH_QCOM
+	help
+          Support for the QCOM implementation of the ARM System MMU architecture.
+
+          Say Y here if your SoC includes an QCOM IOMMU device implementing
+          the ARM SMMU architecture.
+
 config S390_IOMMU
 	def_bool y if S390 && PCI
 	depends on S390 && PCI
-- 
2.25.1

