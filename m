Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512E71CB723
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 20:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgEHS1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 14:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727825AbgEHS1f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 14:27:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C22C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 11:27:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n11so1228672pgl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hN4aOQqQDUCJtoOHCvHdyqo0T+RL3xFpmONUoLpf4BA=;
        b=KL1/NkKRX1oUYO7Z1N00JVKw1P+8x2REeQYN7Q7fhRrD1t6Et+WJx2YsK4Hf/RC4jM
         7cduWWHx/DE4Swjex9x6osHhBCcNe9ec5q2LlkSr1CYh7E6rEDEEConjcTuPOoel7pN4
         BRJXAiM8DzL0QvF3qO5gNLuIKJ4J1g8/h+VuXoT4tVFZ0hqnLlO4i4g5HC3ikNibtTf1
         YhKzedBK7IaqTcL+GFpnhi0hTRDCoZqA5fkQsHu6SH0Ae+swncOm9g3E8RG95OsLmu1E
         yx6RQGSkK/ZVi3zAnpfwgB6y/Rdx38cN+FxMCv3uAzoQIYyOtwiTp3sFpq+/9tOerkLJ
         qgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hN4aOQqQDUCJtoOHCvHdyqo0T+RL3xFpmONUoLpf4BA=;
        b=YMqqvOKa8CnItXZXdxEDvfZuffswBigiYc8mkcc+GO6SI8x6nlkolE/ZwRIyTd3ctu
         D9il52Uq6ACnFhQydvkCTm+wYTt+OQ1UoXRFmDs/KBQ105ho99OhpeqPRNIqL+6YxEsv
         RuZ5R5oGPDm9cv8VHF6AcIaC2KllSqLVbhDI50oSkC2jWp+YOrMSQ8q+Q3WEyyAi4wGy
         RzWH6S+0pmNJpYLrEq472Y0e0iBR9yrYVDhtyG2W0HuyODymYJbJs7OTk8wSoz3lutvf
         QNn3INUd18X0Mw188Wo8PCn9xuCt4tUD48G8zIT8N9sGSnkGoXHN8wKhj6LPm/h81JmP
         s41Q==
X-Gm-Message-State: AGi0Pua0wY/GGcNwtqaIGgaR4zz8Th4VsBnZTpOVlogedHybBbjA+0BJ
        cQAe0glUtQ4TD/aEy7BY9GVK
X-Google-Smtp-Source: APiQypJVcjKVXAtc+RhgX8h8rDloj7wN3GTygiGNJPq9kGosRQivY72uQWPhjT9ky30hWj1dOyflFA==
X-Received: by 2002:a63:ef4e:: with SMTP id c14mr3094540pgk.84.1588962454832;
        Fri, 08 May 2020 11:27:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:9e:e39a:a052:f8c0:a37b:3255])
        by smtp.gmail.com with ESMTPSA id y24sm2248379pfn.211.2020.05.08.11.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 11:27:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for Qualcomm IPCC driver
Date:   Fri,  8 May 2020 23:57:03 +0530
Message-Id: <20200508182703.29021-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
References: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for Qualcomm IPCC driver and its binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..cc2fb991cc0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14013,6 +14013,14 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/iommu/qcom_iommu.c
 
+QUALCOMM IPCC MAILBOX DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+F:	drivers/mailbox/qcom-ipcc.c
+F:	include/dt-bindings/mailbox/qcom-ipcc.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.17.1

