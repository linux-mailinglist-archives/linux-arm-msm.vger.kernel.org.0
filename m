Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1790E6BC8A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 09:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjCPIOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 04:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjCPINi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 04:13:38 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D52AB4204
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:13:01 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id a2so892928plm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678954364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=LXCy3/68yfGlI4UKZS89Aih1UutWoa9bN94wKp+vONYqH4ynGGOUgKjbnhXBt/okiF
         RtyRJxHDBkVd73Sbh8/4zxp+8ePflXlz1PXJbkoh5edqKFyegdiMYx1Xymr9ZojQaqbq
         3ZGUXMWqnomgup9gAvRbi8JhsYAHGryoGYISDsfmKsNG1immAVaHhdIUdaS7ilk32QLq
         AvAE6VMNjTm00k69is76gSBUKlgSXNQqi7/DN9QgE5HXdasm7M9PQS5kg4JpnoxgXZo5
         5Tdxa0e4d2Fv2cW7nUB+xWHQVPiE2696QCxnzBiLwKqeAbawaD92PyBUojRaOPy9QFTr
         Cgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=lqHUa8jnsA92b/b4l8d5yA+3Hibmx0LhMDOR20G2q4VDu8+CSy7RKug2jFHRWJZRPD
         VRitqi5Eybpe8xCCdKnrbTddJWSHwGZAmUvY0Gtt8hlxjMbJkuclZH7wwCZFHDWUi/zX
         25Vh/u/WAcJ0mGaR1aGY02K8Jz7rFGsN7kSqiKUDqFNa3HV/vsDzwoAayBTvxuwMBfIA
         cX0VvhoSrytCi7VXjdSNknrp4XxGQfgopDPQ6js8/8ze5pNEx0BopNa1Y7BK4sGFMyiJ
         6t0Vj3aUqMwc3mFJDT7ImpyByYcQou97gHKTV0r39DQFFVz9fyxnXrscfKUT6Z+7MIRD
         eCgA==
X-Gm-Message-State: AO0yUKWl9snHYmr3r5Z3oCGkyJD+hYVd/PDTNogEqt4e6lHtoLZ0LS8J
        6omh4ypIi/+6gL3hssBODQ7P
X-Google-Smtp-Source: AK7set+PcbIlK8K31rlQMA/Sj0+PzkUG4C29kmo7uq0+s3PXw9tmlfNRwxOBk7N8ik9yH5otRUEREA==
X-Received: by 2002:a05:6a20:929d:b0:c2:b6cf:96db with SMTP id q29-20020a056a20929d00b000c2b6cf96dbmr2100410pzg.39.1678954364120;
        Thu, 16 Mar 2023 01:12:44 -0700 (PDT)
Received: from localhost.localdomain ([117.207.30.24])
        by smtp.gmail.com with ESMTPSA id 13-20020aa7910d000000b005d9984a947bsm4804422pfh.139.2023.03.16.01.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:12:43 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 16/19] arm64: dts: qcom: sdm845: Add "mhi" region to the PCIe nodes
Date:   Thu, 16 Mar 2023 13:41:14 +0530
Message-Id: <20230316081117.14288-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316081117.14288-1-manivannan.sadhasivam@linaro.org>
References: <20230316081117.14288-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "mhi" region contains the debug registers that could be used to monitor
the PCIe link transitions.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..46caac9acc95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2282,8 +2282,9 @@ pcie0: pci@1c00000 {
 			reg = <0 0x01c00000 0 0x2000>,
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
-			      <0 0x60100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "config";
+			      <0 0x60100000 0 0x100000>,
+			      <0 0x01c07000 0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "config", "mhi";
 			device_type = "pci";
 			linux,pci-domain = <0>;
 			bus-range = <0x00 0xff>;
@@ -2387,8 +2388,9 @@ pcie1: pci@1c08000 {
 			reg = <0 0x01c08000 0 0x2000>,
 			      <0 0x40000000 0 0xf1d>,
 			      <0 0x40000f20 0 0xa8>,
-			      <0 0x40100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "config";
+			      <0 0x40100000 0 0x100000>,
+			      <0 0x01c0c000 0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "config", "mhi";
 			device_type = "pci";
 			linux,pci-domain = <1>;
 			bus-range = <0x00 0xff>;
-- 
2.25.1

