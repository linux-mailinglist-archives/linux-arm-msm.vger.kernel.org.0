Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9439C57F564
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbiGXOEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 10:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiGXOEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 10:04:31 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8916C1275E
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b16so2015998lfb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iZwENJOY308zKHdj1yZi8s1aGOxQ3vIhb2O8oIzLRcA=;
        b=Hsk8QI9Kpk+4M7Nsh/UHUxWh+wUk/ffgiUPssy2Xetj8i4eCQ/QC1DL9SFHItGDBha
         JcwirREK8p/lYCuCFwCgZulBWR25RmGidXGrH22VYTbt+AnJDrB8iKj0MsVlYlw6ndfI
         41Bm/6fAMRqbVtV+MBjLHnxhOHZPe9crBGFyOeNwHC1YcCOd+CFZkzobG6pdt7OhIrGA
         7C/NmfLrhx97KZ94Q1ZTbqM5gcxZ8Kd1XEpTCEjIXgqxhAjWCyb15b5RR/epqwmocuq4
         k2Saq157KjsMcz0oxl7pyCZ1OkXJB9lJEdqb/ZwkJErKal1fdkrw3LgrYKpcha/9wpcU
         mkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iZwENJOY308zKHdj1yZi8s1aGOxQ3vIhb2O8oIzLRcA=;
        b=hxl1/IrcsXTDmO8pAHWf2sFcU8NwfzV7cpfnTtvCwJjb/HdqCgcpyfSW5m90mWnopf
         vgAsj/CvLZrZjAh458gjNp18Ws+vEg3J7IsRjRBogeNqEpFkbZTHvZsQRm0KPWv+XdnO
         kNcUD20cT3sTVLLf9tE/f+VI3adevZLP2+dHkHCMsyCLY4H3OJGZh1jAfsSp3cyPUPE0
         11dvdrUmIE9HtDw3E05j/EBR9arX3l3w/wOUSgTuUBZhJ7hiatGPulr616ufTCbK+qbk
         xzAWwj1x1zl/bEFnIiMBSj6Ep60AD+dDty9ONVRjwZPeEaHyfI/LDfQHWmn6foXcMVmd
         smcQ==
X-Gm-Message-State: AJIora/oKhaCRQxvfhFWiHwttpJd/I1PdDHCcvh1DQhRXXxKKjDbzqwC
        vgOQHw6ohYM96p/wRPztPuN69g==
X-Google-Smtp-Source: AGRyM1t/WTZ82UCkld5KvE+nZICTMfab6hQhfcZy/gO1J1Lr8/lBYSER1F5Q3G0BnJLIcpb0CnRokw==
X-Received: by 2002:ac2:4e12:0:b0:489:ddbe:83c5 with SMTP id e18-20020ac24e12000000b00489ddbe83c5mr3472848lfr.371.1658671467725;
        Sun, 24 Jul 2022 07:04:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00489dedf1dcfsm2192622lfs.289.2022.07.24.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:04:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 5/7] arm64: dts: qcom: msm8996: add support for speed bin 3
Date:   Sun, 24 Jul 2022 17:04:19 +0300
Message-Id: <20220724140421.1933004-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
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

Add support for msm8996, speed bin 3. It supports full range of
frequencies on the power cluster, but is limited to 1.8 GHz on
performance cluster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 74 +++++++++++++--------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 24791ed436c5..3ce572f3765f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -143,67 +143,67 @@ cluster0_opp: opp-table-cluster0 {
 		/* Nominal fmax for now */
 		opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-422400000 {
 			opp-hz = /bits/ 64 <422400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-844800000 {
 			opp-hz = /bits/ 64 <844800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-960000000 {
 			opp-hz = /bits/ 64 <960000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1228800000 {
 			opp-hz = /bits/ 64 <1228800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
-			opp-supported-hw = <0x5>;
+			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1363200000 {
@@ -213,12 +213,12 @@ opp-1363200000 {
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
-			opp-supported-hw = <0x5>;
+			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
-			opp-supported-hw = <0x1>;
+			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1497600000 {
@@ -228,7 +228,7 @@ opp-1497600000 {
 		};
 		opp-1593600000 {
 			opp-hz = /bits/ 64 <1593600000>;
-			opp-supported-hw = <0x1>;
+			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
 		};
 	};
@@ -241,107 +241,107 @@ cluster1_opp: opp-table-cluster1 {
 		/* Nominal fmax for now */
 		opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-403200000 {
 			opp-hz = /bits/ 64 <403200000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-806400000 {
 			opp-hz = /bits/ 64 <806400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-883200000 {
 			opp-hz = /bits/ 64 <883200000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-940800000 {
 			opp-hz = /bits/ 64 <940800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1248000000 {
 			opp-hz = /bits/ 64 <1248000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1555200000 {
 			opp-hz = /bits/ 64 <1555200000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1632000000 {
 			opp-hz = /bits/ 64 <1632000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1708800000 {
 			opp-hz = /bits/ 64 <1708800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1785600000 {
 			opp-hz = /bits/ 64 <1785600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1804800000 {
 			opp-hz = /bits/ 64 <1804800000>;
-			opp-supported-hw = <0x6>;
+			opp-supported-hw = <0xe>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1824000000 {
-- 
2.35.1

