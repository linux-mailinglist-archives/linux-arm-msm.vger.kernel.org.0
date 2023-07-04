Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F42747141
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 14:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjGDMZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 08:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjGDMZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 08:25:01 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB21BD3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 05:23:26 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso89373171fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688473405; x=1691065405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPValZyTZ8WT4pXLvEOIhNkjZRCsSVMvy0kqcxXBZWY=;
        b=GbdNYU+53uc+CKJ45SjHdFYvihr23ISMMItqnnGph2QrBQp/yUMObVlUB5z18Fww6W
         V3fldaqEl6L+CEcp8/o4l5MeC26PsbGQXiTDGgZp3Ptioa6a9IES2HzueIOT7VyOTN61
         bjquV6U0C5dzQJvTdxRdYqxI34m0L0zIo5Tiei5DBfaiYD23RrrjWjomMgQS9bdPis6V
         cdi8Xj60xM914Rj+lfjdlREdLmdWQ5IpQcBKnJzq9xBHTLacA6ImPgMFeD/Z/Bz5DM0N
         mXLOunrwwhKfvcGwfdSVKQH4J07PeT/P/5SZDXhbQJk0o2Glnwd5l11l0jV0a4F8Ey0Y
         lLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473405; x=1691065405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPValZyTZ8WT4pXLvEOIhNkjZRCsSVMvy0kqcxXBZWY=;
        b=HPB1R3AKZYM/BaRfvfhJUp1DFT+IdYeLJ7ElRF2YhjRZxw7S2F4HA50QKoP+S0Mjx3
         PgHK0FrxeCwLZYIOo1zLFmTj2+NaBgWCQDxSEd9qobR+SHOgNv1IWzuCnRbUTQzz/T5h
         PPQ9CMyTpDpGEQ72ALLj3MT9DYksxXPwuS5a19I51YPbC1hbal0oPWScGpLHNUdujk4s
         bLBqSewU1hbHabZNDwixBmy+15teV/TDDBFoiL+kC6VuRr96AOzrmRBaX1EjbwZIxhKA
         TKOsi3pnj5Ce4eHK8OgOOyeMSoLK/ni/jjLPdkBI77EcxjkvW/WU5MZJxkKU0Qf50D9q
         F5Tg==
X-Gm-Message-State: ABy/qLYxz6g321VjmoxI3PYRMjI4ozOyxIjQ8bKNPQaNWwIqFNtFQWAz
        e1M8U8WrObH8uVQ7EISHv69EZQ==
X-Google-Smtp-Source: APBJJlGhow9mucQnVPsfHwcdatGIOezpi0wujhzokvFVMFGT/fK19zshJEpL7q0k7GTqRVHtWMA6Kw==
X-Received: by 2002:a2e:7011:0:b0:2b6:e958:d03 with SMTP id l17-20020a2e7011000000b002b6e9580d03mr4190511ljc.30.1688473404846;
        Tue, 04 Jul 2023 05:23:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y16-20020a2e9790000000b002b6d465583csm2851817lji.126.2023.07.04.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 05:23:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 04 Jul 2023 14:23:18 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Mark SMMUs as DMA coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230704-topic-8250_pcie_dmac-v1-2-799603a980b0@linaro.org>
References: <20230704-topic-8250_pcie_dmac-v1-0-799603a980b0@linaro.org>
In-Reply-To: <20230704-topic-8250_pcie_dmac-v1-0-799603a980b0@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688473400; l=1012;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VBShug28IBIFJfOo9caAInSc6q5XHytMqyraNym9TJs=;
 b=3Q7TSlPOV0jaUPz/ndqxXhZeVAyVR+DygeEGccfP5sWFJmt2hzoRB/YMfoX+lmk8Wcf//cyYm
 xvYJbE9aEYbC3Kc97Jj+kSOPYiwCaXBnFbflUPm9IZbP5VT0a1NVThO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SMMUs on SM8250 are cache-coherent. Mark them as such.

Fixes: a89441fcd09d ("arm64: dts: qcom: sm8250: add apps_smmu node")
Fixes: 04a3605b184e ("arm64: dts: qcom: add sm8250 GPU nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1af0eed9eef5..ccc38c205de3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2729,6 +2729,7 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			dma-coherent;
 		};
 
 		slpi: remoteproc@5c00000 {
@@ -5399,6 +5400,7 @@ apps_smmu: iommu@15000000 {
 					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		adsp: remoteproc@17300000 {

-- 
2.41.0

