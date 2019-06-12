Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE5941B4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 06:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbfFLEpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 00:45:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34070 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbfFLEpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 00:45:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so2353950pgn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bVli2yr8eO0K7ILXstIjswO8Yta29DR9SyYFw4Rhlss=;
        b=B2iFFkrKRR2C97mWsP+TwkQCNjPS1UdDCOxH7QUNe03LqOIoezvS25bnRTzmjzBTbC
         lEI5DuqgP3l+yCRRlaDN3+tlTZy7enJGppcIVc1LJcluULHWDAAKQdmhf3zgQbFSnzML
         /ENrC+DQw+NZFL/wKv90PtaFLrD5y/XcQ6eaVBuxHUuovlyQyPyrVAwe69l0lyjM+hED
         akRvPutce9Y/vA11LI2GC2ZYkqRldvDyF5P3n8FfDZeiIgsAoVOjjqASMtsvMcDD1ioE
         NP+KVoQDrztYahZ8F7RyluOPbzF4ltj7U/F4esZucpV+VuAgSq3k5efMuOb1O3YfYIvr
         cAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bVli2yr8eO0K7ILXstIjswO8Yta29DR9SyYFw4Rhlss=;
        b=CDfDFXeYBrq9NH03VCzPprkZsRn+89Q9Gcpnpwo1ll0serOV9QQFazulT3KS24c03E
         TG/7MgddKjDTx8n6JFUX8GhoQSFfkW+Pr9JGZQDB8PWkk50u95lpHLMpxg/XFQM5RKG9
         6w8CXgnKoADOEu5Jk4ZRkSmP8q1+I4i0+ADNiMxXnevbdEpbrSNp2Mbg060Nb4B0OrS9
         MBtV2i3LWKEOSGB3CyRgNih/RFyHVFOmTWKCZ3zpGHdT8rZLdEJtphd8fZ8arYl3K+B0
         2c/vNEPbdeeOUb5Hw93i9CAn407XowcUbVCdgV1qJv5+TkLEfzx6h4Biw/bERCRponPr
         bXSw==
X-Gm-Message-State: APjAAAWEMoEzkSCW4u1uZ5Blov5zhNHNELB3irXm1gARHRzsn82BzPrG
        553fzunkIptyc3jlb1EpSmBPOjWaMAw=
X-Google-Smtp-Source: APXvYqzfOAuiwBlZDLKfmXvuPp3a6Zw1HNOLvA0tS3FXYUmzKxltcw7My52z66cNyttL9qFzH+teYg==
X-Received: by 2002:a17:90a:a407:: with SMTP id y7mr30748501pjp.97.1560314740121;
        Tue, 11 Jun 2019 21:45:40 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z126sm17129194pfb.100.2019.06.11.21.45.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 21:45:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Date:   Tue, 11 Jun 2019 21:45:33 -0700
Message-Id: <20190612044536.13940-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190612044536.13940-1-bjorn.andersson@linaro.org>
References: <20190612044536.13940-1-bjorn.andersson@linaro.org>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding for the QMP based side-channel communication mechanism to
the AOSS, which is used to control resources not exposed through the
RPMh interface.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v8:
- None

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 81 +++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     | 14 ++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
new file mode 100644
index 000000000000..954ffee0a9c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -0,0 +1,81 @@
+Qualcomm Always-On Subsystem side channel binding
+
+This binding describes the hardware component responsible for side channel
+requests to the always-on subsystem (AOSS), used for certain power management
+requests that is not handled by the standard RPMh interface. Each client in the
+SoC has it's own block of message RAM and IRQ for communication with the AOSS.
+The protocol used to communicate in the message RAM is known as Qualcomm
+Messaging Protocol (QMP)
+
+The AOSS side channel exposes control over a set of resources, used to control
+a set of debug related clocks and to affect the low power state of resources
+related to the secondary subsystems. These resources are exposed as a set of
+power-domains.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,sdm845-aoss-qmp"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of the message RAM for this
+		    client's communication with the AOSS
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the AOSS message IRQ for this client
+
+- mboxes:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the mailbox representing the outgoing doorbell
+		    in APCS for this client, as described in mailbox/mailbox.txt
+
+- #clock-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: must be 0
+		    The single clock represents the QDSS clock.
+
+- #power-domain-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: must be 1
+		    The provided power-domains are:
+		    CDSP state (0), LPASS state (1), modem state (2), SLPI
+		    state (3), SPSS state (4) and Venus state (5).
+
+= SUBNODES
+The AOSS side channel also provides the controls for three cooling devices,
+these are expressed as subnodes of the QMP node. The name of the node is used
+to identify the resource and must therefor be "cx", "mx" or "ebi".
+
+- #cooling-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: must be 2
+
+= EXAMPLE
+
+The following example represents the AOSS side-channel message RAM and the
+mechanism exposing the power-domains, as found in SDM845.
+
+  aoss_qmp: qmp@c300000 {
+	  compatible = "qcom,sdm845-aoss-qmp";
+	  reg = <0x0c300000 0x100000>;
+	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+	  mboxes = <&apss_shared 0>;
+
+	  #power-domain-cells = <1>;
+
+	  cx_cdev: cx {
+		#cooling-cells = <2>;
+	  };
+
+	  mx_cdev: mx {
+		#cooling-cells = <2>;
+	  };
+  };
diff --git a/include/dt-bindings/power/qcom-aoss-qmp.h b/include/dt-bindings/power/qcom-aoss-qmp.h
new file mode 100644
index 000000000000..ec336d31dee4
--- /dev/null
+++ b/include/dt-bindings/power/qcom-aoss-qmp.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018, Linaro Ltd. */
+
+#ifndef __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
+#define __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
+
+#define AOSS_QMP_LS_CDSP		0
+#define AOSS_QMP_LS_LPASS	1
+#define AOSS_QMP_LS_MODEM	2
+#define AOSS_QMP_LS_SLPI		3
+#define AOSS_QMP_LS_SPSS		4
+#define AOSS_QMP_LS_VENUS	5
+
+#endif
-- 
2.18.0

