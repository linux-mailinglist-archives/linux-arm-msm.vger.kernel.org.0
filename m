Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5116D4F15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 19:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjDCRgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 13:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjDCRgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 13:36:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91F726B7
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 10:36:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h11so32110613lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680543394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmqF5uM49YwjmXrtdFGNdflHs9PzMdLYC/ZaykFH++8=;
        b=aU9AScITIaFsobLTZ2tfGUL6k6GuH9JuuFNA+RcQL85ghH2jBtJ4xtoZu4nPoQHdg2
         Djv7uB3mfAG7cxxxCNR7wahtT6sg+zEe+viwPCWe9B1qP9Y4G1csaBrrusDa47ApgeX6
         cXkxBnSFfERdLKTzUoHLINh77ns0rwJqLVRYFNj5TvygSnkejx9BAWefo1i8k7hjQsQi
         IxjbJ/9wWnu6tBZhy3aScsgBqI856tDnt5Hhbw6XRZCtREBvxTP0/NMv8Lc2hD0Fk11K
         mZ3kIaGhjXc9bAXMiHCMFExkotb3ww9IkQrkiLKpT3NrVvrBK7Wi3/Lx8J5+Iixevt51
         6ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmqF5uM49YwjmXrtdFGNdflHs9PzMdLYC/ZaykFH++8=;
        b=xZKQWhobW052kXjODtjvfVygQ6z5wktfb1ZTuYZ0v4whRJ2gv8Ww0tTtmaQBR1FF2r
         Bo5pplGWCvqtMBR4M/IlTf2yfuCeUC4cnivOS5xXSS//PesyILUypW1fYlN7X0+LIWES
         EhU4hH8u8hFS7klrJsXOXOvH3sOVnK015MS5ARaXTPnAuA+a8p2ZZCWx8yKwdp9u9jiA
         bcYVYSbm1J4xgZuLxxE8C0Ulx7L1ZAFxgnZ/QbjRQvw+7tQmJhX6/lbAaPB5G7pb5nOS
         rENQWFkkZM2m3F2NvAC+lAVLwiS+2fq63K6o9NStjDbu+GVEFbc8QKLlHseLD6UsNv5B
         rNtQ==
X-Gm-Message-State: AAQBX9eb/giVTO8TKwXroHYQ6cVNilxdPwEeY8bYF8+TcTe1WKwut0qT
        NzimxQyiWvrzbsFkwVoTse5IKg==
X-Google-Smtp-Source: AKy350bfH/K5pOu6tXQpn01UYlLoaYTNlAmEezLfIRBp/DQQJhdWacmk4eiIUUTx7ngecZq3IhZ79g==
X-Received: by 2002:ac2:494e:0:b0:4eb:18d:91df with SMTP id o14-20020ac2494e000000b004eb018d91dfmr9182457lfi.27.1680543394449;
        Mon, 03 Apr 2023 10:36:34 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512096200b004cc5f44747dsm1871094lft.220.2023.04.03.10.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:36:34 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Apr 2023 19:36:04 +0200
Subject: [PATCH 6/9] arm64: dts: qcom: qcm2290: Add SMP2P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v1-6-ca849b62ba07@linaro.org>
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680543384; l=1704;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OGOuJIzvBxSjLJP6dlMoCklt4FuOEYlGVcFCNEeXnhc=;
 b=gcARjhXadoILMfjW+UfvpmFyip6l3NNYKNW/ChYwC5yC5/C2B6W1VjfBTaVwP9U8GySBnkRhpYSK
 GNnQMadvAZ/wJIe4ksmwJHGbHwZpGqatRmS41HoKQERgWZjzuHwV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SMP2P nodes on QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 1ea558bc35dc..228a1d94501b 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -287,6 +287,58 @@ rpmpd_opp_turbo_plus: opp8 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wlan_smp2p_in: wlan-wpss-to-ap {
+			qcom,entry-name = "wlan";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.40.0

