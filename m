Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564A7445EB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhKEDgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhKEDgn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:43 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997DEC061205
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:04 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id y196so6021811wmc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=PXKRs8VaN+BUzZXJAHYO9LhedHihnSsFCU0wx+JaJgJZj65Ll7nCLr3LlaXScR6nyj
         Ctr5WXydQ7eZTZXVKc4ztmIllm9JcoB19iF9XL/1T49z99zFYWMDPRFfRbz2JIw4IUpp
         wCcHP3STYM4HFrUdQc7imYZwql6A/B1c2ncKZ/mc2RGAlhpLkjx7z1webanP4xmvSFwg
         t1LvdgWovA7n5s5C1GkKkMKOXB97Zr2ivFgVGz1tNEz0os9ZA4lRCokV38NBx8/liA+9
         a5ZrzbIMR0APwEESPB18nMIdtw8MJpGWFm3HUo2OwN99iXsMFcm1YFfnP/SjhJtc029l
         14Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=IEIzhhzIcjPUlYFJl29yyMa3DG1Qe1nyvFKfYMaf4rWF+c6iHStxgnHqhQJZ/HhNiw
         MXC7x3Xm2AWurSWI6OfonvlbfrkLfWC3ovje9G0sZHS28f8KVrS7qLj0VnYg3GgmB7dj
         V3lQ8UoIZkic4bw04aly9h2A5sjtQopC+4BdjL0X0DLXrv23/zK8tOfvYQyz7nOHZVTL
         zmxWGqKM24tl6IFT7v7Fo4vJJCw+Denx9F2EfSaliXnMOM0jZekNr6SXn5nypw3H5dMu
         0Q52foPQ92ESTL+Oyq/nzu0fHZe/UE74pN0nQpbvmq63cQXI3AhareWezV4WdLVExYjL
         pw8Q==
X-Gm-Message-State: AOAM531dzO6dVqPbErTP48fAYtcTPLFDLC9gPwjzfqw9MR+oPBIHpHLV
        ZGEEuJiTryIjlZLm9k+UEQApig==
X-Google-Smtp-Source: ABdhPJzM2VjGTLCa03XPonF4uxQqi2O6WUGTTkDbyk3yztPmHu4huC877hPoOO1mFBx0E5U0BKoRmQ==
X-Received: by 2002:a05:600c:ac2:: with SMTP id c2mr27632565wmr.118.1636083243239;
        Thu, 04 Nov 2021 20:34:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/7] dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
Date:   Fri,  5 Nov 2021 03:35:54 +0000
Message-Id: <20211105033558.1573552-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
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

