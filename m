Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A738779ED30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 17:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjIMPfo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 11:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjIMPfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 11:35:43 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255881990
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 08:35:39 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40061928e5aso78701705e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694619337; x=1695224137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmUa/uK3zl9ZI3WJsapz8xqeCXA+AubzrG5QzcNVHCg=;
        b=wlxVSvPLL2Al4Xt3sgtM9pAz0KjRiAenleq4Ow693DM9XyAGoCR5MCsEBSOjoP3nU2
         BAg/ETWIQjB0NHy46XnFfW0JTdfDwWyvKGHOqQv12/nTuFlJi+fa3o/nCgU0KyxkBctU
         Bg0ZXZE6u3z8xYa8Jv1F86UJTRJsFrGK8T0ejZ3+Jrz/bX2cGU9zskL3iLa2pZFl+FbV
         VDpfRPRbD2QEVlomXwnhmrIerIa5rYT1rKhG57rT5xyJAna2+LEKRAp+IVqyAT+L6WdK
         ryyDQbkfTYT2meCP+t9f2ChaKNAftbKk8Q7R05xAExgW3FNomJ/7iF4LgbGNUCjT4Jv6
         rETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694619337; x=1695224137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmUa/uK3zl9ZI3WJsapz8xqeCXA+AubzrG5QzcNVHCg=;
        b=EXdbjvH+fpRuZD2kyHoxTJM+gS9QgubjSLC/zcWo5cpm3hrDGAQFCiPFmymBcxNBy/
         zbTrfmdE+ltLUVEjTvDouAKqzSxeorcgbxBLb7nwl0muqnGLOUDwhK43GNs/9xVUgFtY
         V9ZDsgMUhIA6eNpsB3VcgbPSU00gBH8KTZ3ufCKxJ1bnx8/bFZVWdB8ATyZeGfG/ODVC
         yZ/mlLv9Lgidsdtxhfb4OqtHdf94ii1Sg7qwvZSllZzHVM1couHI+xQJclUc7T6bJ1uZ
         8q/boKvbLVthnC+3Tt4x7D+wjO63ia15D8eZ3jMaAeUnpxnXk21iua/HZB6Zr8MZBlnO
         G0AA==
X-Gm-Message-State: AOJu0YzuDFzELDi8ixml6bGwnlaBKiDgXJxARjj0GU1zzdLJdSBZ1pQU
        d8ltxQKsaKVpE5E3x4HjvuufdA==
X-Google-Smtp-Source: AGHT+IGovylkDo6wyDm6xVXmImMBKxNJpRan8u+7VsotkLE1xj+Aoiq8pqQoC8Lo5nr1Gki/S/RP2A==
X-Received: by 2002:adf:ee8f:0:b0:314:4db:e0b2 with SMTP id b15-20020adfee8f000000b0031404dbe0b2mr2554098wro.15.1694619337374;
        Wed, 13 Sep 2023 08:35:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id e11-20020adffc4b000000b0031f65cdd271sm15750315wrs.100.2023.09.13.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 08:35:36 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: enable the inline crypto engine
Date:   Wed, 13 Sep 2023 17:35:29 +0200
Message-Id: <20230913153529.32777-2-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913153529.32777-1-bartosz.golaszewski@linaro.org>
References: <20230913153529.32777-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an ICE node to sa8775p SoC description and enable it by adding a
phandle to the UFS node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f4f58e831a4..b6a93b11cbbd 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1525,6 +1525,7 @@ ufs_mem_hc: ufs@1d84000 {
 					<0 0>,
 					<0 0>,
 					<0 0>;
+			qcom,ice = <&ice>;
 			status = "disabled";
 		};
 
@@ -1546,6 +1547,13 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,sa8775p-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x8000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
-- 
2.39.2

