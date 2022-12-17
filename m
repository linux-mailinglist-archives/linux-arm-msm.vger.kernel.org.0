Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1162664F639
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiLQAYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiLQAXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:19 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBA37E2AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 1so5899661lfz.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IakMGoNeAkiafUmQyTYpE4STAOzYx1wLgMpz/v+W8ao=;
        b=gtUM7rgOl3NWuHdHVJ+11cJsj01C6/8ZgNNQ/DlRMO8KZoTb3WAeN8TQW2gTc0l/QL
         6FRIJCuQBH1OEUCzXYkR52dMEAJyNxMfCm7Ao83or+QxGqPdMRu9ut5spBcRdOk8oDJ0
         aUi/dv3zc3z1QZqsv6L08kaf/9n2YSJfpzcP07/Lqhj1TdZe21sgCvnhu1IiF8dcgkUR
         UotVQdtVd0KtlNf1ColX1NRF2OdeGAGkmpjG5694VpQ4Xyy6MEk3qDfDIYZgNVX/mxeQ
         MItvvdh0ETgtdhzDuVvEFvJeR+KkLW7H6ZujyQ05B1ofw6XV/Jw0pPB+2NRT4l0rU9NQ
         urhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IakMGoNeAkiafUmQyTYpE4STAOzYx1wLgMpz/v+W8ao=;
        b=4Rfvj2LBVOUvlgYXGHEeb96FqPVVRR7Sif4uLtavyP8f0cemHDGbJi31rCCax2qkHc
         Q/9mvn2s8lXq8DhVMKU2nMimjFeA/s24LDLkl1ZauUXuFLKh2r3gZTyJFHOAXcYDk2Xc
         Tyz2KO4Ki1blaXVkWdKZS52FAOLHltshYdORlCwMBlGCmN37Kp0qGgoHwTrrSnUN2q3+
         T2jvjYPXBO16dR5rsuAvY0Jg1nWa5oKygJlVBymx20T/l2rdxu9JwIkY+iDDQNnAwfWP
         w0rlJyxMsW8cWmXXSCpe6aofk64gNsK1aRTsXdfKKSNPxXUL9Dw9PkdLabiwRkrLuVPo
         +e6Q==
X-Gm-Message-State: ANoB5pnzgQCqk0EpLiDNHCxZ/NoAbbh/86ZPnVdJo3Qn5SPI0NdhCITU
        Yt8KB/MyzR728qBMXsMDqZ3DPg==
X-Google-Smtp-Source: AA0mqf7x2WdR/+5Wh61oqWdZBmYm7BWZfGQtYvK7acmOqBpQ6tod/EDIbGs+3nxToPHONFh7ye+lkA==
X-Received: by 2002:a05:6512:7b:b0:4a9:9827:68e8 with SMTP id i27-20020a056512007b00b004a9982768e8mr7609075lfo.7.1671236263654;
        Fri, 16 Dec 2022 16:17:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:43 -0800 (PST)
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
Subject: [PATCH 15/15] arm64: dts: qcom: qcs404: add clocks to the gcc node
Date:   Sat, 17 Dec 2022 02:17:30 +0200
Message-Id: <20221217001730.540502-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
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

Populate the gcc node with the clocks and clock-names properties to
enable DT-based lookups for the parent clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b72542631337..ee337a3980fa 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -731,6 +731,19 @@ gcc: clock-controller@1800000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <&pcie_phy>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "hdmi_pll";
+
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
 		};
-- 
2.35.1

