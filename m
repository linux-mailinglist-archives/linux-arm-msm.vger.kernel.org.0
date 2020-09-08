Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70156260CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 09:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729967AbgIHH6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 03:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbgIHH57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 03:57:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3694FC061799
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 00:57:59 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k15so10271457pfc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p4U6DywWAGG7hqWgno8xA4KNHg7T7GRWqkUHfcQvB3k=;
        b=YQou9t73q5qKqw0WsgZMOwsCEXbHt8zLCXbEiq5x9ImKUtCw6ZGOQasYp8i6qPO6q8
         MoY4rFNcbXHaH/VVnkF+I/EV8/Xefc6LmJetEQ7Jo+jQhbpad5ca92o+uQTmT+QmPRfB
         miD/PCeXTgw9JjnidrITEqCFnTmMiqveWEvcLy8gFl4sbyW2dWZv9e+ntbOTPEDKyg7O
         jYBlXLUjy4xJ9qRsnzG/BrB89taE/tVr8drt9rN35c2EsGVXFRfs4D1HkNmKNuVrdtgG
         yLlfHFsXKBsPF0n5CbmAHxcfw405bEE7X84CBsTR5maDfD3GJs1CXAb1wJh1Ao7HWp2b
         98Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p4U6DywWAGG7hqWgno8xA4KNHg7T7GRWqkUHfcQvB3k=;
        b=a5O+uYUaFn+0WSVCN86gml0/EhM9iXUfcSQQ08rZuk/2YI5IJSlYcUXgOIvfBPc1ef
         RDf6gbvZhhJYPegTKbPHjNYEHCKr/9il418pJZfE3lnCAXGqpeQdcOVJw/HLM93jX/T1
         GlhG0Ef011Vx3qCg5k6K9jomz+Hxrrx4jzjTPhlro/TrGw2DSe144TfAMsVLSVGdLwTl
         VvDQe+VSV4ON7YPuuTqNp7+oVahHm4l0orfsmSppEWzdVZd6OzRuKzbcxdf57sN9SbEy
         LsKU8p8/NHqKdSMvlkVWn8I7WMQwlGQ8m7905lY3hELWPI8O0KifNQoFGteF9qixKezh
         LGMg==
X-Gm-Message-State: AOAM533aYF19KmESJeqpbkr0pHp368LMQad5emBQFFsHZ1+eDRUdSwxg
        Fiyu1JvBheNcaO82mwLLvho5
X-Google-Smtp-Source: ABdhPJwRUgI36ssfNhxpK77UGbBRO6qF4+xSHVU9GHpnJGzrN/z7Eow2VJb49MTdxfIMJK78Zg4mjw==
X-Received: by 2002:a17:902:8f8a:b029:d0:cc02:8541 with SMTP id z10-20020a1709028f8ab02900d0cc028541mr29499plo.32.1599551878673;
        Tue, 08 Sep 2020 00:57:58 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m21sm7560154pfo.13.2020.09.08.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:57:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 7/7] cpufreq: qcom-hw: Use devm_platform_ioremap_resource() to simplify code
Date:   Tue,  8 Sep 2020 13:27:16 +0530
Message-Id: <20200908075716.30357-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_platform_ioremap_resource() is the combination of
platform_get_resource() and devm_ioremap_resource(). Hence, use it to
simplify the code a bit.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index c3c397cc3dc6..6eeeb2bd4dfa 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -307,7 +307,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	struct of_phandle_args args;
 	struct device_node *cpu_np;
 	struct device *cpu_dev;
-	struct resource *res;
 	void __iomem *base;
 	struct qcom_cpufreq_data *data;
 	const struct of_device_id *match;
@@ -333,13 +332,9 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 	index = args.args[0];
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	if (!res)
-		return -ENODEV;
-
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+	base = devm_platform_ioremap_resource(pdev, index);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
-- 
2.17.1

