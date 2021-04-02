Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D20353083
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbhDBU6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbhDBU6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:19 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7AAC0613A7
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y1so6680969ljm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=UIOLlYXeFyxFtjRSPDEczkGhOllaHblgAqT4THkZaXkXL5s9Gm8dMqX7NJ/9fiV9Id
         vXmQ3Q9iwMdi87XWgsWr0/6xTNtdIjKU1gOCtp6xvnHIG80YzJjfsc4Lci91GodQiVA5
         tlSRG8JPLVtkuW/o3lBVrFJUDBPDT0Lf+4QURxBvmIqzL7dztbW0za5bh745ygopmvaP
         X313s/Wkj1s0uUGtqMCqLqH8DbZifxc7t1++/D7DsPV6ZM2wiV7Axaqvo2kOJ4jbHNCc
         tUhTa0KCUukgZUo+s2UVs328zfZnXaPgBBdp/iC2gHj/Y9Z2J9/HwqzIZ6s9E+zgx1zy
         WK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=pBLF4pZjJcilYM8PuVxjWMTL+YmVnloHPUGcqJHlSNhhn1+AnfmNXg8yKnxzjv5905
         kc4ptIq1HVhPXBG72kgOKOhzfcN9GUl8JXC4fkbIo7KrE/t8chRDvqQGM37DL7oja4po
         aP3z3TWko1fqQb4AV+KhzSG3QfjzdvrYf5vJdrGfQC9FfXBXOiYzUvhZK5LxEZ9XyUVS
         Cf+N6WFhBoP1JECQLb47H/NUVr8BBlu/Xb8sRpnvr8r4OmdwYhyvtkXuZFo7u0P1AvDL
         J6jm34l9bwjFqnz4OiSsIHzdXnpRoWW7hBKKTHe9JMCtkX+8duL4IkB1Hkd5Nf36iTIg
         lA0Q==
X-Gm-Message-State: AOAM531nTsV6wWWPJEajECEFBXCLhla7MZVxEVgO2jmf/YWvF4Ckcn93
        Qw9m+/otGj0/2akNVKGk6HsrFw==
X-Google-Smtp-Source: ABdhPJx/24DfvVJKchpFN+553z9kdzfdaeZz8uLYhYLdq4Ou7U4b2c9pNdmjSiMR5jH1qcYC7snVsg==
X-Received: by 2002:a2e:5753:: with SMTP id r19mr9171487ljd.126.1617397094319;
        Fri, 02 Apr 2021 13:58:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 10/16] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:58 +0300
Message-Id: <20210402205804.96507-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

