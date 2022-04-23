Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743F550CAC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 15:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235941AbiDWNnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 09:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235861AbiDWNmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 09:42:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EC61759F8
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 06:39:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y19so1448322ljd.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ga1FXFUoff60uV1gZjfSxxZrosbrRhkS2aF6jySEeu8=;
        b=lAfcX7bWhAiM9qF8UplivEufLN8b5gpEwGkIaQWc+/TyMXGXB54X7qbZ0xf5ad1imo
         aW9vy+TvbUSWyn2SxkKuslAcVJL77BwkVE26NILN7lifOMfx+nSzBn6o80FmMa9YL/RX
         CCaRkd7KirFN1ilEQGnJBgt+CTtCVQJ6sSlSOG0xFntNGeiE5jcrN2EzxaYuf8AvsYDf
         AFFuVW9IfH29zQM6SUzM6Cj2iWF51BdJCj5VDzC52JBrfrkYwj9lVkzqsc3NlTlvLip2
         b1Yi4nxEwS3b6cCcgUXA+RxKGOdRZUKND3dp+199b6dfMJWCXRi5AkuVTP2QK8dn2Ola
         hkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ga1FXFUoff60uV1gZjfSxxZrosbrRhkS2aF6jySEeu8=;
        b=g/YPF8Pb6v2aYcNeEXVtOFAHW9OYeBN/5/I9yAHr/FetF4V8RMTYhW81OOk6NsmBfr
         j+BJTSeNlOEVSg6/WcQabb2jsTky/YpI500Tin5EKIhPxTcxbSrKy1nwNdl12NFgtTAc
         5ZS1CPL6lPNVQvIGJNwSNGTN2kSm/oxIffbgUIdOkxwJ31YqMMMBHlWJXX/PhEM01b5w
         o4aVNVmMj1Bed2ymKYdkVR9hUTVZaS77dFAoqqHwTIl9FFxWJAGBSIo/Y2WNagJu4S0i
         MnK9xh3frA4dN6Nqe34RaaKokWcvWXPYZwGodxkakRdhcJWjvJe9FonhB/uEsS5cToVw
         kwSg==
X-Gm-Message-State: AOAM531rlaMdbnpGNSkur5aS3RGPTQvLu3EIeWLE14zXg2LnjzaVHW0O
        PYAnrVIoYIRcmJ3qPuH4uI8SWA==
X-Google-Smtp-Source: ABdhPJxNLdvhSGNd5ayRrc8CDk6a9IOgwYlVvuxyvZvzA5HmPMaFuVsPiXoPE3vLcgTwlI5tWirfXw==
X-Received: by 2002:a2e:a4b4:0:b0:246:2930:53d7 with SMTP id g20-20020a2ea4b4000000b00246293053d7mr5715097ljm.74.1650721188494;
        Sat, 23 Apr 2022 06:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.228.223])
        by smtp.gmail.com with ESMTPSA id c21-20020a2ea795000000b0024ee0f8ef92sm544535ljf.36.2022.04.23.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:39:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Sat, 23 Apr 2022 16:39:39 +0300
Message-Id: <20220423133939.2123449-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423133939.2123449-1-dmitry.baryshkov@linaro.org>
References: <20220423133939.2123449-1-dmitry.baryshkov@linaro.org>
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

On SM8250 each group of MSI interrupts is mapped to the separate host
interrupt. Describe each of interrupts in the device tree for PCIe0
host.

Tested on Qualcomm RB5 platform with first group of MSI interrupts being
used by the PME and attached ath11k WiFi chip using second group of MSI
interrupts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 410272a1e19b..0659ac45c651 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1807,8 +1807,15 @@ pcie0: pci@1c00000 {
 			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "msi2", "msi3", "msi4", "msi5", "msi6", "msi7", "msi8";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.35.1

