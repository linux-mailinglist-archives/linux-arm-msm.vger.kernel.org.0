Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB136699815
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 15:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjBPO5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 09:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjBPO47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 09:56:59 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F7B54573
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:54 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y19so2225365ljq.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA8Nok9QB06dAiggpOCi9jTMtWNwPI/BkB7gt9UlA4Q=;
        b=ud3t/DRE6nToVd1mFfxMCc6ZnBTJhm+5E49w3+Wd6fAP1x3kIW/YoRm6IBQP3sj8M0
         rFkdEVsROi9pudYxdoIMTqL5Shncf57fkILgjqbKY+LFttQJFNT4ghldjCVIYA6vCvMC
         23LI5vUzCoFB6Hxq0EeMx7ANobgZ+4oYaB7uafYr5edOgUAWNM9ZjChwWq2pvsfquWDO
         RnzlLylNeFXvOZ7HisHJJzsmJpgdwCs+GzLBG+sOaIX1nwsi909aMXSOlwyYiIoiPWNS
         QvMMsIB1n226cXbdH7MtKUKkbFEO4hGsXXRlRLh9nOyl1e9x355WiI+qRUhHp+bUPfRI
         wVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA8Nok9QB06dAiggpOCi9jTMtWNwPI/BkB7gt9UlA4Q=;
        b=btdyE4F22+XCzCk9E0nBtxsVhBTTay1O51+kkC1meHfB4cVd+wMXWem14v2ds4ZwX8
         vqtPUS/UapohM0g4d7xqWEuZkXrybXKY8PISEwxybbpCAx4sirqBUGh25zz9Q7/+nWAk
         D3bPINKpA8txiO+uehunIha1iTD7mnCxP2dJvG8t8THVnJQmk/1XUUV5KbdarCqbPSVu
         273xMzyXU73+51DpTXVbFnnhy4kHBwHOY5qn4BMRJgenzkbMdI1Af8JsLu10cEer0Gyk
         mfj7jXGxSJybvqIYz8UHnTFSsa7rzKa57ECgZJRbAJLMxiTy5NAxeb1Uj7isau/Eonqg
         6o4w==
X-Gm-Message-State: AO0yUKVVnSNvRVehCSdsmLuR14cAqNgH/BPByEDhsgAB5LZAH5BnC3ee
        6zj5QHo0C6XXiMVGKUXgVeY71y7G8iBTaflV
X-Google-Smtp-Source: AK7set/Fipmuu7N68aDIu5iNxlr0lOhtbQnXNgbheUnyJukms92JZ5kKwONFGBqzp7T7B/gzoigPvQ==
X-Received: by 2002:a2e:2a43:0:b0:293:4b6b:914e with SMTP id q64-20020a2e2a43000000b002934b6b914emr1835066ljq.26.1676559412360;
        Thu, 16 Feb 2023 06:56:52 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id f2-20020a2e1f02000000b00294619d902dsm230012ljf.112.2023.02.16.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:56:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: sc7280: Add qcom,smmu-500 to Adreno SMMU
Date:   Thu, 16 Feb 2023 15:56:43 +0100
Message-Id: <20230216145646.4095336-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216145646.4095336-1-konrad.dybcio@linaro.org>
References: <20230216145646.4095336-1-konrad.dybcio@linaro.org>
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

Add the fallback Qualcomm SMMU500 compatible to the Adreno SMMU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index bdcb74925313..a8227bb6b336 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2677,7 +2677,8 @@ dma@117f000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sc7280-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x20000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.39.1

