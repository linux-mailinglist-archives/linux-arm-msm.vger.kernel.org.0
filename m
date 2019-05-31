Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8346C306C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 05:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfEaDBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 23:01:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36751 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfEaDBD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 23:01:03 -0400
Received: by mail-pg1-f193.google.com with SMTP id a3so3175134pgb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JAKPz5HiR/M9MZ5W/93Y/2txxEly1u4ytdsXz4IxAZM=;
        b=PtlXPcbo4dDcpE3ipqToSLUoiilw4pslHUCPpdqU/uIDE7SUrNvYRFtCTnOlm2fXY0
         BShSdoX0WGnvbEaKEqfwcb4pe1BxeQ26RXIFoCw+BW6J6AZjSZytxIZhJUt5VjO3sRGB
         j5oVWGZ2grZPKi0Fgg8fXd8HqsnrI/n/muxZ1oltqKE2YP4r8B1ZzPUkbdDp4hSSF4WQ
         1XKLSeWq8fAeEJFzSCGTqND1dT8a6TuRI79Y8wprv+O3wfRnvh7qes5T+YsbeLz22sTd
         JXKlvtHx4/DknPQmlq7f3Vx52sxO3IAR0RDFCRKGrWSR5/2WoR9vAOAyTLJNVPkCNtlT
         fsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JAKPz5HiR/M9MZ5W/93Y/2txxEly1u4ytdsXz4IxAZM=;
        b=G7GrF7nniPEUiKJlUiUvgVR8TXqdfYeGDP0boz1rHnTw/PdSJkv+tWPxbKml+fooOJ
         i6nvY9NH33IEAxDuA9fQ/0adElJr2VOM2senpd5VDJg/+xft3hEDq/4qOfOQ6+z25bBh
         tmCDKnNLjakLi5tTxd1bDxVmsoNg4apKlf+zuDU/GqJNPnw7+1UGk4Pc8WmYy2xCbUDB
         Hng1V8+qixLKsoy7DUJvK+WUS7WlWMG1ULz5ph6h8QaRjDv/A9N7TH5/O5p5hAhKSUgH
         MeWS3Y7V7hNGv5t3zF3LI0Z80BbD/MYrYB37zRzbiikxwoMp3aqaKAgv+lLqVnT0LLEV
         Kdfg==
X-Gm-Message-State: APjAAAUf7XeO4xgPw9tV/8uakWKAwKKgMTYLtGIIOwAxUyxtpWUGn7M7
        EBJXXHG8bUpdeO8I4B5+4bVYnA==
X-Google-Smtp-Source: APXvYqwrGyHTCH17O/nwl7MWLe1y4Oxo9vddlZfVF9wdT/6qMhZs33fSBtqL8w9g2aIpoxN6vjZpXA==
X-Received: by 2002:a17:90a:9b8b:: with SMTP id g11mr6297449pjp.103.1559271662688;
        Thu, 30 May 2019 20:01:02 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m8sm6991549pff.137.2019.05.30.20.01.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 20:01:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Date:   Thu, 30 May 2019 20:00:54 -0700
Message-Id: <20190531030057.18328-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190531030057.18328-1-bjorn.andersson@linaro.org>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
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

Changes since v7:
- Fix spelling of "Messaging"

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

