Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8CE43E254
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 15:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhJ1Nel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 09:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhJ1Nek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 09:34:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6475AC061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so5092064wmz.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=tOyMGInVmSKzlPJwDbYSFJOsobbRLD2E9KOpZlsLPJpfCbstawGpwxVmSeB9hpLMP4
         BdRJfvl76PK+yw9LQYYD8UkBOFBHqcDa4E4kDTGCvfHG0B2ZuiQbqgShYEObn4kj5LpK
         oYhva73eqGXtSdqMPQnlVbEVkqI95spS2DgN7am4cm/1KXYufhY0p9Xn3kEgfE0W1vEi
         3+0QHKyoQcFMm6s8VWawWhWg79zFuNRMDIFbN15DO2Oidh5NTtZFJmmGTEwjwlKRAyoB
         37oAi0apqeeKO86sFn3pPzAD/0DF8XISZYdrFpUx6lKE8UGc0ckhsT3SEFappG1btYox
         eyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=caPrr0UDHDepdnefdJ9q3j5B9vc7DZcmxbO0if6+/30tPkEMeMI/J7v1q3r/WDpblU
         eINWU47FAQ7KBUN+RsbJ3l5Ma25x7grjid06ubmMKEja2Y12ryr29vyVcurVgE/kBjkS
         WzRZHz/IwVLdFrjh9l6DhLn+OcbKvoAFxG1+LC2gY9+cCDsf6mrBeLcNmq3Asloy67cr
         i37n6UcocUV6DlC7QG6rrBv/9kaxYfN00fNqQ75sx3eLEBb5Adnp34CtlxHcSaKIrJfv
         G6y/SgSPsQWJQguqU2QWp84VNmxYoP+sk3IDQbL/e3YMXo+KeWTKOgmKMQvyplrbvbkQ
         ZbTw==
X-Gm-Message-State: AOAM532U3+MIFE/hWHF1CF7c75rPOeQLNOa8HlJFDvnhDLVM5z3xAyt/
        Io761hbxVhEJcW1hjGJha8FEhw==
X-Google-Smtp-Source: ABdhPJyVyvFZrha5Wm6/v5MrR7azU5rhUaNn+TBfPEBCTNvckJ3hemaWnT1/bQ0tCPNJf/ujZVC9rg==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr4448494wml.178.1635427932023;
        Thu, 28 Oct 2021 06:32:12 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/7] dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
Date:   Thu, 28 Oct 2021 14:34:00 +0100
Message-Id: <20211028133404.826012-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a series of defines which are used in the DTS and pdphy driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../usb/typec/tcpm/qcom,pmic-usb-pdphy.h       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h

diff --git a/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
new file mode 100644
index 0000000000000..0bb1ce677fe5c
--- /dev/null
+++ b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_USB_PDPHY_H
+#define _DT_BINDINGS_TCPM_QCOM_PMIC_USB_PDPHY_H
+
+#define PMIC_PDPHY_SIG_TX_IRQ		0x0
+#define PMIC_PDPHY_SIG_RX_IRQ		0x1
+#define PMIC_PDPHY_MSG_TX_IRQ		0x2
+#define PMIC_PDPHY_MSG_RX_IRQ		0x3
+#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
+#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
+#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
+#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
+
+#endif
-- 
2.33.0

