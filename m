Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06F743E250
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 15:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhJ1Nei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 09:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhJ1Nei (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 09:34:38 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B54CC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:11 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b2-20020a1c8002000000b0032fb900951eso1274317wmd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=dkwiGfMgfo1c3wLMrfTfTJS9EKEFp+r4mEgURfGabFfIV/caF4azDLxqPD8SVgZrJm
         YedDUQ1GnMztC4OO6d1NTzSRWjyF2pik01tOq0Urj/DVoC6PFs1PV/3uUn5OJnpf7jo/
         xHsbR1b27260i+jlOV5cimn4aCOmfxRH0TJ0vM2obRlaFL/jYpAfSQdWo9tN9f/S5jk1
         6Ke3cfddmx8XuS8dIB4ieHIGcDIOyTp1RTCyBnuFep3LeNyhd/SvnJLaGLy4ofZNklmj
         8nopRkVDZ3IKKYUQSr2AWkNrjNuJoYuQDCu4o8KgWUeHweQY5voeljnOcJkXDhd1RO0I
         zUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=DGDb+4811T1aOmEAsNaHEd7zSHu0zzGIuzRAOrfcGbpNmvsSbtbaxytf1UoCjaMONp
         iKivzofCQrQzEeusz27G3/55Tdql9cYywkc//W6q4hlmB1RGoj5Oof0loFtOX3lGL33G
         xFz17qNHarnrzwrtfqNEpMq0eLkSPiFX4Kkj1fj4PJ90X1YFVSMhbqjaj6Y5m/qM2xA3
         B7cAvqKytbqyl4Ir4VZyuFZKJSuz+PzFmeheCMFAAh+vv19K/QmUEg9+TKbevQgAnbzi
         mHpvhu/6TshluAceiWN6hjXYV46qsVg0EQrsvpveyluocukzJmT7u9mRtwD1cGbEodAK
         asiw==
X-Gm-Message-State: AOAM531g40pisJhYlAZjs2cMbo1O6aHp5H1aM9S603rytzhvG9MOMLoI
        ZhFR/yfOkANvqakODdtb05JjEg==
X-Google-Smtp-Source: ABdhPJzguW31ArCiuRFYvscBgeQKkSNULMLXxZMYSDbka+EsvE7Aq9JOybh3qPQOzH2GSdyFh2pHnQ==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr4541735wmc.5.1635427929628;
        Thu, 28 Oct 2021 06:32:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/7] dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
Date:   Thu, 28 Oct 2021 14:33:58 +0100
Message-Id: <20211028133404.826012-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a series of defines which are used in the DTS and type-c driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../usb/typec/tcpm/qcom,pmic-usb-typec.h       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h

diff --git a/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
new file mode 100644
index 0000000000000..263c999b59b8d
--- /dev/null
+++ b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
+#define _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
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
2.33.0

