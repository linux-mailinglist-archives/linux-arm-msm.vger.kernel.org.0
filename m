Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5F8204869
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 06:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732011AbgFWEFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 00:05:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18026 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgFWEFw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 00:05:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592885152; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iFlnNmncIA99efWrk2+2XKc4Rg2DTJRzRn+ftVB0or4=; b=TOdLcyc7OikewgNzYy0UdEHddMG5UBfSabd/eqUpLGOSxPICuYFucI+ciDZ2xgI18VBFQN7F
 q8XbfU8xIZXzjlDhRJn0NjXe+5WpdPdxSzGuHEVyso/gYzgALKjfuRtj7OrQ50yheCyp2+t8
 YAd7mlH9nkoc6NtEzlnNlZ8kOnQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5ef17f890206ad41d1b538f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 04:05:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1938C433B1; Tue, 23 Jun 2020 04:05:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93242C433C8;
        Tue, 23 Jun 2020 04:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93242C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: interconnect: Add generic qcom bindings
Date:   Mon, 22 Jun 2020 21:05:14 -0700
Message-Id: <20200623040515.23317-2-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200623040515.23317-1-mdtipton@codeaurora.org>
References: <20200623040515.23317-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic qcom interconnect bindings that are common across platforms. In
particular, these include QCOM_ICC_TAG_* macros that clients can use when
calling icc_set_tag().

Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 include/dt-bindings/interconnect/qcom,icc.h | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/qcom,icc.h

diff --git a/include/dt-bindings/interconnect/qcom,icc.h b/include/dt-bindings/interconnect/qcom,icc.h
new file mode 100644
index 000000000000..cd34f36daaaa
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,icc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_ICC_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_ICC_H
+
+/*
+ * The AMC bucket denotes constraints that are applied to hardware when
+ * icc_set_bw() completes, whereas the WAKE and SLEEP constraints are applied
+ * when the execution environment transitions between active and low power mode.
+ */
+#define QCOM_ICC_BUCKET_AMC		0
+#define QCOM_ICC_BUCKET_WAKE		1
+#define QCOM_ICC_BUCKET_SLEEP		2
+#define QCOM_ICC_NUM_BUCKETS		3
+
+#define QCOM_ICC_TAG_AMC		(1 << QCOM_ICC_BUCKET_AMC)
+#define QCOM_ICC_TAG_WAKE		(1 << QCOM_ICC_BUCKET_WAKE)
+#define QCOM_ICC_TAG_SLEEP		(1 << QCOM_ICC_BUCKET_SLEEP)
+#define QCOM_ICC_TAG_ACTIVE_ONLY	(QCOM_ICC_TAG_AMC | QCOM_ICC_TAG_WAKE)
+#define QCOM_ICC_TAG_ALWAYS		(QCOM_ICC_TAG_AMC | QCOM_ICC_TAG_WAKE |\
+					 QCOM_ICC_TAG_SLEEP)
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

