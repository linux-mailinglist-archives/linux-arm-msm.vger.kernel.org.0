Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE97B47E00C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 08:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbhLWH4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 02:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239468AbhLWH4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 02:56:52 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9660EC061401
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 23:56:51 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id p8so7765100ljo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 23:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3BDYvh6G6Kwwfj8Ljh6Lxu3/k0dPkOL4LYyEvjC7J0=;
        b=rVF6Tc3/MFHIEUwvtVahS5P3e+/awptOHz3RZwyIk70cgvCtfwkillFGnFcntnCChH
         PpBhj8E+RESx6fdn5Zq2PYmACwNGR4xY2WCB7kC1iHMJAj6YKdtJWU6rmkH+bjrCeIwo
         diwvwrZSvLY5pmnsliODr5gw5w1xcKMPJ9424QsqNaKoTdLfveqSLLYlxUGKbrh56tpZ
         Vd7HEX8oo+tBqiAeDlns8ICxNTNxKko5Bhc7uI7fIcgBZOFT53zSCswEb/d8itW3LqGx
         EWPp4naSasCCDkMHTrNhAj1Ff0Dn3peut4XhAM7YIpS+cbtbQVxGoSuGzQ8byCdSGNP4
         QZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3BDYvh6G6Kwwfj8Ljh6Lxu3/k0dPkOL4LYyEvjC7J0=;
        b=piWXu1mltqIU4vqgKGavCko7E2gsP5t3Akffg98P4eepDndKVgGPnmlt//gJf0yLQb
         QD12XlOhFLWstQ7jOwOw9wm+070f0ZwGR2FVOvzYmRfcMWGPWv4gYbOp3YMNJuo9yTD4
         aCTcvZGDnMcBmIqZRivkJIoQU4XXDouMq84FjvRRe5sIA38rqSM8QMAiNm4mk9Z0iZTm
         skUO3Y78ISs2ZaRm4eEI3LNuoALI2wmj96itaKhl0tcyCPftUd01i0tVWBjIrhz3iXPe
         e+7ZDJ0DfrkkLTKc9LCtesqBu2d9YwUdh+zNUN4dc5dTytnrUKiaEjASZdHFbx/Iuyqf
         EQBQ==
X-Gm-Message-State: AOAM532X8DPVrF5LQ2jMOK8nFauRBF9mmTzHxu4P6qeTB/mOYlRhXGIk
        fdEs+Zivnk73gmxbowxPL8xOew==
X-Google-Smtp-Source: ABdhPJzlbWVgk9B9QJKs/ie+tgQLXVUI3ooCQ6uDo8ydIQyDaZAdM4hWLN94s1P2QoN98Wxyse8e5g==
X-Received: by 2002:a05:651c:198e:: with SMTP id bx14mr935157ljb.370.1640246209901;
        Wed, 22 Dec 2021 23:56:49 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id v24sm433140lfr.30.2021.12.22.23.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 23:56:49 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8250: add description of dcvsh interrupts
Date:   Thu, 23 Dec 2021 09:56:40 +0200
Message-Id: <20211223075640.2924569-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change adds SM8250 cpufreq-epss controller interrupts for each
CPU core cluster.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 5617a46e5ccd..e7d20c55a743 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4571,7 +4571,10 @@ cpufreq_hw: cpufreq@18591000 {
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
 			clock-names = "xo", "alternate";
-
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
 			#freq-domain-cells = <1>;
 		};
 	};
-- 
2.33.0

