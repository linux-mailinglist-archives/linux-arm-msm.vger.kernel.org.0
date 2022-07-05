Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BEA5663FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 09:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbiGEHYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 03:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbiGEHX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 03:23:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC2465F0
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 00:23:58 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so5600590pjn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+gYIpHsZ47Eh2pxDFNpWAcmAPIFH2rD2QueXVUKLjQ=;
        b=oo34EZNXmLKH2pHjVKcQo+pJx6A4tSD4Y44io8hKk7lZY6W8BEaPlUrXPGiehmmqwn
         wHC61S5xRn80QzNV4fLyPCeJ944/ooqM+4rY7FGB7F28ihM/0Gr9dRYZZDhHo5n5273s
         oUGfnXr3NmIL7ml3zTFrpq9OzCiP3vFNvRdFCPwrSZhtSMh+5YmoRfgUfhLLUxJNvqd/
         ZL/6UYDRDf82wAG4T5BTwlP7H4Dep4rAk4U2NwuKn5IjmZaxHrTaE/imwtcykYXE82cK
         jcR0z9LpcdcuVuVOhkkzKJhEOYLcl1maoM6ik9OhXnQHVPYAkbJ4SjQRmbvHuimgrHl5
         mm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+gYIpHsZ47Eh2pxDFNpWAcmAPIFH2rD2QueXVUKLjQ=;
        b=nAtH7AzvE2Tw/AVKsoJL/Hx7AGTBdLNHygg982IP3hZyKlIvINvBAP4e/WQLgVJT5f
         +Ze9cYhdyQW91FMENiFk6P7ExrrHpRR5gBET8yUauHxeiidQoXqKkvpJ+sUxoSr7ggZE
         EIr0BoGEaJZpcPzC0J6t8IrObfuPFjtpI+Qf7Is0CoJaPrPjzNPs0IVDN6Agow4JU4FR
         CvLhS8OgTa0BFKr64gqebJxqajuVFvPfZhjOUzWKxd0zZGrH7/oZZNvZyZ1EJZ4ay5JY
         E1VyMRzpqv9ahQ5+Tict+gPqZfKwkVbQNmS4VqtEahnCQlLIWk1HvCUJjW1BFQ0lXjzJ
         SPmQ==
X-Gm-Message-State: AJIora/Qe0/Zf7e5+Za+v9+8OYgVQB7kSGEHMksmJ6RhPaRUUILEg505
        3JetxOUZZz44MeQt7pB0oClhFA==
X-Google-Smtp-Source: AGRyM1uEoxzYf1xSZi6kwhm09T+C2dw+bqI2dPscnHhJFTIvTlQ/wHS3bdGV8na9nD3EZ1igoSA3sw==
X-Received: by 2002:a17:90b:1c8e:b0:1ee:e899:c612 with SMTP id oo14-20020a17090b1c8e00b001eee899c612mr40593116pjb.170.1657005837633;
        Tue, 05 Jul 2022 00:23:57 -0700 (PDT)
Received: from leo-build-box.lan ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id y6-20020a626406000000b0050dc76281f0sm22148016pfb.202.2022.07.05.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:23:57 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 3/5] interconnect: qcom: icc-rpm: Change to use qcom_icc_xlate_extended()
Date:   Tue,  5 Jul 2022 15:23:34 +0800
Message-Id: <20220705072336.742703-4-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705072336.742703-1-leo.yan@linaro.org>
References: <20220705072336.742703-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit changes to use callback qcom_icc_xlate_extended().  This
is a preparation for population path tags from the interconnect DT
binding, it doesn't introduce functionality change for the existed DT
binding without path tags.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 7e8bcbb2f5db..8c9d5cc7276c 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 
 #include "smd-rpm.h"
+#include "icc-common.h"
 #include "icc-rpm.h"
 
 /* QNOC QoS */
@@ -414,7 +415,7 @@ int qnoc_probe(struct platform_device *pdev)
 	provider->dev = dev;
 	provider->set = qcom_icc_set;
 	provider->aggregate = icc_std_aggregate;
-	provider->xlate = of_icc_xlate_onecell;
+	provider->xlate_extended = qcom_icc_xlate_extended;
 	provider->data = data;
 
 	ret = icc_provider_add(provider);
-- 
2.25.1

