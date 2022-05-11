Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3EB523740
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 17:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiEKP0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 11:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343644AbiEKP0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 11:26:54 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80373377D2;
        Wed, 11 May 2022 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652282813; x=1683818813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DmCggzxlBlEElILwccMo5iy8HH+CtovGy9o1uqA+ZRQ=;
  b=ihByjAJKQigeM+yFpe6xujZvFmgS9Ch11O3lYobW7iU//kF0VXWri9UA
   EtP2mKCseuHBorK90qN9dB+jgDt7nLtwCCcou52ZbZEjHyE/uG6mCBka4
   JHrEhA28bm6ZKtxSRaGYnw3QtPCe84ehA1NVAN7SOayoVCxuWlnBRw9eN
   A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 May 2022 08:26:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 08:26:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 08:26:51 -0700
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 08:26:45 -0700
From:   Krishna Kurapati <quic_kriskura@quicinc.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Doug Anderson" <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_vpulyala@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [v4 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy override params bindings
Date:   Wed, 11 May 2022 20:56:31 +0530
Message-ID: <1652282793-5580-2-git-send-email-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
References: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Add device tree bindings for SNPS phy tuning parameters.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 1ce251d..70efffe 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -53,6 +53,93 @@ properties:
   vdda33-supply:
     description: phandle to the regulator 3.3V supply node.
 
+  qcom,hs-disconnect-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the voltage level for the threshold used to
+      detect a disconnect event at the host. Possible values are.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,squelch-detector-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the voltage level for the threshold used to
+      detect valid high-speed data.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,hs-amplitude-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the high-speed DC level voltage.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,pre-emphasis-duration-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This signal controls the duration for which the
+      HS pre-emphasis current is sourced onto DP<#> or DM<#>.
+      The HS Transmitter pre-emphasis duration is defined in terms of
+      unit amounts. One unit of pre-emphasis duration is approximately
+      650 ps and is defined as 1X pre-emphasis duration.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,pre-emphasis-amplitude-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This signal controls the amount of current sourced to
+      DP<#> and DM<#> after a J-to-K or K-to-J transition.
+      The HS Transmitter pre-emphasis current is defined in terms of unit
+      amounts. One unit amount is approximately 2 mA and is defined as
+      1X pre-emphasis current.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,hs-rise-fall-time-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the rise/fall times of the high-speed waveform.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,hs-crossover-voltage-mv:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the voltage at which the DP<#> and DM<#>
+      signals cross while transmitting in HS mode.
+      The values defined are in milli volts. The hardware accepts only
+      discrete values. The value closest to the provided input will be
+      chosen as the override value for this param.
+
+  qcom,hs-output-impedance-mohm:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      In some applications, there can be significant series resistance
+      on the D+ and D- paths between the transceiver and cable. This adjusts
+      the driver source impedance to compensate for added series
+      resistance on the USB. The values defined are in milli ohms.
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
+  qcom,ls-fs-output-impedance-bps:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      This adjusts the low- and full-speed single-ended source
+      impedance while driving high. The following adjustment values are based
+      on nominal process, voltage, and temperature.
+      The values defined are in multiples of basis points (1bp = 0.01%).
+      The hardware accepts only discrete values. The value closest to the
+      provided input will be chosen as the override value for this param.
+
 required:
   - compatible
   - reg
-- 
2.7.4

