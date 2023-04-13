Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7546E0CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjDMLfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjDMLfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846B510DE
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:12 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id s2so10624682wra.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385692; x=1683977692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCwho3uKk5QmWh01Wmw4tEPLfVlhN7/orLWF0pBPcCs=;
        b=lyWdFTy01zdkKIAMhd86VlRGtmuUXbsZaaNgoqXONatOnpkIQqrwx3fq1Zq3Q/LGiV
         aSPaRa0RgunwdGhFfkBRgAMIiLjT+1s4R++qnrPfZe5yWNaWa3SoWIGjcPs8WJsWk9QS
         XMWNy1U5bAPInGmmv4PAzcgk5JSmJC483X8QERIOd+O8/+VSJ4JB8cXgEEPm0s+64WW4
         XLIiR2VnpYcWfA39ooQctexKQ2tI1Yv6x09DJcPr7zjkXtniZWe4zbi1pDPIKOt0I8LT
         FHpFwbp/7yAnTses/hWQb1xtMf/cU9wBsgNykAHSVw8ubdpR3h2VEIjLGlmG0dFwxZVs
         huhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385692; x=1683977692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCwho3uKk5QmWh01Wmw4tEPLfVlhN7/orLWF0pBPcCs=;
        b=Ol8nYAoYuj5h9K8Aj2KpUtBvhRNdGu4bJShHAU1iSaaWENRxgAFBPaQHG9yzr9j4Gv
         +cwj2tV9RAAUS3KOTjiRRI6OZ1CRbbr4iEq5ym4H7hf6OPqkte6OoqQGBNdwZAm0xSLb
         V4sXZ8JutKaSDLtJu04NldKlE0s/g5PggttyUTXPTvpE95p/040m2kSHmtww6LmhR6cF
         Yj+vz9BSdQWAxybTpQlbO5nGzyzLh3wTxyYwE/xl4y15tJAONsluPdLOkeHPFpDEVMZO
         h2s3aazlfBXWqB09g9c+G1/Y1dJe713A/Z60BmiaEV0LSMy42SK7olD0K/0gfFnY4VPC
         JhJw==
X-Gm-Message-State: AAQBX9etB/k3LFLT2oESJ8bPucr2iTnCPPSKsMDSqTXlo2pWn3R4H3sp
        mQXrFBQO5Dc5hghO9tu7kp/KEg==
X-Google-Smtp-Source: AKy350aibB5/j9eVHZeBgBpIaf3ugOadiXWSdOLIfX4YNuZMSvI8W0y/9/K9Vi56roeUSEzkgX7+7g==
X-Received: by 2002:adf:eb8b:0:b0:2f4:8e52:b603 with SMTP id t11-20020adfeb8b000000b002f48e52b603mr1306008wrn.64.1681385692639;
        Thu, 13 Apr 2023 04:34:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 09/14] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Thu, 13 Apr 2023 12:34:33 +0100
Message-Id: <20230413113438.1577658-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on VBUS for the Type-C port. We need to support a higher amperage
than the bootloader set 2 Amps.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dd924331b0eea..b326bdeeb7742 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1338,3 +1338,9 @@ &qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
-- 
2.39.2

