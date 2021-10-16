Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF2343046D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240852AbhJPTIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240771AbhJPTIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:08:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE2FC061765
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 12:06:09 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q16so397727ljg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H45YVwe40DetvUNJ0d00LEpnQjv13osUh2nlrM3WI0s=;
        b=bygnBbU04JpUtmGqiZ+1CqT5prU8vLIS8/qu1G6ju88fcSEe7/tf3A3LI5WdxFnSsY
         Zywj82eL2GUmhWKfNMtReyUunR+UtdcgpSkAj8HlOc88R3aV+4wEJa9TcmifoBKtHSdg
         t9xbgDK9R3AleJcB+gna4a1GGE9sTop6MglxRn8ylLvApesRQ3eeWnbZ06xJfH3T/57J
         c8Pdq7ifC4p2Sbn1+FPtKIrFFk+vL0C9WjbYD8OjMuEMjsM4C/V0Kea3iQ3r2I9tApRD
         df6bslbqBqp8dWRX3SMokjUf2+8rQCZKSvVPDkHZgXWSce3J4dVTn8CBum0s8GPCbq9K
         xDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H45YVwe40DetvUNJ0d00LEpnQjv13osUh2nlrM3WI0s=;
        b=rFJ3lXOpQGr0OqInjgOgpxhsp0sSq7anCVdRtZduCiert+jx2WSdFA9vCNV8sbQOer
         roeExMoxU0l5EGx45BEbAbEI6KFIvzMPgiZ/K/FNUR63bwGi+krQ4TFfVYucMFdBom8V
         0FiZAL0oVjC1yWYU1UA6rxKyczt7UDrZLN2QszcBQ333DLwUp0wJ01D5Hkj7Yi+Jnul1
         3ecRWixNnILiUSt+fj0cysrNsQlDLmFy1oIfCP7IPTMXPUdfAU568xQLNtEHiUfgL3Kl
         YX8Q+N+16G0EzzsOPfF6I8EGXIf8YGBntOKhSMUI5HTBFcvKuShaX5E+occTU3kdlS+D
         hz8w==
X-Gm-Message-State: AOAM5338jezFF6B6TS6XNUk4lgBXrTLlNXA/m9tFZSX08yRpue+s7LWx
        9o5ZT1Dm25HZ27lNborrmkHHnGtjQyNiTA==
X-Google-Smtp-Source: ABdhPJzNYtuuldHYl+wf77D8Hex9jlDmlEiIE2m4/nKkq06QSH/Z/Isu+mNlkuFlxT3qGER2PU//aQ==
X-Received: by 2002:a05:651c:200e:: with SMTP id s14mr21225583ljo.397.1634411168012;
        Sat, 16 Oct 2021 12:06:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d20sm1009853ljg.20.2021.10.16.12.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 12:06:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: add two missing PMIC IDs
Date:   Sat, 16 Oct 2021 22:06:07 +0300
Message-Id: <20211016190607.49866-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IDs for PMK8001 and PMI8996. They also fall in the list of
'duplicated' IDs, where the same index was used for multiple chips.

Fixes: 7fda2b0bfbd9 ("soc: qcom: socinfo: import PMIC IDs from pmic-spmi")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9faf48302f4b..458a4c5d85c3 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -87,8 +87,8 @@ static const char *const pmic_models[] = {
 	[15] = "PM8901",
 	[16] = "PM8950/PM8027",
 	[17] = "PMI8950/ISL9519",
-	[18] = "PM8921",
-	[19] = "PM8018",
+	[18] = "PMK8001/PM8921",
+	[19] = "PMI8996/PM8018",
 	[20] = "PM8998/PM8015",
 	[21] = "PMI8998/PM8014",
 	[22] = "PM8821",
-- 
2.33.0

