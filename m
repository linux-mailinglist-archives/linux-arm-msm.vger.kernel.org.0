Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977C56F396B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjEAUw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjEAUw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC5426A1
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682974297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZySyzkpa+LDQ1V/Mnqnm2QktfICKKdof2ETQCboTeH4=;
        b=WiLr3i41qK8MMjbYtYNffg4z3qKw/Bt6cgR0+1IaN5x1k5J6+EIQXya9xzAXRFTnB8DJss
        iznlXzd4qAKioQdo17RfZOSUZHTiIJpzPQQlUkQAcGHB2Q95nKXsSyRbvIrH7BqzZ7FouP
        6Q3gItWAXzz+M1buUQUB1HhH9XfUFws=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-fNhS1yc8OHqnTG29mdnYhw-1; Mon, 01 May 2023 16:51:35 -0400
X-MC-Unique: fNhS1yc8OHqnTG29mdnYhw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6a6562beeafso2855086a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974294; x=1685566294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZySyzkpa+LDQ1V/Mnqnm2QktfICKKdof2ETQCboTeH4=;
        b=HHUJHRdXogcT44redPYjh8qnT0zPa1dNkFYnH6Q5pvx+xTmdSm4TMiFQedDO5A6ajL
         KPJSvfWg/A/kVWIPiekPcqrl18gBj2Js48/Zr2Z+qP5gd401ymB64MLASMCqOkbgtjh+
         Bd9Ap2TlgjTYebo9WA6JM+LX4C9eo5VMCmqjV36cIN/4en7dYQLJLgpI6X3sUXmz/xG6
         yyaQVJLxYU/jbM8Sh/11Uw3FKQ5/5wxZbn5OTpMalHsjiNWA24dWrUqfU3TyrK7l4KiF
         5gSSxhdDFiuKmi4AAr0PU2CFGsQuEr60CF6HbvC+0EqOCj4h4rwgESn8tDXYKSzVJJjz
         1aKA==
X-Gm-Message-State: AC+VfDz53zSu6TLVui4Xh/ytQ9Cyeh97En1sAB0vb6v9GE9i4lq+gsUb
        CVZWIinmz4TXrRdvSoelBeVKHYNXyPBM0iUMiftsxHNZLcqZP/ADGv4W2Bl2Fs8UnnQ8eH9kb6C
        PNaxxA8evDFwNJK3fmagbngJv9Q==
X-Received: by 2002:a05:6830:10d2:b0:6a9:3a68:5f00 with SMTP id z18-20020a05683010d200b006a93a685f00mr3851525oto.23.1682974294488;
        Mon, 01 May 2023 13:51:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7p2EuYnCd+mPMDSdWbdhp05745yHsbwmyQNDzvbQkpx1JL0fx0/+NPbWuItPTDuk8cZzQdcA==
X-Received: by 2002:a05:6830:10d2:b0:6a9:3a68:5f00 with SMTP id z18-20020a05683010d200b006a93a685f00mr3851522oto.23.1682974294289;
        Mon, 01 May 2023 13:51:34 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id c10-20020a9d67ca000000b0069f153bb37asm12110130otn.62.2023.05.01.13.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:51:33 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
Subject: [PATCH v6 1/2] arm64: dts: qcom: sc8280xp: Add ethernet nodes
Date:   Mon,  1 May 2023 15:51:04 -0500
Message-Id: <20230501205105.2518373-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501205105.2518373-1-ahalaney@redhat.com>
References: <20230501205105.2518373-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This platform has 2 MACs integrated in it, go ahead and describe them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v5:
    * None

Changes since v4:
    * Be consistent in newlines (Brian)
    * Add Tested-by (Brian)

Changes since v3:
    * Order soc node via unit address (Konrad)
    * Add Reviewed-by (Konrad)

Changes since v2:
    * Fix spacing (Konrad)

Changes since v1:
    * None

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 8fa9fbfe5d00..a2320f880795 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -768,6 +768,36 @@ soc: soc@0 {
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
 
+		ethernet0: ethernet@20000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			iommus = <&apps_smmu 0x4c0 0xf>;
+			power-domains = <&gcc EMAC_0_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc8280xp";
 			reg = <0x0 0x00100000 0x0 0x1f0000>;
@@ -4706,6 +4736,36 @@ dispcc1: clock-controller@22100000 {
 
 			status = "disabled";
 		};
+
+		ethernet1: ethernet@23000000 {
+			compatible = "qcom,sc8280xp-ethqos";
+			reg = <0x0 0x23000000 0x0 0x10000>,
+			      <0x0 0x23016000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
+				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC1_PTP_CLK>,
+				 <&gcc GCC_EMAC1_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			iommus = <&apps_smmu 0x40 0xf>;
+			power-domains = <&gcc EMAC_1_GDSC>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
 	};
 
 	sound: sound {
-- 
2.40.0

