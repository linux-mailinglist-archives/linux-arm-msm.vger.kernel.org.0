Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B42E075CBF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 17:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjGUPgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 11:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbjGUPge (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:34 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23231359D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so3422163e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953778; x=1690558578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MB9Hz9FYPbHP1/W1q13iV8rm76UZfJcQNXKd/dkkVV4=;
        b=PBwgqH5UsJ2Tir9LjymDjGIGJh7NpbtFg1oe6fWQPBpo4ZJvupNFBFkcblcl/aHcFM
         ixQyEd6V+58qPVE5KGsykpCF5VZt8y+3xqWmgMHjkmPs2s82pDvAv5zqhPbQRaanH/Mb
         ariCTuIiP+TxpBUXnblBxC7e1KsvlMZDhrMx8Eu9P0ZABovbk/xdj+sSFtWX3YNrSITP
         1WApMUG61hJUq4mw/uyBjRt9/eguw0gnI9FR02sb0Xw/L0C2virGAWHt6Z3PSf8sBYiR
         m8y12WO7g71kY0WGgVnPphyo6svrUgabEwdu8tQgHucW80P+LO2F5QUA3w4KI4f7fEKO
         h5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953778; x=1690558578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB9Hz9FYPbHP1/W1q13iV8rm76UZfJcQNXKd/dkkVV4=;
        b=jxe1lVMGQw5c3juuECxqAkNl1B1NCTg0LRnJGmIzsgnLuYTxyHOdsmpSZErygs8bxp
         sgzJTSwuhoq+KwaZrOyKOwKkBnIlbCC+L9h7hpHMu7wqt3FEfMdxxxvyl45NT0emuwEF
         9lI+M+dXi964NJ+XK9duLF2GBy+z/YDRZktX8mOXJSP3D+X7PyZqrERSQ8Mk4GRolCy3
         L75LQ3ocjgs7PPZfFTdaBpg9Ad/djSE6ql/LlRS4DkYOv0N1Lon6gInSX9QeHBm26uXY
         0RrQoZX/yvGSQiKjLob45womLMk44DmH23cRvB9PoR4kcpmJxzLRDH8diZH7U//cfht6
         ob1A==
X-Gm-Message-State: ABy/qLasE4DhVjddJxxDJB+LOuRV19hMT7xJenb6lgQs5X/qRYtEZI1B
        iPOHR1zSPUPTVjqgu2K0daV7ZA==
X-Google-Smtp-Source: APBJJlGKbxuPWdpk5M+a/pS8k19St1fgwVbyB6Xhgje82zzWPijAskOnKT0wuq37AcMCusb4fnhcEA==
X-Received: by 2002:a05:6512:318f:b0:4f8:64f5:f591 with SMTP id i15-20020a056512318f00b004f864f5f591mr1857858lfe.12.1689953778114;
        Fri, 21 Jul 2023 08:36:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:17 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:08 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: msm8939: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-5-cf6cd5c621d5@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=1626;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Qeg4jsP0LQ/xvq/rRMXQUJjcZLqeOYzSjY7Gfujapnc=;
 b=02lxiOlL+/xa6zGsUINMMoPp+4N7qV1gFmQPH61era91armyXFuLHVVIQGitrFPRQLNrQ/dy5
 UzE7nxTsWSQAJhLa8OpmKh5dgD4M5DNQtWgNTqIi7hbpdBjzO/YPWGL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index af6d644a5d38..a1fda6db0854 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -581,9 +581,6 @@ rpm_msg_ram: sram@60000 {
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8939-bimc";
 			reg = <0x00400000 0x62000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
@@ -627,25 +624,16 @@ restart@4ab000 {
 		pcnoc: interconnect@500000 {
 			compatible = "qcom,msm8939-pcnoc";
 			reg = <0x00500000 0x11000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
 		snoc: interconnect@580000 {
 			compatible = "qcom,msm8939-snoc";
 			reg = <0x00580000 0x14080>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 			#interconnect-cells = <1>;
 
 			snoc_mm: interconnect-snoc {
 				compatible = "qcom,msm8939-snoc-mm";
-				clock-names = "bus", "bus_a";
-				clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
-					 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
 				#interconnect-cells = <1>;
 			};
 		};

-- 
2.41.0

