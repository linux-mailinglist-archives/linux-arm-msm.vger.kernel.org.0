Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D39744ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjGBRnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjGBRmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:42:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7DFE59
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:42:53 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b5c231f842so54007241fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319771; x=1690911771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=JV3fVvgFb3SJLxnQIsHYp/Fy+tujVMse2cBjxtp8HzzO65G+1Pq0sq1JlMTFoNoRLt
         sLAsqHZqq1HWOwj1hoFFebch7xtCSVzkUNI+F+g0UmYWVGQPHcnJxssB4skI1b8sQZ6m
         TmWGj0qvoXCpQ7N0cg+4OFxttHEUKrGfhtSvvww9vp13hmLpZhDkRVBHjZTyson2KUDH
         PSHrQuyYthiLvdXdlKMPHIAkRZDqQ06nmg4v1dFGS4v80mbuoRCtm6dAXFsXcssncSPw
         Szj9xp6X49KvFKQoXvPEk6/qcMvR3RktmxvUYOK08qx1Uei2QqFLfJB87TYsgVzRTPZF
         RtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319771; x=1690911771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro+frU1rlZBxpMUoLWa0fuKb2nit2Il6DrrgMioSWzE=;
        b=UsmSqZzUh8cbo80rck+H3VbOFtXThEy/jpSME6G4I4pS3AIffVz+dH4QChGqXFctSD
         Kax5McGl6VEAFobbfrUOw/gksoAIDuNZ29U8dzaSq5QsxlomSiCpa9OIWHcioFOyU8cW
         zsn1He3IDcUVgl/iN38VAs4Z+ZeszHYyT2B+ZFiTVbhwP/q+Rm/ZUefndGWh/a1cmBGo
         /aUBX3W0rvPskUtRmocb0Ie61XTwoJ3vZPk5+A9Ycxm0kgbOK+IuZZLtM/w+nI2N0q6f
         9N7T3f0CL6mZoqB9kI/7cLZBqjzLn+RuDOOhwheRAtXTr6iPF3d75f9jZ4I3rnEVoMUr
         nicA==
X-Gm-Message-State: ABy/qLYsT0yrao9x1/zgpAoZFygXy9075yxdcBjP+nPYTaV6qd2GhTfJ
        GMt1Etgz3CUHjIp6cuGQvowZiw==
X-Google-Smtp-Source: APBJJlGTFvuJJ9r9y+g/OUGeFvITjap5CXUPpRSEXhi7z938e4QK2sSQWSoD41CdGoXNGm5byh9B0w==
X-Received: by 2002:a2e:7214:0:b0:2b6:97bf:18a9 with SMTP id n20-20020a2e7214000000b002b697bf18a9mr5040200ljc.37.1688319771784;
        Sun, 02 Jul 2023 10:42:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:51 -0700 (PDT)
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
Subject: [PATCH v3 04/28] dt-bindings: clock: qcom,krait-cc: Krait core clock controller
Date:   Sun,  2 Jul 2023 20:42:22 +0300
Message-Id: <20230702174246.121656-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
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

