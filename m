Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED8F69AA28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 12:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjBQLQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 06:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjBQLQv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 06:16:51 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C17165340
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:16:30 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f22so630468lja.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUKqOclF/IMyzXt4+fGb5sDCuf0d8h/lEm7jg21Dcd4=;
        b=OdYgHszFs9+rIVPcJOczB0ZfI8VdZWLiDLg9OcOB+M9zQ/5l+OPW9aLKeHqi+EeAQh
         GsI6FAjY+62326gpU6sdJpBSNvCy9HXEGm5eJCS5r/gkha7f0nIkG21hw4nlyQYZ2Rri
         O90Sw/94xumrs+/347ePGrg+Sr1qX0wZ84T4jlb2lkaY+Yp5d4SiuX6nGFTKzw1Ff3Ai
         Tw3MIAQ4CZXGaj6zNNyU/HtmrWnjSSbFrWUHe8xVt6fM3Akp1Pxu6UA8CAtThlcFo7ib
         yrUibwSC7YCHr/HHDsLQ7c5yLs1n3Pkb8DK2YwmZkLZ3th9/Do6Z6kYP2LKghrD97IEA
         X0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUKqOclF/IMyzXt4+fGb5sDCuf0d8h/lEm7jg21Dcd4=;
        b=E/sA6MpLz1wwutGN1s321TeYJg9t5qkR1q6h/dH/InAm9OifpBqExDq82aif73XzzO
         6D53JgtHX/6LfUGxdbiK0EMZJyfptD47qf+2VxmcqJiiZSjX9IBSz3r64rPk5gFdmmUM
         ouNqrGfvtRZGzH9NU750jr950kUaybwFIIlfAjYwqJi0d6q1XRF3nLak9XbuKmGYhLuY
         gCmMGxC8E9mJ6XbPWsrX3PJD1QQeVkwM7wihUqM6AfsK5t0VlkZWQibx7QrxCGm3E06T
         rUm/fQxcQeEecTwhE4ncmTCQaInkVZ7mr2/ajLrqUrQb/rnYeSnQkm8j3H+eozhFn+0s
         /FSg==
X-Gm-Message-State: AO0yUKUSCZkg1dCsMLRXoTTsFxmyX94HFaCvl6Kzt4URAG8viB1pBywb
        eCfw3ryZ27uEyk4ZA5NbXOqsYOuerQqHu9TZ
X-Google-Smtp-Source: AK7set/qzGs71L7hCHzM6bWc+ba5WTEBUcFQ55EA5QPR5GM0kEMsY+gNG2k14sSDwmK1AWDQphpnNg==
X-Received: by 2002:a05:651c:323:b0:293:4a87:1790 with SMTP id b3-20020a05651c032300b002934a871790mr183307ljp.9.1676632588245;
        Fri, 17 Feb 2023 03:16:28 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id u21-20020a2e9b15000000b002935899fe3fsm554818lji.116.2023.02.17.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 03:16:27 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8350: Add qcom,smmu-500 to Adreno SMMU
Date:   Fri, 17 Feb 2023 12:16:13 +0100
Message-Id: <20230217111613.306978-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217111613.306978-1-konrad.dybcio@linaro.org>
References: <20230217111613.306978-1-konrad.dybcio@linaro.org>
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
v1 -> v2:
No changes

 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index f9822afedd89..07349d37f852 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1932,7 +1932,8 @@ gpucc: clock-controller@3d90000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
+			compatible = "qcom,sm8350-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x20000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.39.1

