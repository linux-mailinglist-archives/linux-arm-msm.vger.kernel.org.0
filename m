Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F72365A497
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 14:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbiLaNUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 08:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiLaNT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 08:19:59 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A509C5F80
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:19:58 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id f3so15726445pgc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0TzfLVblu11BnOZpdHUHkIFyZ4wNC2FWblphcv+5ss=;
        b=PUf1gptAuaeOnX85qX4xCkwWEmpJcjpOVT4ZdjI009BSDbgRE3NnmeiYX/rbTw3op7
         BzCKY1/t7zWqtac7WiKyPVmXDVzm3UdsGSHKWLjynPWFbHrrBBrWvJpqVESbU23BVx2s
         7/XLXxtrNuWV8nY18BfWA5usXBKhncMfszrp0ZtUFRj7hlgUn7dGMgzePFROIAEPY5ix
         f/KJcZW576QMIZ6WuJ1tCwCTyKunqjkpgJV/cNK3mtdizH8jD/Tu2zXf2yVEhYeEWUG6
         ldLY/8prpW8OqsNT/TbVO5etFv9ml0d+ud1gEwWFjNbPDyBlfaAIWK5VSq+IyDBiBNLU
         2j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0TzfLVblu11BnOZpdHUHkIFyZ4wNC2FWblphcv+5ss=;
        b=ECoomSql8Jv5XriBkILRZG+UuVGnyaI0uwni4X8P1PVWdo+NJu3xRaFPyM2hyROk+a
         CL+emyNQCQINQYlxOXpbSlGN1uoV9ROC+R9GiN6jHyEVqZQ0/ZIz4v0FMGGaqrxv67lY
         ML0nvX1zLgGFaOyUIRx4im4/34hPkDXgt/FHHjjokC9llWgdIL4Jhawb83Suiubn7pWs
         sHlyPrK1lhmJ71wjtEZjTMpHAdTIpKxihkdm6Ec+D1HZHUQ0UChmiJQeVbO8uC/I0jQS
         D/KoimvkH6SFRnt44NPmHRBKJArDZrUC+DzYATrr/CulHUuQ6th/juR4PrM/1r06MkUi
         qiug==
X-Gm-Message-State: AFqh2krd67ErXUVaigkHtXYl55txXY+n59EIa8xbjrx+2uCbmdYSdQ2Z
        3+H+i0ztqPgDBvYb/KauU2raYVozRfLjG2EOiKk=
X-Google-Smtp-Source: AMrXdXsnGhpNhIwF6+O73w+A/1aIoKIM3XFd9Yup95Om3nfHxq99XvBNmmPmfJmkvzRMybJTzURmUA==
X-Received: by 2002:a62:ae0f:0:b0:577:15e:d9eb with SMTP id q15-20020a62ae0f000000b00577015ed9ebmr54163124pff.1.1672492797674;
        Sat, 31 Dec 2022 05:19:57 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id i27-20020aa796fb000000b00581a5fd4fa7sm6133415pfq.212.2022.12.31.05.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 05:19:57 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, bhupesh.sharma@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
Date:   Sat, 31 Dec 2022 18:49:45 +0530
Message-Id: <20221231131945.3286639-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Embedded USB Debugger(EUD) device tree node for
SM6115 / SM4250 SoC.

The node contains EUD base register region and EUD mode
manager register regions along with the interrupt entry.

Also add the typec connector node for EUD which is attached to
EUD node via port. EUD is also attached to DWC3 node via port.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
- This patch is based on my earlier sm6115 usb related changes, which can
  be seen here:
  https://lore.kernel.org/linux-arm-msm/20221215094532.589291-1-bhupesh.sharma@linaro.org/
- This patch is also dependent on my sm6115 eud dt-binding and driver changes
  sent earlier, which can be seen here:
  https://lore.kernel.org/linux-arm-msm/20221231130743.3285664-1-bhupesh.sharma@linaro.org/

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 030763187cc3f..c775f7fdb7015 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -565,6 +565,37 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,sm6115-eud","qcom,eud";
+			reg = <0x01610000 0x2000>,
+			      <0x01612000 0x1000>,
+			      <0x003e5018 0x4>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			ports {
+				port@0 {
+					eud_ep: endpoint {
+						remote-endpoint = <&usb2_role_switch>;
+					};
+				};
+				port@1 {
+					eud_con: endpoint {
+						remote-endpoint = <&con_eud>;
+					};
+				};
+			};
+		};
+
+		eud_typec: connector {
+			compatible = "usb-c-connector";
+			ports {
+				port@0 {
+					con_eud: endpoint {
+						remote-endpoint = <&eud_con>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,sm6115-qusb2-phy";
 			reg = <0x01613000 0x180>;
@@ -1064,6 +1095,12 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
+				usb-role-switch;
+				port {
+					usb2_role_switch: endpoint {
+						remote-endpoint = <&eud_ep>;
+					};
+				};
 			};
 		};
 
-- 
2.38.1

