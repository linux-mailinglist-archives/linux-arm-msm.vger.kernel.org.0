Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49DA5E8B05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbiIXJnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiIXJnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:43:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9B2112FD4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:43:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so3735605lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GQrdTdBofDL5vf6PRkXejN2E9BKeZSpZtMQfMhCaWUs=;
        b=RIfYj7SRavWfZMzce6bmkEVpfSm/5h09Mcb/GDa8d5KynU82xmd5OS97tdw9qpIe7l
         b4t5JSElI63QdqUgYBqJbmTPn+iDY7evsyqPsAw5lmgMCild/B/9up0gjYgFvh5OpyUs
         ePlTRURyeg+0iOLLPtIHRch0RrTmEiwFDdeP/su2LSvqjEanpvFldlz+6rAQujeOQzMZ
         Uh/Cox2JcOAzliigBscmVxDWn24xfnAH2Gq5DvRTM6mIRFXIHq3JGyHX89aXXX811c2v
         1R+OkSQizOstk46MkhX2+C6ixhkpkeDzf88Y//LCXeBcs4ZziUq6kL8/GN0cTNjZAdiu
         NqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GQrdTdBofDL5vf6PRkXejN2E9BKeZSpZtMQfMhCaWUs=;
        b=nry7parwcZNNnylfJ8YA0QpSKFVGMcZ+k04V9yF0tpcZBNcvXCUgTXpKfYenESRdwx
         5lshLVe30xS+uWG+hIlWedLdwZKsAKxAKTKDpBZg3zi2PgnxN2tnWM0CZ8b+0rpO16Zg
         k4j1kjX3QqQ3DY9DrqdnZrR/WM2/KT5natzkxtkesKGKmvAlKwR/E2xPb+BuhqarP5hI
         aMUmLNdvP5KEGWSHrBSNmrhWI7ma+9kthLe732SgvQD+GJ6+27kNDWsV+LF0yWOyphet
         wFynD1FQW5jiSYl01IKy4H2UBWx3mqGm/7hlb9fKYug+0CRee+iRLkE8Q5quTps0lOy2
         eSaA==
X-Gm-Message-State: ACrzQf3N4vGn/kmZV5LkwMwA9xrVPU/7AIeVHpjjLnubKObuaUYqtc3n
        gcR4pnwDvykb8CvSSEaMnSxRiw==
X-Google-Smtp-Source: AMsMyM5vcoNWuoc0ZWuZz5bZdSFqh+BZ/no1YdJLhxPL6pyZw/m43F2jNZseTa05AxfgYkOCMV8ugA==
X-Received: by 2002:ac2:4e10:0:b0:49a:d44b:426 with SMTP id e16-20020ac24e10000000b0049ad44b0426mr4990054lfr.234.1664012629416;
        Sat, 24 Sep 2022 02:43:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x13-20020a056512078d00b00496693860dcsm1833347lfr.232.2022.09.24.02.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:43:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] ARM: dts: qcom-apq8064: change HDMI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:43:46 +0300
Message-Id: <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
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

Change HDMI PHY node names from custom 'hdmi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 0322cb88d448..497c4012a65b 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -361,7 +361,7 @@ endpoint {
 			};
 		};
 
-		hdmi-phy@4a00400 {
+		phy@4a00400 {
 			status = "okay";
 
 			core-vdda-supply = <&pm8921_hdmi_switch>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 1b704c7ea890..58f239218639 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1453,7 +1453,7 @@ hdmi_out: endpoint {
 			};
 		};
 
-		hdmi_phy: hdmi-phy@4a00400 {
+		hdmi_phy: phy@4a00400 {
 			compatible = "qcom,hdmi-phy-8960";
 			reg = <0x4a00400 0x60>,
 			      <0x4a00500 0x100>;
-- 
2.35.1

