Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E45351DEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhDAScy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbhDASWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:22:48 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5AFC0613B9
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 10:41:25 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id g20so1432215wmk.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=psvxzM8AQK4wCtp0jeyZKJzBZ6tnLyY6y8gR0kB6FSQ=;
        b=EMmIIpg/ifLBU7e7zLFrcXCCfIzMtCtKRsgGC+uiqADi9JOFm/C70JBublWsnaUVRa
         oCZxA0b7R6+S5c6eIM6aTK2rShi4buAp9UTBOZvengzL3ry78NjgorwerN5w9uR+MQl8
         wFmFFhZ2LNNFFsVxk0J3+YdAKYIcg8cUcRhCdKEVKLggbLG1cXV+bDuVQ7ZuRJAK/ERN
         CMOnRVQTPWew4AuiSfQpcIXhFdYzII+5yg/DZRqYRH04pVABn08plYIKwbQekbvCfp/e
         12IuwdtNhTCLqFVKRofcUj9ILp1si1+qG16Mtn5NI4n25XGQIuaaG8vYZK81s+vpZG54
         mYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psvxzM8AQK4wCtp0jeyZKJzBZ6tnLyY6y8gR0kB6FSQ=;
        b=tF2n+VG3gHPqL3qTsB1O2a+H1Sx5J2Xqxje4d7ysbs/KWxBPb8U8dVgEq+I4LPyGRa
         8ZyWypHU81pDpNdUhnYt36XbxuOuw83BPztb4JAx4p1fEUvL/jC7Hgf1Qs6szzyxPAyP
         fWPKvLAJXewgVMDu/U8F6/7SW0vrqXaKj0qIRKKozq1H2pRUOGLrzUtUAOaooCW5m3rd
         WshxZ8pHjrrTC3YNb3To5ROKJDwSwU1dewbxmhn4MQbD7AeUvOFx6TtuXlBJ+gKBq/oB
         MqPsAWU6dTBmbKVKcrFoZJmkgGBBX2WpACGWuRRHJ8TKit4g63IrrXuNFhrXTKVxoL+4
         IWIA==
X-Gm-Message-State: AOAM532DiPqq+5icOwLf8PY0n6fj3eEMJODqrLC5XBgiaTE+4p0gH7q4
        P7MUJKM4mlAMwJEZNPv+H3UkhQ==
X-Google-Smtp-Source: ABdhPJw9y5hUwH+Md4zCAgqxbaMyEu7tTgsvmPNvwhDg27gxBbeU5ES38mvog43v+aumPaKRMfWa/Q==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr9036924wmk.156.1617298884186;
        Thu, 01 Apr 2021 10:41:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o8sm9070242wmr.28.2021.04.01.10.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:41:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        Jonathan Marek <JonathanMarekjonathan@marek.ca>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sm8250: Add videocc DT node
Date:   Thu,  1 Apr 2021 18:42:55 +0100
Message-Id: <20210401174256.1810044-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
References: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <Jonathan Marek jonathan@marek.ca>

This commit adds the videocc DTS node for sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..23fb9a0e32b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/clock/qcom,videocc-sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2322,6 +2323,19 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8250-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			mmcx-supply = <&mmcx_reg>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.30.1

