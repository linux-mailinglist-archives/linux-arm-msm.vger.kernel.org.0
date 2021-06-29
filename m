Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F74E3B7972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhF2Ulv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbhF2Ulv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:41:51 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBB1C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:39:23 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id f13so32826754ljp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGGdhrQRxRIwpexQ026nf1QwSjPosmBJCMufHDMbnLc=;
        b=ZHes7vTF6ekSlCjtih4vBw3PMWUUnp5NLHqOUsSxFK/fKLA/GQCgT8SRgufgTC/sSn
         pNF9hu/hYIbDZH4Pu+lNgGmp0frywk9rtmmD1UDri+A0W1bOGhLWn6/deAbzOikj3Z76
         zzGfykPrcLYqtdYbk79HJarMA5emMrCH63C6rGYY2uxILrQk0ZqnzkXG5t+Mud+pEnIV
         hyd8t8tMPmbVkq7ej/thFDUM1gTer0YbIssINjQtu2oqRSbDlc1I4eIZpuu72TXGqU82
         BTzGraItHp0s3/FNZb6zjcXAVdfFmnKUYSLeHp/mfo9pB3qLLmx9RvlH92q3jVdj9mc6
         7M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGGdhrQRxRIwpexQ026nf1QwSjPosmBJCMufHDMbnLc=;
        b=BcWGAQl1WGVs3rggGz131HXMIS61MPGTpptkdUwTHA4l6B/KgG9RqE5wGKccPTH9UJ
         tHkqL9XhU6UGc3PctOtyJldunfkWKfyl5b/9w/8dF1pQsdG9AZwqRos7Lmj4a/OaH0Ng
         ln4nEsu1Zj0U9GAQalfH0Zysza5ro7QDf8KgEjZ1bKek5O5I2QoEqOkmz6R1/yiyMEBk
         YWFgpgSYKjl2HgE8EWY9AO+90hjL51dfIV+Z7ia7qBtkUE7p3OhtwPlP+wMyjfRCUxEU
         ye+eW/qCpkFYWNyZYVdceFUNNvWOHj6n7C9ITOmdIxHdYd2xLzko2yxzETdx8iNVD9TU
         KM6w==
X-Gm-Message-State: AOAM533VDyhzmphpRJUxYWbi1bkZWmUHDtPuA0BGNSmrXov5mBjpi2pV
        nMm4Q/8Ww09vN1I4K40qOkAMQA==
X-Google-Smtp-Source: ABdhPJzROw9SP++u6Y10jdS/n6Cw2Qd6JTOh5rY7Mnsvp6UoXX48ZlDS4FLp1ChapTVgvLJsky8v2A==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr5392588ljk.112.1624999161861;
        Tue, 29 Jun 2021 13:39:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp34sm1716902lfb.125.2021.06.29.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:39:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: fix domains cleanup in gdsc_unregister
Date:   Tue, 29 Jun 2021 23:39:19 +0300
Message-Id: <20210629203919.2956918-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
References: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Properly remove registered genpds. Also remove the provider before
breaking parent/child links, so that the system is consistent at remove
time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 241186d9d08c..4b211dd1764d 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -475,6 +475,9 @@ void gdsc_unregister(struct gdsc_desc *desc)
 	struct gdsc **scs = desc->scs;
 	size_t num = desc->num;
 
+	/* Remove provider first */
+	of_genpd_del_provider(dev->of_node);
+
 	/* Remove subdomains */
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
@@ -482,7 +485,13 @@ void gdsc_unregister(struct gdsc_desc *desc)
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 	}
-	of_genpd_del_provider(dev->of_node);
+
+	/* Remove domains themselves */
+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+		pm_genpd_remove(&scs[i]->pd);
+	}
 }
 
 /*
-- 
2.30.2

