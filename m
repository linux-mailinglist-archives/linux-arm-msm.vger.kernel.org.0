Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399836B8A88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 06:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjCNFiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 01:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjCNFiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 01:38:06 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC8181CE3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:37:50 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id ix20so8911634plb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678772270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tE4o5E5NxTGWs0FFcIpd5GaMpz3q7yKukVUL4nRPNs=;
        b=wmJqBLe3PPzAtxKqvtVbRBPMaWvTNHEiPth7RWQgJ6zLBaUAo27PEc0oVrbGavD4dg
         AfMSFVO+t6s1kScrp/8cp6dCvU41Dckn9S83/o3f6tTMsDANGYlEevDegEjHXPgg6O6P
         543ezXPnfrkENqcb+YmM1OpdXpyZw0u4EEIqjlBTpzn1IqHD7vFiHiLKMVAsLWKCOMzb
         w9zJOIloYL7lIkHmOuYninQuszhZ/PxkNwBArQt2KZmVxrCQgyp7Grkstfo7BiAOi0Jw
         Iyg9VsspxkJNc1wo64rbpjPI9UPa9wReMhvasEmnv2pSF0jvwRlvXxHTViyOtVCt4jPN
         xfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678772270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tE4o5E5NxTGWs0FFcIpd5GaMpz3q7yKukVUL4nRPNs=;
        b=V0sAQ4BxJI8KYh3Y4WtfbBzbV17qquhOzEdfNlcSzSR77Ynbzz3CQts9XR0CxXGeRb
         0AnRoWFl1oc4kPkck7miXWvFzmpXDhrn+AX/imOuHKytPp4yWBnAZQfU5lwcrdMX44ns
         J3D+4NVozuh9TdYiU29ZjUB3A8gwBfYa12gDIWsiDy/VYPUIcIdcP1vywffyPeaEluvt
         9qUHXS/DzeFQayvQCx+m8lbpu3DFAX5VyOxqCf1PB17mYrVINkZ+b1y+fuhLnQ9rc88B
         8Lw3tc2k2Eqq6zhSYwK5P/6VIxamWl5cidfaScoKiMY+voaHRwjkORVfo7UgYsOQwtwW
         LlBw==
X-Gm-Message-State: AO0yUKW/WyBE+S1z4H5HzwKE9N8m+84msGrfsYW+WXc9o3CPM1E+7fXp
        pF1f2gtEFGo57HE6yT0Q5OPy
X-Google-Smtp-Source: AK7set9lm+DL6YRwlqTJ2wxLFWg+WceL5BW8szf1VrZB3F06Rft0TKUcBhKSr5enb66she+swDtD8g==
X-Received: by 2002:a05:6a20:8f09:b0:cb:cfb1:5009 with SMTP id b9-20020a056a208f0900b000cbcfb15009mr46167648pzk.34.1678772270021;
        Mon, 13 Mar 2023 22:37:50 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id n126-20020a634084000000b005034a46fbf7sm675093pga.28.2023.03.13.22.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 22:37:49 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 03/13] arm64: dts: qcom: sdm845: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 11:07:15 +0530
Message-Id: <20230314053725.13623-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
References: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SDM845, the size of the LLCC bank 0 needs to be reduced to 0x4500 as
there are LLCC BWMON registers located after this range.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..3bf95a12ebb9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2192,8 +2192,11 @@ uart15: serial@a9c000 {
 
 		llcc: system-cache-controller@1100000 {
 			compatible = "qcom,sdm845-llcc";
-			reg = <0 0x01100000 0 0x31000>, <0 0x01300000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x01100000 0 0x45000>, <0 0x01180000 0 0x50000>,
+			      <0 0x01200000 0 0x50000>, <0 0x01280000 0 0x50000>,
+			      <0 0x01300000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

