Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BC6456C90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbhKSJqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:46:11 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18892 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234588AbhKSJqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637314989; x=1668850989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=yo4mjE0N6Mc1vvj8+tfPuqf9+Q2K7nHzoBTKE2y475Q=;
  b=OmTiERF1VIKpIA5oHyL7g/oUMJ7buVMCUAIS362Dw/BJkpXAvkn/yOqD
   tGfJlDMBrTBSk69Vg+LHHIWh8Z2XAbuk+P5CQo2uTw4XU5LTy4/HiMJ3d
   Un91Dy1YZajuX34k3f2OKiSdd4Nw4sY1+d+2ukiJC70k8aSGSM64VZm2O
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Nov 2021 01:43:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:43:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:09 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:04 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 1/6] dt-bindings: regulator: Add "regulator-min-dropout-voltage-microvolt"
Date:   Fri, 19 Nov 2021 15:12:28 +0530
Message-ID: <1637314953-4215-2-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "regulator-min-dropout-voltage-microvolt" property.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
Changes in V4:
 - This is newly added in V4.

 Documentation/devicetree/bindings/regulator/regulator.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index a6ae9ec..fdb37d3 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -224,6 +224,10 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-min-dropout-voltage-microvolt:
+    description: Specifies the minimum voltage in microvolts that the
+      parent supply regulator must output, above the output of this regulator.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node
-- 
2.7.4

