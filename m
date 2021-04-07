Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363A0356F9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349071AbhDGPCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349063AbhDGPCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:02:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A91DC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 08:02:05 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r8so11487089lfp.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQHU6JVtwNTebM12E9MrwsK4Nn8euAbOyGr3erk+v5o=;
        b=XUUM4YOyI1XzFTGGfqTr9vUu2wDf+IMIjn6pjjjgMzpX7PDK4Zq26m/d1d94d981UQ
         ySU/lmOMxGiOIE1uZH8UWJUAxdqu9jVNiyUx799SPCDeBb63ksU89PEJDMKOLmkb7E59
         R9jqdvu1fcEye4vX3FrmoHuSwIHdpLbM/EJYBLfu4INCMTkbYOKYRDTXisY7xeuQYrvX
         w5U+uGA27sW847fg1SqpjEDgFZ7cCZ7ddrp9AXpNX1CpWRqyzjL5E8tgMGFrfAynwGBt
         wueqrtt2eDP/eq49yWXpDzqCfgnvNitu7dtzoQ2OLyinW652jiFgZZNz4nWmyf5+qwU8
         c1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQHU6JVtwNTebM12E9MrwsK4Nn8euAbOyGr3erk+v5o=;
        b=f1snXW8GNndkDC0ebjegntMMrdO9Lu2r0Oh84/Cd6zw0Cs+5B1kAAPOWPaIFEK5T4t
         sKxinlxTJEQ+3M/nrPB9QZbBrDbnYM/WZKUErTcvTfn1ZBRf6Qd7iJzZE46UtwdTdgWW
         Ufa0vOfHtgNn4uX14DH8y090u3r/rkL8NIpgw6bZQGX/QN+YgdqHsVPdgEscvYSotctS
         O+9TqpWN1qQc8q/xsle0eaS25qP1bZARcO1EE/pDFYdwdMpf/t/N38anSWK71Iahmu/J
         0uohyeD+m4Tm0ljD9q99yz0Sl9FFCljKlIOG+Q7pzJNgD8wTINEtWbXmRIrrtXO20vJm
         RZBA==
X-Gm-Message-State: AOAM531H/io2RxDk3nBDtZGdrMVirdiSL1UKovIkCN9VgF+8cvhk4ySu
        3zvo4WWkQhWIs2WzyW5ppUw6YA==
X-Google-Smtp-Source: ABdhPJzwai1Ce3UJfMgUpbo47kQ3ESVbnzMTEChFlScgebRxFPt4GLqvV8oJ8ymGDEQrsU/DBfv12Q==
X-Received: by 2002:a05:6512:21a:: with SMTP id a26mr2880860lfo.507.1617807723775;
        Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: sdm845: move bus clock to mdp node for sdm845 target
Date:   Wed,  7 Apr 2021 18:01:56 +0300
Message-Id: <20210407150157.801210-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the bus clock to mdp device node,in order to facilitate bus band
width scaling on sdm845 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, move the clock node to mdp device from where the
votes are requested.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7395ef20b90e..55704804c2ca 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4136,9 +4136,8 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
-				 <&gcc GCC_DISP_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "core";
+			clock-names = "iface", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <300000000>;
@@ -4166,11 +4165,12 @@ mdss_mdp: mdp@ae01000 {
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				clocks = <&gcc GCC_DISP_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
 					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
 					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "iface", "bus", "core", "vsync";
+				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
 						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-- 
2.30.2

