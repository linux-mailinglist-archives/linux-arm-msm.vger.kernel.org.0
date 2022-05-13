Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6A526D9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 02:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiEMXzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 19:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiEMXzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 19:55:11 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042883A8ACE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:36 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a23so3869362ljd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=KDfN369II16+5p2gc4GulHkeIqPe81bmC5OQuViwrZQXhW28iWwmNhjJ2aApZx23Wg
         ptYdBumtf1L/x6MxSBZ9zw8PWk2U+Qpnuk7WAYuZa4birs3qunMMdD8ui7gSuZzVul64
         jx2qZ2PZ91+Z9BWtj+iBSMeut2szue6Ja9UsO5Te2XnwLkVOfqDzSQfrTuWzJxL3oRD6
         DEjfXFCxcIpicZE9ihUMHEnzWW5AKpewz4ZJMKUbYxsz/p42n3x3Fh751Jc9rwVzp9Vm
         sejgaIlXjFAQRrQ3yFMfjstylW9IJBz5FVRLcuPN+K9SfD4MLk6vkRcvOThhT+m6WQ8X
         JhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=w9T+/29gPBN8H4CNHTFZJYouei8ZNgABQpQVpSriu2aws69czllA7+JIS8gIxLHrSq
         yP0iqCXJndh6jMjZ3JRgrwFO7jE4jwhfD6mam9zmeeBczBRyIkSxmmcm2momcxNMfPRv
         P25qc5nAToWdw47wNAdtPyLvkY7YBsb9dCip/ikduqsBZRMw+j0lqkHtarTYOMOkma5K
         V91GfjpK7p7XK25qxSqmlpsqwkx6qPsnC4pj+Vmdpr3ZsDEK+6xdYEm+fLi5eRQSwAz/
         KgBd+bEkZOYzA3ztzYeZaK63DRt9vPNfyOkWkqXJQwjYk+SgeWCXHbiU+++e99rPlgjv
         Gv3A==
X-Gm-Message-State: AOAM533BSEx19e3OUGqSbVBqaWg5eGAsafqbcv7gzjdsCs1pAkCp/wr8
        YIKcWREtPWX7xBNULPhube1PzQ==
X-Google-Smtp-Source: ABdhPJxkC9UkmXQIquUS/nbTM5as+JgDGHLhvAoXwMioa7NQELEnTg6u2yL54nFsduJhWTQ7+oKXqQ==
X-Received: by 2002:a05:651c:89:b0:250:87c9:d4e6 with SMTP id 9-20020a05651c008900b0025087c9d4e6mr4480668ljq.315.1652485520441;
        Fri, 13 May 2022 16:45:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 1/8] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Sat, 14 May 2022 02:45:11 +0300
Message-Id: <20220513234518.3068480-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

