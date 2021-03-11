Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42942336BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 07:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhCKGDv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 01:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhCKGDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 01:03:30 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268D5C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 22:03:30 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so8812769pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 22:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HNPx2DSIhBecIZB40xNyDRpcDC3Xc50l5VqlNf/nUH8=;
        b=WV9lUW4MPtNCnOkJPaRPRTV+2s5GRwpU8BwS9IJjuhVsz0btlHgEcwtqTtjpyjS/Tn
         oUP0PJHF2PqXZl0C/ZzM9mfgB5xJEp3KYPbTny/VCt/HtA+B5F1LdzPFTM7ZHhAIzN73
         UJXzVpm9x/AIUR4m2I5uXPzzkmgrc9pwJUeLZ/8o7IUobMqqFWXuUfoA4bFbKsWL+Mof
         q+/gsW6DxQ2LZx3c5pd5YKSw0CgjS7Fo8F9w3l41UqS3dcRr9uMjHyw2yzypW0KZHxt4
         5Kw9Q4gpk/62/D47X3et8OXPykvMFBbdr6yMHY5Kctq38BPlmdqs9U1LbAeHZq/blJMU
         oiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HNPx2DSIhBecIZB40xNyDRpcDC3Xc50l5VqlNf/nUH8=;
        b=ArBm4gSRa0+yJAsSQOoDkjv0cWm06RQzMgIWKHbYLppV+yppKv/g3t3s8WFcv6KaQs
         9bNDionm4wv6EIw2RgVvO896hwzBKuIfr+BAMdqsElKt9olRd45MzohaFZjv2qLmM0u4
         4jdq1uzrnevxC5SNF6fQEOnD7ff6Oxl/DXlb/vZgRtgSuI50PM7miuMPAhxvhozjbsJR
         JnWyzxBJHq78//VwvJA4UNFZXN/GkKFbSEMRPjV0n2MX1wLmYHYN7Z2pa6ml6ne8dOpl
         2Q9hfH4cQsqJYTssiFdk85SJjrMs9yzpoz4B6Np43GHLoGBcy+pMAQAH+P9VXiKZ8JtJ
         NoOw==
X-Gm-Message-State: AOAM5317zqduZvLhH6YozM9ZqKshgYs+9Pw/Rr3wJNCmshWU2yZRPXU4
        4j1cVz+FbTERiUAl6/X8wF1FpQ==
X-Google-Smtp-Source: ABdhPJxnxRRaqIgt5xg8cni9ihAqx2cDTBPIAj5X4u4xfOHOP8908CujM5PSbYuZlFFDTshuaniztg==
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id u8-20020a170902c808b02900e64204f62fmr6656703plx.0.1615442609512;
        Wed, 10 Mar 2021 22:03:29 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm1294397pgh.37.2021.03.10.22.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 22:03:29 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] usb: dwc3: qcom: skip interconnect init for ACPI probe
Date:   Thu, 11 Mar 2021 14:03:18 +0800
Message-Id: <20210311060318.25418-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ACPI probe starts failing since commit bea46b981515 ("usb: dwc3:
qcom: Add interconnect support in dwc3 driver"), because there is no
interconnect support for ACPI, and of_icc_get() call in
dwc3_qcom_interconnect_init() will just return -EINVAL.

Fix the problem by skipping interconnect init for ACPI probe, and then
the NULL icc_path_ddr will simply just scheild all ICC calls.

Fixes: bea46b981515 ("usb: dwc3: qcom: Add interconnect support in dwc3 driver")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 175a609cd0af..7dc74885a635 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -244,6 +244,9 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 	struct device *dev = qcom->dev;
 	int ret;
 
+	if (has_acpi_companion(dev))
+		return 0;
+
 	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
 	if (IS_ERR(qcom->icc_path_ddr)) {
 		dev_err(dev, "failed to get usb-ddr path: %ld\n",
-- 
2.17.1

