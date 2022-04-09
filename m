Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEDD4FA9B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 18:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiDIQsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 12:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242736AbiDIQsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 12:48:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF694A206C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 09:46:00 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m30so17196316wrb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9cK41P1pkMRpsEDL1aLO7EK26z+iSv/jU9GggKykUGg=;
        b=yOmchb7PttxV2H2q3XC31q07cHDupYrkV22dkUhCy/Pz0puTdjUrPc4fQEX3dPNNbL
         pq86/X86B4tSz6rK3OQvJ9uFBfTwu+9gjQKfzY5L4JuBcVUm0BUHimuXIawWhb8fjnbM
         zm21bs40dMNZCslL4m/Exoe0d9355J5T0ywQHMn/jGdnCOtbIkIjQ1u5rhQIIDIRM1MQ
         /X9CDiHylhR6QIMyUSul3jTkxZTZA+NxdgeSYVVCFgHFiSku7SsX/tmKAVpGYM7mx/Cz
         D4GgDI2xMnK6+qcbMq7LdQf54QZIk/SJDQBR3mbwAAEP+5JwNmZNs1EAytpKChnmUdP8
         V2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9cK41P1pkMRpsEDL1aLO7EK26z+iSv/jU9GggKykUGg=;
        b=5fM0l/QTWHXN6PF2Tb/gVYQuTEXGsihSZs8KvKsjzqmfOzwl3PplOPC+TsGl/XSD9H
         eoHgAMzsaq5u7jZtQU6vUIlCTQRJJNTcyUx+5le0Szo5wIJ0wS/ErWX/xrlZto0ZzrYi
         B3NBBT4MfognrfLPHQx5/YqoJ31ib7hQqbwxNFfQX6qBCzlpiCjPWTJffycjnsCpGudH
         n1IuCX0GcpLlz4scaZbhus6imUPKGYY1iVPGAfVCe/jMNvVQmCdWiUvCblCcjxpu9huW
         S8o5Ujy1bLSwrwYKI0iN/hPmbN/FoSIxqqmuyITClJ+8rmtKf5HZl/QXIpx+6IZ5qxgB
         21Vg==
X-Gm-Message-State: AOAM530PWjMA0QNhyWh73JsdKmYeiKPdUSn6uZoBe/2md/1fnuYHOfnx
        z8Z0h0HMvx2Fdvb/tWWWpQ/vng==
X-Google-Smtp-Source: ABdhPJxhPQg8wfKgIFOWKDdl1ykmA3KZD2eQmQBGHRoXWfRxUQBQ7GzMCXkcR9OfTBNCpS538cTYRg==
X-Received: by 2002:adf:f092:0:b0:207:994b:a5b6 with SMTP id n18-20020adff092000000b00207994ba5b6mr6139399wro.220.1649522759602;
        Sat, 09 Apr 2022 09:45:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j3-20020adfd203000000b0020616cddfd5sm13901357wrh.7.2022.04.09.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:45:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 1/4] arm64: dts: qcom: sm8250: Add camcc DT node
Date:   Sat,  9 Apr 2022 17:45:53 +0100
Message-Id: <20220409164556.2832782-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the camcc DT node for the Camera Clock Controller on sm8250.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index af8f22636436..906bc8ed25b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+#include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3149,6 +3150,20 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm8250-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
+			power-domains = <&rpmhpd SM8250_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.35.1

