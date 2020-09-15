Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E9B269F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIOHNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:50 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:15401 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgIOHNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153984;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=depHl5avfj1DyAbaZz1neJW4aRTrMc6PE9PRsNW/t4Y=;
        b=thEtUptP4eZKJm5q7ImsLzQ8huWKU9omuEVIGTkBT+9OkQ2Rz+D8mh34msMXMjJLbF
        vPATx3kEqPnHtTd3wNwKyBpowUQvmvm+MAWRDDbF/QjvRq1Txz6MbXwT1zngaURzNmlE
        0LXWA3S/RtBFu7Ij6CGN1xk5nnbqfYvDaE9XHVSgfKB3AXU8uh+x2CUHS5UcjWithvvI
        KxA9PRSBX8789aGZEaQhz0Uumn1fZr0bU/0jqBtFuc1AlwC38WFqMu3Fl+aoUPQOVKt8
        5pl/OMOeKS/XSiLVz2wNsy/SLY/UzJJJ0eVCMwUF7WzKFTLaLB4gnZ0UdFTAkr0Sbkgl
        +fUw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D2rdx
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:02 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 10/14] arm64: dts: qcom: msm8916: Rename "x-smp2p" to "smp2p-x"
Date:   Tue, 15 Sep 2020 09:12:17 +0200
Message-Id: <20200915071221.72895-11-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows grouping them together when sorting nodes alphabetically.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 4444d068343c..47f01e206255 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1829,7 +1829,7 @@ rpmcc: clock-controller {
 		};
 	};
 
-	hexagon-smp2p {
+	smp2p-hexagon {
 		compatible = "qcom,smp2p";
 		qcom,smem = <435>, <428>;
 
@@ -1854,7 +1854,7 @@ hexagon_smp2p_in: slave-kernel {
 		};
 	};
 
-	wcnss-smp2p {
+	smp2p-wcnss {
 		compatible = "qcom,smp2p";
 		qcom,smem = <451>, <431>;
 
-- 
2.28.0

