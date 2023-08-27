Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F1F789D67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjH0LvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjH0Luo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:50:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C4D1B4
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007c8308c3so3625415e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137037; x=1693741837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=kVrCWnDlujG4mHtYucB+dfb+lZ8IoCUgXize2o9ICAfAWnp9uyyEB8CUU76ZXGeMY+
         fNyOJzNqMAawRUbImkbTI4VZrlzJZHHrnGZSCjbMAfB0GOwu4+khYb37OBIxwBPTEF2n
         uE4o1Fn9Ib6GdiaKozkNa+jaGiNfnsvmrp3Z+zNlc4JcHEURLr0fWrF3ndQgzz3lxYhS
         XPn1kR47nv169Wia2E2zfZvTk9zr3W8ZeLLBHCXKKr093UQRei405JlDP50Av85F5cXo
         2zgLmy9JuPsuvB+8lhD6MBHjwxxmwMLtevLevtUNSZVA16/4zkVA6gYpFi5C/Oa1boDr
         G9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137037; x=1693741837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=dsPbGLtzirgH3fI1S2Ktyrbnr6EfVubLFn8FpJ8tKgUVbgvi8JdNh3NqTgsfsZs0+k
         6Ce9d3+fqpISY+6+dMWo7KNUq197k87wbil8dOp8rQWrpUZgB8Lwc9OXV2582Ui3XgqN
         cv3cK/aB4FUzGP/ru/SWcnK6yLSVZpwynkc8jo3lIohhbB1Ptx/Z7CRhH23Uduv3w/W3
         s1QLg532XFuaOCCulrzaq6JkE0gAxJPMs5q6FtclEYnQqq6vuCZ9gMKFic+JgMqYSnk7
         FpZbTzoWK0MqOLeEy4shqrx6Be4F7BoQPnx05b6C98wqJb7oNXCN2B3e2BzLj/J4EqbX
         4U4Q==
X-Gm-Message-State: AOJu0YwYa34WqtUobeIJbDXjOPYv2a95Z+6o8IL5S6h+8y2DCtwjXfol
        TS5x47TaFB/0GXNIOA0ZIa2hgQ==
X-Google-Smtp-Source: AGHT+IGt2xgmWwOY0CUsVtOQyV9nxdtxLsPQavPhWLMXNuZlLE1bY4JF0pl4U12XqJVuGZD0wQUyqQ==
X-Received: by 2002:a05:6512:114d:b0:4f8:67f0:7253 with SMTP id m13-20020a056512114d00b004f867f07253mr22826824lfg.49.1693137037268;
        Sun, 27 Aug 2023 04:50:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:36 -0700 (PDT)
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
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 03/23] dt-bindings: clock: qcom,krait-cc: Krait core clock controller
Date:   Sun, 27 Aug 2023 14:50:13 +0300
Message-Id: <20230827115033.935089-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,krait-cc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,krait-cc.h

diff --git a/include/dt-bindings/clock/qcom,krait-cc.h b/include/dt-bindings/clock/qcom,krait-cc.h
new file mode 100644
index 000000000000..9d181873c414
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,krait-cc.h
@@ -0,0 +1,15 @@
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
+#endif
-- 
2.39.2

