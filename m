Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4178F338553
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhCLF2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:34778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231511AbhCLF2N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:28:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2267364F84;
        Fri, 12 Mar 2021 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526892;
        bh=kx0e/nkHrvuAw8BXYQ1q5L6tg/hUuMwxxsJH6ZjKDfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sKyJE9wmsPC91wlP49jd9Qasdx1j9EIyBrwF8Ab0R+DZmMPy2xVat0krHbVKLNSwF
         AmnuypQxMd6R9hv3ZeASlrRzaO9WNwOwiYT+RzAZQkdQpWrPlsS2iHkrs6iaxyuqT7
         E9LtVXWGsxQBvozFx+KCz32KzVEThJLd90h/O1tXhRvNrdWPoqvB6t+xWCY6t1oe0m
         IN5ifos17xumgdxmfLN43mgVbZxuWEWP9uW4aV1E+7rAobyMbG6lqmx6EhFuG0MaH5
         X0dW1ad/uDDkcbKjj++pv2pBLN9y6heN2WpcW6BPmQoipxNr6pFjJQWhACDQJkIuVJ
         UmConV6kkT8Zg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: qcom: sm8350-mtp: Add PMICs
Date:   Fri, 12 Mar 2021 10:57:37 +0530
Message-Id: <20210312052737.3558801-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350-MTP features PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
PMR735B. PMICs Add the dtsi for these PMICs to MTP.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 98a517edd442..6ca638b4e321 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -8,6 +8,12 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
+#include "pmr735b.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. sm8350 MTP";
-- 
2.26.2

