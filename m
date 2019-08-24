Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06499BE64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 17:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfHXPLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 11:11:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46692 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfHXPLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 11:11:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 705A060AD1; Sat, 24 Aug 2019 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566659499;
        bh=DjeyMDjg4yTVadPS8oHIKohNhnXfa8SEgNDGMYhsFj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VnF1oebTrOGLemtn5Cq8QxN3vXCaFuI7f+A9VxkW6uGMLMuESA4KzPwsOgNYRsQEz
         a70X+9GrSfht33iRSQHrApfGC1C6zxin95Mcp0L8sDIWu2gxsYq32Hn8UOVmWje2I8
         XQdXrQXBIPilyPsddSRUD2+CYAVg4CuPRDZ6rEp4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CDEC60A0A;
        Sat, 24 Aug 2019 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566659498;
        bh=DjeyMDjg4yTVadPS8oHIKohNhnXfa8SEgNDGMYhsFj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TvdK8xk/m50HwJDnQn2bCtJw6IZ7EVJJldYyypjSoPBp6maV9g4NlWM4nVJ0+/J3W
         UHrGVhLRKt5z67a+96nwXhCLNB4qJfLbj6lciIkLlFyosIrL1/Pe2JmLjabVp2cwKr
         nfOjXZmkwFSqLuLjHUbk8dbHoQYUhc91vz2ML7Vs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CDEC60A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
Date:   Sat, 24 Aug 2019 20:41:16 +0530
Message-Id: <20190824151117.18906-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190824151117.18906-1-sibis@codeaurora.org>
References: <20190824151117.18906-1-sibis@codeaurora.org>
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
index 510c748656ec5..438a3e5173846 100644
--- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -8,8 +8,8 @@ Required properties:
 - compatible:
 	Usage: required
 	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-aoss-cc"
+	Definition: must be on of:
+		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
 
 - reg:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

