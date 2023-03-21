Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF0B6C39AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 20:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCUTBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 15:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjCUTBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 15:01:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1977A559FF
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:34 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so21314570pjv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679425293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EO5HCrL/48xWt1UFxSeB3X47wtvSFENBkrMN/kz2Z4=;
        b=Hg0STW2UxISTQFaVd+BmMq2m3Uq9BeGqe4ieVq9oVQh0j7mGiDs4cJvO3loji+E4pX
         W5YGItnjwF8zOtleNYvXqtwRqbExbRz5XIPq3qtv3PwpypoQfpDU0cYwplE/ew4iBOvM
         ZjU/UM0Q+Wc0UQfhoVjY9GvQWnUWSDZwHdFxticf5JTNmw82TQhvMZXCc4Xu2h1FWtZ7
         hUwf/dPZdI/42mJcyjv9UgU9Q/0RRHfP+cnsJlY9EQpgfdic47IRqFKisJIed4zX6orP
         pShWvpsFgTg7lT6+6deiMexaBE/SeHz5SaSLma54Qjc3tyRSsFDrwm5nsA8rpAA6miNm
         MEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EO5HCrL/48xWt1UFxSeB3X47wtvSFENBkrMN/kz2Z4=;
        b=yJtqsx8v/CK60ZM0PrrHuRJzkn8Adzs7whVnROst7XOdi8axY5q2TsgHwElCPi7c2h
         ZS/Z+2SNCIBPO95x726epkTj10Fb//EcpPJAWJLFm/u27+GahzKQqyVZW7h9oXHsnFOQ
         uOecWJqpnvcKjn2rQ2a0WkPENWBMViRHl+Nkc/EAKrDiYEd/WwerX0tEzTVcYkVw0zkt
         vY0mlQW0ps1xwfJk6ungunicYhR9ByarUexwn3ad424vLx6YD7R5wDsCSIdtVG9B3Udg
         1JVk3oco1J+IeCNFsAddepTDM/JTteVUC3ZqvEyrhK1S0peqTpg5zYkZvU7M4HMoev+u
         mt+w==
X-Gm-Message-State: AO0yUKVMcNes67864oZTjFFR/hDbWEwi3MPYzsTdiK7jvLSVYvCD9ac/
        mlQY4TncPDHbT3c9YWKVBbmqY6IfpuinTrLCRyA=
X-Google-Smtp-Source: AK7set9IcbRVIHvBCJAya+bH9UyoCJ0UrEsUKBiP/3RNDLBs4Ab4kGdyLoY/IMZOYCWs1GOzuLup9A==
X-Received: by 2002:a17:902:f1ca:b0:19e:6cb9:4c8f with SMTP id e10-20020a170902f1ca00b0019e6cb94c8fmr82042plc.41.1679425293022;
        Tue, 21 Mar 2023 12:01:33 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709028d8900b001964c8164aasm9043453plo.129.2023.03.21.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:32 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: sdm845: Fix the BAM DMA engine compatible string
Date:   Wed, 22 Mar 2023 00:31:14 +0530
Message-Id: <20230321190118.3327360-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per documentation, Qualcomm SDM845 SoC supports BAM DMA
engine v1.7.4, so use the correct compatible strings.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0fdd59a9feed..e8e9aa4da914 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2628,7 +2628,7 @@ ufs_mem_phy_lanes: phy@1d87400 {
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-			compatible = "qcom,bam-v1.7.0";
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0 0x01dc4000 0 0x24000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rpmhcc RPMH_CE_CLK>;
-- 
2.38.1

