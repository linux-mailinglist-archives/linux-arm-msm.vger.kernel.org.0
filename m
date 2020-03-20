Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E2D18C4DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 02:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgCTBlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 21:41:14 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34649 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgCTBlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 21:41:13 -0400
Received: by mail-qk1-f195.google.com with SMTP id f3so5438838qkh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMpp9cGV1kolIa23/+eXnHG3jYVNr7iJ09Ptby/dQWg=;
        b=iUr7LVw9yHWif+ZG2vxEMY0bR1h+bCvJ+y8Af7km3yxODyCKqGeLTuoAa94xgvtgvN
         9r/pYxzS6JQpcpWm6vPUMohRn6hsM+mnz8L/BY7V9ZuUcOl8gFc/Cl/ONKiXSl2AwYID
         4DAY+x0Q81jFcJcTVsMUpyGs/ybHm1U4GYKlV8sEh1ON90pbIijtoj5Rx3dlLn/iHT1i
         Z4A++AavvO8qdTEW/g3j1JcgA/OTnxayZveVOoI8mupFY3geIf3aEqQkt94XG3BVgW67
         AWJW6g6HffdtQsixG9lBHGPbeENRX/pNWXM5SnyOipO8XPB7/JyA4K085MljAgLQrnOA
         bWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMpp9cGV1kolIa23/+eXnHG3jYVNr7iJ09Ptby/dQWg=;
        b=RlB9DqoDlD5vfl7edvyF0+QJCmkBHRI3ZHK1N09FCR9D3bQYBvQFt+++t3h9NPkZs5
         sr+o4L6q+8jvucrkwyFqiGxocQtYM55UP29r7czoBfclzqCcFZKva3KY6Jngg2QDXxr9
         COaDaWJg9elr56mdrX1kOgU00WqFZnzBU7Tvbb3+nwe4ApwYlcxB8npBB1bfpGjkdCda
         INL90a+kAaLtCs39ZrSJtA7Dc8UIPKnXdaQwTqWgcSIChx6eY2QjkzBBnaQ+7UJIp4rx
         LzPjMQmTUZUamwCRRF+5wVKTS2cPtamjwg34KFCjnQ1BS9nzBOK09xgyuDMeBU8LY0/p
         CgNA==
X-Gm-Message-State: ANhLgQ2QVbNx1ooksbFLUQNcQPHb9MxhFJSID1V6F5qvfvpodDmwcdPw
        nW2KWJE2vwAy5D1+0RaRIH54Zw==
X-Google-Smtp-Source: ADFU+vtZPj94yZXMLwqO8JOCiKMUmJSZBqsuWIHCWksgaTY/SAPuOrMmCfd9rU2kKgjinskLZzoRhw==
X-Received: by 2002:a37:aa92:: with SMTP id t140mr5385602qke.119.1584668472463;
        Thu, 19 Mar 2020 18:41:12 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id 2sm2706287qtp.33.2020.03.19.18.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:41:11 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Patch v5 2/6] soc: qcom: rpmhpd: Introduce function to retrieve power domain performance state count
Date:   Thu, 19 Mar 2020 21:41:03 -0400
Message-Id: <20200320014107.26087-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320014107.26087-1-thara.gopinath@linaro.org>
References: <20200320014107.26087-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate .get_performace_state_count in genpd ops to retrieve the count of
performance states supported by a rpmh power domain.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 4d264d0672c4..7142409a3b77 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -341,6 +341,13 @@ static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd
 	return dev_pm_opp_get_level(opp);
 }
 
+static int rpmhpd_performance_states_count(struct generic_pm_domain *domain)
+{
+	struct rpmhpd *pd = domain_to_rpmhpd(domain);
+
+	return pd->level_count;
+}
+
 static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 {
 	int i;
@@ -429,6 +436,8 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		rpmhpds[i]->pd.power_on = rpmhpd_power_on;
 		rpmhpds[i]->pd.set_performance_state = rpmhpd_set_performance_state;
 		rpmhpds[i]->pd.opp_to_performance_state = rpmhpd_get_performance_state;
+		rpmhpds[i]->pd.get_performance_state_count =
+					rpmhpd_performance_states_count;
 		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmhpds[i]->pd;
-- 
2.20.1

