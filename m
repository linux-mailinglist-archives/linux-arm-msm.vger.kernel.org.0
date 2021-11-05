Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D32E445EAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhKEDgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhKEDgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4EBC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:02 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d13so11645170wrf.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=HhHEAGDK2IjCv2CBs5WF0mta/GRYPDsyYQmRLzp2CK8tUu2Th0Ty8RtSKG7r+sSSSh
         229b2PLb/4TnmDMpbAY+wFLFGvt28D5D0cYriIG35eRRevKs4CG853xawj0BytHSlKpF
         7UpULrjozx/+iT1+E7/t8MTV/xfrwyiG7XpQvOz4zjLQxufOWI9TKq5QI6Bv9xD17xAN
         FwJoe7/7y2nDqK4ockJStJeglwLfYaroytvMzT6hOHx9xm3e8SI7h4xpkDG71vA0H04f
         Wf9K6nHRCVP0HzlBR0mBRyym9Rb2UDWmva0ddLGFW5+IkkUkVyF+ZixHiWGRmMqS4XDp
         w9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=3O6eBqq1P5fwCqJHLqYzVEN3AaOu0FIPDtejI7aJeZdNkqdZRMgd9RlkphrfClua8o
         8eAtj6gqUg7ubTh0hlo6GrujhoQD9d4nFQqzqDtJXIjrFYfPI2X+476pMu/RD/l/D11D
         YB3oz8TZnI/Ds1J+9+ZHdmb2v3oyyTpEI58rZetYLlUyA+8moz7VtJbv6tV9atR3L5dg
         sQ98UdPYUN5e7z11Qh5W17Z7ZZS1CupkEt3k6uSN+fEbAnY9wvnt6spxUm1LnHEv79QP
         CMTWikw+O5PD5v3gqy5idvk5/rimQ89UA9fPL6oBAl11pxUMr9SvqGbj/2hERjUNXXkm
         b6/w==
X-Gm-Message-State: AOAM5312pERWnClLrn9ZXKxeub4mHDP0lwTL/754yzTE+y+rPDigKvvn
        SQePqqpMgAb9bY7KvzrjVYjqaXSOp/s9TA==
X-Google-Smtp-Source: ABdhPJwuFzFUhLQ6Z0rTNlK73tfbbfJ/2AwH112xirfs9SRXhWLsPl2JYNTJKydkJziC59D9gYUNjA==
X-Received: by 2002:adf:c986:: with SMTP id f6mr74183765wrh.216.1636083241011;
        Thu, 04 Nov 2021 20:34:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/7] dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
Date:   Fri,  5 Nov 2021 03:35:52 +0000
Message-Id: <20211105033558.1573552-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
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

