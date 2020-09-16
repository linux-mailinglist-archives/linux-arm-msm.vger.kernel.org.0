Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478A626BE7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 09:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgIPHtp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 03:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPHtp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 03:49:45 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B64C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:49:45 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x18so2748110pll.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FJKZ4qWhYuqFORnfOlWgEOnzs63sDuoaHzyAcYoARt4=;
        b=w3KSn71pux/Ryh8Zs8qYoDNASmTZIPkVuMB8lwZUwF8Hv1QFyk6CBfwl9bvQMkMyVe
         zBC/pccqUmkiNnuzW7JuamsZ3gDaLcxIK9Gl10YIGz0JnlFZc1vgGsk5CoYORTTqEBcE
         F6z8HMvy+1siXtmkVJpqfnd5DReEyaYqHt9w9TCCsUWhIDvaFKTWexwEG6p55+1Y0s32
         BCmp+FM+spdbQnNet7NrGLlwDVUahKKZS4Jv15pCT8VhGuORR/QRHPbLSaSAXF7AVaiX
         OB2iOdzgn7Jx7yjKfh+1KDCvKE34Gnp90uzrUSFs3d8eFRREWi+KFvijjLIYvAuHhsya
         feng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FJKZ4qWhYuqFORnfOlWgEOnzs63sDuoaHzyAcYoARt4=;
        b=baur9HVbI2UwKSq++szwobkqYReIOqNQhGVFSHUKPI6KMHRtwfTXYbTbItP011x2/r
         tva+09YGZIudq7FWf3tA+2Ms4A4QHFK2BqkgYPL0vQhBuiPcHu39D7ljlzZ1eyferPP6
         tPmpAsg5HOJZBcDCCwi+kzZp540oKswJPcsrbqqquB5pzOEKexhVtwnzfwvkr14BBY05
         7aFJoTsajEd+jsoSSFQBvu4k0sKeX6M1ghHNUzhqW6lhcAuWPq5Hg5G9mQNYWUdudOcr
         +nUXLG4PKK+5UPVng2oaBobojmbC+4bXlW4HcQWkvGRwAO50cTlVwwub6zaKEEZWv5zU
         w4JA==
X-Gm-Message-State: AOAM531wah3S9OEi/tL2JzyuTFW6Fm123xt5nCtbj00Uc5Cr9QlfOjMS
        z57z6U4kRGaZlqHKD9iDQXPHKw==
X-Google-Smtp-Source: ABdhPJxxz4uO7PgInAipS+7NXV7ppWqKUgIDnxTk+H194QNXjhRTQ0F7W9EK6ucD8qjDhjVmCJuWzQ==
X-Received: by 2002:a17:902:d897:b029:d1:e5f8:d263 with SMTP id b23-20020a170902d897b02900d1e5f8d263mr4921881plz.64.1600242584555;
        Wed, 16 Sep 2020 00:49:44 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id o11sm1587731pgq.36.2020.09.16.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 00:49:43 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     phan@gerhold.net, shawn.guo@linaro.org, rnayak@codeaurora.org,
        robh@kernel.org, viresh.kumar@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2] soc: qcom: rpmpd: Add MSM8939 power-domains
Date:   Wed, 16 Sep 2020 15:49:24 +0800
Message-Id: <20200916074924.20637-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the shared modemcx/cx/mx power-domains found on MSM8939.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..ce9b556ac155 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,msm8939-rpmpd
       - qcom,msm8976-rpmpd
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index f2168e4259b2..829f51881e41 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -220,7 +220,34 @@ static const struct rpmpd_desc qcs404_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+/* msm8939 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8939, vddmd, vddmd_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_VFC(msm8939, vddmd_vfc, SMPA, 1);
+
+DEFINE_RPMPD_PAIR(msm8939, vddcx, vddcx_ao, SMPA, CORNER, 2);
+DEFINE_RPMPD_VFC(msm8939, vddcx_vfc, SMPA, 2);
+
+DEFINE_RPMPD_PAIR(msm8939, vddmx, vddmx_ao, LDOA, CORNER, 3);
+
+static struct rpmpd *msm8939_rpmpds[] = {
+	[MSM8939_VDDMDCX] =	&msm8939_vddmd,
+	[MSM8939_VDDMDCX_AO] =	&msm8939_vddmd_ao,
+	[MSM8939_VDDMDCX_VFC] =	&msm8939_vddmd_vfc,
+	[MSM8939_VDDCX] =	&msm8939_vddcx,
+	[MSM8939_VDDCX_AO] =	&msm8939_vddcx_ao,
+	[MSM8939_VDDCX_VFC] =	&msm8939_vddcx_vfc,
+	[MSM8939_VDDMX] =	&msm8939_vddmx,
+	[MSM8939_VDDMX_AO] =	&msm8939_vddmx_ao,
+};
+
+static const struct rpmpd_desc msm8939_desc = {
+	.rpmpds = msm8939_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8939_rpmpds),
+	.max_state = MSM8939_VDDMX_AO,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 5e61eaf73bdd..fe207860456e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -64,6 +64,16 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MSM8939 Power Domains */
+#define MSM8939_VDDMDCX		0
+#define MSM8939_VDDMDCX_AO	1
+#define MSM8939_VDDMDCX_VFC	2
+#define MSM8939_VDDCX		3
+#define MSM8939_VDDCX_AO	4
+#define MSM8939_VDDCX_VFC	5
+#define MSM8939_VDDMX		6
+#define MSM8939_VDDMX_AO	7
+
 /* MSM8976 Power Domain Indexes */
 #define MSM8976_VDDCX		0
 #define MSM8976_VDDCX_AO	1
-- 
2.17.1

