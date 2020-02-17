Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698E7160F3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 10:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgBQJuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 04:50:23 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:37451 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729051AbgBQJuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 04:50:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581933022; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TmZ0MaXtT3lJp8LRCBLmspS+LPQtb3tysf9sUdB/Lyc=; b=bftkfTi/MmUBnXC7o6YHypV8WagXXcMUvnRKddSpT7/vjnX5sj+n/w6L4/pCwTS2BH0ay2Vb
 z1rUyEeiahZa2/f6wlsviMHQ5r85LPOZSrvadEmfEXqh9UY/D3QmuXmlQ3s7gbKwBrTsR+9w
 7Q8fG+7PYx1Y2AR+PMKQT3VPkQQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a61d3.7f0ec86d86c0-smtp-out-n02;
 Mon, 17 Feb 2020 09:50:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2088C4479C; Mon, 17 Feb 2020 09:50:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46BFEC43383;
        Mon, 17 Feb 2020 09:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46BFEC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: spi: Add interconnect binding for QSPI
Date:   Mon, 17 Feb 2020 15:19:34 +0530
Message-Id: <1581932974-21654-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581932974-21654-1-git-send-email-akashast@codeaurora.org>
References: <1581932974-21654-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the interconnect and interconnect-names
properties for QSPI.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 977070a..b58bd73 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -47,6 +47,14 @@ properties:
   "#size-cells":
     const: 0
 
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: qspi-config
+      - const: qspi-memory
+
 required:
   - compatible
   - reg
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
