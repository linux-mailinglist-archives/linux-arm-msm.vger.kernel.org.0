Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F32616CB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbiKBSo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiKBSoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421352D1D3
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id k19so25871901lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgMhdFkKLkhPhfVCNQ6+pSsp5VjoW+jEZtcFsBXxEx4=;
        b=FksAD5v1C/TpK1XjS0IBQ4/8HsPn7ot3DprBWYnIB9syyukB4rLZPBb6tA0YZm2tdv
         mnMaDUlUVzzxEOuHjhj0E0xDth/1mrNzQZySXRXjYKDLaqJdoW4gPEJutPuOOw0mBRhu
         QBnxD5QgfCDrbOm43ALL0L3iFoGFeMmdijmI4pGEMGLC2PgBo/rLjrpnc3g8009OSv3c
         JqiPmvd04K1mi86IKSyGp524T3D0UQn/ssEOWsDEIqHJeX14TNdIeWk8096C7KRdK7Es
         OPwK7kUcb3JKonk2wxDfSNMC9vltEt78EzvAYfbF3yi4VJ1BzX+t5KNwx232jXnz+9mJ
         7+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgMhdFkKLkhPhfVCNQ6+pSsp5VjoW+jEZtcFsBXxEx4=;
        b=yXBzL0nGTQ+bM47LA+elNy1FolTJQzQdplVgYc4UIKPDhcD2tWkQVwB7l0cCaY9vpb
         5CibeuXB6K4WD1/NsQdHa4VgQKyiwn4lCcxP4Di9hNfBlphs4HfXV3faVwn1nXrniqcY
         tU3UGeyL64u6k1mGuzVF48FlQqr2Mw33aj9jVeXOsZPfx/EkeLtkUnihxT/+80/Advby
         ljFIyK2DM0MYkh8/27I4xsH+ZiKxviTXCBzY7F5g/vvkb/zxPG+tjOc7/bcoLFm7JF3i
         E+XMc5THxxpvfgWwXH0mdS2bpBvu2Byg9DkVZnA9mK4a9v2F6Es6Q6Yur9hoedqIwZhv
         2EZw==
X-Gm-Message-State: ACrzQf1bRfs/qO/urvF73u0VYOs3dkB9ZMVNKSE0a5siOLAgQxSsraqq
        iLuF2BU1yyJ6b9oXs/ykVK5kvw==
X-Google-Smtp-Source: AMsMyM4QRl5werbPkUscSIzc2q729LvDrgthZOrKbD+rv3ezGvOX+tkpxYFYAI/j+MoIwm7qkGu0zg==
X-Received: by 2002:a2e:834c:0:b0:277:24e1:7b80 with SMTP id l12-20020a2e834c000000b0027724e17b80mr9314376ljh.302.1667414662496;
        Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 01/11] arm64: dts: qcom: msm8996: change order of SMMU clocks on this platform
Date:   Wed,  2 Nov 2022 21:44:10 +0300
Message-Id: <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
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

Change order of SMMU clocks to match the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 31 +++++++++++++--------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c0a2baffa49d..9331327678d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2205,9 +2205,9 @@ adreno_smmu: iommu@b40000 {
 				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
 
-			clocks = <&mmcc GPU_AHB_CLK>,
-				 <&gcc GCC_MMSS_BIMC_GFX_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&gcc GCC_MMSS_BIMC_GFX_CLK>,
+				 <&mmcc GPU_AHB_CLK>;
+			clock-names = "bus", "iface";
 
 			power-domains = <&mmcc GPU_GDSC>;
 		};
@@ -2272,9 +2272,9 @@ mdp_smmu: iommu@d00000 {
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			clocks = <&mmcc SMMU_MDP_AHB_CLK>,
-				 <&mmcc SMMU_MDP_AXI_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&mmcc SMMU_MDP_AXI_CLK>,
+				 <&mmcc SMMU_MDP_AHB_CLK>;
+			clock-names = "bus", "iface";
 
 			power-domains = <&mmcc MDSS_GDSC>;
 		};
@@ -2292,9 +2292,9 @@ venus_smmu: iommu@d40000 {
 				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc MMAGIC_VIDEO_GDSC>;
-			clocks = <&mmcc SMMU_VIDEO_AHB_CLK>,
-				 <&mmcc SMMU_VIDEO_AXI_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&mmcc SMMU_VIDEO_AXI_CLK>,
+				 <&mmcc SMMU_VIDEO_AHB_CLK>;
+			clock-names = "bus", "iface";
 			#iommu-cells = <1>;
 			status = "okay";
 		};
@@ -2308,10 +2308,9 @@ vfe_smmu: iommu@da0000 {
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc MMAGIC_CAMSS_GDSC>;
-			clocks = <&mmcc SMMU_VFE_AHB_CLK>,
-				 <&mmcc SMMU_VFE_AXI_CLK>;
-			clock-names = "iface",
-				      "bus";
+			clocks = <&mmcc SMMU_VFE_AXI_CLK>,
+				 <&mmcc SMMU_VFE_AHB_CLK>;
+			clock-names = "bus", "iface";
 			#iommu-cells = <1>;
 		};
 
@@ -2336,9 +2335,9 @@ lpass_q6_smmu: iommu@1600000 {
 		                <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
 		                <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>,
-				 <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>,
+				 <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>;
+			clock-names = "bus", "iface";
 		};
 
 		slpi_pil: remoteproc@1c00000 {
-- 
2.35.1

