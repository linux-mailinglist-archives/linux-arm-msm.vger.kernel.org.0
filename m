Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4581E6585F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbiL1Swt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbiL1Swp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:45 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F1E15FD1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id x37so10406879ljq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p38bywVFtTrj3kqH2Lz2Ph0NglRYNc7cYdrBsK3q/3U=;
        b=AmcNx/D90sbymus73k585cXbjg5zInvXk9Wc8fLQwnHCIlmfW5ZVS3WhPBA1awSyZT
         n3dYN3oD6H1IMTj18yip7RRUjsDXMkfT7d0obLPMjI/aFEQ2DVJqWpxcuNXhxGtHxotK
         k2bQbpk4WTAJrZL6rHdt/JahkP+8/LRZg9cpavXafkcAyNV3fGG8q1NSmm23C45AjaDU
         j0XfOtwDpEb8+IWK/c9Bz9IVq7BW0NZxKa4APYEciVUlAUoyGk/PDygvRNndhTDUuiC2
         UOaldFqqxXNdndl44Z+bg6W1Q7mAcaEiOQMc/FtNy2KvK2a72IaNN1cG5uejNgM7FqqP
         MSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p38bywVFtTrj3kqH2Lz2Ph0NglRYNc7cYdrBsK3q/3U=;
        b=wZAkxoN4ILcdV13EPQCq+aalQYoguA1qvpWup2tJQRdVya70xnxnje6hnF38p+tuJJ
         CJouka1wWOQmoNhgLDAtniFgDt+v+BrFrjwGHOJFQxHwPdXDdbodipYmGCt9NCwEk+Tb
         XSEJk9Tup030mpL0MVDI7sTtUCj8X5PPckAduV0Wg/U4vMIkIP9DcgA3BATcvU0pvpOT
         CDKBEoXVozOiEeUk7GtoeUUh04DwhzZgBW/WVHLR83lGWGVs4Y5WQYQByA7HFS2e+EOQ
         BE4Y/4vTK8CgC4y3gW9Wh7PMcHDbkCYiwFClnGUGVU2tGP0hQC7PScyN+sPxxY0qp/+Q
         pPCQ==
X-Gm-Message-State: AFqh2kreYzuFhMrmAeOYFMEUljyBfgRIz4JdNuFEShYCw0vFiLBfkf+i
        ynYW88zr1vpInsJbO/9+XUK+Fw==
X-Google-Smtp-Source: AMrXdXtDF2TSK0lgQn6QSehRiJI0j28OxjVQDQkXR26yi2t9NjxQGDr2os+Z5QuD/0aupXENa1lnuQ==
X-Received: by 2002:a2e:908b:0:b0:27f:b8ba:176f with SMTP id l11-20020a2e908b000000b0027fb8ba176fmr4099442ljg.46.1672253562454;
        Wed, 28 Dec 2022 10:52:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:41 -0800 (PST)
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
Subject: [PATCH v2 04/16] dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:25 +0200
Message-Id: <20221228185237.3111988-5-dmitry.baryshkov@linaro.org>
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
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 703d9e075247..b4fdde71ef18 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -23,7 +23,6 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
       - description: PCIE 0 Pipe clock source (Optional clock)
       - description: PCIE 1 Pipe clock source (Optional clock)
       - description: UFS card Rx symbol 0 clock source (Optional clock)
@@ -40,7 +39,6 @@ properties:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
       - const: pcie_0_pipe_clk # Optional clock
       - const: pcie_1_pipe_clk # Optional clock
       - const: ufs_card_rx_symbol_0_clk # Optional clock
-- 
2.39.0

