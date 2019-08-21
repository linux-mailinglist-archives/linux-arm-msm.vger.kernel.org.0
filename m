Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CCC97674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfHUJy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:54:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40876 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfHUJy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:54:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F168F60E41; Wed, 21 Aug 2019 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381298;
        bh=DlnHN5zdPpl43ZxbxIhjk+Psuo8cuhTXvmZc+BVSodA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fPIvuCbHd3w2qdMnxNPeYyiTWov4xIvxUkl0vkNfbnNF87hB6SVvT+ClCdxWTbv6b
         T0SLl/uhf+rbfqURlfFYHJRg9NJBnHeY6aWYcr3YXKWVC9vz/Sv5P3FEyJteofQrux
         YKbUjnTceZpWIpX0UBaexc4bV3vj9bY6BOuXy6mM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 580D560DB6;
        Wed, 21 Aug 2019 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566381297;
        bh=DlnHN5zdPpl43ZxbxIhjk+Psuo8cuhTXvmZc+BVSodA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PPoWCsUKqkEijj3MJySqhGeA8rSmJrPuH7aSgGDeU5kwnXsapQgwnVQN3zIv60mfc
         E3Ciudg57++b1y15dM0BFeHXRKjTSJr4k9asua2UUsi81ZJvUOoUmyDon0RMq0rFtK
         VIirrtqH6bzyqhVkaFsUy/R+q7N39M3uMdWZ9DyQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 580D560DB6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date:   Wed, 21 Aug 2019 15:24:39 +0530
Message-Id: <20190821095442.24495-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190821095442.24495-1-sibis@codeaurora.org>
References: <20190821095442.24495-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SC7180 AOSS reset to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
index 510c748656ec5..8f0bbdc6afd91 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -8,7 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
+	Definition: must be one of:
+		    "qcom,sc7180-aoss-cc"
 		    "qcom,sdm845-aoss-cc"
 
 - reg:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

