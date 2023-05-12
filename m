Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2166FFDB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239615AbjELANk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239577AbjELANj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:13:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D4659D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:13:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f1411e8111so10411649e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683850415; x=1686442415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77FNe5lQGnz3ackqRetecIFKihn6GBCFcTJ0ar2GS+4=;
        b=zEUT9jG5d7seEagfSLiy/3UqXVWEeEve3jyoHqI/VaJH4Rv0U2v+LjbgwfW6w8PaEj
         feyHGilSY6GZCtR27hbxka1BuLw9nwYNCIo2+D24Nj7TiQODkt9Hyfu9ufNLz26uGByF
         0J8UJU/HgTUcSVcq49EHPSdj0C2ZzyreM44xwNCYJ9gfhir4GOrSTzn0818BzG82OgDU
         dJAXrgn76FuM+UAKsUPMiBLNjuXTy9ztIO9sHWCbSn0W4K1I4rp6x8kQDC8liyYHTpUU
         RNgAoR+gxCVZpp5kN+E4Pjpay3C4CT2Hltl7oGZed6GrqJtXKKiHq2f/SBVzbpmbymoL
         lMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683850415; x=1686442415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77FNe5lQGnz3ackqRetecIFKihn6GBCFcTJ0ar2GS+4=;
        b=M2bjxgx9GTj61PV5nygfONC6Nbmnw3sOhmoKD9/QLhCkVzfI0qANUO5lB9NUmkYJa3
         f8R4NOLsWwXWpAxHN/ATdVrXYgwVBN28fySPZM+jqMolZJZFeuf+s0fv2eAGbm+YNtyF
         qE2DlnO4tALqjbUSY+PPdy7Ga+9yq9dzOXcKQ1SXS0GFMtYGvTsp3bJ7Yn84VImd4TN9
         S3ST2EQo8XCow0wFO5Pv1p112RA43vgApfgAvDARqeNRM7OdS53/b8N4agzBCNjxuJ6o
         IDHr3oCmpvnr/acuAJAWNh5C5MiqjPNyiNPAPnvd5pbmmWsaAdp8MjrMAJ7xSselyfNC
         LISw==
X-Gm-Message-State: AC+VfDzeejA2z2Elq93VFbN1MOuzWhKPTM8a9quc6QhKrV3rfsWr0ACy
        IWaRhq8yRC6vn5843PqiIphR4Q==
X-Google-Smtp-Source: ACHHUZ5PTNRH/ouTDdRRDXyT4W9o+vmmsr5sD6A01Jsj954ADNzRkhliyAiKVyaIG5X+KYQPegzT1g==
X-Received: by 2002:a05:6512:78:b0:4eb:3bb5:81c5 with SMTP id i24-20020a056512007800b004eb3bb581c5mr2961110lfo.15.1683850415679;
        Thu, 11 May 2023 17:13:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p15-20020ac246cf000000b004f13c3cb9ffsm1258109lfo.200.2023.05.11.17.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:13:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/4] dt-bindings: interconnect/msm8996-cbf: add defines to be used by CBF
Date:   Fri, 12 May 2023 03:13:31 +0300
Message-Id: <20230512001334.2983048-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512001334.2983048-1-dmitry.baryshkov@linaro.org>
References: <20230512001334.2983048-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On msm8996 CBF interconnects power and performance CPU clusters. Add
corresponding interconnect defines to be used in device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
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
2.39.2

