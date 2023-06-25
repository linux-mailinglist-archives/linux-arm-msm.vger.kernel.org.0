Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC2573D3BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjFYU0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjFYUZz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:25:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743BC9B
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:25:54 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so1295904e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724752; x=1690316752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqcO67HcDBaOtZPpHw7j2J02maw29IRokEZZ2i6M3WM=;
        b=yBXfcSmQWXTmlK6UtFj9tPByv67+V/dmfYW5MpnSnrRmfDyLmLwuBbt7YFJm4tsLiu
         lX5g5rNKhBpAA9034xiYEk6CwqPkmkprXw2U7nxPAo8AO6u2b4oRLyas0q2jaJ0xIR7/
         WtTGR+4i6sfdb5lAtfCUuj43naQhbd3hTN6gmlsuCBy60dUNlVhQEqHkKlTfgvl/v0gB
         1dkeekhmjcYh3Pa6rZ8KA5nP+4S5WMQ3PmDZuclrLnkfTmn9Kpcak2Q7r3VeBaAZKc73
         jlaB2S80xLxjws4pZ+lqKN0jB/HQN9uDg74l5sDOmtq73MlQoyMxwiXmgznaj8e7uUq/
         7Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724752; x=1690316752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqcO67HcDBaOtZPpHw7j2J02maw29IRokEZZ2i6M3WM=;
        b=UZ4NbRkQZIIVnageKaB1vnmr9Bz769mQ5nwX2i3ooNno1+VJLCKPT1bl2Qv+WNBcp4
         kjzKVnDk6+0XigbXPrGzb74J4BEagwxyG0Ksyte+ceL0E12gABjJsRXvU0l2a7bkuHXN
         vaqAc/ZgwASo/ZIxQXq1NhltbdhiWtJD7h0Ey8iDfwqJ9JyqchBD4p3wFvJjkYMfHYbD
         j3dA4bV6rcApeUAOm0KKUGSAsgfIfjabk0T3MhBbSRpP736ndLEG+YY56ixyBPZs7l/B
         /JUTIRywzF23ronHYVoBlfvJAXGi2XJDUeOB2jmEahPZopcYt+XaxuSgWhPbPGLipHr7
         DW4w==
X-Gm-Message-State: AC+VfDwCxuus4BPYOjKJHMfa/KRA+5Df8GVb1wRFcnUQa/hlMfWuwPah
        e7KCxhycayPLP/TxzIbR7sZVAgfVGiqI1ybm+ek=
X-Google-Smtp-Source: ACHHUZ7zWlgr66w2nCQT9TQvInjXs8SGr7Aj9thLfzQMTmBlDs9+6jPCqqoszimji/TTyPgcF+jypw==
X-Received: by 2002:a19:5f08:0:b0:4f6:3677:553 with SMTP id t8-20020a195f08000000b004f636770553mr14194221lfb.38.1687724752807;
        Sun, 25 Jun 2023 13:25:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 04/26] dt-bindings: clock: qcom,krait-cc: Krait core clock controller
Date:   Sun, 25 Jun 2023 23:25:25 +0300
Message-Id: <20230625202547.174647-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define bindings for the Qualcomm Krait CPU and L2 clock controller. This
device is used on old Qualcomm SoCs (APQ8064, MSM8960) and supports up
to 4 core clocks and a separate L2 clock. Furthermore, L2 clock is
represented as the interconnect to facilitate L2 frequency scaling
together with scaling the CPU frequencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,krait-cc.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,krait-cc.h

diff --git a/include/dt-bindings/clock/qcom,krait-cc.h b/include/dt-bindings/clock/qcom,krait-cc.h
new file mode 100644
index 000000000000..ff69a0a968d8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,krait-cc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_QCOM_KRAIT_CC_H
+#define __DT_BINDINGS_CLOCK_QCOM_KRAIT_CC_H
+
+#define KRAIT_CPU_0		0
+#define KRAIT_CPU_1		1
+#define KRAIT_CPU_2		2
+#define KRAIT_CPU_3		3
+#define KRAIT_L2		4
+
+#define KRAIT_NUM_CLOCKS	5
+
+#endif
-- 
2.39.2

