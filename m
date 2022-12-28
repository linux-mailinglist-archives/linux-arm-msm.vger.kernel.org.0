Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E09C6576FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbiL1Nc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbiL1Ncu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4769AF5BF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f34so23610464lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3e3d1DCcRQnKd+nn4f8JuEfsAGMFbH2M5RoMT3JeAo=;
        b=ZtOyMclXTB2Ioh/RPPqF2/oaOjHtPFGuinve6zzny+sxdiajNzjm3jE94o5jER3Mnw
         ziVkZm21UmiGW1rXvcWtbmGEOajoGR1xtVAeFhAQkkRUoE8wI7tawUndevdJ9Q2HsH52
         kDVboyMwAfynmKisKWCcWa1ApAxkiECgAsSZ+/a/YQdINX9LkZIeFSUdAhJdKci6TDz3
         bZ+UYRGzmZEr7Yy6ZvV4U2u9cFIuifzcKxSdPfiJgnkoJ4TnIed76MjSqK21Skxibr8A
         TWLnhNlhCSBQQE7PRLyiASMcV8TfX9ipIn42N2rkqUFRzoKPG0IH0fy7LXjCY6qGwN4G
         LUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3e3d1DCcRQnKd+nn4f8JuEfsAGMFbH2M5RoMT3JeAo=;
        b=tyIbOkfnwEQwotvBvvChyWfuEneZAgOr99UeD8STgEO562+PgqdKGJj4uzBYONgjap
         SGkgG3/AF9k5kssr41glFHXHrBiCfNhQjiXUci90OZ1SrHOxNwqzPFsPRfeABatUKCCY
         5oy2QtxQiSPekf20rLazDC8WErQSWW4EKZagIbwcunVRVZtc2q7YFQQg7hgpvYIUYSSU
         oauBENSNYu2EZ65hgHpVj73hUZ+EaPYGxx+7SgpYIZbc95qU5vGUK6Jo7Vxl4fLtZCWZ
         wyZuOPuRHnyeiJFFtjpxZmImazo1OAB/taK0RZ04mNejOK/lB4Drhbir5ld4Atob+W0y
         7agA==
X-Gm-Message-State: AFqh2kobO1NTmDQXyZaPsrV92vFfRMOWzFnB63WGQYbasjWZvZ31arOY
        s16/0lSaoosWrB72mEkOu0Rz6g==
X-Google-Smtp-Source: AMrXdXtmHM44WzFjW4zbA4RCiVlM0bKwE1wxjj+zjBoRd00CFfvFFgFj8e4Jfet7baYUU93JTtZxaQ==
X-Received: by 2002:ac2:5f02:0:b0:4cb:14e:e5b5 with SMTP id 2-20020ac25f02000000b004cb014ee5b5mr3478262lfq.65.1672234367588;
        Wed, 28 Dec 2022 05:32:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:47 -0800 (PST)
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
Subject: [PATCH 03/16] dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 15:32:30 +0200
Message-Id: <20221228133243.3052132-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml         | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index ba62baab916c..523e18d7f150 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -26,8 +26,6 @@ properties:
       - description: Sleep clock source
       - description: PCIE Pipe clock source
       - description: USB3 phy wrapper pipe clock source
-      - description: PLL test clock source (Optional clock)
-    minItems: 5
 
   clock-names:
     items:
@@ -36,8 +34,6 @@ properties:
       - const: sleep_clk
       - const: pcie_pipe_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
-      - const: core_bi_pll_test_se # Optional clock
-    minItems: 5
 
 required:
   - compatible
@@ -56,9 +52,9 @@ examples:
       compatible = "qcom,gcc-sdx65";
       reg = <0x100000 0x1f7400>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>, <&pll_test_clk>;
+               <&pcie_pipe_clk>, <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
-                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk", "core_bi_pll_test_se";
+                    "pcie_pipe_clk", "usb3_phy_wrapper_gcc_usb30_pipe_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.35.1

