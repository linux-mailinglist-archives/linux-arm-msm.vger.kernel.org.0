Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E735F6585F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbiL1Swv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiL1Swr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:47 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1154415F1C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:46 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id g14so17270088ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhFDc1hg+Eb9tEQftxzX0BdtZxOOhzNp27cW9co6hFs=;
        b=nSJDr/NpSXdbqjRrnAl3kAaM39YIdBbqoty8jnR10wztBSHfiIgTPrl0KtW6jOGGFc
         l7cnggSn94PT5+Z86poBh8W7P+c/7R4TMR7anjO44SvZXfkxKjNPGsrcXDr/ULfa6ss1
         ieGyeTSguQ/C0TZxB875nRrUOcGUpTuU08DGST2xfcbaGhWhAhoaG/JPAmoZ5Bzz1UTc
         3DHpUzzY8Ghs2i7NfIhZlQvnYj9OK8Sm7php/FRbXjdjZ2ZSUGcO8/7eLfFayERDDu5f
         uI3SY91N/YNSTHxy4MTcLVqqvwHIUVrM5JP3T1wTMbEu8mo+syo5uNai6PmnFJPRA3MT
         qx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhFDc1hg+Eb9tEQftxzX0BdtZxOOhzNp27cW9co6hFs=;
        b=sdho5JjnSt8TTbPaY33MDRyK7bl+yO3V3Ogz74yn8kANfMkwCsGsi4NlrFmvFskE3B
         ZTwJnOFYljTxN/+8J2YOkplGRq1Zc2MNjFc+N7HincGiNjFnNkQ9XjjtSKk+uiEnLsDq
         v7bTXfeyWftXB1qpanHc31+HunXjkIc2hLZ8DbXO2Hh444u4eyuL0vXLWyIXSHsxyOom
         qoVAacsEqz9ccYNaRN13xz3wkdAme3I5tBac2swH/rB8GuKCy+i9bOgti4NEtW4tne+l
         GSPP+jh2I46YvjXwNjTLO3SLBaP39aCDeZ/fJwnX0bfjjPrKyOLxqNpjKMS88Whd6X3/
         q9iQ==
X-Gm-Message-State: AFqh2kp8Yliya9x4lEmzMT/mJhXvK7h3KcijGtxYZzurBCQldwPiHRh7
        kuHZG9+yLsrqAEMN4gBb8igOQg==
X-Google-Smtp-Source: AMrXdXviI+DWKchELH2hrpNTVuKm/QYC+AEQVMeD0/y87/nJHKWZ8P4FBiCrpCFjDyVGq0Vbf3Ah1w==
X-Received: by 2002:a2e:9052:0:b0:27f:9493:76ab with SMTP id n18-20020a2e9052000000b0027f949376abmr7134543ljg.7.1672253565638;
        Wed, 28 Dec 2022 10:52:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:43 -0800 (PST)
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
Subject: [PATCH v2 06/16] dt-bindings: clock: qcom: gcc-sm8350: drop test clock
Date:   Wed, 28 Dec 2022 20:52:27 +0200
Message-Id: <20221228185237.3111988-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8350.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
index f6be3da5f781..529c1b8b0417 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8350.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PIPE_CLK						2
 #define UFS_CARD_RX_SYMBOL_0_CLK				3
-- 
2.39.0

