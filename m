Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F879BE7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 17:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfHXPY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 11:24:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50826 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfHXPY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 11:24:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 405CD60AD1; Sat, 24 Aug 2019 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660267;
        bh=VaM1MRtAXHJVuqmO2DY4lvxrZXG9o0c3uhPPPbLTiUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BGit0PP+dkxGrfvzEUd/nm5xnGW1E6rnYzjv22jwIVlGtM6EfYtR7MXJuheTw1bbc
         M6VuKi7TIwAYzmH4moUDtimOtQsi3x2qhoRo8br29Goewi8r3ETdDUbJIWgRVOGp1p
         UloRkVRtfOPupCdePoFEmJyhKw9ZPX06gyNpaKEI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C40160A0A;
        Sat, 24 Aug 2019 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566660266;
        bh=VaM1MRtAXHJVuqmO2DY4lvxrZXG9o0c3uhPPPbLTiUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fd/Sa7ONsdG2Bj3H0Wbc+jzBJQB46SEVfvAIp/XZydw17ySY9ff1waLEYf+x3SYLV
         GjqJk5jN3Aa6OZZqTvZrsc+2fMbHg6YC2X1aNbebUe9+LSdyk+yaMPWlpHcHQdrls5
         MC5QrWpBQGUlMHJTa5iOvo6uWa6wS7DKzzXWkAkk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C40160A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date:   Sat, 24 Aug 2019 20:54:10 +0530
Message-Id: <20190824152411.21757-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190824152411.21757-1-sibis@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SC7180 AOSS reset to the list of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
index 510c748656ec5..3eb6a22ced4bc 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -8,8 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-aoss-cc"
+	Definition: must be one of:
+		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

