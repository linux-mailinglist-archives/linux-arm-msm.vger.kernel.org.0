Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC75206789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388749AbgFWWs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388728AbgFWWsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761ABC061795;
        Tue, 23 Jun 2020 15:48:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q15so364491wmj.2;
        Tue, 23 Jun 2020 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JFIVAxYllJjFUIQOOKJqCr+RrdTNoBfoRruJGm+HL/s=;
        b=SqVFMMKZXa8G0Y3iLXVKmA2d5h+XkiARcFpD6xkuCLd0+r5fduG06pXrOT5GGvIw/9
         jjrMaZJ1Z3HUapP0stciaZVBu/2m8vDj5H4OO9iHo6YcR1Q5nHZEN0OzQ53HbpmxvdZB
         JKIjEkDw/7CGRRxmimy+Rol2htoXRNhnfsfEsIbxxBm0kawo/jTSg6rSkYasN3hDS6/X
         tnbivBIDH/CKdU/9q9utct7tHJ6FW9voXIgI9w910NdBGzFFQONIUG/4bCGDhiQjNqFA
         yQQUW5TyjhXJc6yWvLiaFegEM9l87m5q+SUc00JDdV8f3B7KmIwoCLVa+vEPjKpnopZE
         tTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFIVAxYllJjFUIQOOKJqCr+RrdTNoBfoRruJGm+HL/s=;
        b=BrMLe7fOaZiNCQcG89Pnz+oeyQNpoIrFQNDL5BV26ossiduwy76GM4tdFZY0LYAU70
         YgCpVs9xTSomfctqk6/Vfy7SiYOyfBd0ODiadrWJ7jkWKdEt99YTwbj2se3mmUE/nDlW
         rSl4KKkaQKVUILFk25YNLexXTVLh8HZKDPYwUDsRcl/TFGPVKq6x6D3zWdP88AvDiogf
         5ST4q6EwU9NoZwHeg47ChyE7KlehOcPvKr+uusuIrDCCKsQCc2ob3re3PgP5iEpF2nb0
         nviKUKVf0H/odxLL7bB/2F1/MwI3hwQ7lIf2Xgaz8PYtkTca6U2BQVyZhysFknmueMSO
         9cew==
X-Gm-Message-State: AOAM531TNp4Gdkz1cQrAsa39UUTPcZk5G1Pf7I0+v6s1gv2pTv3vNMvi
        mQMXM84+3DNB11f1fHC4U7I=
X-Google-Smtp-Source: ABdhPJwnR0juuMjlsm0VqeqsUAZs7xb+4Cm9vbK/tEMqGnbJTn7HnXxJXrZkoKUlt/f1WAiJV4lTKw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr6939735wme.102.1592952502235;
        Tue, 23 Jun 2020 15:48:22 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/12] arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
Date:   Wed, 24 Jun 2020 00:48:01 +0200
Message-Id: <20200623224813.297077-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SPMI PMIC arbiter device to communicate with PMICs
attached to SPMI bus.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 79e6e46798c8..23e50c30669b 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -169,6 +169,22 @@ restart@fc4ab000 {
 			reg = <0xfc4ab000 0x4>;
 		};
 
+		spmi_bus: spmi@fc4c0000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			reg-names = "core", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
 		tcsr_mutex_regs: syscon@fd484000 {
 			compatible = "syscon";
 			reg = <0xfd484000 0x2000>;
-- 
2.27.0

