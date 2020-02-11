Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68244159323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 16:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgBKP3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:29:52 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:56492 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728963AbgBKP3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:29:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581434990; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MvQaaE8N59wTtaXaPTPX5FkMiN1q6n99dukOzaIf5QU=; b=wVikGuB6pB5AJpkxiFnnAc54Ot+ZWH5G229pj/LYWUPV+3N0kaQA6OrFdq7AL8YcqZGLzvNr
 e89UJDbM7LJQlqv8NNJT3cfdUKNKsHEzedp7L11TRKmpL9Jajis6r3EFnnkQpCKf7GWH0H8l
 PhbVtYwouGcJFbr41J189TklP0w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e42c86d.7fd1af5e4dc0-smtp-out-n02;
 Tue, 11 Feb 2020 15:29:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D14FC447A2; Tue, 11 Feb 2020 15:29:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 412B7C447A0;
        Tue, 11 Feb 2020 15:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 412B7C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, dianders@google.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH V1] dt-bindings: mmc: sdhci-msm: Add CQE reg map
Date:   Tue, 11 Feb 2020 20:59:14 +0530
Message-Id: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CQE feature has been enabled on sdhci-msm. Add CQE reg map
that needs to be supplied for supporting CQE feature.

Change-Id: I788c4bd5b7cbca16bc1030a410cc5550ed7204e1
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index 7ee639b..eaa0998 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -27,6 +27,11 @@ Required properties:
 - reg: Base address and length of the register in the following order:
 	- Host controller register map (required)
 	- SD Core register map (required for msm-v4 and below)
+	- CQE register map (Optional, needed only for eMMC and msm-v4.2 above)
+- reg-names: When CQE register map is supplied, below reg-names are required
+	- "hc_mem" for Host controller register map
+	- "core_mem" for SD cpre regoster map
+	- "cqhci_mem" for CQE register map
 - interrupts: Should contain an interrupt-specifiers for the interrupts:
 	- Host controller interrupt (required)
 - pinctrl-names: Should contain only one value - "default".
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
