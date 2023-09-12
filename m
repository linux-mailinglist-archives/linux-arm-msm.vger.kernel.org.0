Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A06E79D248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 15:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbjILNcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 09:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235744AbjILNcO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4151981
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:32:02 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52e828ad46bso7339518a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525521; x=1695130321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y15C8Fv8QHJExv9aOHGDEKpdbaBfEIqNr0Cf6pow0Ag=;
        b=nI91iwqJIH1SjoS5i8r+kXQCiccUkhQ7ewjeK6z07T9NvenxGlsVu273mQGCAQp3av
         2JW2LiR+yk0KEb4KXGLmQQmVFeVUjSkOA6IsROSSExxspjyeXRc+t22k+W2jHm9qGohI
         +zJHg4zGlSKsVe2LTHBPJtLcPWRWdJgmZoUT6QLeoyrUTXQ1ZVCyW9qSrrWhLqgPbNBl
         AmhBfuewRF9H5O+RrexSceiBlvddffaZOBN9Eqvgi/yebc/wNYabeatgkqHFmuKrOt54
         Z5c4n37r4k9AdIrTTCMTjvvjnK0sB9cmm8XJefOiL3Kv2P6JXNeXSgRnk0u63Rxpzkyr
         niPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525521; x=1695130321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y15C8Fv8QHJExv9aOHGDEKpdbaBfEIqNr0Cf6pow0Ag=;
        b=qn+gaLNZ44VwqMx8gpDJRSw1REA3J0csvzfY7QqwqNlwyMbPGfmpdkWVFdrf/PEM9K
         SdWggeqLCNuChBUbSoGTM2VYS5Qs6Mpb3YoFGy6C22rybatcGr1/vz+tLWaq4kOvbUds
         wXzBUUwBkB90aZciqSAvb14o17bxrEwfxxukBBmDBVt2I+oLmb8VDSGw6Ql2FjATNldx
         tgMaggAAMiAqLcq2JTaTMYL8pXc6CC4B6WzP7yTTKVgmKELDPUF+MMA8qBrsjS9gHRpT
         zMUhSHUebVXgJ/+ETNWEP/zd17deRO4KRYZN8b2Ubbrv6Ebz0Y+ClAao0V5IqgSGpI3i
         Ja8g==
X-Gm-Message-State: AOJu0YwrKv96UvPdjyC4ztzBIuC71ZeMfymGbx8tFefw9a8C3YWFLHgJ
        1TJ+529JDvK9losT5MjFVdMERQ==
X-Google-Smtp-Source: AGHT+IE3doayARluv4buJCGo1gFXhllVuL8rkaKATeR59HGZ3l/xPGTkeTXBDZpVZHKXxV2qHfkVYw==
X-Received: by 2002:a05:6402:7c7:b0:523:3f45:5678 with SMTP id u7-20020a05640207c700b005233f455678mr10703279edy.31.1694525521218;
        Tue, 12 Sep 2023 06:32:01 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:32:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:45 +0200
Subject: [PATCH v2 07/14] arm64: dts: qcom: msm8939: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-7-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1626;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hTGKHTrH0J17CafSs4xXiO5hAXDwGff4qsoi0JWwbnA=;
 b=l+QgN/I9sJ1LySbRwaJMmRSPxHrlPgUlyioN0ie8QDsjFp8u6rYg+lKqT3jjZ7Apm7mhB2dgS
 PSf1efuodKDA5yu/qkP/pv2fKUCJuDLwADDK3n+SXTx671DVTtqp0Da
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 6e24f0f2374f..e3d1eb7dd289 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -581,9 +581,6 @@ rpm_msg_ram: sram@60000 {
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8939-bimc";
 			reg = <0x00400000 0x62000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
@@ -627,25 +624,16 @@ restart@4ab000 {
 		pcnoc: interconnect@500000 {
 			compatible = "qcom,msm8939-pcnoc";
 			reg = <0x00500000 0x11000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
 		snoc: interconnect@580000 {
 			compatible = "qcom,msm8939-snoc";
 			reg = <0x00580000 0x14080>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 			#interconnect-cells = <1>;
 
 			snoc_mm: interconnect-snoc {
 				compatible = "qcom,msm8939-snoc-mm";
-				clock-names = "bus", "bus_a";
-				clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
-					 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
 				#interconnect-cells = <1>;
 			};
 		};

-- 
2.42.0

