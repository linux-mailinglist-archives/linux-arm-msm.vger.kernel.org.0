Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD78255583
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 09:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgH1HoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 03:44:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgH1HoB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 03:44:01 -0400
Received: from localhost.localdomain (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3868820776;
        Fri, 28 Aug 2020 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598600640;
        bh=v9mWH7zlHRqcHIGa1924zsThVWJeNyD5f15ay8z5SrA=;
        h=From:To:Cc:Subject:Date:From;
        b=LL2aSIH6DgkNiVVSR+8x/62AO6u1WvctR5jlLT3RFhStipeSneP3vua7mU/tWDBxx
         oFaEaYQCKyL9Pz6RjdxVVNNaHhFS0tkdwIkh3eeLcdBljsOiB7B19L0wvxVT9lsFgq
         04+kLlX+3tkz2pLfRcYkViv0qIIRPzEEewNEMB6s=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: Fix hdmi nodes
Date:   Fri, 28 Aug 2020 13:13:47 +0530
Message-Id: <20200828074347.3788518-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per binding documentation, we should have dsi as node 0 and hdmi
audio as node 1, so fix it

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: aef9a119dfb9 ("arm64: dts: qcom: sdm845-db845c: Add hdmi bridge nodes")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2a98680ccf5..99d33955270e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -451,16 +451,16 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				lt9611_out: endpoint {
-					remote-endpoint = <&hdmi_con>;
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
 				};
 			};
 
-			port@1 {
-				reg = <1>;
+			port@2 {
+				reg = <2>;
 
-				lt9611_a: endpoint {
-					remote-endpoint = <&dsi0_out>;
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
 				};
 			};
 		};
-- 
2.26.2

