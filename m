Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E64264F631
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbiLQAYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiLQAXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:16 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809CB7E297
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:42 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so5927124lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4AidH89fDpMmt6amLOtMiqausw19uEwRJmaxMyMhmE=;
        b=mvu+zcFLAf58M4jAxZ4udj7LLuscOB0CGdZ9pnf9THwitGd3A6WpFJqlaHcZoAJ4C3
         d0BHEov/lFbUST22RE9eJPDpp1g48jpR+STO9gwkEs0v6yPnzGTGpp+rb9QehomtTd/1
         AhQyWGUaoA9kGX7GOBioyC9ak1IV34i+x4Fv5CWsgzEXyburjLG2H1/AQnuJBQ/6E6zI
         ImeHDRGIY3Hh2AVE8vafDPkf92sIHfKII4W3dPRuCqDSHJrsASVGuC9gyw9/IMsu06LB
         tyGAC4B9Sm53yl3btc4wizgr5L2DTFH8Tqh3910+ozR+LHKTXKwIA0f7F22bPhllwSeI
         QDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4AidH89fDpMmt6amLOtMiqausw19uEwRJmaxMyMhmE=;
        b=1KO6U6EugaB0Zocmy+6D/NZlw0EwS2JjuieR0H9BCeFcHgdndvRPXselA8Po8Y8Jie
         qPUpVIOYl80gJxgyFTNX2MnZVGYOeegy4aIzCwFsNTB+INtH1pvwKVkVoc/I1/Mph0OX
         6YRC1gV1ZcfQQ4PgxpNf4GdVj4kJNnifVdA1Q8MFoJjhawwdOjssW6Ev2uKMRaCHcRS5
         dEGotmnFnw3Q6TdBPykyTC19tvpRsmkKHFP5H124PDRTIAzfUbB2IV24xrrA2Jhi7Rah
         XMhD6aD6NHHcYADFj15Z/4SMyW0juIEFaNyjnXmXobYhoBPZiw20bQwYJveNlx/6Fd/V
         RwWg==
X-Gm-Message-State: ANoB5pl6DChHVMhbcv82hblCLERzcXlcyT8q+lUCqtIp09vzYeewcCUt
        wzO4yGaE6iPJ3QDE8mTnyQ88sw==
X-Google-Smtp-Source: AA0mqf7EboJmYvwsEFdy2YkliyzGZdHk1/a6i6rKNTBx99M1bmqrk/TOuENbGUuAQodZq8RRIt2FmA==
X-Received: by 2002:a05:6512:3990:b0:4b6:d28a:2558 with SMTP id j16-20020a056512399000b004b6d28a2558mr15344090lfu.49.1671236262055;
        Fri, 16 Dec 2022 16:17:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:41 -0800 (PST)
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
Subject: [PATCH 13/15] arm64: dts: qcom: qcs404: use symbol names for PCIe resets
Date:   Sat, 17 Dec 2022 02:17:28 +0200
Message-Id: <20221217001730.540502-14-dmitry.baryshkov@linaro.org>
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

The commit e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets") added names
for PCIe resets, but it did not change the existing qcs404.dtsi to use
these names. Do it now and use symbol names to make it easier to check
and modify the dtsi in future.

Fixes: e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffffaa7507cf..ffc4b081bb62 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -806,7 +806,7 @@ pcie_phy: phy@7786000 {
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
-				 <&gcc 21>;
+				 <&gcc GCC_PCIE_0_PIPE_ARES>;
 			reset-names = "phy", "pipe";
 
 			clock-output-names = "pcie_0_pipe_clk";
@@ -1337,12 +1337,12 @@ pcie: pci@10000000 {
 				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
 			clock-names = "iface", "aux", "master_bus", "slave_bus";
 
-			resets = <&gcc 18>,
-				 <&gcc 17>,
-				 <&gcc 15>,
-				 <&gcc 19>,
+			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
 				 <&gcc GCC_PCIE_0_BCR>,
-				 <&gcc 16>;
+				 <&gcc GCC_PCIE_0_AHB_ARES>;
 			reset-names = "axi_m",
 				      "axi_s",
 				      "axi_m_sticky",
-- 
2.35.1

