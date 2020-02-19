Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63ED164259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 11:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgBSKkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 05:40:47 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:43621 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbgBSKkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 05:40:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582108842; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=m+SsMqk+RGxd+hw8dBrJx3lSAASFyjzQtx+MR+zMseE=; b=NCEDfSkT0h9qQc0B9smfWhBZy8zT8+3Qz8HCDNhWhQATZkXVPFvNd+wpKUf1+jnnUHrWJL9Z
 WN/7binysaG29YZavnaqgtbS1EuUQZTuYCcqomcL5+aoiwEVrvA7L2HI704OJ+q5qM5+Q0NE
 D0c5ZdwyAx18R2l3jwqw9QffhSA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d10aa.7fa756c1a3b0-smtp-out-n02;
 Wed, 19 Feb 2020 10:40:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7552C447A2; Wed, 19 Feb 2020 10:40:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1C7FC4479F;
        Wed, 19 Feb 2020 10:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1C7FC4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 3/7] dt-bindings: soc: qcom: Add RSC power domain specifier
Date:   Wed, 19 Feb 2020 16:10:06 +0530
Message-Id: <1582108810-21263-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582108810-21263-1-git-send-email-mkshah@codeaurora.org>
References: <1582108810-21263-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In addition to transmitting resource state requests to the remote
processor, the RSC is responsible for powering off/lowering the
requirements from CPUs subsystem for the associated hardware like
buses, clocks, and regulators when all CPUs and cluster is powered down.

The power domain is configured to a low power state and when all the
CPUs are powered down, the RSC can lower resource state requirements
and power down the rails that power the CPUs.

Add PM domain specifier property for RSC controller.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt b/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
index 9b86d1e..5682806 100644
--- a/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
@@ -83,6 +83,14 @@ Properties:
 	Value type: <string>
 	Definition: Name for the RSC. The name would be used in trace logs.
 
+- #power-domain-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: Must be 0. Number of cells in power domain specifier.
+		    Optional for controllers that may be in 'solver' state
+		    where they can be in autonomous mode executing low power
+		    modes.
+
 Drivers that want to use the RSC to communicate with RPMH must specify their
 bindings as child nodes of the RSC controllers they wish to communicate with.
 
@@ -112,6 +120,7 @@ TCS-OFFSET: 0xD00
 				  <SLEEP_TCS   3>,
 				  <WAKE_TCS    3>,
 				  <CONTROL_TCS 1>;
+		#power-domain-cells = <0>;
 	};
 
 Example 2:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
