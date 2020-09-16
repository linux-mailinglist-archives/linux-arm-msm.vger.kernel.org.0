Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BE726C928
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbgIPTEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgIPRsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:06 -0400
X-Greylist: delayed 625 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Sep 2020 04:14:26 PDT
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69643C0611BD;
        Wed, 16 Sep 2020 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254260;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jiyYMYZZNIoZ7veBFmVpfgQHbhhTN+QDRt6ZYIRb/ZI=;
        b=LBpMMN1198j+Utnu6y7plHoZ4aBh94yChIZh8LR9kAIH8UAZiJV+2uM6jFoiV9ivV1
        S+O0nJwpwNqOWIpqF3eWc1krI73NiRzsJGKLDrZ1kQYCWAGj4xx1QhYPNZYfgXalsu8W
        4oCLQDyLz3YShizg8RI4YN6bTzrQWXo11UEl7hxypXrI0KXfJmqTip3T9aQq/P51C9Ca
        NpnYuZx9triBsNBQkx40UycgWSgvovTbqnlxlVaOayJlHDLJlHNhq5JUaVRRevSp8e23
        ALgdHGloFbifrviwPDARe+HT3X1JK1S4zrUsFJC6ODBFiy8xdA4BROnqW4odnMfu8CP0
        qSew==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfrzlU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:53 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 07/10] dt-bindings: remoteproc: qcom,wcnss: Deprecate regulators for PDs
Date:   Wed, 16 Sep 2020 12:41:32 +0200
Message-Id: <20200916104135.25085-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far we have been doing all proxy votes by voting for raw voltages/load
through the regulator interface. But actually VDDCX and VDDMX represent
power domains that should be preferably managed using corner votes
through the power domain interface.

Document that those should be specified as power domains for
qcom,pronto-v1/2-pil and deprecate using them through the regulator
interface.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/remoteproc/qcom,wcnss-pil.txt    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index d420f84ddfb0..cc0b7fc1c29b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,14 +34,25 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
-- vddmx-supply:
-- vddcx-supply:
+- vddmx-supply: (deprecated for qcom,pronto-v1/2-pil)
+- vddcx-supply: (deprecated for qcom,pronto-v1/2-pil)
 - vddpx-supply:
 	Usage: required
 	Value type: <phandle>
 	Definition: reference to the regulators to be held on behalf of the
 		    booting of the WCNSS core
 
+- power-domains:
+	Usage: required (for qcom,pronto-v1/2-pil)
+	Value type: <phandle>
+	Definition: reference to the power domains to be held on behalf of the
+		    booting of the WCNSS core
+
+- power-domain-names:
+	Usage: required (for qcom,pronto-v1/2-pil)
+	Value type: <stringlist>
+	Definition: must be "cx", "mx"
+
 - qcom,smem-states:
 	Usage: optional
 	Value type: <prop-encoded-array>
@@ -111,8 +122,9 @@ pronto@fb204000 {
 			      <&wcnss_smp2p_slave 3 0>;
 	interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-	vddmx-supply = <&pm8841_s1>;
-	vddcx-supply = <&pm8841_s2>;
+	power-domains = <&rpmpd MSM8974_VDDCX>, <&rpmpd MSM8974_VDDMX>;
+	power-domain-names = "cx", "mx";
+
 	vddpx-supply = <&pm8941_s3>;
 
 	qcom,smem-states = <&wcnss_smp2p_out 0>;
-- 
2.28.0

