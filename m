Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32C11B4019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbgDVKnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730065AbgDVKTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:19:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B730BC03C1AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:19:35 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id f13so1685268wrm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PhIRlfxSd6Xawyu0KJOVJaENTrBMylRV4/RWfRrVd8=;
        b=fQog2JFHadvS9RrhNUQ8NXgdPQM3795g/mlpdl336mApkCejO/gL0OcFOxX3/2PN/P
         GpPKu2N7mnFNBSVAl9Xp/lWjM5TGxtcVffG1VqZ8BoRtN81WAQ8wtyBKO98NSQ6pJgqC
         CpiHAOm6KVVOYAWLE68uhj4Pmewf835akUehm840wphbDXoh25/uZiCot+NenUXr3lWO
         HcAGIWiqCtC0K4H8SBUEAp0zSaNgRiDvB5Qc38OIS9pHCj98Lq8MMZ1RXctVEGbEDbaE
         fL4ywv2N1AKR4tIzgjjR7qLgIpQfWFPEC1VBkbw36K2d3qp/YfcLQaJRpowtxgMCjMSJ
         rK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PhIRlfxSd6Xawyu0KJOVJaENTrBMylRV4/RWfRrVd8=;
        b=P6aZNO6cB1CfoDJsd4kNRdb/1moUQ6KfeDN/hosIq5jMtnxCQOAWltva4LALd1fmT5
         A2DdXrPMWo262PHvkz04VK0a4e0AjLl31rySX38PoSkc94okGgE3HZwjVpX/lWs5++Hu
         +aszN6CAptMz6BV9eoIk+dxr1lpFpf7aOL/B4XY7enp/ZDZsnjxVHcJAQjCkDZwcUDoz
         xkk24O5Jpm0oFCSlhlfNtZs8MBwARB7JwFCRRwTaraGbUjXCnRaQ9158I8tmEIngDRv1
         9Ig/4dwPMetwomK9+wSz0rsRMI6wdwHYWK2CpAuWWOE+liwCtVVdEPEdlbU64l/+/po6
         E3Qg==
X-Gm-Message-State: AGi0PuaJXl5maQfpnzlDTHHtm3nid5buwWj5Vz0088rjOvEk+0XqqoKq
        xf1cmqSvE7MsX1FD9IUrSXK+x0b9YDM=
X-Google-Smtp-Source: APiQypKtnvoqO690NcodPG5Icoc96fbnAS6AsX06nqnlt6p4KLnlpdrwCBcwDHeB2H2N5nbR++xHTw==
X-Received: by 2002:a5d:4381:: with SMTP id i1mr28121319wrq.194.1587550774176;
        Wed, 22 Apr 2020 03:19:34 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id k3sm8483299wru.90.2020.04.22.03.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:19:33 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: db820c: fix audio configuration
Date:   Wed, 22 Apr 2020 11:19:22 +0100
Message-Id: <20200422101922.8894-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After patch f864edff110d ("ASoC: qdsp6: q6routing: remove default routing")
and 9b60441692d9 ("ASoC: qdsp6: q6asm-dai: only enable dais from device tree")
asm dais and routing needs to be properly specified at device tree level.

This patch fixes this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- removed invalid direction property

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi        |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index af87350b5547..6e81db5671c9 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -908,10 +908,27 @@
 	status = "okay";
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+};
+
 &sound {
 	compatible = "qcom,apq8096-sndcard";
 	model = "DB820c";
-	audio-routing =	"RX_BIAS", "MCLK";
+	audio-routing =	"RX_BIAS", "MCLK",
+		"MM_DL1",  "MultiMedia1 Playback",
+		"MM_DL2",  "MultiMedia2 Playback",
+		"MultiMedia3 Capture", "MM_UL3";
 
 	mm1-dai-link {
 		link-name = "MultiMedia1";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 14827adebd94..98634d5c4440 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2066,6 +2066,8 @@
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
 							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
 							#sound-dai-cells = <1>;
 							iommus = <&lpass_q6_smmu 1>;
 						};
-- 
2.21.0

