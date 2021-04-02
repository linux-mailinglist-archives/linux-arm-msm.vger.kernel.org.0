Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77893531A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 01:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhDBXjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 19:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbhDBXjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 19:39:52 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1365C061793
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 16:39:49 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s17so6970110ljc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXyC+Ex2hhHEAnZmoCpz05Kya4MLUb/eMrgyTrPfEno=;
        b=zQ9lEASWvryBJyOy3CWl9yPjiZK+55+0hlnfWQTr9GMXpTGAWhpfrn2bueLeuL1UBL
         iOgaicjC9tqzfgbM+QbFgl1y9NI4Sr3Rqv5hyF4k2V0ng7UZwhBbRx+rMgIjSSzEUzqZ
         8v15JaVfM6lRB1+NOzOINQMWG5x8TVUQrM9WAL32dK2CS97WeWpH1hUFaB0gKO4GtVpR
         /CXWVtAC0UIq0ZAeMJ1yTrCgi4XGVFpjjkL+UCf8M4l4+Q8bCW4jqVq82uEdiH7qyUXO
         +V0sxrVNxVu4PXxUpObNlbZrxrf385LEfRTUiTDtmMnY5Dfk7sXcR/fCrvuabVhxsFRG
         q4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXyC+Ex2hhHEAnZmoCpz05Kya4MLUb/eMrgyTrPfEno=;
        b=KlJt26M7wJ0Liw0OZEJYI9hcD5VxRXXDfgJSLwQPo5pa+6XOdshQ2cLLAcpTRz9DgQ
         xnVPGwNxnsuAiLHpquCEqJwk7YjRPhWMjpbPXHFA89dpY1VAj9aTnLFUi3qGpX+8rnDE
         G2KrbFc1+wzsvVaGoqrIkC/gNOwZbuO3gSw7V5G26Xop9Tak7dr0PMee30+KAidLcGd9
         kQUF3+jlvb9FfkW71CG5AUhx8DDnd2+YxYE6mFjKj/eS/xAd5Yi/owqmnkQQEuSg1487
         oB0nfCP/8kTBwQzUTglT2Do7fFkKDVtzdS3pUDxXQ6EJBGN7l00Yq69z/ZeNiWHA1dxs
         wVUQ==
X-Gm-Message-State: AOAM531J23fSBetyU3dAk7ciJvi4kOOTh1kAxtdNXwO4t1HPSsNa3KmI
        d2Rb7Z9134wAItAYUpTvv1lx3w==
X-Google-Smtp-Source: ABdhPJwG6viz6cBRcTIqj6vJzfWXTELf5FbT4tN+KOwGOZxQenGK/4t1rdLCZpndQftx6ij3AUpQLw==
X-Received: by 2002:a2e:b544:: with SMTP id a4mr9678649ljn.504.1617406788385;
        Fri, 02 Apr 2021 16:39:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w30sm1013134lfq.210.2021.04.02.16.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 16:39:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 4/4] arm64: dts: qcom: sdm845: add required clocks on the gcc
Date:   Sat,  3 Apr 2021 02:39:44 +0300
Message-Id: <20210402233944.273275-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
References: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify input clocks to the SDM845's Global Clock Controller as required
by the bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..86f717d5bfb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1061,6 +1061,16 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sdm845";
 			reg = <0 0x00100000 0 0x1f0000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <&pcie0_lane>,
+				 <&pcie1_lane>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk",
+				      "pcie_1_pipe_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2062,6 +2072,7 @@ pcie0_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_0_pipe_clk";
 			};
@@ -2170,6 +2181,7 @@ pcie1_lane: lanes@1c06200 {
 				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
 				clock-names = "pipe0";
 
+				#clock-cells = <0>;
 				#phy-cells = <0>;
 				clock-output-names = "pcie_1_pipe_clk";
 			};
-- 
2.30.2

