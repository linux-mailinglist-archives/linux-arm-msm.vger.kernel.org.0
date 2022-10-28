Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9F36110D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiJ1MIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiJ1MIi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:08:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058FC1D3A74
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:36 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id fy4so12450404ejc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqnPxVy8rWsh7YyVlKpD3T7tk6cWSqxi/9UnPvSPSFQ=;
        b=c2qFwZ7Swf9ZWH7CmeXC0eFOBqRr/0WPLpnz4GQCoBP+OwhEJ3mN6aQBJWTQLYA7tY
         oPhpPb2KoMbbR0J55kElppCaaM8fSd7eQ7YNGkzolJvFSusZD1gsDCVoEUFcYIbDRlev
         QfjWbwds+HZP94T9VYrJlzdMpAb5E9575WfdD8Y0JghBlODKam7O8tWFhy0U5ursWwcL
         dc9P0a2SlyfWP2Bp28/d2uDWr4VvC31ihz+3a2f3CwPcNpjCt+8firo6zAVV9qkqpYzJ
         u8lYCtzVOT5sE36gSzajk8+U/KN+3Z8/Pr4Yn0/tpx5R6tiqnyOWbvv0nQA8XcOaH92A
         Mt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqnPxVy8rWsh7YyVlKpD3T7tk6cWSqxi/9UnPvSPSFQ=;
        b=k764r9lK0BRpO5kO1H/wpdp5h0z84ex/4SdgJbjTFnScg0B2R1C/20vdV2uUWw1dZp
         3UxeV9xUy+1ahqNuU6aD6eXoTKpz4J1hd59pKGV34JE7tO82/iwSUEtMyB/Anw9ve/B3
         pqFguyy9fCg0ZlUufEXYF348VqtIrJrI6O8c0P7Oq07f1yhM89DoR/9aalli8vlRDdbI
         ed5AIqX82myoWWSNz3fpDerj//7hl1gd3St1Mv4atKN7+iH8TYar5rbjSPPTTRAwvFoF
         4FpKScnuke4UI1CoCPenGoTNxngOh94XKzCMMS+ih8/Gbk7FWEuwcTBNK0uP+qle9myM
         c4ZA==
X-Gm-Message-State: ACrzQf3nqINebyU4kNzRPuM+XQRMJBGWo/Iu6tNB9m1pp/RHMMpBZmXc
        teIWY6oDm+IfDoq8wV0FlSuBHA==
X-Google-Smtp-Source: AMsMyM7fLaX+5b8DsmtUlcGiGYlHZfYuymB9Tmb0KD1+oWv1+ntAez6bKv93IOThvK6ZTocD3LASAw==
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id hc42-20020a17090716aa00b006fe91d518d2mr47620699ejc.190.1666958914511;
        Fri, 28 Oct 2022 05:08:34 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:08:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
Subject: [PATCH v1 6/9] arm64: dts: qcom: sm8350: Use 2 interconnect cells
Date:   Fri, 28 Oct 2022 14:08:09 +0200
Message-Id: <20221028120812.339100-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
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

Use two interconnect cells in order to optionally
support a path tag.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 606fab087945..b6e44cd3b394 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8350-config-noc";
 			reg = <0 0x01500000 0 0xa580>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		mc_virt: interconnect@1580000 {
 			compatible = "qcom,sm8350-mc-virt";
 			reg = <0 0x01580000 0 0x1000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		system_noc: interconnect@1680000 {
 			compatible = "qcom,sm8350-system-noc";
 			reg = <0 0x01680000 0 0x1c200>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		aggre1_noc: interconnect@16e0000 {
 			compatible = "qcom,sm8350-aggre1-noc";
 			reg = <0 0x016e0000 0 0x1f180>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
 			compatible = "qcom,sm8350-aggre2-noc";
 			reg = <0 0x01700000 0 0x33000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		mmss_noc: interconnect@1740000 {
 			compatible = "qcom,sm8350-mmss-noc";
 			reg = <0 0x01740000 0 0x1f080>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,sm8350-lpass-ag-noc";
 			reg = <0 0x03c40000 0 0xf080>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		compute_noc: interconnect@a0c0000{
 			compatible = "qcom,sm8350-compute-noc";
 			reg = <0 0x0a0c0000 0 0xa180>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
@@ -2420,14 +2420,14 @@ usb_2_ssphy: phy@88ebe00 {
 		dc_noc: interconnect@90c0000 {
 			compatible = "qcom,sm8350-dc-noc";
 			reg = <0 0x090c0000 0 0x4200>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
 		gem_noc: interconnect@9100000 {
 			compatible = "qcom,sm8350-gem-noc";
 			reg = <0 0x09100000 0 0xb4000>;
-			#interconnect-cells = <1>;
+			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-- 
2.34.1

