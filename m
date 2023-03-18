Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258556BF9D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCRMSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjCRMSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:42 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204143BC59
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id w11so3725999wmo.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1I7qnuznofFTSCzUNTU+tjSLuCVpFiHoBhZuvsEgQo=;
        b=fUI2WHNAcwM7CaBIm/FYsjWY7EVFMhJIpidQ3lVgQfo0tydlqkfH6zCZpJiKvhn64X
         b+3U5ro9fd3o69SsxXBOGon+4r42R9NsLFf5ASRyfEaYKWpiUuVAYcCoazA7rbqQf4kz
         LDIkqTOTq+D736yiCT05E4ZXiBOy76oIaqXWhSKS6MrLltjsUCjgVS4SIIbpAdWj2oW5
         STPnSMyZ5VYLShoz3x94LcpoMlXLG8f0xal1G8HDZebC/NnvtPSfbyrtep+qygPNouc0
         +fLZ386gJiOz+5ReOffKsZEEOefiXI6QW73F6debrH2uz3wCwBCjTeyf9vzMxbG7YmOb
         TpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1I7qnuznofFTSCzUNTU+tjSLuCVpFiHoBhZuvsEgQo=;
        b=cytQu/OZ1mCajuSnJSFsst1QjNsRgXKWysrcV57ysDkAyvZ2zDCCbQUszXBA6OOWvP
         tV1fbqQqaIbRe9/+JxWIOWeuUp1GLAt0vJcg5KRX08Ywx+cD/JRaHLInnkrFxuuYSY66
         XyNOSC8Fk8mF3Nulcy/QODdnnFHNflNDQQsgpdyMttH2GOGd2Ff1G0Cv7Zn3iiNx4p+D
         GdxSQlQ3BwonZA0MsS2j8OVDyGabNOXYeWYeZz0b5ymHZ8PFfnXbX3mAI4MiDoiU8xyv
         IqL8zVHIUlQlnHvaNcemgpoFz0JRzVHjrIJ2ds0dRCBYZTjmsr2MjydOspxktlZakcy3
         V9qA==
X-Gm-Message-State: AO0yUKVIISYM8+PKAA6l+dfuqB5kJXfM130XjhjUrol+IYnTbDe5wXPu
        bC+qW5TyQQu7O6h6x4x+5+6N1A==
X-Google-Smtp-Source: AK7set8xYrXPeP2b1RenkXRYO0JjE8L/3iiwsbrUkVHvmiO6JzQAN+E0uHt9pdnVTw7H27H34QPUDg==
X-Received: by 2002:a1c:f216:0:b0:3ed:346d:4534 with SMTP id s22-20020a1cf216000000b003ed346d4534mr4722999wmc.0.1679141918454;
        Sat, 18 Mar 2023 05:18:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 05/18] dt-bindings: usb: Add qcom,pmic-typec dt-binding header
Date:   Sat, 18 Mar 2023 12:18:15 +0000
Message-Id: <20230318121828.739424-6-bryan.odonoghue@linaro.org>
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

Adds a series of defines which are used in the DTS and type-c driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dt-bindings/usb/typec/qcom,pmic-typec.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-typec.h

diff --git a/include/dt-bindings/usb/typec/qcom,pmic-typec.h b/include/dt-bindings/usb/typec/qcom,pmic-typec.h
new file mode 100644
index 0000000000000..733e23b6cdbc4
--- /dev/null
+++ b/include/dt-bindings/usb/typec/qcom,pmic-typec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_TYPEC_H
+#define _DT_BINDINGS_TCPM_QCOM_PMIC_TYPEC_H
+
+#define PMIC_TYPEC_OR_RID_IRQ		0x0
+#define PMIC_TYPEC_VPD_IRQ		0x1
+#define PMIC_TYPEC_CC_STATE_IRQ		0x2
+#define PMIC_TYPEC_VCONN_OC_IRQ		0x3
+#define PMIC_TYPEC_VBUS_IRQ		0x4
+#define PMIC_TYPEC_ATTACH_DETACH_IRQ	0x5
+#define PMIC_TYPEC_LEGACY_CABLE_IRQ	0x6
+#define PMIC_TYPEC_TRY_SNK_SRC_IRQ	0x7
+
+#endif
-- 
2.39.2

