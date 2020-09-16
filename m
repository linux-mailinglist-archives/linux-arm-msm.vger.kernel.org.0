Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A376926CAB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 22:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgIPUMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 16:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgIPRdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:33:15 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250E1C0611BE;
        Wed, 16 Sep 2020 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254260;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KTYtuLjpG4q2FFVDMLYAxEmULX+z+h2JJwIQULJoCkA=;
        b=hGHJZNh+6JkVq8u8BHH6lPnZHyfHYMGWMlr0lPMKJyh6SxWazdgKDJH2b9WCOrQ7lm
        W9K9dEdMJBYQIn9ub1yvg7JADdDIGaEbS6vwiSWHSM+vZIakTietudzWQhkkkX3Ss92I
        D353f+ovwIJA/TV+UCGQ7nse3iE4un3V3WcdeZByhvKVbvjc+0gWyDfn5Ch5Gq6nAueh
        oeRcqXiqf/P2shR0B3DZ+/7lirlDkfCEUneti6oTIYguU6EN8ILVsrZD8dXrFoK2V+w8
        fhCzlz7vvut5NEcQbQXLZoIJxG2abgiy8jqWcub2omTmpUWB9BZ8poNBTbmDAcB8dGC3
        1afg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfpzlR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:51 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 04/10] arm64: dts: qcom: msm8916: Add RPM power domains
Date:   Wed, 16 Sep 2020 12:41:29 +0200
Message-Id: <20200916104135.25085-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has two RPM power domains: VDDCX and VDDMX.
So far we have been managing them by voting for raw voltages through
the regulator subsystem, but it's better to manage them with corners
as actual power domains.

Add the device tree node for rpmpd so we can manage them as real
power domains instead of using the regulators.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index aaa21899f1a6..117804f94c35 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -289,6 +289,35 @@ rpmcc: clock-controller {
 					compatible = "qcom,rpmcc-msm8916";
 					#clock-cells = <1>;
 				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8916-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <1>;
+						};
+						rpmpd_opp_svs_krait: opp2 {
+							opp-level = <2>;
+						};
+						rpmpd_opp_svs_soc: opp3 {
+							opp-level = <3>;
+						};
+						rpmpd_opp_nom: opp4 {
+							opp-level = <4>;
+						};
+						rpmpd_opp_turbo: opp5 {
+							opp-level = <5>;
+						};
+						rpmpd_opp_super_turbo: opp6 {
+							opp-level = <6>;
+						};
+					};
+				};
 			};
 		};
 	};
-- 
2.28.0

