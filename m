Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777D74EF75A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 18:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244518AbiDAP4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 11:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344057AbiDAPRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 11:17:11 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FC25AA60
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 07:58:30 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so3665594wmb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8iJL2q3As3zzwdz8529fEEZQXinzEbA6iVffO5JCw4=;
        b=gAw9uKXxBpP0+l/FsExGrFZKGlfbBOnEzDF2KtQgPGeonCt5ot3PcKIvm+oUPMtT8n
         y5ZqXPaqAarqpi8xfYYLJvu5tzPW9wT70R3am9D7xFITmMFwt4vsYIVqX/n8dhCnsH85
         Ai6a5VeuNV4ZTtZBlcot20j4htC0DD/R4/mPB19BrA5i1HyplNnU9mSSOc0QsDhZ44x4
         aZfaQ07vN4E/mgE4B1qqbokUKXCPJpaI0z7l5Y7d4Z9vF2GgZScHNyfiIVXhDS4W1IOu
         mowELakVMDfvVYVilPSjq6nwCjV6Zv1fbAqINaNJAy8z4f/Gw2HMoMgFBEYqlSiY/QWc
         Go5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8iJL2q3As3zzwdz8529fEEZQXinzEbA6iVffO5JCw4=;
        b=FFfVFRoiezEhErvwbghAe8faYnmChp8IM9r9z/Ey+0PXjka+mxhkkYfXt0itudQjXc
         PhauZa11sgQ+ZqFDMNI/MlUzSvTtlaG7W3kcX5ohXsoHNYYNgc2JrQve3vAEl1y0l8dJ
         odRtZNzJ1a1hKSNCOAcyziwgNiwEl/nLtEX8CF8EPhCaRODLiSLM0rNKpu3yLcGQA10s
         IVD9buXqiVdpiCB4/nPOJ421Cf0q3/LpWoZChxOzo8vwBOWSA2J0iUxfNIx6gmP1lfDC
         JX6cHCZYudhYoVyIsu3naC/0zRl8qSUojrF608FhNJiwzWi3QTApYAEWnZBj7Dlb1TFj
         5Dpg==
X-Gm-Message-State: AOAM533c83SRFFgoKTZbUv7x9BquUa20/3sjkaDptVp9dCEj5yCrNPXY
        ZtvVqM6Yh+VsmUVrW+HV/lmnHw==
X-Google-Smtp-Source: ABdhPJzRdJIaIzMFeeJvk97VMkntf14Z4PyRXAxrDx3BRlFhHFG2iJWpnqp97DFOyl9gYTo2sakUJA==
X-Received: by 2002:a1c:7308:0:b0:38c:7b63:e385 with SMTP id d8-20020a1c7308000000b0038c7b63e385mr9094276wmb.116.1648825108956;
        Fri, 01 Apr 2022 07:58:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c404800b0038cc9c7670bsm8530722wmm.3.2022.04.01.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:58:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 3/4] arm64: dts: qcom: sdm845: control RPMHPD performance states with UFS
Date:   Fri,  1 Apr 2022 16:58:19 +0200
Message-Id: <20220401145820.1003826-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
References: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UFS, when scaling gears, should choose appropriate performance state of
RPMHPD power domain controller.  Since UFS belongs to UFS_PHY_GDSC power
domain, add necessary parent power domain to GCC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b31bf62e8680..c999b41c2605 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1078,6 +1078,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM845_CX>;
 		};
 
 		qfprom@784000 {
@@ -2336,8 +2337,22 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<0 300000000>;
-
+			operating-points-v2 = <&ufs_opp_table>;
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ufs_mem_phy: phy@1d87000 {
-- 
2.32.0

