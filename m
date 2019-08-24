Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE4F9BE7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfHXPYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 11:24:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50984 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbfHXPYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 11:24:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7479160E41; Sat, 24 Aug 2019 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660270;
        bh=6aXlqUBwZViX6SYEV6IFwgeA31UVuQZ9Wh7+LosfjCk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TrQrLX/gAK1pNytr8PGKVRhuFKuwUmcEZiR9SHzp1W4pIX3+uXz/fzrTHWk2ohkoM
         Pzg2g046eG9jLbWkoRKCHjPQMWNBzWAKDItbAZfWO/CGJyG/uGNegoqahuOB81iDTW
         yAm/pFsjtpadmT050ZjUxgd5Gb5+dVEW/l6IiYhs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E26A460A60;
        Sat, 24 Aug 2019 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660269;
        bh=6aXlqUBwZViX6SYEV6IFwgeA31UVuQZ9Wh7+LosfjCk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZJiUqS6VvTDnSYHHB6dPFbo/aGNdv04fIaHa1yUmlMWrPbVVR1WyLp1LO81GnNhBZ
         whdj5wPQlISL8XrXgvNfAQMl/rViSwhM87scrpSNw753CeNSZd5gBYSS6roPMxfu6t
         3CZlP1Kp8PzeXaKDvkXJaX+zj6dNJs5egs5h2GFE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E26A460A60
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [RESEND PATCH v2 2/2] dt-bindings: reset: pdc: Add PDC Global binding for SC7180 SoCs
Date:   Sat, 24 Aug 2019 20:54:11 +0530
Message-Id: <20190824152411.21757-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190824152411.21757-1-sibis@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SC7180 PDC global to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
index a62a492843e70..c1fef349f0faf 100644
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
@@ -8,8 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-pdc-global"
+	Definition: must be one of:
+		"qcom,sc7180-pdc-global", "qcom,sdm845-pdc-global"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

