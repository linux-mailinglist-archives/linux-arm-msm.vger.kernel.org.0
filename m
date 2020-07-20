Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754B1225762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 08:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgGTGMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 02:12:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:43387 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbgGTGMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 02:12:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595225561; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tCQstnYiW4oDcLqWIM5x3gMwV3s0GxxoNU7aLtySkyE=; b=UNVeOijlTgcG24cUNJ+ZNehqhT4aRW29b/ZnGs1ME16/b46a05kdF6FeIh0Z3c7VTzC2JLi9
 4IZRt9sE/XXsaQnxwo4kOxyb4hRtmPbBukt33gsbPNL6P7Tc6kob6LK+ThXeyNzYzAx4nv/p
 S+b16MyRRvJoFNAl+1IqA7nXEoI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f1535d903c8596cdb33d808 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 06:12:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 445A7C433C6; Mon, 20 Jul 2020 06:12:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7BCCC433A0;
        Mon, 20 Jul 2020 06:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7BCCC433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH V3 1/4] dt-bindings: soc: qcom: Add IPQ6018 compatible
Date:   Mon, 20 Jul 2020 11:42:20 +0530
Message-Id: <1595225543-12127-2-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
References: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the dt-binding for the rpm on the Qualcomm IPQ6018
platform.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 005940f9..4c9c6fc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -20,6 +20,7 @@ resources.
 	Value type: <string>
 	Definition: must be one of:
 		    "qcom,rpm-apq8084"
+		    "qcom,rpm-ipq6018"
 		    "qcom,rpm-msm8916"
 		    "qcom,rpm-msm8936"
 		    "qcom,rpm-msm8974"
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

