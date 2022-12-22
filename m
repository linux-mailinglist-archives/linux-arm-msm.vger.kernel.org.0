Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF02E6541EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbiLVNbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbiLVNbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:31:52 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6AA140B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:51 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so5704587pjr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xuFcNG+Lmd6sCAcx37A72Ddu+m83mu9NNvxLdsptSw=;
        b=nA0ejjbc4ytOQVnxKuefw8MAuoRRUqjMaGNYnMY+ffjK/YbyiaNBpzJcU+FMdCNPv9
         qzJ+NCcvT5bJcFZsC+3gSV9hOTT10rdAe7l12HO/wqnJ3E5e1Iz1Oyo7zDYY6iJfo2Yr
         abNHgiimpIb4/+OxWWJ83YaQciW8gx1jdh/CiWuA4yoRQ9JXoZU/J6WLVLCG9eWXpYqZ
         Pzssu2lDki9ge53ut13Cr6nDhJJvEng5+Gt0G0Yd6CJh9ZXuScFZdiV+socMh4eDvQWG
         qyXqE6bmxNqbqhIaRZK4pZDCEg7UDXXXZzL53S0KezKK9Mr5F6o/kxJiNUQTQKE37WxJ
         UAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xuFcNG+Lmd6sCAcx37A72Ddu+m83mu9NNvxLdsptSw=;
        b=1UNl35VJn6zwh25e+iPmjUKoUWQD5oTPjaNmMg/4sM/G/HgCQ51ZshDIjV3dNKjTuV
         emC8qV+1WSxRKVFi46yBUNSJxWgfbeQinnX9DiQcp1Uqn6iocz8vKmNW4HuOkm4y7YoW
         hQqdJITld3T0Fy+MAThmMsQXqlZGoA0NLytd93fzDUVoVUEucOz7mFsm3kZZsID45m6t
         pfA0jMbI/71NI47NFst+Dj160h3dItBC8Fe25wypTD8A/LyVFqrhV1ptCIEV81qJsQoU
         itfEjINLHyL+0gqDt3TPM+/i+gLp90DcxkcLeACrFSq+uw9+SaJ3CALgF9z8f3XWfOll
         Eeww==
X-Gm-Message-State: AFqh2kpadZG5zx6xxks+V184anxCX4x7gGVE4IizIOw0VyBZhEtbWLq+
        RCdljut7DEJ9vI6IbNfYZC0I
X-Google-Smtp-Source: AMrXdXssTF2j/7G2W7A5SzQqs9JwTq3TPxXMUyLOzEdRGDV92xCWp41iMryIUYKECqxp58XVPBCdlw==
X-Received: by 2002:a05:6a20:3d14:b0:af:b909:2b3f with SMTP id y20-20020a056a203d1400b000afb9092b3fmr8965864pzi.34.1671715910863;
        Thu, 22 Dec 2022 05:31:50 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id f66-20020a623845000000b00573a9d13e9esm737467pfa.36.2022.12.22.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:31:50 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8450: Use GIC-ITS for PCIe0 and PCIe1
Date:   Thu, 22 Dec 2022 19:01:23 +0530
Message-Id: <20221222133123.50676-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
References: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both PCIe0 and PCIe1 controllers are capable of receiving MSIs from
endpoint devices using GIC-ITS MSI controller. Add support for it.

Currently, BDF (0:0.0) and BDF (1:0.0) are enabled and with the
msi-map-mask of 0xff00, all the 32 devices under these two busses can
share the same Device ID.

The GIC-ITS MSI implementation provides an advantage over internal MSI
implementation using Locality-specific Peripheral Interrupts (LPI) that
would allow MSIs to be targeted for each CPU core.

It should be noted that the MSIs for BDF (1:0.0) only works with Device
ID of 0x5980 and 0x5a00. Hence, the IDs are swapped.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..c4dd5838fac6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1733,9 +1733,13 @@ pcie0: pci@1c00000 {
 			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
-			#interrupt-cells = <1>;
+			/*
+			 * MSIs for BDF (1:0.0) only works with Device ID 0x5980.
+			 * Hence, the IDs are swapped.
+			 */
+			msi-map = <0x0 &gic_its 0x5981 0x1>,
+				  <0x100 &gic_its 0x5980 0x1>;
+			msi-map-mask = <0xff00>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
 					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
@@ -1842,9 +1846,13 @@ pcie1: pci@1c08000 {
 			ranges = <0x01000000 0x0 0x40200000 0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0 0x40300000 0x0 0x1fd00000>;
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
-			#interrupt-cells = <1>;
+			/*
+			 * MSIs for BDF (1:0.0) only works with Device ID 0x5a00.
+			 * Hence, the IDs are swapped.
+			 */
+			msi-map = <0x0 &gic_its 0x5a01 0x1>,
+				  <0x100 &gic_its 0x5a00 0x1>;
+			msi-map-mask = <0xff00>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
 					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-- 
2.25.1

