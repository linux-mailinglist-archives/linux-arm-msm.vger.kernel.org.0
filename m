Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264EA57F55E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 16:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbiGXOEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 10:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiGXOEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 10:04:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BC71274D
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t22so8019666lfg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kstyrt0XJSckYmgk033hhfAcj8eyuSwLu1LDNFgz1o8=;
        b=eeVwxImNS4ubJ29h1XNHDAG0DzYVWUXzBK2jPhBgvcSRYxTvRR4rPADU36LdxAtkmk
         /q1y1xcUzA3J5gV+2SPQwqHNQCyjxonrzaXP36sSpvzwWywRnV7kDtreVuSjFpKxpTy7
         0DQ/2hh7cdKWYmEB8eJDssXOL+bm5OCAngiWmkhRaXJRjXSNXVhGwcnqn+icUbkUs4sO
         WMopIr3WrRUMOCxXLL1UKTjSvLgWGe4sVB//sKfdOVi/DsysaN44d8GPD/gEHJTW1za8
         eluWD1yTYbLLrQUgle5NW+g5sPX/3tcgmB0ZUHSCg1YA/JixDE6WcWW3VCpZyY9dFnLe
         FHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kstyrt0XJSckYmgk033hhfAcj8eyuSwLu1LDNFgz1o8=;
        b=Rx+75iw4RSRlm7ChAxTQT1NLtuZm0+YzrYlm3Eh7cQVxHEhBXOTYCmtuHHyWKlYp6D
         jtTKOos2gNn9iGi9N0VlhhHjsIKZJDKTmZB74LAzd5uvZmXAoH/Mv2iNZ/PygKdrAf5Y
         B5J0+cncOWn42FbEquiwmSkS6z6c9aCiXLd5yMd9Cohz71utMIronGP6xR6H1iPiDEZd
         J7ni52hEQe+QUt7lzImR2a5QrUWLTQYCvIsqlklkj2W2xXl0KHKNtLJEXbip55+eemAk
         BRmt598wetc08QP5musyKkp5qPKJPGY9WB5VkNjFVmGv+BMCiZSisEOURNQkD4FtPJ4N
         NQfQ==
X-Gm-Message-State: AJIora9p2DeGpExyMUm6gfW6mCHplf2Avx+GDk6DcA3PcUR0+XYgXx1V
        /pcdW9XLf7GA6VuDBvOVXZKk4A==
X-Google-Smtp-Source: AGRyM1sl6nqUDQCpKQmfBJccBkddpkh40nbW0ylG1/Y7zzA4YtQ9dJBe0YBnjWKmCSeQIgVMukd1/w==
X-Received: by 2002:a05:6512:a8e:b0:48a:7513:6d83 with SMTP id m14-20020a0565120a8e00b0048a75136d83mr3271916lfu.56.1658671466896;
        Sun, 24 Jul 2022 07:04:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00489dedf1dcfsm2192622lfs.289.2022.07.24.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:04:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 4/7] arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
Date:   Sun, 24 Jul 2022 17:04:18 +0300
Message-Id: <20220724140421.1933004-5-dmitry.baryshkov@linaro.org>
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

Adjust MSM8996 cpufreq tables according to tables in msm-3.18. Some of
the frequencies are not supported on speed bins other than 0. Also other
speed bins support intermediate topmost frequencies, not supported on
speed bin 0. Implement all these differencies.

Fixes: 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 38 ++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 41c09895268e..24791ed436c5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -203,22 +203,32 @@ opp-1228800000 {
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x5>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-supported-hw = <0x2>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x5>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-supported-hw = <0x04>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1593600000 {
 			opp-hz = /bits/ 64 <1593600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
 		};
 	};
@@ -329,29 +339,39 @@ opp-1785600000 {
 			opp-supported-hw = <0x7>;
 			clock-latency-ns = <200000>;
 		};
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-supported-hw = <0x6>;
+			clock-latency-ns = <200000>;
+		};
 		opp-1824000000 {
 			opp-hz = /bits/ 64 <1824000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-supported-hw = <0x4>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1920000000 {
 			opp-hz = /bits/ 64 <1920000000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
 		};
 		opp-1996800000 {
 			opp-hz = /bits/ 64 <1996800000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
 		};
 		opp-2073600000 {
 			opp-hz = /bits/ 64 <2073600000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
 		};
 		opp-2150400000 {
 			opp-hz = /bits/ 64 <2150400000>;
-			opp-supported-hw = <0x7>;
+			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
 		};
 	};
-- 
2.35.1

