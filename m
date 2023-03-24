Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34416C7575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjCXCRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjCXCRK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:17:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65C32A175
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:16:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s8so377725lfr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP6HJzbfWnQbZnYaEveTm/r1Hf4YsWx7DZ0mbC++Obg=;
        b=FA2e38fuTp65A89LUD3ceqdSUpB/MVp9EibzfMV5H+byVtUmw0d97DH8k81av9aXEr
         TkxmemOULvdRlzdHOSNssPwFRM/yNzmhZQ35UtaRKTvIGtsii0+jWhlboD9MVafCWDMy
         UlcdZ89Ez3t04aCU7WYl3HUdIAtLO+gfMryaDNjQCAF+rNPCOLUAipZVUNmq8/gPqVVa
         tRVBUB7RDHLCXFETSqRnhnkd6dQc7jPhnKl3Oig4Rnql1rUZxKya++4JlIkqfdxkgyUs
         Ve0gKwm7F18lHFKYNCM8TzwleByQ2Pasg8vbA3WebfWKSJfhVnlJxp6X5PX8kSCOsYir
         0j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP6HJzbfWnQbZnYaEveTm/r1Hf4YsWx7DZ0mbC++Obg=;
        b=NQpGXJ5rL6b1ibZ/yRbXaNeDlpMeHOxMoP3HVWHCzg+BZkJOCF3wguKpkTn0YkZb18
         EggeS9yrQ15kkhaspsSAxucrYZqiQ/5gHbcPJSsjRcrIF//UrKB+4Qv+JB06VVFhaUny
         TKCu/3BtLdEVjErSPNPp2ocyqB2EgJ68S02LFd5Xn1lr/3HU7kH2QMk5UfwMbbaMfEXr
         PJKKGb3r8XpSAODsdn1361sECgmoTfKl7Jcd6VYS0WCBtSjfQLvrNnVaiG9NrPWt7U8z
         4lpkM1tfhgDLeFIiiGjM3MapYNw1RENsFoiANwrP+XNu1tRXyrCJaq6DkLco26KeD25H
         Yg3Q==
X-Gm-Message-State: AAQBX9eFov/0yw4rYa+ZDaf6mWJ3MINloWVduqLO2bVYnxLpnyPNTgqg
        yHLsyuzVqIyC0qZ1HLv4Qnu0PUrZ09WTcMExOV+UKg==
X-Google-Smtp-Source: AKy350Z6zo5UgN2oFSDvcANG+uSeaVcEr9PKHk2hxJDNpFBparDrvW4pJA2KG22Ls4OFDrBmh/QQPQ==
X-Received: by 2002:ac2:5d66:0:b0:4d5:a689:7f9d with SMTP id h6-20020ac25d66000000b004d5a6897f9dmr182419lft.57.1679624212953;
        Thu, 23 Mar 2023 19:16:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ac07000000b004e846175329sm3148330lfc.202.2023.03.23.19.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:16:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
Date:   Fri, 24 Mar 2023 05:16:50 +0300
Message-Id: <20230324021651.1799969-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct PCIe PHY enablement to refer the QMP device nodes rather than
PHY device nodes. QMP nodes have 'status = "disabled"' property in the
ipq8074.dtsi, while PHY nodes do not correspond to the actual device and
do not have the status property.

Fixes: e8a7fdc505bb ("arm64: dts: ipq8074: qcom: Re-arrange dts nodes based on address")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index ca3f96646b90..5cf07caf4103 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -62,11 +62,11 @@ &pcie1 {
 	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
 };
 
-&pcie_phy0 {
+&pcie_qmp0 {
 	status = "okay";
 };
 
-&pcie_phy1 {
+&pcie_qmp1 {
 	status = "okay";
 };
 
-- 
2.30.2

