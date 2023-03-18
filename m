Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7866BF9DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjCRMSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjCRMSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:46 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EFF3CE06
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:41 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so4835815wmq.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l73lhSfJR0MXTja3lCI/L1FnLvsz9yKY6h4sxugZA5A=;
        b=p7uFWd6oW2fsk7FImFHU7uiL3c4UNxMdTDkhJbDsKgytoyQRZwTxyn/gfCbObzNPF5
         lsvx1k5ng2jaV2vdc7p8Rcb5pu4NAmcTQvrkk/+wcNU5Phc4x0ADSiRsk0FLtD4odAX3
         qZ0TfJIWMY1HGPTWYOYYFbwf/2/8wA3HABUUY9mAXgH8odu0m896wESdrSXEM+8UsXXY
         BkpCk39hmKqDzOivg3x0Bu1mBDW6THODnfdtpaNM48JHc53xRYe0AlxWrafDYwEi10IT
         +DTTrXRNzNOiu2MQTiDn5n++552Q7phxnk6ReHqlEzF5bmQDrva+BU7MOLXwoTP3y834
         3SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l73lhSfJR0MXTja3lCI/L1FnLvsz9yKY6h4sxugZA5A=;
        b=d0hdyVxnbsPMZ3HwHFk/HndprRXJ6c+iNfmOYN4iCxYeYgB6WeQ7PQ22oeiA7eU0rb
         GEiHhlEXS2uHSP/lhXeZg6sh8VVSqOOrzbqoeP+xJBPIl4VGLslrJ0+WAjcl/6wXTDVx
         9yNOwPV34lQedE33l5j5tjSKYi86gHYSF3V1S816UlHNbbSMWkFlsgvlyjaUflzUbw/M
         Soyy21Klu6czBGbDozhri+qnHYv7yQXn2rZHtmCBrmctxDM41oR99GdYuZmp7dLsqXje
         ccw1zc2vnrKEEshj0+R9n6xDM/FJLm9ll2fTIggKSVhOsmteMJCsSVVAW6c2y5qb1apO
         L1uw==
X-Gm-Message-State: AO0yUKWxKeKk5wkVNog6utPcA5SM4zwfmBJdbhcqJUET/gfENVdiAlUY
        0kxeWLOALubfbRdUYX5qpG3U8Q==
X-Google-Smtp-Source: AK7set9SEmSPVQbsgjWcJNUcoI172tQtFIJk2apNAzcvfRQ8VUsdFYSjj/i7zGSAbFeF7Klps6fCnA==
X-Received: by 2002:a05:600c:1d24:b0:3da:1f6a:7b36 with SMTP id l36-20020a05600c1d2400b003da1f6a7b36mr26807018wms.0.1679141921479;
        Sat, 18 Mar 2023 05:18:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 07/18] dt-bindings: usb: Add qcom,pmic-pdphy dt-binding header
Date:   Sat, 18 Mar 2023 12:18:17 +0000
Message-Id: <20230318121828.739424-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a series of defines which are used in the DTS and pdphy driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dt-bindings/usb/typec/qcom,pmic-pdphy.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-pdphy.h

diff --git a/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h b/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
new file mode 100644
index 0000000000000..7d39985bcc779
--- /dev/null
+++ b/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Ltd. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_QCOM_PMIC_PDPHY_H
+#define _DT_BINDINGS_QCOM_PMIC_PDPHY_H
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
2.39.2

