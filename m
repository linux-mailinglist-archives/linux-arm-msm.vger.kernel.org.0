Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164F21A1853
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 00:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgDGWsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 18:48:46 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16266 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726380AbgDGWsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 18:48:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586299725; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+BwWb6bZ2jNnwZxDYA2vtg528w7ktuHus/p00QTtFTs=; b=rz10rOa3KZXw6bQ1vJV11C4NwmqBBs5cpAnT/eVGZp8d0fKyEE7SUa7S/GnsGxl4OnBxw/Gy
 iAvKBpscL5r3ZpnfnihP8Ax0j6D/zBJVcXSU9687b1bVNWgTvQb+riFuWldum9FB9zIzxWKo
 uqdeeGiwlQ1+wQETfBsg2z37sAo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8d034c.7f94453febc8-smtp-out-n05;
 Tue, 07 Apr 2020 22:48:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CCA6C43637; Tue,  7 Apr 2020 22:48:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28C32C433D2;
        Tue,  7 Apr 2020 22:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28C32C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        aravindh@codeaurora.org, varar@codeaurora.org
Cc:     Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO bindings
Date:   Tue,  7 Apr 2020 15:48:28 -0700
Message-Id: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Display Port HPD GPIO description in bindings

This Patch depends on:
	https://patchwork.kernel.org/patch/11468505/

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
index 761a01d..003f5f7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
@@ -155,6 +155,11 @@ properties:
      data-lanes:
        description: Maximum number of lanes that can be used for Display port.
 
+     dp-hpd-gpio:
+       maxItems: 1
+       description: Specifies HPD gpio for DP connector without
+                    USB PHY or AUX switch.
+
      usbplug-cc-gpio:
        maxItems: 1
        description: Specifies the usbplug orientation gpio.
@@ -282,6 +287,8 @@ examples:
         aux-sel-gpio = <&msmgpio 110 1>;
         usbplug-cc-gpio = <&msmgpio 90 1>;
 
+        dp-hpd-gpio = <&msmgpio 117 0>;
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
