Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B507E568CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiGFP2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiGFP2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:28:36 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B9B14024
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:28:35 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j22so1474325ejs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJT7FdOWxd+3nnySZrE0QuUxvv8Z3Xa//ZmqvjylFS4=;
        b=ILCUdFHtPfMH9nrZAwCzEevwotaKhk0OQgaUs/4ENgCUDl7RZKhGEEsgoQZWZOv6HE
         CG6pGyfMEQcf29ZqnrjOR6esGyDTcV99LO/5b5mZPj3ZRyp0UCguyLsCWlNLB0WsxLcd
         SGkjI2x5Z2bnhnAqME6nZtsatFNz2+H14zAeWluepv5Rqh2X1XBJY2LwQQzdW8tZSIzM
         WI70UTNuJwCiarSla8Wnzm2+mlKwGCc596aqBnEV+wHKZ2W/LhUm0jvktIIjvt3UGcwB
         dGPfX4JsTe60C/r8M2SKZD9amq7D0oRO9fnm2RucDiWiwZHG2RiOxcBlcUlUEsMlChZL
         1Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJT7FdOWxd+3nnySZrE0QuUxvv8Z3Xa//ZmqvjylFS4=;
        b=t//whxRfcLQ2uYfQ6zA+nZnpwkrntBC9ZK1E7+HNq5k2AmbbMwMOYRpgYXRHSPtFcf
         Bk1wPbkPNVVW22QPwPW+jhYZYS7hK/rVzM4pLoO9wma4cS0S28b2WwdAnBV+uP9wgrbA
         wtPgxDnsVkFts+nKMOn6UJ8cqyjH075rYsrGu/1hpX5Wf/+9A8zees2/4Xh7t4levTS+
         s0jgWnBqmToltvZ73xapnXvgU2q6Xw4hOHhyQUg9gKgGSe/to1EwFqnhyzhyfRweRp5n
         BngbjZk6SHZ8CiuxH5wJmf3ZdFSsWmlq9MVlGUO6m2mbfGn8ioPmzlHMPsPiDlTB1iVB
         KcJw==
X-Gm-Message-State: AJIora/pMkCP3KS3qGg2g0Uct0yS1o/tDzGGGRx2x+unKCAGXx1cq9B0
        L5PzcY2JKLdZBwaiatCobhPe0Q==
X-Google-Smtp-Source: AGRyM1us+WTKDCZDbDNiudzERluNIKifdOpVHHRXxQ9XkzJpDtUXKV36gyo706/NYT8yWO9XgGOfOA==
X-Received: by 2002:a17:906:3989:b0:70c:2090:b498 with SMTP id h9-20020a170906398900b0070c2090b498mr38979157eje.56.1657121314194;
        Wed, 06 Jul 2022 08:28:34 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709064d8c00b00722e50e259asm17340684eju.102.2022.07.06.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:28:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
Date:   Wed,  6 Jul 2022 17:28:30 +0200
Message-Id: <20220706152830.2021197-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace &rpmhpd power domain integers with their respective defines
in order to improve legibility.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---


Changes since v6
 - Add r-b - Konrad

Changes since v7
 - Add r-b - Vinod
 - Split off from series


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 6eb78d7ae8c5..447a02f10463 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1656,8 +1656,8 @@ mpss: remoteproc@4080000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 12>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MSS>;
 			power-domain-names = "cx", "mss";
 
 			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
@@ -2166,8 +2166,8 @@ slpi: remoteproc@5c00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_slpi_mem>;
@@ -2234,8 +2234,8 @@ cdsp: remoteproc@98900000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 0>,
-					<&rpmhpd 10>;
+			power-domains = <&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MXC>;
 			power-domain-names = "cx", "mxc";
 
 			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
@@ -2546,8 +2546,8 @@ adsp: remoteproc@17300000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "xo";
 
-			power-domains = <&rpmhpd 4>,
-					<&rpmhpd 5>;
+			power-domains = <&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
 			power-domain-names = "lcx", "lmx";
 
 			memory-region = <&pil_adsp_mem>;
-- 
2.34.1

