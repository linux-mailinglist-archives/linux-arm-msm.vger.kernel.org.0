Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E040B4BFB9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiBVPCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbiBVPBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:01:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496BD1107CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:13 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 24BD53FCA9
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542012;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GQX7eovLM2ONZ5zVmcjtC0LU9oboow/vk2ZQTFSgt5QDlIC9XCt8HJp0fuPO5sDOH
         hpvExQGg1Y554QlIO/uzGvNmWNY59eTCCAyE5ABTJawaFTd+xoOF4+t8kW4lwo88Vc
         5UM2Lcorn30ad+wNkmurzddJ0nE4LdYy6nY+dNB/AYkZw01GCnUv8qn29Ovp6i3DJ0
         UGb4CRbcXBmH3a/SQBSUDRdVdzM3dWT127bSa/VKAxcCpCysxoaqwyAviYPt8+VkAd
         axrVoMy6wAZmaFDt+42IvedFhIiRUUp4FL/MMf/ZkxRB/BKUAk/4rSLgKlisOrpr+b
         py7Yvihpa8VAw==
Received: by mail-ed1-f70.google.com with SMTP id y10-20020a056402358a00b00410deddea4cso12065592edc.16
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        b=1YS02xeESy/aKvWNEjI6+RwOM1pstb1SeSN1TZ1l06DeDIUpHWlunQyvQlnFNMlkXp
         x1UF23IA8mvLtWkZquoucgvwObLDZtI0YBErsJML2q7PoHHoDNzpHKyBXTE+KrXPb7h+
         b5GqDwjRo+qz7JA3wM1BlXUjt4u6fAl71Rh39p4u7WdU6paxYHn0Y8xiSswD8HdLeumd
         fiNvYSPqq8SmSr40OYONPi9lXW7MQMwzpRBj9N+IiP2g2h15vmnqgmzZwiJcwIHF1b/t
         zaHFMYhtqwbVqIDnVaT02++xd8R0HAduXJQeIPhWEP3iwfQyCoBokQe7G7O4hws0cYye
         QRSg==
X-Gm-Message-State: AOAM532L3/fZnOK0qb0KWBSsZNtpn61C7Xb7me0jC5/p+2WSCK6JqLZn
        kAxcaOavOcH4wmpUDFsCkcehwMHT3XJVC9xpe2zhRxAYzATmJa1lj2BAheDxHekN2hbkaKUtlLM
        AQWhf+7+Q4WBf6gOsFiP9GcnsYWMiAeFFgdh7qcLdmJg=
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id i4-20020a50e144000000b00410d8130092mr26862701edl.9.1645542001227;
        Tue, 22 Feb 2022 07:00:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMw582wnovmDAi/CIh3lxLYM2LG2ODyt+mkZ0ZiJXVQxrV8hjaQpoxhGRnSRAJris1bHJ60A==
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id i4-20020a50e144000000b00410d8130092mr26862658edl.9.1645542000976;
        Tue, 22 Feb 2022 07:00:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:00:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
Date:   Tue, 22 Feb 2022 15:58:52 +0100
Message-Id: <20220222145854.358646-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0

