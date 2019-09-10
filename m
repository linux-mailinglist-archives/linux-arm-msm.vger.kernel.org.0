Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05272AF041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 19:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437025AbfIJROo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 13:14:44 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37669 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394252AbfIJROn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 13:14:43 -0400
Received: by mail-qt1-f196.google.com with SMTP id g13so21235376qtj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2019 10:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=85pIOc0VjXEJVW1VGnKzdHZfrPu0dnHyPG3j4q4cGXI=;
        b=Hqq+ZhFigBBOZ8KVi3k/1GBGGNXSk+aAlUmrrKb7C5UmaZ6FoAtluRmqcZqeISVKXv
         leAypDTy0Y9VBEICyka7PNC+myRYAWDKvEv8Usaoj+QgvyZyFwd0rscFFq7NmqcnM5nF
         4J2yUegdTxW+cJpAWIRbY8Slqi42kwgByV7FPREkEpk51fb2U8TaPamQhUlTfxhGA7cI
         D8o/S46/PdI00Vq7JtFUa3E1/e826aT41nMXFSSFoUE93EMFuTp5NCZykLC/MWNhMZy3
         p4RRGp16vXYDXXOLxkFGdFVQucfohagdojOaRo7QvL1Cll7qiTHisoVwn6+Qc6jgfXOQ
         howg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=85pIOc0VjXEJVW1VGnKzdHZfrPu0dnHyPG3j4q4cGXI=;
        b=cW37QhdXx/wMHFc78W++xef2xrl2chF8q0sS+Z1HcVQgvtzw0YmDKCd7xLkSBUSzU5
         cyk/tdL3/yE9F2vfsG2GJ3EXlALKAq3CM95REJA/oy2dp6zXuczRmg+Tr/pyoAfjL+Gv
         FACWkMJalaRKLoEXYDNl+o/wUd3Q7mSYetFhkQGctzkPxDitV7iqPV6Vw1ywruI2xob0
         8u5iX8Xz0nF7SEotW5yihMJhERre/sN8zFtBodTcEUcxgL9IJpwhwseQxZgOmgLQzhux
         zqdB4q2othIGZZMS1qG00GlpHypX8UiZJck6IYWQYUceBLUkD5VcoVecWNC4wnkChQoG
         MZPA==
X-Gm-Message-State: APjAAAUhr33CrS3JmwdwRCy/FuZaHhTwDETUzSUTXJ3l8S7imJ+UF9tJ
        aoS2P+UE3SNt+VWR+3Ylw7Wvew==
X-Google-Smtp-Source: APXvYqzJ3KeIDWlW5DCZ0rKR+iZzQQ/izEFFd7jC4UrUByD1xzyZXWg+I301lrMlRkHBjzFbuq4dWw==
X-Received: by 2002:a0c:ee22:: with SMTP id l2mr6412105qvs.4.1568135680903;
        Tue, 10 Sep 2019 10:14:40 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id g45sm3400713qtc.9.2019.09.10.10.14.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Sep 2019 10:14:40 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] soc: qcom: rpmhpd: Introduce function to retrieve power domain performance state count
Date:   Tue, 10 Sep 2019 13:14:33 -0400
Message-Id: <1568135676-9328-3-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate .get_performace_state_count in genpd ops to retrieve the count
of performance states supported by a rpmh power domain.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
v1->v2:
	- Changes ti incorporate the new format of
	get_performance_state_count.

 drivers/soc/qcom/rpmhpd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 5741ec3..9d37534 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -285,6 +285,13 @@ static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd
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
@@ -373,6 +380,8 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		rpmhpds[i]->pd.power_on = rpmhpd_power_on;
 		rpmhpds[i]->pd.set_performance_state = rpmhpd_set_performance_state;
 		rpmhpds[i]->pd.opp_to_performance_state = rpmhpd_get_performance_state;
+		rpmhpds[i]->pd.get_performance_state_count =
+					rpmhpd_performance_states_count;
 		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmhpds[i]->pd;
-- 
2.1.4

