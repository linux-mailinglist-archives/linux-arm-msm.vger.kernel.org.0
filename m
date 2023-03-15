Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5B36BA84E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjCOGpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjCOGpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:45:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB2A664FB
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:36 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso704649pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=FVf2FTSfILO2UHWSzQpbbOwX9XGVtNPYf3sQGwWsCbhLx1owqENJG01x56A4l4pePq
         ZF3toElw/ffVYH47vgzD7LVqpNarnQ9VilatNDqpXqs+M1u0rLnCs/6x0e9VIKfQqFmJ
         9DFa3q0P4snEs9pXet9l2fTFv0vQ5WlbsU+teAcpU7qvCBAegOPcnyg0xHtyNGYEU5ri
         upiEnEzX7467BpaBeEX30yYPvH2hjwlc4f6sQJIcbE7DO8vv60+zpjpdrP2ytGwnL+Uq
         dlla1vaxAqI1Zxt9d//1nekyT4tzuE/C9SHrFkRP3elaT4/Bc83FIy0+1Wway8mqv9j/
         Dwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azG6rPTW4OW7MpxRM4BYmIziHm2wpGO0S0WPmax4BIQ=;
        b=1imYpOdqY3OAeWynVlt3kM3CaizFLrHQrioUGVymvM8c7HFEWSePTk2Lmu1JrUj4WB
         w0VoWlaKrqat+nK/SKVHuugGLsVUpN/prJ+Utf6SDQ+G7Sd287GjnZ/qN8cBrb9EhgZf
         Nqt/XkJEq7OOlhJO0xOVGhUAP4kfSOTBfmMIi0a68MkHeFowyD4wM0fvb61pVn+9GZNE
         rQrgHDLqJUkEtsMIxQK7D0CS0PfWibAfrnK63aqBftJSflBQaiRRbGAPAPZpzqOo7ZoL
         Dxn8le6Pq0dfJixbkkT5Ukxwd2wpXkWSBSZiGVS3pB/hD6I8N7t97CF0bZQGJRP7g9xt
         xusQ==
X-Gm-Message-State: AO0yUKWO+61b/u3twPvZXSbj++x9BvGlUtjYpZmUXJPhoh4QZeU7H10E
        PliRrq4t3eHU25dwZUJD10azgwmi2MnfZUf2ig==
X-Google-Smtp-Source: AK7set95vcEC+9NVxnH8GsFnZv4rUTSACOyZVFeTH/qKwYTTLBxI4XNUCPV1Kfbm9qeIwtHnzIENMw==
X-Received: by 2002:a17:90b:2245:b0:23a:6deb:adce with SMTP id hk5-20020a17090b224500b0023a6debadcemr16224145pjb.15.1678862648470;
        Tue, 14 Mar 2023 23:44:08 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a6a8400b002367325203fsm550747pjj.50.2023.03.14.23.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:44:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 15/18] arm64: dts: qcom: sdm845: Add "mhi" region to the PCIe nodes
Date:   Wed, 15 Mar 2023 12:12:52 +0530
Message-Id: <20230315064255.15591-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
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

