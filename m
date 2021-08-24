Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62ECC3F5758
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 06:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhHXEfg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 00:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhHXEfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 00:35:36 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49ACC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id m4so435407pll.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nff3Tp8Tu+bjLX3ssyXcSoAVuinaN02903EEynfcyEI=;
        b=akyrO8UW4SNYZEpYM1TGkjrb18VxaZv24fdamHymXvkgr6Kfc1IY6qzydAlK3ADJO2
         oDBT9JuHVRdKmasKr+SNTcGjFx/nAZnTW0sr0g3FAr6kKjJWeL69G02RtwQO3xY4yqHB
         GEf5Py2ddON8e4RMW4nWJv8lDICXf2aGT4YVv1EnMMG4PPm3pd0ct28OyCJzMfDBKtTc
         IhulrZ1eq3H3fOWByt4dSA0ajFxQaoYKzXGU64DXg7DSuLTFJqcTao6Kznpqmz1xFTD9
         LZZx+2Ka56HW4GabUlUBQlFtfQl1mE82CwwUgwc6p1TTOIpASFAbLppRdP4hLn998i3A
         1N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nff3Tp8Tu+bjLX3ssyXcSoAVuinaN02903EEynfcyEI=;
        b=RszxOXrxjh7XdbsKNYf3hswpekIEq5ag1wV0S6XtNzMS5ZRKJxKSU/hjodewJNKf/q
         u4+4ksRRnEeGvl37DUK4Yst7nUJr9yt7ghVzCxkmkFjUukyCwlYJfupQs/skl9HMr8B1
         GiseMq6i/5TJwM0VuNdKvSPNzFrDLibuceTa6sGXZxcCr7WiJqOwBwWnJp2l6DxItU+E
         R3KS1h1Rh31YEnOPyRbE3hfvWnYWnDq3jvOUDWB8+NKTk8IOSWsryL7HDUp7896abvIw
         0tuGq3xYXkXdsunzxwxl06gkST3g/CU5Sz770BKnliRgBh6mj4KX97pOkMoEX8LkV11t
         hRxw==
X-Gm-Message-State: AOAM532YLZWlo6mzlhU6MkiVeGZhdlaqjPr7w/JlVIUUty/zVwCFOmh5
        IBS4vgIRaz1k/mClh2hN3Gb1rQ==
X-Google-Smtp-Source: ABdhPJwCrgQs+CNG8zpMXBnm0FQPFbYJnCkHn+S6Acaqfm8JfyI/nVXVussec6xNotV2x6onHOMUSQ==
X-Received: by 2002:a17:902:c94b:b0:130:ad84:990a with SMTP id i11-20020a170902c94b00b00130ad84990amr18696165pla.1.1629779692226;
        Mon, 23 Aug 2021 21:34:52 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p10sm789401pjv.39.2021.08.23.21.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:34:51 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing a2noc qos clocks
Date:   Tue, 24 Aug 2021 12:34:35 +0800
Message-Id: <20210824043435.23190-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824043435.23190-1-shawn.guo@linaro.org>
References: <20210824043435.23190-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds the missing a2noc clocks required for QoS registers programming
per downstream kernel[1].

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 9153e6616ba4..9c7f87e42fcc 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -654,9 +654,20 @@
 			compatible = "qcom,sdm660-a2noc";
 			reg = <0x01704000 0xc100>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
+			clock-names = "bus",
+				      "bus_a",
+				      "ipa",
+				      "ufs_axi",
+				      "aggre2_ufs_axi",
+				      "aggre2_usb3_axi",
+				      "cfg_noc_usb2_axi";
 			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>;
+				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
+				 <&rpmcc RPM_SMD_IPA_CLK>,
+				 <&gcc GCC_UFS_AXI_CLK>,
+				 <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
+				 <&gcc GCC_AGGRE2_USB3_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB2_AXI_CLK>;
 		};
 
 		mnoc: interconnect@1745000 {
-- 
2.17.1

