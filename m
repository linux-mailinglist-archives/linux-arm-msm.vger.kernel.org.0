Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB353B3654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 20:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhFXS4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 14:56:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58401 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232821AbhFXS4W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 14:56:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624560842; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aiuxn+DnrO5jrk2hOetPkzHkSL7V7qhTdnTfb2x8Zto=; b=eIlmtZMfKCYq/YOQhWXZIcKuEEQ/5dzuHz0cyfg7CjxqTcQXhmL42KOFZik0EzTV2crlLl68
 O37liRyXEhvXA6UhVMLJYArThpeQwYBG0Jwa1gppuIJ76Ga06o37sdfO1yNPSUbPP0HGbV53
 T7ADa/kkvmv1LZrrGHxsZDyH90E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d4d4c57e5ba0fdc06acceb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 18:53:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1C25C4323A; Thu, 24 Jun 2021 18:53:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A8C6C4160D;
        Thu, 24 Jun 2021 18:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A8C6C4160D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
Date:   Fri, 25 Jun 2021 00:22:07 +0530
Message-Id: <1624560727-6870-14-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Delete unused power-domain definitions exposed by AOSS QMP.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/power/qcom-aoss-qmp.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

diff --git a/include/dt-bindings/power/qcom-aoss-qmp.h b/include/dt-bindings/power/qcom-aoss-qmp.h
deleted file mode 100644
index ec336d31dee4..000000000000
--- a/include/dt-bindings/power/qcom-aoss-qmp.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, Linaro Ltd. */
-
-#ifndef __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-#define __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-
-#define AOSS_QMP_LS_CDSP		0
-#define AOSS_QMP_LS_LPASS	1
-#define AOSS_QMP_LS_MODEM	2
-#define AOSS_QMP_LS_SLPI		3
-#define AOSS_QMP_LS_SPSS		4
-#define AOSS_QMP_LS_VENUS	5
-
-#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

