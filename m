Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B54F4D547F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Mar 2022 23:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbiCJWUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 17:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232622AbiCJWUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 17:20:41 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619875A5A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 14:19:39 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b28so231994lfc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 14:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltAEZbyZLVfVeVrk0Wt85llgsjn+pNs+1t+/8KbJndU=;
        b=XnNrZ0UqLC58u+TifWhc5txCIpvFo4ANJoB8b59nUJBUoBu0czMi4jST3aZMWpehaD
         7oxR53YLZclgvH4tHgPEz+0jWCwMaK1yOuBSkJJLIMuwDZKyKzXP3FEyV6JlGA3MMcXI
         hy3CFi/Fc4byqyk5yOopO0y67FmsPpKs0gZriIS9Eh2hZz7J3mlxgH9iPnDoEdTrg9Au
         lPvadla5Vpf/u1y7wqDCjLNAPpfM6RgsDPDszh+LODzWj2E2D7sIPgTWcFNEdTqknZ/s
         F1UG/SlITzxrGx0mTrOui5Jsu+YmaRxX89SSsXOe/x/TyN+Qr9uAOtR3lVbROBA9mItz
         mo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltAEZbyZLVfVeVrk0Wt85llgsjn+pNs+1t+/8KbJndU=;
        b=edPz8saT4H7WLWrZohheEuDfQdG2eFEBhXbcLGqfCYGEx0pmFKiJW7Vm+syLq6up0B
         cwqB/Z2RKOMiobyxESGkXtNDKNeWRQOWChv9cp58CCO3Fnfl6rJqAxrM/Rn1a+VPcFpB
         eJTCFN7eIKAD71FKQwwETqoVfbOe44UoK+lO2t5amlY2RyMq9YBttgvtKQRQ/i6g9b2b
         koewGMVTrx5uKikFBHDsFZ6DG5zMPWQbo/NWTTqN3724/r1WocLnw/qIxdY7eLg1aPTC
         KvutjBDFmgWe4hKozIZ9+YcAJvdWm5pD9+Iq7TJoukpWG1WgaZJb3cZ1jsyypAH7/LI2
         uTMw==
X-Gm-Message-State: AOAM532s/JVbDDwtIeZPeE3FDGZnPKOmOHHv7PqTow0xkhIF7F6IqCUL
        VOlrPeOGocLJR02wxwi0Qq4IMQ==
X-Google-Smtp-Source: ABdhPJxVgE47WDGfVsj/7torO5HeN59Y32gauwo2qntSel9Tv4qolvpa7Vemyu7JKFVMOzgRpdYPgg==
X-Received: by 2002:a19:8c54:0:b0:448:2271:57d3 with SMTP id i20-20020a198c54000000b00448227157d3mr4444610lfj.482.1646950777725;
        Thu, 10 Mar 2022 14:19:37 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id q15-20020a196e4f000000b004482f75404asm1204598lfk.237.2022.03.10.14.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 14:19:37 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of UFS node
Date:   Fri, 11 Mar 2022 00:19:34 +0200
Message-Id: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All interconnect device tree nodes on sm8450 are 2-cells, however in
UFS node they are handled as 1-cells, fix it.

Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 0cd5af8c03bd..bbd38b55e976 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			iommus = <&apps_smmu 0xe0 0x0>;
 
-			interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
-					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
+			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
 			interconnect-names = "ufs-ddr", "cpu-ufs";
 			clock-names =
 				"core_clk",
-- 
2.33.0

