Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A7C6CAEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbjC0Tio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjC0Tin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:38:43 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935E02718
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:38:41 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cn12so40766582edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679945920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP7vUwcUfZjT92t57J6/2HFlOi0R4gSQ4bD3Gdxv8EQ=;
        b=gVYf6k+Q1Hw3tfFAQM3dthxP++izXDBmMYvfyZeGOhZSqGbDx1qu/5ZyiKE43VQTue
         zPvOP1mwvIB2CxKB/6cmoAngCvHRw0datYLj4+RN5RSnBsXiWmxUbX+b59jUb4MrOMmn
         ZkDGOUk6rXjH2t0VDphftu05shEtZhH861kbAuDkwdyRyMN7S+8RlaKMtuAz0aacMqFO
         1tG3Z8mpmrSpAIUeB7NTlPNGuT4vz7PkgMTro3piu8wao26SgAZtlDfqZgjBh7obA3uw
         CzfiU5guucKSMFYrOAtcjobT1UqiSj3XJ7rnObW8O8Y8Ri5L0ya/cDWZk7t5VVaUzEoS
         k1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679945920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP7vUwcUfZjT92t57J6/2HFlOi0R4gSQ4bD3Gdxv8EQ=;
        b=jluE0oVFSzZTkko6E0v1/VXEe31meYz8AE50HE9QOmW8+uvTeBVtdpZDI1uQF9XDEF
         lOaxWANHzQE5PwDOSdvSgds0uUgu+Ago9kvL4asfD0MuQhBbJiAaf4BGKiLuqsIEVUsF
         qt24fXK7XiIciujBdi4rnhLFCftxnIsR277jFDOpSP7pAX+2Xp+ycyF/jJLzYbgJcNAR
         nL47jp9nqrorio5Ywp5Qp0RZMCqJFJoX4c5Gzt+zHiWJ52URmKteurQaAoqgDmRU35k3
         0mGtNL23CFoSQqrkoAYHVlfaPINmg/U3HOjaQmseN4/BQSEwzg3cp8eM42Lwx+4+0IMB
         jkZw==
X-Gm-Message-State: AAQBX9cLPHjpehSjC7OntmBwq7z6E4E02DdahBiXw9YFNyPeA5sJWhMS
        2MJO8pGFj/uz7K7jwxmkU9Wx2g==
X-Google-Smtp-Source: AKy350adEKdeCdVUqGPyeEv9UeZI/9p7Qn5YWZRwAV/xpSyX1GViLO2pAcu7/Eh5auRkifBQ1iRvHQ==
X-Received: by 2002:a17:907:76f9:b0:930:fe49:5383 with SMTP id kg25-20020a17090776f900b00930fe495383mr13477287ejc.76.1679945920207;
        Mon, 27 Mar 2023 12:38:40 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kb1-20020a1709070f8100b00933c4a25735sm11701254ejc.100.2023.03.27.12.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:38:39 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 2/4] soc: qcom: rpmhpd: Do proper power off when state synced
Date:   Mon, 27 Mar 2023 22:38:27 +0300
Message-Id: <20230327193829.3756640-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327193829.3756640-1-abel.vesa@linaro.org>
References: <20230327193829.3756640-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of aggregating different corner values on sync state callback,
call the genpd API for queuing up the power off. This will also mark the
domain as powered off in the debugfs genpd summary. Also, until sync
state has been reached, return busy on power off request, in order to
allow genpd core to know that the actual domain hasn't been powered of
from the "disable unused" late initcall.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index f20e2a49a669..ec7926820772 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -649,8 +649,12 @@ static int rpmhpd_power_off(struct generic_pm_domain *domain)
 	mutex_lock(&rpmhpd_lock);
 
 	ret = rpmhpd_aggregate_corner(pd, 0);
-	if (!ret)
-		pd->enabled = false;
+	if (!ret) {
+		if (!pd->state_synced)
+			ret = -EBUSY;
+		else
+			pd->enabled = false;
+	}
 
 	mutex_unlock(&rpmhpd_lock);
 
@@ -810,10 +814,8 @@ static void rpmhpd_sync_state(struct device *dev)
 {
 	const struct rpmhpd_desc *desc = of_device_get_match_data(dev);
 	struct rpmhpd **rpmhpds = desc->rpmhpds;
-	unsigned int corner;
 	struct rpmhpd *pd;
 	unsigned int i;
-	int ret;
 
 	mutex_lock(&rpmhpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
@@ -822,14 +824,7 @@ static void rpmhpd_sync_state(struct device *dev)
 			continue;
 
 		pd->state_synced = true;
-		if (pd->enabled)
-			corner = max(pd->corner, pd->enable_corner);
-		else
-			corner = 0;
-
-		ret = rpmhpd_aggregate_corner(pd, corner);
-		if (ret)
-			dev_err(dev, "failed to sync %s\n", pd->res_name);
+		pm_genpd_queue_power_off(&pd->pd);
 	}
 	mutex_unlock(&rpmhpd_lock);
 }
-- 
2.34.1

