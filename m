Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7071C6BA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 10:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgEFI0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 04:26:37 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16879 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726935AbgEFI0g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 04:26:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588753596; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+e/hn/YJWiH0dL4r0I+5eUSTGJwUxUv6Ig6xc3EC2tk=; b=oo7uabDgnxavYE4iqv2k3BeTlIbwuYX2H0PKzMGwvQQjB7zXQUPn4PX1stBsZ4LaKXZmkL23
 Vvv3mWEuDvYVQiaixg2mt7bLZB8YWMDh7uiupz25IRFcMMEObWXBGST1a07//iH1WVSQVl6N
 dTLGQ7B3FfUxBNkhovIUzIc6j0k=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb274bb.7fc2faca4ca8-smtp-out-n05;
 Wed, 06 May 2020 08:26:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DD6EC44788; Wed,  6 May 2020 08:26:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 675E6C433BA;
        Wed,  6 May 2020 08:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 675E6C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, vkoul@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] dt-bindings: phy: usb-snps-femto-v2: Add regulator entries to example
Date:   Wed,  6 May 2020 01:26:29 -0700
Message-Id: <1588753589-22673-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix errors reported by dt_binding_check, due to missing required
regulators in the example node.

Fixes: f06b9fc9a814 ("dt-bindings: phy: Add binding for qcom,usb-snps-femto-v2")
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reported-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 984242f..574f890 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -72,5 +72,9 @@ examples:
         clock-names = "ref";
 
         resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+        vdda-pll-supply = <&vdd_usb_hs_core>;
+        vdda33-supply = <&vdda_usb_hs_3p1>;
+        vdda18-supply = <&vdda_usb_hs_1p8>;
     };
 ...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
