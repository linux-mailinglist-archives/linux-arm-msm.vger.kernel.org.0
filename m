Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1C9342A19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 04:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCTDAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 23:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCTC76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 22:59:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9744DC061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 19:59:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so5319531pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPX8Jj8fXngXUqa4TPBe2XO/CO/gvTfPNr7wapkl2B4=;
        b=lHOc/t666YqhwXFeJcHR5aNB2iLuox3AoHa7xXCuRFwk/ns4qd4uiQDpI3hYmWCGpl
         OdCHM/fWyvVuTAgjBvWLjbwxnpq5gH2XX3wT91crEv8+0QcWO9jplPYf1tBVbOF9NVIf
         reP8JuFiWFc8CphffLEv36+jgPNq8TO9M/sZE4nl0TUlp8Qbek07nfEQtp6XWN7Ig2LP
         anUTLl9ZKi9BA2zax1LOJ8ra89/TbkVRkFMYlpqImYiAQ6rRgNOnwSNBQcWP9lLlLajo
         c1dFf+IHcR8k9nf+tRlKjdOrh+YMLOVs6U79bG1rf/DyUXAzCCXMhHSBzhLVXkZlgCW0
         NAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPX8Jj8fXngXUqa4TPBe2XO/CO/gvTfPNr7wapkl2B4=;
        b=M0iRWkyWrG+hx6ulJ7MReakTatVRI0Yv0oXmMu5MMM72ycl+Gonx7F3YJV7uGuT2qh
         bs/nEU1Ds1C8PCMEGmLC/xO64uzmz/pk1HM0vqcuaFUbdXY6B/UcpLvmzMh96wRlktU+
         Qc1ARdBXDCDCnvvYjXwJSWxnN+Y4nJRDgRpsIwgvZ2nAR/pZBzY2/7lavNEU5rsksRx2
         8shY2NAkHMem31EUZSZHSFqvDNDRAlGzW1CpJO/CXYPIgMcGnfMIPMqc3SMBnqte0Dn+
         7p0mMAd8HrMg5uR0LnbGNKJfOsPVLbGyvvclo2GkgwMijarBwd3o+qQOI5jP5x+rVIV7
         KT+A==
X-Gm-Message-State: AOAM530iuuGhuVUdlXoJHVcv0P2ug5j2V/g0turwh4iLnf8AeSaGipUP
        TndL5ezoiz7cmcsQ2DQ+9Y4z6w==
X-Google-Smtp-Source: ABdhPJwkPO0aq+cCVGTySogVUu2eVUQY+jIn4Br0ysbai/hMLrLE0UG7wJK6uDgldnb2PcYhuiID2A==
X-Received: by 2002:a17:90a:d907:: with SMTP id c7mr1500517pjv.45.1616209197935;
        Fri, 19 Mar 2021 19:59:57 -0700 (PDT)
Received: from localhost ([116.206.101.232])
        by smtp.gmail.com with ESMTPSA id e1sm7005000pfd.72.2021.03.19.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 19:59:57 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] arm64: dts: msm8916: Enable CoreSight STM component
Date:   Sat, 20 Mar 2021 10:59:42 +0800
Message-Id: <20210320025942.487916-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Georgi Djakov <georgi.djakov@linaro.org>

Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
which can benefit the CoreSight development on DB410c.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3a9538e1ec97..dd87e5d739ab 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -406,6 +406,7 @@ &wcd_codec {
 &etm1 { status = "okay"; };
 &etm2 { status = "okay"; };
 &etm3 { status = "okay"; };
+&stm { status = "okay"; };
 &etr { status = "okay"; };
 &funnel0 { status = "okay"; };
 &funnel1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..892f1772e53c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -562,6 +562,13 @@ funnel0_in4: endpoint {
 						remote-endpoint = <&funnel1_out>;
 					};
 				};
+
+				port@7 {
+					reg = <7>;
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
 			};
 
 			out-ports {
@@ -882,6 +889,26 @@ etm3_out: endpoint {
 			};
 		};
 
+		stm: stm@802000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x802000 0x1000>,
+			      <0x9280000 0x180000>;
+			reg-names = "stm-base", "stm-stimulus-base";
+
+			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			status = "disabled";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
 		msmgpio: pinctrl@1000000 {
 			compatible = "qcom,msm8916-pinctrl";
 			reg = <0x01000000 0x300000>;
-- 
2.25.1

