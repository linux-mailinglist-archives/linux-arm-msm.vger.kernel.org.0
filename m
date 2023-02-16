Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C16699817
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 15:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjBPO5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 09:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjBPO5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 09:57:01 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04355355E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:55 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id x29so2277181ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IlYxYxNog8XCHVUEYok7oCK3ZQqmTpqj9A73guknvE=;
        b=yyZAspCKa2SMMKvuJ6Dk6UjknNEziJX/g6QejPlibJDm9p5FgjAY0BdPo0yvIxkE8z
         mD9dmXnD9I+eazZtYYuz0TdPPdhMQvlcEbm8p1jNReD5AEF2O20WQbmTbOKjuzH0X1Fd
         S8Ycf9y6ewZ0jIU0pEYpZL3tPbSS4gHMcZPQF2Z2KekkfZ5Pfk6eTtRZEjHljSyXLjUB
         6qt3J8m+dmFB6oeW4mQ6gebc+j/YYlXSaCa+j47vXtw5NVlZDNot72zT54sgDExVxG1E
         EhlfzWAcHsznN1CyDsAfHORtQYgbAWs0y9sLjpJtNj0CIsSyazCnmPBF7T8fxWP3pUmF
         4Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IlYxYxNog8XCHVUEYok7oCK3ZQqmTpqj9A73guknvE=;
        b=P0iHsVuGEOl7OrQG/devwX2uZMZoiccINjKupRMugX6K8cEyuqvmO7X4a+2TYpeV2O
         vUN0PQyQosmqEG1DfiussR9B/mytz5VHZFaZJYJYiYrIfhKBbWY1AF/jtVZHaw5ug7Fy
         Q/o6hE8q2e8m9Zau3f/EHBu29QFCsHZWoYTX453Y0lGwHRJ6wgr7fmqmTkc8j2ohhv0k
         lnQrP8ez+u3zHKP1WeeIq5vsdj+XTbm33bShA/XrHJ2DPqc/El7Aok0bOyjaVm0kVGrQ
         t/0YKVTyRQgWCQZpNJEQSvBjHdCdPcYi9DjI5zL8AjXk4S7F2B54EDTF7OwwjshSfk/k
         fTtw==
X-Gm-Message-State: AO0yUKUe0xgRTGrvvkwU6zHmzPogxG/LajcnXDyTJRR7vio3hXPfS3lt
        lD4WPUdDCLrXRr0YIJTzfKrWyM34oZWnu3Os
X-Google-Smtp-Source: AK7set9OYyZjiDx2+mIP4XkSuI7pXcZaVBNISJytZjYZiK1Ifi0y9a8FFA0HugJseZYi7w2yJbIIGQ==
X-Received: by 2002:a05:651c:2207:b0:293:4fff:422d with SMTP id y7-20020a05651c220700b002934fff422dmr2286616ljq.13.1676559414000;
        Thu, 16 Feb 2023 06:56:54 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id f2-20020a2e1f02000000b00294619d902dsm230012ljf.112.2023.02.16.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:56:53 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: qcom: sm8150: Add qcom,smmu-500 to Adreno SMMU
Date:   Thu, 16 Feb 2023 15:56:44 +0100
Message-Id: <20230216145646.4095336-3-konrad.dybcio@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index d94171f9b73d..3da77141a164 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2287,7 +2287,8 @@ gpucc: clock-controller@2c90000 {
 		};
 
 		adreno_smmu: iommu@2ca0000 {
-			compatible = "qcom,sm8150-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sm8150-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x02ca0000 0 0x10000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-- 
2.39.1

