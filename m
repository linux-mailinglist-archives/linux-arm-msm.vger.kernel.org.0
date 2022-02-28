Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF8B4C6C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbiB1Mbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbiB1Mbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:31:38 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B38C74DE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:31:00 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id p8so11010472pfh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/XNuiNwtu02wRy/TRgkyFviYDIYxqmuWsetEjULcyA=;
        b=UQNYW2DOhP2WdiWZJWQx2ANfdBvGIp1SDU1WVliAYBh528aOBZFG7XtI+3d7+pWVFL
         JfzUAJesEKOi+QYCPLoXHM7iStlS+JgLcrif0UZlgK9qfbD6m3H9wvz51VIbBpXGrHPn
         P0ubW216hkIT0rtVPHMavwdWCRi2j8W6O8Ei3ojdEtQnWV/oTfXigkHd65oONNykU91I
         /vkzz/a1ejmF4P7zYOBNTrh++xznalszt/kEJmrTN0/PS+Jdy1f6TB71Qhst7gaOkpzk
         Ld935w5Suo/Gz1Q3Qeg5NcZL2NEWoWAXTc2a2b33wQH8HCOQPlTrQvBzD4hPcWHoee9B
         VoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/XNuiNwtu02wRy/TRgkyFviYDIYxqmuWsetEjULcyA=;
        b=CO+v2Msvred17+a9HTXzCoBC7K8sHs4h3PPS6WNwCAU+EKECofhhZtqwGfO1sOegyF
         MLssTg4FdJbB3XUZw21UGmM1HgjDfaQ0m7qx+hhudqhGEyRQ7sdFBskrwz1Gl7qlLyCt
         DToi2kbK8ENO0S7KOKOI+6SYjJ24Q8/lzcCtFjC3pYbzGjjHZUhzPvYFOUih8bufLKJC
         juOIQ0pLWvk6NdxOUhZtZ5sI+56WB5O1uZx+/GTY8ll57+hzGRQaZSSSgFD26883zj0Z
         68eG7byz6f8bFDA2P/XSLe6nmuKDsZEEhCXmNsGkHFZMuq/MM6IDjrVWrUWCIDjg0w6X
         pWSQ==
X-Gm-Message-State: AOAM533/HP2Bflq1Rfou19Yjs4Ngi8FTR7MMg1GLveHco18Q+ToWtD+4
        IbPe8b46B8uXbqz9vppDl9CBnXc+BD9HhA==
X-Google-Smtp-Source: ABdhPJw4ud5qguWt5MFUYQI9Ef4BnXs5p1195d0g+KmVLDjkH8eapfKBg2CmtI+UYIARcs9MLqHvfQ==
X-Received: by 2002:a05:6a00:d4c:b0:4e0:27dd:37c1 with SMTP id n12-20020a056a000d4c00b004e027dd37c1mr21536386pfv.86.1646051459367;
        Mon, 28 Feb 2022 04:30:59 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id f7-20020a056a0022c700b004f0e9d686dcsm13790001pfj.137.2022.02.28.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:30:59 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 6/8] arm64: dts: qcom: ipq6018: Fix qmp usb3 phy node
Date:   Mon, 28 Feb 2022 18:00:17 +0530
Message-Id: <20220228123019.382037-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
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

Fix the following 'make dtbs_check' warning(s) by
using phy@ instead of lanes@ and by moving '#clock-names' to
sub-node:

arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml: ssphy@78000:
 'lane@78200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 66ec5615651d..ad7914e49532 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -674,7 +674,6 @@ ssphy_0: ssphy@78000 {
 			reg = <0x0 0x78000 0x0 0x1C4>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			#clock-cells = <1>;
 			ranges;
 
 			clocks = <&gcc GCC_USB0_AUX_CLK>,
@@ -686,12 +685,13 @@ ssphy_0: ssphy@78000 {
 			reset-names = "phy","common";
 			status = "disabled";
 
-			usb0_ssphy: lane@78200 {
+			usb0_ssphy: phy@78200 {
 				reg = <0x0 0x00078200 0x0 0x130>, /* Tx */
 				      <0x0 0x00078400 0x0 0x200>, /* Rx */
 				      <0x0 0x00078800 0x0 0x1F8>, /* PCS */
 				      <0x0 0x00078600 0x0 0x044>; /* PCS misc */
 				#phy-cells = <0>;
+				#clock-cells = <1>;
 				clocks = <&gcc GCC_USB0_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "gcc_usb0_pipe_clk_src";
-- 
2.35.1

