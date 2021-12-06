Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DF6469105
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 08:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238698AbhLFICD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 03:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbhLFICC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 03:02:02 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63807C0613F8
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Dec 2021 23:58:34 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so10139487pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Dec 2021 23:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vrS5M6DytZl+EPmdclSiBMyMOC/Af23DduwHTH7/9D0=;
        b=xtyFoPIICYXcJpxVI3thOWh2vnlIHOJKRkY86VxQOC+5qyROIpi5gJmVA5NEbU+Pe4
         JiAD/uK9/JwcntQPjnxgFz25Qquv0kd9AgNNgiNxG3pKz3ax22YHNmjsIbJxcR8dwuvK
         UKKy6k8xP6XbVP233Q7N7ab+7kPZmsBpUPoEFSR2F7XSdU2vDd1famdGL4GPGC5WE7rW
         eOsQE+gxUIYiWAmQcR1fgiZbpAjALQyQOkXMKUd9u9fkFz4Ub7H48JvpOfoUM2DKEpCG
         ZOXyNKp8w+LzX+KvsMiDoy3yCeClVlRj+S8smzKprlyNI6mUgXgDSu33Kv5+UJucUlLK
         YoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vrS5M6DytZl+EPmdclSiBMyMOC/Af23DduwHTH7/9D0=;
        b=ZxRqLodSN+qIpuWcBRcPAEgVIukTakG2gykxr0VS0aTOigk9SeJdx2XFxvFAKmV/Gt
         obxxhIuKuw0InYbVaFO/1rGoNzL5FTwVF/QJ6L6YE+ZTQDDbsUhfKVzXmUfbHtbLGrKQ
         6q2RH2TXoiUf1e+IsUxICONANM+EtQcCdXCSI8IQB7dJTQIkEcPLBndwbFJgKHJj45mU
         5u7JdIbChGS/juuvlgIAt3yqyU+wk+8xn0aFv1f4W0PJIWqzfcPsWLBSq2lZoWbYoD7R
         95tIl9uGOdWWsyQCAPUjQEA/74vQG+gTzO+rJmWlrT7HRWoFUkzvaLntCW+xNEgNy8f6
         xJLQ==
X-Gm-Message-State: AOAM5311PIbtazRY8gQKOoOkKDFILA4GD9bWoLJUJg3P3p9gzEvsiw/t
        wwDvMZ7lxhbNz9aTKB7guqOeFQ==
X-Google-Smtp-Source: ABdhPJwD4TnfzMz6rDyCQNZ90sw3OzsSXCCHtoFm7iR8a3z+Vq/iu8E/p80RKFWxGOXXk5bG1bPgrg==
X-Received: by 2002:a17:90b:1e49:: with SMTP id pi9mr35388240pjb.220.1638777513923;
        Sun, 05 Dec 2021 23:58:33 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p15sm11794476pfo.143.2021.12.05.23.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 23:58:33 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 1/6] interconnect: icc-rpm: Use NOC_QOS_MODE_INVALID for qos_mode check
Date:   Mon,  6 Dec 2021 15:58:03 +0800
Message-Id: <20211206075808.18124-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206075808.18124-1-shawn.guo@linaro.org>
References: <20211206075808.18124-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use NOC_QOS_MODE_INVALID for invalid qos_mode check to improve the
readability.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ef7999a08c8b..35888721a690 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -76,7 +76,7 @@ static int qcom_icc_set_bimc_qos(struct icc_node *src, u64 max_bw)
 	provider = src->provider;
 	qp = to_qcom_provider(provider);
 
-	if (qn->qos.qos_mode != -1)
+	if (qn->qos.qos_mode != NOC_QOS_MODE_INVALID)
 		mode = qn->qos.qos_mode;
 
 	/* QoS Priority: The QoS Health parameters are getting considered
@@ -137,7 +137,7 @@ static int qcom_icc_set_noc_qos(struct icc_node *src, u64 max_bw)
 		return 0;
 	}
 
-	if (qn->qos.qos_mode != -1)
+	if (qn->qos.qos_mode != NOC_QOS_MODE_INVALID)
 		mode = qn->qos.qos_mode;
 
 	if (mode == NOC_QOS_MODE_FIXED) {
-- 
2.17.1

