Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E084FBB72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 13:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243906AbiDKMA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 08:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiDKMA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 08:00:26 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF90843AF9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:58:12 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q14so19737060ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uvvVhqyyHmf1hZGyDCQIrUCgAmx1cFxWmc0Lj4nO0C0=;
        b=OA3pod6FZWwbmIVbGgBKWDR2SGX8qf2mVFnzXMXcFtp8OBsDtzYSvhu7zkrZJPeiDT
         Mgl1mjl5OR1HtZY/FJDZakszYtFYP0gbq0uk4PKp21hVTCon5leNrl1PS5VfoS/LkK13
         ltKoSqq/H5hErQVgSEEmAP5eXBObf5XLzOW9u/y712lsScAXkMDYNDECToyUxoPT9GTh
         /2sbP+R+rvtvvw/X3n4ZD+i7Qj73hjhPHB2StZkg/rOdsjSjHdZ5Wl2gt+HjPABwrWWv
         QnKAGAxdCDleNA4gNq8A+5NIHdcn5OIxsH6Z2HI6V4gXZ5TAGlgSKIe1+NbvUl897RkF
         ss3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uvvVhqyyHmf1hZGyDCQIrUCgAmx1cFxWmc0Lj4nO0C0=;
        b=VP6pJwAICBcXBZ128CAjlN43RXk0sOAZ8Y4QKkIVv8scKsBdA0hGtrmzjTZ94CDvYx
         WFRm3Q+xbx4gC0l5ixiZiJkS6qCSP0ZjOUsMBNyjVATq3IttRZ1c6GJbERfYnMZioeWp
         JtK9uuNm1gA1g8zUtIsLizx5k4xsZ4z+/VBu6skkEyzi23QrCDTLIdZM0K1Y2nRfDwvJ
         rTgrGw4gbe5LEOOmtn3SJA1dyHr0abaKTJvcr78TA7b/QOjX2sFKNcfssuf/4deXf8Nv
         xvo8RAmohQiw10aXfGXxUaXpOR5L8O02imY8GipwPvzVOJ4wZs6U4TliNZB71n0SMFSA
         Xfpg==
X-Gm-Message-State: AOAM5313SR0kuwRiC3MROIZf6BEC2FKeYXbPExjePd0OVZ5zUXA6yPVe
        la3CjKQg7jY7jY6rOQ7FzhlOug==
X-Google-Smtp-Source: ABdhPJwXH43OtJvizluQwGgTDeqlT5lC9sk5Y7EOv5yCC/eONoN+dNYKCy7fWwSos/PtyD3kkYSo4Q==
X-Received: by 2002:a2e:4b1a:0:b0:248:484:b45c with SMTP id y26-20020a2e4b1a000000b002480484b45cmr19704778lja.419.1649678290935;
        Mon, 11 Apr 2022 04:58:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p7-20020ac24ec7000000b00443d65ea161sm3314171lfr.291.2022.04.11.04.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 04:58:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845: remove snps,dw-pcie compatibles
Date:   Mon, 11 Apr 2022 14:58:07 +0300
Message-Id: <20220411115808.1976500-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SDM845 PCI controller bindings are not compatible with snps,dw-pcie
binding. The platform doesn't provide second (global) IRQ, it requires
additional glue code. To prevent it from probing against the dw-pcie
driver, remove corresponding compatible.

Fixes: 5c538e09cb19 ("arm64: dts: qcom: sdm845: Add first PCIe controller and PHY")
Fixes: 42ad231338c1 ("arm64: dts: qcom: sdm845: Add second PCIe PHY and controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d7ba15591987..cab8ec0b9cf6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2027,7 +2027,7 @@ llcc: system-cache-controller@1100000 {
 		};
 
 		pcie0: pci@1c00000 {
-			compatible = "qcom,pcie-sdm845", "snps,dw-pcie";
+			compatible = "qcom,pcie-sdm845";
 			reg = <0 0x01c00000 0 0x2000>,
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
@@ -2132,7 +2132,7 @@ pcie0_lane: phy@1c06200 {
 		};
 
 		pcie1: pci@1c08000 {
-			compatible = "qcom,pcie-sdm845", "snps,dw-pcie";
+			compatible = "qcom,pcie-sdm845";
 			reg = <0 0x01c08000 0 0x2000>,
 			      <0 0x40000000 0 0xf1d>,
 			      <0 0x40000f20 0 0xa8>,
-- 
2.35.1

