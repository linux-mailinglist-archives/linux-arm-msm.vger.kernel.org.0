Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0312F666451
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbjAKUBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239582AbjAKUA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:00:26 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17E343E44
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:58:01 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so25154727lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AC6eqnmCMNVcGNe0mju6hDV8wr8UXHC5zlM4CacDZE=;
        b=t5jFXj87//k+X0NhB8/XfjQFnJsNwjro9Q3GZ1WZQYE/LtKorrQE7XqowRTMapgjrx
         m0Im8IssbRCn9kusS4kTrPstUVEQMEnYPh/Th34H33go67A15wHLS7mzUJCPn7MhnKiw
         1qltRAGz6hgT9GQ2SVFDCzNyUG624NpBWXui4lRr+A3kscvWbkpLResse+IV3ByR7YWd
         zG/kiYiDN65yMfdEgL3/z/cTxEsBU1bWDgVZT0RqWxsjcw+geewwdCABl1C28Uu0C+Df
         ISb3jliqs37GLhaWlRB6/xNFMZ2I5HQFNccJrLiPrJBkt3z28CWzV3B7/yWislpBEq+R
         n4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AC6eqnmCMNVcGNe0mju6hDV8wr8UXHC5zlM4CacDZE=;
        b=erbxIUp7VUn+GozvTGyTanWsL6U9aW+ltfwfAZiwtyw4TyqE3uH0ltKhCbAwhzFv+8
         qDascJiqCNMdTA6biA9gFFeA+co7Nt6i6769sqfV2qrFcAF1q+duK+r6Cm08+ykQpZsf
         2j578gAQILT2vHX98gq+Z45qOfHvadda0DSbpQ1vwJqFZpvdUYEKevhmaE7Zcw/7nuJM
         4bYCh7Sq4+yXGcACcPakFMZJ11y0+YdtCVR5f9nRVmFGZsiz76K/N3IDFP9pciA3tbuR
         rTKx3xbaWxDm+H9lneNDb/hMAgqNQrFL9MWKZPLYGQ9T+rx56IoUcN3X7SrOVdt8E5C7
         eDoA==
X-Gm-Message-State: AFqh2kpCe2HHikAzpYFNvYTD/OFwDsqlw+lBygii+68t2DxJVbVGayyA
        EcuKSEI4vkETPXIcGi4tzegDtw==
X-Google-Smtp-Source: AMrXdXsybeJG4mLyaeiPfcVLFX+8QdicW/3SMfXvqeKH+BIv6IHHEP1XJPJ2ae+6kMblpxC1RZzpOg==
X-Received: by 2002:ac2:43b5:0:b0:4cb:40ba:4ae8 with SMTP id t21-20020ac243b5000000b004cb40ba4ae8mr7772013lfl.34.1673467079354;
        Wed, 11 Jan 2023 11:57:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
Date:   Wed, 11 Jan 2023 22:57:54 +0300
Message-Id: <20230111195754.2593134-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
according to CPU frequencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index e5a638b85ffc..675933e8e98a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -49,6 +49,7 @@ CPU0: cpu@0 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 0>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -66,6 +67,7 @@ CPU1: cpu@1 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 0>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -79,6 +81,7 @@ CPU2: cpu@100 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 1>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
@@ -96,6 +99,7 @@ CPU3: cpu@101 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 1>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
@@ -147,91 +151,109 @@ opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-422400000 {
 			opp-hz = /bits/ 64 <422400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <384000>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <460800>;
 		};
 		opp-844800000 {
 			opp-hz = /bits/ 64 <844800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <537600>;
 		};
 		opp-960000000 {
 			opp-hz = /bits/ 64 <960000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1228800000 {
 			opp-hz = /bits/ 64 <1228800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <902400>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
 			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1056000>;
 		};
 		opp-1363200000 {
 			opp-hz = /bits/ 64 <1363200000>;
 			opp-supported-hw = <0x2>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1132800>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
 			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1132800>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
 			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1190400>;
 		};
 		opp-1497600000 {
 			opp-hz = /bits/ 64 <1497600000>;
 			opp-supported-hw = <0x04>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1593600000 {
 			opp-hz = /bits/ 64 <1593600000>;
 			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1382400>;
 		};
 	};
 
@@ -245,136 +267,163 @@ opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-403200000 {
 			opp-hz = /bits/ 64 <403200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-806400000 {
 			opp-hz = /bits/ 64 <806400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <384000>;
 		};
 		opp-883200000 {
 			opp-hz = /bits/ 64 <883200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <460800>;
 		};
 		opp-940800000 {
 			opp-hz = /bits/ 64 <940800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <537600>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <595200>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1248000000 {
 			opp-hz = /bits/ 64 <1248000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <748800>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <902400>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <979200>;
 		};
 		opp-1555200000 {
 			opp-hz = /bits/ 64 <1555200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1056000>;
 		};
 		opp-1632000000 {
 			opp-hz = /bits/ 64 <1632000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1190400>;
 		};
 		opp-1708800000 {
 			opp-hz = /bits/ 64 <1708800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1228800>;
 		};
 		opp-1785600000 {
 			opp-hz = /bits/ 64 <1785600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1804800000 {
 			opp-hz = /bits/ 64 <1804800000>;
 			opp-supported-hw = <0xe>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1824000000 {
 			opp-hz = /bits/ 64 <1824000000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1382400>;
 		};
 		opp-1900800000 {
 			opp-hz = /bits/ 64 <1900800000>;
 			opp-supported-hw = <0x4>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1920000000 {
 			opp-hz = /bits/ 64 <1920000000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1459200>;
 		};
 		opp-1996800000 {
 			opp-hz = /bits/ 64 <1996800000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 		opp-2073600000 {
 			opp-hz = /bits/ 64 <2073600000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 		opp-2150400000 {
 			opp-hz = /bits/ 64 <2150400000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 	};
 
@@ -3563,6 +3612,7 @@ cbf: clock-controller@9a11000 {
 			reg = <0x09a11000 0x10000>;
 			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
 			#clock-cells = <0>;
+			#interconnect-cells = <1>;
 		};
 
 		intc: interrupt-controller@9bc0000 {
-- 
2.30.2

