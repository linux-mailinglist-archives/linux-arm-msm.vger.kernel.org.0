Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E85674D14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjATGO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjATGOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:24 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315AE7CCFB
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:23 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id mg12so11416826ejc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyKSg+vfMAea6pVcrzgbbLwmsuRb3ANBIcu63Kru3pg=;
        b=LKCL8W0iSCEPNlqZ1btiRsXm+Nc5UtjEkQvbPJMPvF6ZHqMRe0Y28nB70dviyVfgf+
         V7NzNxwB+mLFYpQs+sqJQ2v3b5F9c9vHcxMYu+W/XMuJDBH6a0oomM6wJ+4RkMR6VCEl
         maJg/gjP1RiTs0OScP+bk/ES+xVPY1qEKSgRuHhrIg36GCzTlJrNeP6rwCe+BpW6o2cW
         U2M8FNuUvh/bUeyj7784x1+u0ti9Eh4hsi5cey2wXReoUukU9KZfsNZBLzFG51Yuz6wj
         4YqSxKjVGUdPlv5/QM/IG2A5tMDZtpFm8s3gfAbL4OkIFAM2ORhk76liIm8719WuDCx0
         WVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyKSg+vfMAea6pVcrzgbbLwmsuRb3ANBIcu63Kru3pg=;
        b=HDDWsj5LqlU3Zwlfb02KAbWAP8Dz8T985kp1U7uNbMFGrfVbK6wFzrH+RMWafM/nQj
         cQbUaD7vIVX0lA/Po/ULG0kSekqc8OHnbpHkqofrVhCP3+saeiKXm0PkTFpn5FTHsIPn
         RIVCBRGB3YlTujamVO8T/nLEs2VpxwoNfc/Rqt104i+h2WuHzwhoaSOEZ6JRlA8jPC9f
         XlfEtmbVy+wg7c2YmCHaT/VaZZE7JkD0W+zYDm5JcaRbtCo0VdjEYG5Oa/dJCg/bxCiH
         cwPdmPiDbNYycvyNZ6IEQvIBTu9Nf3bhvGUmf1aTBGcM0fU+BCfBdMMgaP5Xc5kHt+lC
         0jfQ==
X-Gm-Message-State: AFqh2kotYtMQwdUDQsB/FvaLQdwh+Dk2UZGW5TfMpc9/Oivm/OyK5SfJ
        yglSkeMTZeevmwg4py/2vbqPIw==
X-Google-Smtp-Source: AMrXdXsmNd4fM8CMqjyZBEOvA4sxRNxikVBF39PLx59db/MyCLTTKFZylK4lnPkWvgVfb7gdVEtVPg==
X-Received: by 2002:a17:906:a08:b0:877:6177:309c with SMTP id w8-20020a1709060a0800b008776177309cmr8084772ejf.31.1674195261720;
        Thu, 19 Jan 2023 22:14:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/8] dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
Date:   Fri, 20 Jan 2023 08:14:11 +0200
Message-Id: <20230120061417.2623751-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On msm8996 CBF interconnects power and performance CPU clusters. Add
corresponding interconnect defines to be used in device trees.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/interconnect/qcom,msm8996-cbf.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h

diff --git a/include/dt-bindings/interconnect/qcom,msm8996-cbf.h b/include/dt-bindings/interconnect/qcom,msm8996-cbf.h
new file mode 100644
index 000000000000..aac5e69f6bd5
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,msm8996-cbf.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_CBF_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_CBF_H
+
+#define MASTER_CBF_M4M		0
+#define SLAVE_CBF_M4M		1
+
+#endif
-- 
2.39.0

