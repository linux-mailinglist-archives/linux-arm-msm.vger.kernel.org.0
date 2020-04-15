Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB8F1A9328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634812AbgDOGWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393546AbgDOGWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:22:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFDDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id np9so6343574pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7avCLbe9HAwosQBa6LlVF/qUTGXim4biWBuIF11jNCU=;
        b=lbADryP1UsnJT4+HlIV8WcjjuaMWFzGRcULDWPvuyis2HA6h2gAf8PIDWQ2M7Lc5qL
         E2FsT5EO06c9Rsgfb6b3Ul4bCJOotCGIOnetst2/FbuDcRWm0PeulgY3nJnxNmlETAan
         oGA6BRApANilKEsMzDnOF65f/BhoVhKkzh3IEpoWco2RPUtkKEEZqM5vXtHa1pUnDfIG
         jy0dpd2zKihNeVvwXFEBASQ47bAolWY9CsRhlTWIk7E4EgCrLXIdGwz98dAEOcbvUQzG
         Nxo8EH40SEmDLYb0OjtnC3Kpfzklx7ObUKiUVDEx0I/hqmdhsQiRYb7Tv/k5ZUa1/aXt
         a+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7avCLbe9HAwosQBa6LlVF/qUTGXim4biWBuIF11jNCU=;
        b=inRBpXTf5qFjgG9e41MdOW0374l8y2qnKWDUF7TtquW+JNL2Cg7xsmntt4SuKfNbBF
         IMg5xU39e87D7bVHIFphZJI2duhOdr7Yk36FeiNnhYx31uYdQ8e8xfHhq2yhUlhfWv9B
         Nistw+I49WiiMmDyJHACp/kSxbIDBDYfgYv0jw0C4Sfd76iFwiYdxZvX5JYqasr6a81W
         1uHdJKQEaDJ9za0YtAO4ja6sLRX2TMq0Fy3em5L/ZMhiTdUCsOsf1D3JYyoAByA4o0o6
         VHuW93cGIBT0cMoyr0h2sarXdoLI45n5fvDtPlHlb8U9MmMc2dwRgrMp063iUSW9z37z
         VYbg==
X-Gm-Message-State: AGi0PuYIiE3SNtDEyelxoobSuiJWiyMV9qarh/s6pL1Cmd2Qd+kR1oLG
        wHV7+qXl4xE3Wi696cBCdTJEkYCwrPg=
X-Google-Smtp-Source: APiQypIdwUPC4FfOrzwT02GzsEBa0duhvaBxGkyGhlCmkXhoVszx2qook34zcRpOUVAOB9HMAAGUBA==
X-Received: by 2002:a17:90a:c78b:: with SMTP id gn11mr4330672pjb.147.1586931740009;
        Tue, 14 Apr 2020 23:22:20 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nu13sm14032899pjb.22.2020.04.14.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:22:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add rpmhpd node
Date:   Tue, 14 Apr 2020 23:21:54 -0700
Message-Id: <20200415062154.741179-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200415062154.741179-1-bjorn.andersson@linaro.org>
References: <20200415062154.741179-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a560f2cb40fe..f6ae5f55ca5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -441,6 +442,56 @@ rpmhcc: clock-controller {
 				clock-names = "xo";
 				clocks = <&xo_board>;
 			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm8250-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
 		};
 
 		tcsr_mutex_regs: syscon@1f40000 {
-- 
2.24.0

