Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF97C6FB2A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbjEHOXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbjEHOXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:50 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDF449CB
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f415a9015bso26188815e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555815; x=1686147815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9qMrQEZj2sK+b/vIMtDiShjLuXQTJPacoRfeHroN+M=;
        b=ejtz6d4gw2vuyuuXCTj97WL9PoHJdb3mNzAONV0p4NVokUSLuVu1PELJSzl3r4AtbN
         m3L5daRvar+Y5xKxOdllSZ/SVY1nl4/IZAT7PtFbJK9YHY+HQygBxxa7aSDeU3YLVqkm
         28CZRTYNBmvs0E6ysV9YBI0uz0+OkBRnncI8ZjYb/zGNIky0UIMjKh/+Io+Xt7rEPxnm
         Si1Wvo+QVBrOJA1qaVRvtUz1SekIbEEjjdfkLXkjkpguMBN2nc5Hq3sIVRKxey3+nzjj
         hRZiKh3fCzDq5Md0yinsO2bse0sACGv2+9UrF3WPBZHwanuKwJimkVILF4tzK9DltYup
         HGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555815; x=1686147815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9qMrQEZj2sK+b/vIMtDiShjLuXQTJPacoRfeHroN+M=;
        b=EuvYamFplejtTzDtpgaWLijkrVRmDOFQmLa3yjn1SDia8rKg/ZgzzYafWaWiN2iy7R
         Der3vxT9Z43u3apM2i33vsHM3IHm/b2ptuQlE8bTQfroVLubkWkxKtSWADtukw7YoYp4
         Vr1Whh4nNisNn2VwDPF/MJKPEaPjnyAT1osidIjZRboAI4xGZon5ZArz0mCguvp8O/rK
         5Ox/bipdxbFcPv58MmstHMU8fa3SkqVDHsvaTZ6PZ+t+Gx5j6NpNpcGWb6HCBthEksdh
         c7/wrYeyD1zu7+KQmPAUevNjg6JdbSJtpvWNenAM3h09g7EJAVYU9Vwty9V7Q1nhRG9Q
         Arkw==
X-Gm-Message-State: AC+VfDyI6xGCkk3NHxal5v07tT/h+T0OPNFwz1WlvApMOBgBs+xmX4V9
        P88YlTG0vw+dKGlMfHCJArYCLg==
X-Google-Smtp-Source: ACHHUZ5fQORjI1ucQpduqnfEKLFtTOjXMgTkYcdfyi11APMzZ6E5R0Jzqm8nEbGjjcEdDZjoDcn7sg==
X-Received: by 2002:a1c:7418:0:b0:3f0:8ed8:853c with SMTP id p24-20020a1c7418000000b003f08ed8853cmr7626307wmc.37.1683555815508;
        Mon, 08 May 2023 07:23:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:34 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v7 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
Date:   Mon,  8 May 2023 15:23:07 +0100
Message-Id: <20230508142308.1656410-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on usb-role-switching for usb_1 via TCPM. We need to declare
usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
which provides the necessary signal.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 ++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index df7179c7a58f3..286bf63caedd1 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1273,7 +1273,12 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_role_switch_in {
+	remote-endpoint = <&pm8150b_role_switch_out>;
 };
 
 &usb_1_hsphy {
@@ -1360,5 +1365,17 @@ connector {
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm8150b_role_switch_out: endpoint {
+					remote-endpoint = <&usb_1_dwc3_role_switch_in>;
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index af16d3ba76b8e..3d79110892298 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3740,6 +3740,10 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				port {
+					usb_1_dwc3_role_switch_in: endpoint {};
+				};
 			};
 		};
 
-- 
2.39.2

