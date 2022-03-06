Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71B44CEAB4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Mar 2022 12:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbiCFLMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Mar 2022 06:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbiCFLMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Mar 2022 06:12:39 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB86F60A8F
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 03:11:41 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C3833F62D
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565098;
        bh=K87fd/JruUZqYWOr8a/mojQKl9UWafqN7QNiHwMxzUY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pCfGiAXIYnrc/f+6t/ZSMcAfBEjzetXCC72UbkdsblrMPkJNd/Pi+z0aIXIjvhF/p
         S1GJu7jtMG0Wz4PS68/6YovZSUTCWkBG/wsJ7F/+MWfOUQQkHqBf6wMs0Oupzil77B
         ksnPZtMmOBaBJbTZsdPOmp+/QfsO3K1Qb5qwRvyTordw+fov9a2Aq5M1p6Hza3QU6k
         LIEQJ95iiRHpEbcYxpaOT6dipgE8r4s1XpPROo1j9fPc3ZtcUOg1Ui+A34ob2MumpH
         JPvF0tUSH1YlPMRDCo9nwMTFyOjHre4FjGqHOFEjp4N25ueY34uZcbRi+nqo7lIeBw
         EEsQS8YEwr/Zg==
Received: by mail-ed1-f70.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso6761652edh.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Mar 2022 03:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K87fd/JruUZqYWOr8a/mojQKl9UWafqN7QNiHwMxzUY=;
        b=DwDgePgqEQWc4/stbLGl/BD5r14LLhjJYjDKz5vx5Lyay6aX/FAWHRk1SEQLCBMvPd
         x383/krZ2QCjsxqnWw1KBeexQIfbmT5iB2uMXTdTOxjDEtRknORJ7Z0l1DYKC3rojHJy
         0wbtFKe/3Qo4bGM8YRU/BKdF8iJlpaFGw+doDZ/5YkmLO81g4ToH/LyHuzFX5TPEI6IG
         T0iSwMgIsL7vdjc884CDS1+PXcVYSzSaqXKhjCCRIOhZeC/GSiPftcMbGVKqzT59ID6J
         i9bAM4x4NWqqsyxiGlFpujyWPsSBhaP10qonc+5FmQp9192A85+HGfiUzKIk+wSfBl36
         mYJA==
X-Gm-Message-State: AOAM531RvddvVAtblk36szBWMFhAfMu3g+wka6O3ba5IH9y6xnlb0+fq
        CCqyi/WzeXBU9LZ4FxQsduMF2MYIyaJh/YbPs+11luucWBqbbZVRGDcZHsg6CSF4fhjuIbDEVWT
        kFJsh7GmMIs/uN5B/h8HpbquRg69nzS6VkRVUm1uDJdU=
X-Received: by 2002:a17:906:2bc1:b0:6cf:d009:7f6b with SMTP id n1-20020a1709062bc100b006cfd0097f6bmr5438919ejg.17.1646565096454;
        Sun, 06 Mar 2022 03:11:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1ptrmrXdfsckOQ6+dPK+8ZJ5rNb1lYSQOz++uc/dn/a6ktfiEQvucxBSUD3XC+Nlvx7yKfg==
X-Received: by 2002:a17:906:2bc1:b0:6cf:d009:7f6b with SMTP id n1-20020a1709062bc100b006cfd0097f6bmr5438902ejg.17.1646565096238;
        Sun, 06 Mar 2022 03:11:36 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 04/12] dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
Date:   Sun,  6 Mar 2022 12:11:17 +0100
Message-Id: <20220306111125.116455-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS PHY bindings are documented in
bindings/phy/qcom,qmp-phy.yaml and the compatibles from separate file
bindings/ufs/ufs-qcom.txt are not used at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/ufs-qcom.txt      | 63 -------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt

diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
deleted file mode 100644
index fd59f93e9556..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-* Qualcomm Technologies Inc Universal Flash Storage (UFS) PHY
-
-UFSPHY nodes are defined to describe on-chip UFS PHY hardware macro.
-Each UFS PHY node should have its own node.
-
-To bind UFS PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS PHY node.
-
-Required properties:
-- compatible        : compatible list, contains one of the following -
-			"qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
-			"qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
-			"qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
-			 present on MSM8996 chipset.
-- reg               : should contain PHY register address space (mandatory),
-- reg-names         : indicates various resources passed to driver (via reg proptery) by name.
-                      Required "reg-names" is "phy_mem".
-- #phy-cells        : This property shall be set to 0
-- vdda-phy-supply   : phandle to main PHY supply for analog domain
-- vdda-pll-supply   : phandle to PHY PLL and Power-Gen block power supply
-- clocks	    : List of phandle and clock specifier pairs
-- clock-names       : List of clock input name strings sorted in the same
-		      order as the clocks property. "ref_clk_src", "ref_clk",
-		      "tx_iface_clk" & "rx_iface_clk" are mandatory but
-		      "ref_clk_parent" is optional
-
-Optional properties:
-- vdda-phy-max-microamp : specifies max. load that can be drawn from phy supply
-- vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
-- vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
-- vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
-- resets : specifies the PHY reset in the UFS controller
-
-Example:
-
-	ufsphy1: ufsphy@fc597000 {
-		compatible = "qcom,ufs-phy-qmp-20nm";
-		reg = <0xfc597000 0x800>;
-		reg-names = "phy_mem";
-		#phy-cells = <0>;
-		vdda-phy-supply = <&pma8084_l4>;
-		vdda-pll-supply = <&pma8084_l12>;
-		vdda-phy-max-microamp = <50000>;
-		vdda-pll-max-microamp = <1000>;
-		clock-names = "ref_clk_src",
-			"ref_clk_parent",
-			"ref_clk",
-			"tx_iface_clk",
-			"rx_iface_clk";
-		clocks = <&clock_rpm clk_ln_bb_clk>,
-			<&clock_gcc clk_pcie_1_phy_ldo >,
-			<&clock_gcc clk_ufs_phy_ldo>,
-			<&clock_gcc clk_gcc_ufs_tx_cfg_clk>,
-			<&clock_gcc clk_gcc_ufs_rx_cfg_clk>;
-		resets = <&ufshc 0>;
-	};
-
-	ufshc: ufshc@fc598000 {
-		#reset-cells = <1>;
-		...
-		phys = <&ufsphy1>;
-		phy-names = "ufsphy";
-	};
-- 
2.32.0

