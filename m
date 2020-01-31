Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BB914F288
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 20:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgAaTJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 14:09:11 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:27122 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbgAaTJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 14:09:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580497750; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bIJ07qh5lOtDS6LJCkZXbqG2dvWXiGWlxxUNOg7SvO8=; b=YcLqDJ4jKSvmRypmDd3f7g61C357SvaayCzQzdasPZocxy5YELYkkBbn6uGZAfATCwvKEgY5
 HpaINAIJlN79aeDP6yacSlx8vcuNoBw4d3EO7vtHfYU3vzhOBPV+fYEUWit8IQc/X2a2TO3Y
 BahNdSWhJn8bWGccpnuZDc0ZRuQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e347b51.7f52055ec228-smtp-out-n01;
 Fri, 31 Jan 2020 19:09:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73563C447AE; Fri, 31 Jan 2020 19:09:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88B13C447A3;
        Fri, 31 Jan 2020 19:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88B13C447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC v2 1/3] dt: psci: Add arm,psci-sys-reset2-type property
Date:   Fri, 31 Jan 2020 11:08:49 -0800
Message-Id: <1580497731-9845-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580497731-9845-1-git-send-email-eberman@codeaurora.org>
References: <1580497731-9845-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some implementors of PSCI may relax the requirements of the PSCI
architectural warm reset. In order to comply with PSCI specification, a
different reset_type value must be used. The alternate PSCI
SYSTEM_RESET2 may be used in all warm/soft reboot scenarios, replacing
the architectural warm reset.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 8ef8542..a790e5a 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -102,6 +102,11 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/arm/idle-states.txt
 
+  arm,psci-sys-reset2-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+        reset_type parameter value to use during a warm or soft reboot.
+
   "#power-domain-cells":
     description:
       The number of cells in a PM domain specifier as per binding in [3].
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
