Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE226453C09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 22:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhKPWCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 17:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhKPWCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 17:02:22 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A8BC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 13:59:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bu18so1472880lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 13:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzBSG7kqq1EY//DQG7+JE9yhI7O+ZkeELeJBY10brBc=;
        b=e5itTIH1lt/EmfH/WYKCPydb4uuDiRzUrgSRSeHm2fvv4Niw2na+bMeRcl5YYXOrC1
         olXg8K21mKkqOkuEY7xoQkjBPQBdEDOBxx73i89UPAFG81PxTnbKqk51KVGarXIyhgRg
         8p2+vo2Eeyli/5lMZfnvHgSEhR8BxLm/9MlY4G1KRQR3VymbLUbEzsdFlXJrbvBNQ978
         HH5R/KNg77tsaDZHdMp/opldbCyc68Nc18RjX8mIjz9PfYf79jH0SzGAQ4rw1xrAktb2
         +0gSa+S+qOe5KNcbH5pzcdIcAZdM+B6ZN/9JVSLKOGA9o+hGbQlZwC5B7zsyr6UfRz/s
         CMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KzBSG7kqq1EY//DQG7+JE9yhI7O+ZkeELeJBY10brBc=;
        b=z0sN/rU4pschajp8nLTyKN+qNQH1732WAcn9qigTF4r0A5AwnT4c+XLdQlyFPxT38T
         Q00AnEydoGZ/aEK9qG0cNPozRsgtfgDgFs9RZ6FyoM5R/mq5h1EyVffmtKGc29m0eoff
         y1SyVrkd5DZb5nhuUtGvVBpWVmCK9EDtqAUTDHCMfyiRSfJnLTAoWN6RIgu4sfyYQw24
         O5ETfXf5966l1rmwspNdI7/yjn0CGmgPoAhf8iR6ZcZpPFiCU+WsCzxaLVG/0Z/6M/HN
         XnepMB/hznUgjkDlXhiWY6GqOpaRu67Pjoh3//Cz67AfR0XcNrGJV5kWyHEuo7QtdYYq
         iw/A==
X-Gm-Message-State: AOAM533/typCdoqFnBvYKVQudLalGstqJciIMm+2RIJBg46Ziw5lH53A
        282Vzq6ETgwp0sDX+R03ghD3Ol8Y7M6ntw==
X-Google-Smtp-Source: ABdhPJzO9Hn1W3kxt9zTmvgN8G1UlwIKRw+MfPxLZ4aHc/cTCYlpK/q9vdVM41qpxsomd3FG8uqGRQ==
X-Received: by 2002:a19:7709:: with SMTP id s9mr10036514lfc.682.1637099962990;
        Tue, 16 Nov 2021 13:59:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k43sm1896871lfv.177.2021.11.16.13.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 13:59:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: cpufeature: fix CPU features mismatch message
Date:   Wed, 17 Nov 2021 00:59:22 +0300
Message-Id: <20211116215922.2021550-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix cpp magic involved in ARM64_FTR_REG/ARM64_FTR_REG_OVERRIDE macros.
Currently ARM64_FTR_REG parameters are expanded early, resulting in
cryptic debug messages:

[    0.071123] CPU features: SANITY CHECK: Unexpected variation in (((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5)). Boot CPU: 0x00022200101022, CPU4: 0x00022200101122

Make ARM64_FTR_REG to be expanded before parameters, resulting in proper
debug log:

[    0.071163] CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR0_EL1. Boot CPU: 0x00022200101022, CPU4: 0x00022200101122

Fixes: 8f266a5d878a ("arm64: cpufeature: Add global feature override facility")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ec7036ef7e1..72e3e3819eb4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -573,15 +573,17 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 	ARM64_FTR_END,
 };
 
-#define ARM64_FTR_REG_OVERRIDE(id, table, ovr) {		\
+#define __ARM64_FTR_REG(id, _name, table, ovr) {		\
 		.sys_id = id,					\
 		.reg = 	&(struct arm64_ftr_reg){		\
-			.name = #id,				\
+			.name = _name,				\
 			.override = (ovr),			\
 			.ftr_bits = &((table)[0]),		\
 	}}
 
-#define ARM64_FTR_REG(id, table) ARM64_FTR_REG_OVERRIDE(id, table, &no_override)
+#define ARM64_FTR_REG_OVERRIDE(id, table, ovr) __ARM64_FTR_REG(id, #id, table, ovr)
+
+#define ARM64_FTR_REG(id, table) __ARM64_FTR_REG(id, #id, table, &no_override)
 
 struct arm64_ftr_override __ro_after_init id_aa64mmfr1_override;
 struct arm64_ftr_override __ro_after_init id_aa64pfr1_override;
-- 
2.33.0

