Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A1F1C9389
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 17:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgEGPCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 11:02:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39263 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728190AbgEGPCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 11:02:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588863764; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pViwrlcmQ4tKYgRp1wnIuQY9NM/R6M6irGDCItt7vT4=; b=MlMuau2AXxjNQnnALB7pjKE/zUnkreufakwI3qN3WTa7Oq8FE/+3b33OKPL8GGSGKnkyT7cP
 rzAW/NYPO3Rm0ZvU9n5CEnnppGu/mVSYmOckx4rAiuiUJnTUbT2c1gc++Rh03/i6fgBFBeyd
 uAUNs0Xjs+nkJyZL8qfqJCw6aLU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb422cd.7f1bd6757dc0-smtp-out-n05;
 Thu, 07 May 2020 15:01:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82369C3855D; Thu,  7 May 2020 15:01:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21879C49493;
        Thu,  7 May 2020 15:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21879C49493
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V6 3/3] dt-bindings: serial: Add binding for UART pin swap
Date:   Thu,  7 May 2020 20:30:47 +0530
Message-Id: <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation to support RX-TX & CTS-RTS GPIO pin swap in HW.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 53204d9..e657dd6 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -67,6 +67,12 @@ properties:
       (wired and enabled by pinmux configuration).  This depends on both the
       UART hardware and the board wiring.
 
+  rx-tx-swap:
+    description: RX and TX pins are swapped.
+
+  cts-rts-swap:
+    description: CTS and RTS pins are swapped.
+
 if:
   required:
     - uart-has-rtscts
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
