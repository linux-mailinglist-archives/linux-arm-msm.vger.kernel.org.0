Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AF234328E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 13:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhCUMmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 08:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCUMmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 08:42:21 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5E6C061763
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:42:20 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so8990393pjq.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XedR4D63zUvw1J+WKjbyJOOz+/A4gC1Wz66rLRAAKFM=;
        b=oj22IieoJ7hv+uAPIgxTaFRsEDoIse1V91LhPaGz2yCMBF6lDasshA25Lg3c0lIZcV
         HxXs7kKiaAhlTO7CLbhJRo8B1OSkRBtrPHYvYKMctN4YKva3i0TbkjDNP1bMG03bJOSt
         SqgzCWy+j4DR9huHcv1QXymACKvig+2IdjyPQ+mLj87l2V5cid2xYp9Lscy8FnZxtF1Q
         UbT4YqhU7yo8E0vacmw4F1KR6F8PlDmvEKG5UWOMSUJfK3rZcW0LGqAfrBP6qV3koOD+
         hbQbtCGnCf1zjiuTbDRc2h6Taa1L7d7BVEZ/srLVjVD8zlLTJlBKg9Oz6DXN7iH5WXFN
         No8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XedR4D63zUvw1J+WKjbyJOOz+/A4gC1Wz66rLRAAKFM=;
        b=mQxbtODfEy55PH5yXqfHLsBUrK9eraFG+vlB+TqEjeqkzoWX8atnuXTiWz7T8UgB02
         WOxbarCJmx0qz7voEptNCRGQtKIlrhljik8XkTN8oeMACk3mcjUBF5E1qRfDQxjNq+yR
         GbxoQF7k/jF3oWyk6Z644s+PaREuek4DJFrPSvXo+xKbk509OMzzZqwpgexiT9haFK3O
         JwoJaiZfA/tbQmZDt0s4CCZvagm/oMACIeZpceTTEY+ql9lbm3tWGr4cieaYa4Bz7PwK
         jlKAp9NxLjh30Ba7/6pQ5OHjKiDtryadyAKNl0p929kLlR1lLEZY2wZbZuRxBW2/9uNV
         lhXA==
X-Gm-Message-State: AOAM530snjvslk24mOLWvELSo1L/7/mxpPGLI4TfwanFkcHR9VJdbJo+
        IlD+pBocP9cIqd6gsTNdG7KbqA==
X-Google-Smtp-Source: ABdhPJz9tEOhms+sw51vndtnLuai0NKy9rh8QteyN7vews4P/+DdVN0S5k2zoHxwFvN7sREFEZKpcw==
X-Received: by 2002:a17:902:b68b:b029:e6:cda9:39d with SMTP id c11-20020a170902b68bb02900e6cda9039dmr18588590pls.63.1616330539591;
        Sun, 21 Mar 2021 05:42:19 -0700 (PDT)
Received: from localhost ([116.206.101.232])
        by smtp.gmail.com with ESMTPSA id v13sm9973103pfu.54.2021.03.21.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 05:42:19 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3] arm64: dts: msm8916: Enable CoreSight STM component
Date:   Sun, 21 Mar 2021 20:42:12 +0800
Message-Id: <20210321124212.4253-1-leo.yan@linaro.org>
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

Changes from v2:
* Correct for author name.

Changes from v1:
* alphabetically and address ordering for DT node; pad addresses with
  zeroes (Stephan Gerhold).

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3a9538e1ec97..2165b7415add 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -410,6 +410,7 @@ &wcd_codec {
 &funnel0 { status = "okay"; };
 &funnel1 { status = "okay"; };
 &replicator { status = "okay"; };
+&stm { status = "okay"; };
 &tpiu { status = "okay"; };
 
 &smd_rpm_regulators {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..f02b976480d5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -489,6 +489,26 @@ snoc: interconnect@580000 {
 				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
+		stm: stm@802000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x00802000 0x1000>,
+			      <0x09280000 0x180000>;
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
 		/* System CTIs */
 		/* CTI 0 - TMC connections */
 		cti0: cti@810000 {
@@ -562,6 +582,13 @@ funnel0_in4: endpoint {
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
-- 
2.25.1

