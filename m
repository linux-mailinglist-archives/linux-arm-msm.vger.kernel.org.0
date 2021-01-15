Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9D72F76D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 11:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731104AbhAOKl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 05:41:59 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:27945 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbhAOKl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 05:41:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610707300; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fx3iEICIQ3xcsBUZZuCUmPDnj2VVlP6W6Q3W+bu+4DA=; b=l4RqDm/Z3uJ6vviIPSu1dDGdfBnOGXNNXtTtj4afWy+9kPNiFr+seLFTFkNScnwIy0+XApJT
 vzSfzd+0LVKOKW3k6BC+yoKfpW2mueUcXsHn4imUmZsKkEzrQV7DYUVJ/m+Z2Ci5vE89S5Oh
 Fd4D1NXY0X6zkPnYGEjD3LML6UI=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 600171498a0374a5016c7988 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 10:41:13
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 517B8C43461; Fri, 15 Jan 2021 10:41:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A8DBC433C6;
        Fri, 15 Jan 2021 10:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A8DBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH 4/4] dt-bindings: usb: qcom,dwc3: Add bindings for SM8150, SM8250, SM8350
Date:   Fri, 15 Jan 2021 02:40:47 -0800
Message-Id: <20210115104047.3460-5-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210115104047.3460-1-jackp@codeaurora.org>
References: <20210115104047.3460-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible strings for the USB DWC3 controller on QCOM SM8150,
SM8250 and SM8350 SoCs.

Note the SM8150 & SM8250 compatibles are already being used in the
dts and driver implementation but was missing from the documentation.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2cf525d21e05..da47f43d6b04 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
           - qcom,sdm845-dwc3
+          - qcom,sm8150-dwc3
+          - qcom,sm8250-dwc3
+          - qcom,sm8350-dwc3
       - const: qcom,dwc3
 
   reg:
-- 
2.24.0

