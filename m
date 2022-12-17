Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146C564F610
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiLQAXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiLQAXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:03 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA2B66C3D
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:33 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y25so5868029lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw0n1LkFyR04NfrsZcxul+5/yjJGz7Sdv3Db/gbp0H8=;
        b=U50zxo8n/BD6fQ/v/hWIab/sQDbcMY1DAGIDGZmwtczhL7OKc7YbnT7F67SxtTszZk
         jEU0AxaYsZRcwJGFb/9pFqjE0LXA8LpkP0hDRoVHPgyJ0/VQ8YJIsVEl4htCQbkX5raG
         fCJnn+SWeTEJ51X2LhfvMcJBc2fb0HSDbq4Ouj5VfXSSVEB8so1CIUV110wJl7hbnNDl
         eoTCfwgP8EbJrM3cFeEsLCA6eFmaPo0/eR0mRnqdpj9r6svJuyxuXpBUy3N8FMFeENWf
         VOfU8PS2g+THHj+sgoZnuDKvGw71v0l9x89assRHTPGK8guczNvDsKyKUxDaiLYdMPMB
         e5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw0n1LkFyR04NfrsZcxul+5/yjJGz7Sdv3Db/gbp0H8=;
        b=RaXcBbHT9fRoc3q4Nh7RMum9FZc/Nu195xUHiX3A1S9a7Jj+WMSuD9dOFzCs4fVPQq
         +lB7LMCwMYdRq/Z5x6det8wuHlmk1MJuj5f82R/T0rpsAae/GWGi6dNu7pI9B87VPdR0
         eC/7uXZP9s7qAuiJ6dZBsyrTWyEqyZKusIh9LHVYaOhuEXYlh5rTmNXBmRC2uiKE5Q7D
         hDg3FOuNDvGNLlw2AueJt9kl5gdp93C9kVXE65XCSM+Tu3G4fG7gwLjpGo4uE1QpFtNy
         VLs3abU1dmlx0u0Nc9sHBk7hJ2Fj1nyFqjTase9o/qcrhmHHMGildkh+oicxMJivHj1o
         bUrQ==
X-Gm-Message-State: ANoB5pkCFH8fldYxBGBZJGCzD/T6jfCIde0S6mr3nhOgtPqr+44Jdycq
        BBQ0TVNyUyjB+hOPcRsmyFB6CA==
X-Google-Smtp-Source: AA0mqf49NRUCkB+rHihLGWKrvFeZlWFy4qTa00HW+o604lrVwXriqc9YxMeQtPG9YgYunx4dm8VvQw==
X-Received: by 2002:a05:6512:3992:b0:4a4:68b7:dec3 with SMTP id j18-20020a056512399200b004a468b7dec3mr12330945lfu.31.1671236252091;
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:31 -0800 (PST)
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
Subject: [PATCH 01/15] dt-bindings: clock: qcom: gcc-qcs404: add two GDSC entries
Date:   Sat, 17 Dec 2022 02:17:16 +0200
Message-Id: <20221217001730.540502-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
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

On QCS404 platform the Global Clock Controller supports two GDSCs: MDSS
(display) and OXILI (GPU). Add corresponding indices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index bc3051543347..126a51898571 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -177,4 +177,8 @@
 #define GCC_PCIE_0_PIPE_ARES				21
 #define GCC_WDSP_RESTART				22
 
+/* Indexes for GDSCs */
+#define MDSS_GDSC				0
+#define OXILI_GDSC				1
+
 #endif
-- 
2.35.1

