Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14AB978B4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 14:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbfG2MHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 08:07:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37214 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbfG2MG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 08:06:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3FFA860C5F; Mon, 29 Jul 2019 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402018;
        bh=m3ia/Fh5MD3ijzGdThtCiuN/KOQNmjZvI9Il33uPp1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q4Jg3GzQTRjnITByNwXzFtwgJeKNJiTIM2laWT31ClKHu++0flJu76ZTcUFXkG71k
         N0wg90+Eizx72L/sMZH45JAsHsyQaC6Kj1rDDVZlqCwwnBx/3nQN+vEfhPzX8e+IIl
         niUs8Wp9fWisXc6rjHx6RycoUnebgQ4Gb7lVzMJw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD94960A50;
        Mon, 29 Jul 2019 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402018;
        bh=m3ia/Fh5MD3ijzGdThtCiuN/KOQNmjZvI9Il33uPp1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q4Jg3GzQTRjnITByNwXzFtwgJeKNJiTIM2laWT31ClKHu++0flJu76ZTcUFXkG71k
         N0wg90+Eizx72L/sMZH45JAsHsyQaC6Kj1rDDVZlqCwwnBx/3nQN+vEfhPzX8e+IIl
         niUs8Wp9fWisXc6rjHx6RycoUnebgQ4Gb7lVzMJw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD94960A50
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/6] dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
Date:   Mon, 29 Jul 2019 17:36:30 +0530
Message-Id: <20190729120633.20451-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM8150 and SC7180 APSS shared to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9fc709c..1e081dc3f2dae 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -13,6 +13,8 @@ platforms.
 		    "qcom,msm8998-apcs-hmss-global"
 		    "qcom,qcs404-apcs-apps-global"
 		    "qcom,sdm845-apss-shared"
+		    "qcom,sm8150-apss-shared"
+		    "qcom,sc7180-apss-shared"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

