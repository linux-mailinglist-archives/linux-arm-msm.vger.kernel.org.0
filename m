Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F254B301495
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jan 2021 11:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbhAWKpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jan 2021 05:45:24 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:49512 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbhAWKpY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jan 2021 05:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611398676; bh=nNig1wsMtDRJMUEXSq3QZYMxFydCeLaGA3yt4uND37Q=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=edkNrN2aM/5h7b0xsBZRlqmExJG+tK50TBu49DnkBx9A9H0ybqjwt/Z5s6M26bqd1
         F85MvnasaB5tt9L09kMT4upb+xwEhYsrQyQsX21Iy9U5cyuxwHCtygxoVHf4nCJU6P
         8yo1uXWeTHTINxSGapic8hI2wMihW3ReKAL0i3/Y=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sat, 23 Jan 2021 11:44:36 +0100 (CET)
X-EA-Auth: 9q8yNSchJIdYU+iW7B2awtAIZlb9jt+7sW6wZeUEjq5dVhtUu+orVpcnEDHn1wHsb5DXycevENO61fUx3QoJAnssuRU/c9w+s40l3sCHslg=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH] arm64: dts: msm8916: Fix reserved and rfsa nodes unit address
Date:   Sat, 23 Jan 2021 11:44:16 +0100
Message-Id: <20210123104417.518105-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix `reserved` and `rfsa` unit address according to their reg address

Fixes: 7258e10e6a0b ("ARM: dts: msm8916: Update reserved-memory")

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..d25f6dc751e9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -56,7 +56,7 @@ tz@86500000 {
 			no-map;
 		};
 
-		reserved@8668000 {
+		reserved@86680000 {
 			reg = <0x0 0x86680000 0x0 0x80000>;
 			no-map;
 		};
@@ -69,7 +69,7 @@ rmtfs@86700000 {
 			qcom,client-id = <1>;
 		};
 
-		rfsa@867e00000 {
+		rfsa@867e0000 {
 			reg = <0x0 0x867e0000 0x0 0x20000>;
 			no-map;
 		};
-- 
2.29.2



