Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE49F32C153
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244863AbhCCV2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352280AbhCCDcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 22:32:54 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5678AC06121D
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 19:31:27 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id q20so15272784pfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 19:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+0F+pGitTgwubWfG1pa09cZYXP+gzbeba4SznEWwqGI=;
        b=NxviuoedHqex1136fXmzceOOH1rLLDrZKHeclScAeylCEzqGB6HNwfHBLw+VRSNWKE
         w9LyE+UAP79zJPoq/6XzaJY61r86/ZzpLuy1c9H0Vhjx3EfeKAbUZYaZciNMwfWNf8Vv
         jMr1X72Fpznz/NB53A1Mfdiq+wBBASamhhqg/HrxSUInvWRHCK8hPdlwnm3gtP30lKWi
         BTc8zYoBhkxDKXwnQ89aDbWDv5hyae5xbqvIP9BCsr0FlOQxNMLXfXz+aHn0YqLwlyae
         Q0JKkG6eFj4iMPrGgNudgSZPuCuFAFy6Zloj5LMSUEbR/YxEFM8QXwx9HaTySPEip6SY
         thkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+0F+pGitTgwubWfG1pa09cZYXP+gzbeba4SznEWwqGI=;
        b=jcbWhiRGtoo6usT1XJKpyE1dAZp84i7mi196qFLmV7oZBqm7f5Y0BLUhE0/ozy+07B
         BmizRN5Y3GNdwBEFz4EEDBKtiH4lApLqsBySsAP7pa4OMISHcYeySu90M4akANPWLX+7
         /466gRq0ejS/K0xMWpfuIdM6c5yBoodvD6geeXyRv4bXW4J35u9yTLo0DIWbZsxzIwwV
         4gnrKYjuySqjyTNeMY9ysw0S7qTP4pRnKyPsXR4COVQ1AwQo5/FgalHBdezPIJQySMQE
         YhsiyqwCjrv51ZNi+FQ0yUVmwZYXMB9USlc//tc7B5uz6xPqaV4FVYCp7zFHqmrqMuYF
         t0YQ==
X-Gm-Message-State: AOAM532bwUZxLW+CR+mC5RsrMSBZWFRPuSxQ7PXzqVEuchSJao+JMrUR
        yqDOgkrPtswuYfIEJeoQJKCQ9w==
X-Google-Smtp-Source: ABdhPJznP8usQoH+CSTZzZ7Cbg6it5ya6bVS9YOZmFL7I1t4ENQgoxl77nM/aFPWJzl6dz1yh27qmA==
X-Received: by 2002:a62:6444:0:b029:1ee:67c6:a169 with SMTP id y65-20020a6264440000b02901ee67c6a169mr15389830pfb.47.1614742286942;
        Tue, 02 Mar 2021 19:31:26 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm16057511pfo.2.2021.03.02.19.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 19:31:26 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'
Date:   Wed,  3 Mar 2021 11:31:06 +0800
Message-Id: <20210303033106.549-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303033106.549-1-shawn.guo@linaro.org>
References: <20210303033106.549-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The last cell of 'gpio-ranges' should be number of GPIO pins, and in
case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
than msm_pinctrl_soc_data.ngpio - 1.

This fixes the problem that when the last GPIO pin in the range is
configured with the following call sequence, it always fails with
-EPROBE_DEFER.

    pinctrl_gpio_set_config()
        pinctrl_get_device_gpio_range()
            pinctrl_match_gpio_range()

Fixes: b7e8f433a673 ("arm64: dts: qcom: Add basic devicetree support for SM8350 SoC")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5ef460458f5c..fab211298c35 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -382,7 +382,7 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 203>;
+			gpio-ranges = <&tlmm 0 0 204>;
 
 			qup_uart3_default_state: qup-uart3-default-state {
 				rx {
-- 
2.17.1

