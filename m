Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8438E69981B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 15:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBPO5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 09:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjBPO5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 09:57:06 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328F4521FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:57 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k24so2227639ljn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 06:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKPZoARVL4pErww1wba0PhsjF+y4EURMfNEf5dTC1YQ=;
        b=odBtyRbdU9e/VNYr//7YW4Mc/4+x6j5dMtcALVOVFF9QTGuXaxlEGRgccSqD6wYwnx
         m/GFsZY0IZOlN5khck2Bi5GkcikpdtKamOW0AwagkHnDgiRqMdsQWIoBHFmDCAYFCwbw
         xT9PbU99YZh81KjBqwxtJrS4KZIZgT1kXaiB2oqWeLWSnQoWRTHO7VGJypgPVjscEQE9
         uSfqeGO3uaJ/49BnkjkQ0qSWw/JIag+uIdh2ceCPB7RDyi8HMOqtGoC5nLJjdBFREE2z
         dBOAtYykR8YyVsYClU5UlGN5uSxKekIQjZDGaYoUO3o3Flp52SFfGw5qINxXNQ+qKLGV
         onGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKPZoARVL4pErww1wba0PhsjF+y4EURMfNEf5dTC1YQ=;
        b=PMYNhA2MKQLJmmTth7ng5St0yf83NRSfPnEQqjPfV8d8tLEt6WfLnIesv4jE86Su0c
         h2Qc3Qhl4+XyXhp2zYyIxXCP+DK1it5bOjlRKj0SYvdsSleuQWareD2kUbIAeAgiIy0Y
         kC+p/CjkoW5mdtNain7i5eMOTSk/cDZdcASLhSN6xeQYbO56/eC8l9416arSwimlhg7A
         RHrTsIXViNl9srA4BbS9mVoBbA18omMTO9QOufDZYKul9XhbQrVB3Z0FYoVjPBvlcHUb
         R+dVnST+RrrPmZgKUNm8XaQ+rLQkXcUjXIxeuz7udCy4/FaLYg9Ckq85Tb4EDUIY0MKj
         wccQ==
X-Gm-Message-State: AO0yUKXlq+InovmLDHCsKG3DwjT2/faJL8OEBjE5a/ao0ejCV9MY7rVw
        0IfW0FW59W+UFznOh07JayJswfGO2CnI+vIQ
X-Google-Smtp-Source: AK7set8FaLeTWAr/SL89TL2fRxvrlq8DSwMxLi2hP41yr3ZatnqIYGddBt7KxaV9SV/egp5Ryjb5uw==
X-Received: by 2002:a2e:550:0:b0:294:6d2d:c18c with SMTP id 77-20020a2e0550000000b002946d2dc18cmr331046ljf.36.1676559415327;
        Thu, 16 Feb 2023 06:56:55 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id f2-20020a2e1f02000000b00294619d902dsm230012ljf.112.2023.02.16.06.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:56:55 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: qcom: sm8250: Add qcom,smmu-500 to Adreno SMMU
Date:   Thu, 16 Feb 2023 15:56:45 +0100
Message-Id: <20230216145646.4095336-4-konrad.dybcio@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 6a0100822d3d..13f5526d97b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2701,7 +2701,8 @@ gpucc: clock-controller@3d90000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sm8250-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sm8250-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x10000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.39.1

