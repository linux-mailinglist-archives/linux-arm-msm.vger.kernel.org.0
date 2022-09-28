Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0075EDF89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbiI1PAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbiI1PAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC3D1A040
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g1so3168792lfu.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gv+TB5vz0jii361bUqWIooViGxmGQPct0fTOn1q1P3o=;
        b=g3r+hb6XIf8X+C3ses6PuIx0RVsHov7HhClz0ZX/jDhI2KJcEQ4MS862BV0Cw+ExXe
         1kh196l24uxLctMgqvX/RVlaTrulILQnGEN36KFG6BIhdgD30EFQZv2MniHoXFokpw3b
         TNTvMXUfMYwbSyqjOZqMqGfQNZUvjQBacJOx/LjG2oM3zzWZUouMGXXlaQ+q5IqY2/Xd
         VvjclNlEeiJ5SJmya8OnisNOABYlbXpqHjxw/wc/wsAfIQIGucOgh7eBRrZ1rP+0L4Pt
         AB891HjYfz9F/qvs5D5Pk1fR+FbbebfdSJL2R9DyxJzWxdpAYB7C/ETuQb19m7hybwMn
         ZOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gv+TB5vz0jii361bUqWIooViGxmGQPct0fTOn1q1P3o=;
        b=8GpFByd2JlVFUHCBOHB3WgpI0s57xWEzjS0LbjZrkp3z09K13vvCWg3IuwJJ6EWUYj
         ozfFBMjwF/JPYMypujZO+blWW/zXLjFdPsLUGdH37kOwT7bAtu/2lErUVNzF/kAhCDnk
         ocimYGvpO/r+e2a457RYbsScDGIwIBw1Vla0BsOidRDlenAgcarjxtTB95uu/BXqX/Ly
         +vjGvXRWyddwcckuqy2Dh5IAsPN5Rvc4cc41qi+xYFzBB4dWJVykfmnHV4qnSxk6Fshx
         Z4u6OTIbGT/nWsySW9bFRqMwVVrE3ivQEO077fsOghvJxHVMPB4doLuBnlnQt1TIHzZD
         ccYw==
X-Gm-Message-State: ACrzQf09ppW0J0nuylZFJQzTWV0CQ80CF2+Vib/ewpk3DRMuHlBMdPAw
        /Ws7nqDz5pcADT6eI+ryLEsFBw==
X-Google-Smtp-Source: AMsMyM6+32vjuH06+MaZVY7m2dFezl2OxIKB66cvsrnIjyMoz0Vk+W7GBmOh4h6UI0C5MESuIaknMA==
X-Received: by 2002:a05:6512:2384:b0:497:ad1c:799 with SMTP id c4-20020a056512238400b00497ad1c0799mr13258871lfv.294.1664377208230;
        Wed, 28 Sep 2022 08:00:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
Date:   Wed, 28 Sep 2022 17:59:58 +0300
Message-Id: <20220928145958.376288-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
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

Add clocks and clock-names nodes to the mmcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 68ef494ca87a..3b7940022cdd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1493,6 +1493,30 @@ mmcc: clock-controller@fd8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfd8c0000 0x6000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_GPLL0_CLK_SRC>,
+				 <&gcc GPLL0_VOTE>,
+				 <&gcc GPLL1_VOTE>,
+				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "mmss_gpll0_vote",
+				      "gpll0_vote",
+				      "gpll1_vote",
+				      "gfx3d_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll",
+				      "edp_link_clk",
+				      "edp_vco_div";
 		};
 
 		mdss: mdss@fd900000 {
-- 
2.35.1

