Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3253ED847
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 16:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhHPOAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 10:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbhHPOA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 10:00:28 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8726BC0612A9;
        Mon, 16 Aug 2021 06:59:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z9so23713487wrh.10;
        Mon, 16 Aug 2021 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZutF4knfsOuF8Cv0WuZd4fBJstx8+dJNDUrpHSR5Vs=;
        b=IabavD9KFls6I9KUiTe51j9br3DeNKSgVE7+mmsIZRHz0USNduyx8sMF2GS0bkAaD2
         RqF5tIs3hm5fMte83Jy/ne0nQ6mvuaDwKx/gjNxZ6ThciabLsABGrRobFt0FbJW/j7ve
         EopjjYZCHdUQ15qg1eI9cVfC3tWBCuECilkbZruZGpjauo5XPwo6vUrK5h/CytB8/IyZ
         TWmSjZCpDUbt7SWGoh6ytEv+2ZdnRuaLJPkNDfOrOlUu21nlXC4kan24kQeCZK3oWF23
         xhpfveSS+D3AuxtLgsX4H2lR4P+bNpGg9iBx77rHU3SZTDEUfxl+PWhVJfWnvxfH73Cs
         uyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZutF4knfsOuF8Cv0WuZd4fBJstx8+dJNDUrpHSR5Vs=;
        b=IbKe/PxNJ3WKLbP+oEoXbSzScVi/CCBcVBmfsh5nm7FBQaMRqjaaETcq4AwE5a0oWM
         lNAYaoqqbBQm/UdLbvkmQS3SBA7dJUsI/NLvnuMJCk6RI/7eSqzOgESlFYVgZI6xeQCA
         QY/WzVzS/5dM377NoGQfSsptt4djaV9w5L5ASGbrwGTHVxFc8sHFeHiHzO+mCbF3Nkyz
         J983pgJFj5QTG7RlrogaPeQvX8UQEZxGSE/fUbZb4hlD74SRuQJOvkDcABpptNljZTHY
         0WHKoA04vpavBDzi2fNrg9ix0ozG/QNSrBq1vVOq7IJnMvahMkJnb4stXtVdIt6IfZFj
         OK3A==
X-Gm-Message-State: AOAM532p/zlNQVyOqk3+jKDNeCphFSCOHIvkUeZ98SpJrG2IGaiX6NC0
        dfQCR01Zn5F7H+IQiCVBQOk=
X-Google-Smtp-Source: ABdhPJy+Q+4j8nqBRSzx6Z9tbZZ5EqsU+MprxZP86/ilnLcVEKX6wtCdxRv9oY0sEDeO94qwZrdWbg==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr18410368wrs.127.1629122376151;
        Mon, 16 Aug 2021 06:59:36 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id r129sm10697693wmr.7.2021.08.16.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:59:35 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] clk: qcom: adjust selects for SM_VIDEOCC_8150 and SM_VIDEOCC_8250
Date:   Mon, 16 Aug 2021 15:59:30 +0200
Message-Id: <20210816135930.11810-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 5658e8cf1a8a ("clk: qcom: add video clock controller driver for
SM8150") and commit 0e94711a1f29 ("clk: qcom: add video clock controller
driver for SM8250") add config SM_VIDEOCC_8150 and config SM_VIDEOCC_8250,
which select the non-existing configs SDM_GCC_8150 and SDM_GCC_8250,
respectively.

Hence, ./scripts/checkkconfigsymbols.py warns:

SDM_GCC_8150
Referencing files: drivers/clk/qcom/Kconfig

SDM_GCC_8250
Referencing files: drivers/clk/qcom/Kconfig

It is probably just a typo (or naming confusion of using SM_GCC_xxx and
SDM_GCC_xxx for various Qualcomm clock drivers) in the config definitions
for config SM_VIDEOCC_8150 and SM_VIDEOCC_8250, and intends to select the
existing SM_GCC_8150 and SM_GCC_8250, respectively.

Adjust the selects to the existing configs.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 85b090a8d9c6..6c54d810d615 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -579,7 +579,7 @@ config SM_GPUCC_8250
 
 config SM_VIDEOCC_8150
 	tristate "SM8150 Video Clock Controller"
-	select SDM_GCC_8150
+	select SM_GCC_8150
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on SM8150 devices.
@@ -588,7 +588,7 @@ config SM_VIDEOCC_8150
 
 config SM_VIDEOCC_8250
 	tristate "SM8250 Video Clock Controller"
-	select SDM_GCC_8250
+	select SM_GCC_8250
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on SM8250 devices.
-- 
2.26.2

