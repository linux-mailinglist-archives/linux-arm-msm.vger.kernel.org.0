Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562E63C72F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhGMPRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:17:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35536 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236984AbhGMPRd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:17:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626189283; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Nb+xuni7E6LMFv722oAXNbGbFVRD9tApBAZTHk6wDzY=; b=TwI1Kd4lIQJIs8ToxduBj/Vm58nvja9kP74m+A/2cTQITAKmwYykitvHxgyHlsxzyGTBgJyG
 kIga1gOKMMvxtpm086ZL2xuinhnVperphtmAvX0zD98731PawXzKEAYqeZatJ2yM7Q+j6Hmc
 iGdCDM8sOzJZHwmgE9EI/bL2n9s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60edad6e06ea41c941b29ca3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:12:46
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85A9BC43217; Tue, 13 Jul 2021 15:12:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34A39C433D3;
        Tue, 13 Jul 2021 15:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34A39C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Update license for GCC SC7280
Date:   Tue, 13 Jul 2021 20:42:17 +0530
Message-Id: <1626189143-12957-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update BSD license for GCC clock ids.

Fixes: 87a3d523b38c ("dt-bindings: clock: Add SC7280 GCC clock binding")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
index 4394f15..3d5724b 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
  */
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

