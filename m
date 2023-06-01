Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26CB719B69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjFAMBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbjFAMBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:01:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D491A7
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:00:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so98913066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685620845; x=1688212845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12GsqqrbTT/zpscVm3DxuZSkplEHxlX6gdZbxZpkH1I=;
        b=ZQCP3Vz21SZPCdoeJB0qVBsty2nlHg4ivPp0SMPJYIf7meNgPrI4ELS7sCdtVpjxpF
         7jlQx0T+YWJLvUgZ9sDim+9VYMJLYB666aZAh4Nvzl8at5w1QkoxpqRGVzNzmIqooM3g
         KRTJ0XgQye79ny/m4oEElBNG0uPyG5EmUQBTRU0HzIi6ws/Tt8qVmUw5PB1MXxaKRBIL
         5GwuYWNPDOIXnD5Kk7tA2CbC1ljaSgwMP/tIacLscmeqeVH84YDB0HX8P6aE4XfE/tcI
         NPCyYw0/V1WhFgmsUMGldH40sWp4cdOm+Mn5yw7VPQMbz85o+nozW5xM0wv/nA8luGfa
         8+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685620845; x=1688212845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12GsqqrbTT/zpscVm3DxuZSkplEHxlX6gdZbxZpkH1I=;
        b=Eg0+ftQek4788K4CD7XBhJ2kTLkgRt2ha6MMz8TmU6VunWumKzHgN00dIgmEfp1fZJ
         sC+E7DYPr6VLbxfWCzz58rTdkCylJrJWHg39HiP10vg3egLRD4cBvFPGxpd14cldZDjQ
         WMv/7S1+u2Zz2Xt8TfZp84nnP9Un/abMaDRPFEerfIYYzXJeI94vCeIT4z0U+bz6Vv9/
         BvGixTWFPMH/XX+V6ZeEV9RhmH1bkRHFa0tbAL2ya0DhqI0tFl1IlJQFzNUfHeEhtpDK
         7F8Aqc51vNZbi1lR+PvdXT+Xcwx7Appcu+xvqGJXSxkwFLjAxrtFjAHU7OlA9uFSvIqn
         bveQ==
X-Gm-Message-State: AC+VfDx4BbSB788QN5krxu6iXykNLAMk+EIOVtvA+VF6ptyWFg1F+5qt
        1AhETl+KzB74UJ3uRb1ziorE5w==
X-Google-Smtp-Source: ACHHUZ5abBo1T78xO5hoQRfWEx585gY/aIQ7KsF9l79IH9l+iQF6ebG2nStWMZ601I5uK2a9nkAcSA==
X-Received: by 2002:a17:907:6e11:b0:958:801b:9945 with SMTP id sd17-20020a1709076e1100b00958801b9945mr7832799ejc.31.1685620844908;
        Thu, 01 Jun 2023 05:00:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906b01800b0096f6e2f4d9esm10359923ejy.83.2023.06.01.05.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:00:44 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sm8150: Add missing interconnect paths to USB HCs
Date:   Thu,  1 Jun 2023 15:00:26 +0300
Message-Id: <20230601120029.38859-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The USB HCs nodes are missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 197c016aaeba..4e73808c7bb1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3595,6 +3595,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -3644,6 +3648,10 @@ usb_2: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
2.34.1

