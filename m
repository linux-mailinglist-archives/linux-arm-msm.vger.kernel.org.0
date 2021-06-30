Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C3C3B8ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 01:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbhF3XCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 19:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbhF3XCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 19:02:32 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B74C0617AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 16:00:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q4so5535883ljp.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 16:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k2pJB7kzaE3cwUXfHhNQ/snYVpRf0hIxIEPV1H568iM=;
        b=WQMWBbh5E7uFL+sdKynMR23K2epZrvv3d4qdbf6GF8N9TPFO3CTH0nNaPMpQr18zHI
         NchhLl8+kfXh/baqTNO1GQ4rAya8/b7DrXUKXQaEN3I5ypnoERDP8gc9GS6Sv2oTbBYX
         DaljhoS7YvfdC4yRH9Mq28F6CpU/ksYEadAkiTrFWciqbkP6YOLfgALE8w7PrzBOeU2T
         /N4Im75cLDoShtIRLMI8noQL+QMpYvvMUa9+i4NqG7vwPe599oMj9VB6F8K0/nodcTGC
         i5B53MoDqmG+Ut53PmgeiYGgw26akNXOD/Uxpn9NUkbuI2R//4vE1uUW7pFeycjMMEpS
         kAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k2pJB7kzaE3cwUXfHhNQ/snYVpRf0hIxIEPV1H568iM=;
        b=bZpdssgGpmlGTuki7J+yHGjbPJviqdfHdlPMLj3OLBbbc0f4hYWuN8Uh+wWnurcAni
         ADAAQ1f2+hWFFw5DPqkgOIbr8yK2to+kKXgPzyypomPmqmJyEulnF6cTlKCOEObanvbZ
         SN0RGg07ec/jC+3QvlJjtar1IzZC0ZDNkJtY4VP++1uLziBI5r8HjtnPBGj6pkfLj87K
         b4qyu7+NRtDOHmYwIqv8Yk74o5khHpXAgHha0L8ZwgF+pfmDJRJmRIrc8VnWkhH5pkrA
         F0/fo97Ik0Fqvi/ohUCw3FuOySdZsyRuJZRgJUXlGoHiQ6+eqyg1HEY+uOqmQQUKUyf4
         ATJg==
X-Gm-Message-State: AOAM532wD1HSmm5hZjh4y8igaxD2fAm/0X/sTybRZx5u7ffaihWaLOje
        9iAiXQOMmhVCc2lPmYfaKY+png==
X-Google-Smtp-Source: ABdhPJxkhDC+h4AoEfXwYVO2x0gOF0wkHRTyTcE08z0FVKoc2n7DoipLQRwfZA/ieNd0AL8GNgG3hg==
X-Received: by 2002:a2e:6d12:: with SMTP id i18mr9640228ljc.88.1625093999698;
        Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm2324444ljn.125.2021.06.30.15.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/2] clk: qcom: fix domains cleanup in gdsc_unregister
Date:   Thu,  1 Jul 2021 01:59:52 +0300
Message-Id: <20210630225952.3337630-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
References: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Properly remove registered genpds. Also remove the provider before
breaking parent/child links, so that the system is consistent at remove
time.

Fixes: c2c7f0a47493 ("clk: qcom: gdsc: Add support for hierarchical power domains")
Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 241186d9d08c..9e16f234ce6c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -475,14 +475,26 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
-	/* Remove subdomains */
+	/*
+	 * Remove provider first so that we can remove the genpds without
+	 * worrying about consumers getting them during the removal process.
+	 */
+	of_genpd_del_provider(dev->of_node);
+
+	/* Break subdomain relationship */
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 	}
-	of_genpd_del_provider(dev->of_node);
+
+	/* And finally remove domains themselves */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
 }
 
 /*
-- 
2.30.2

