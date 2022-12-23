Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18D0654B02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235932AbiLWCMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235939AbiLWCLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:11:18 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4601277E
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:46 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o15so2751542wmr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
        b=tl9KeKXDtyZBmFoIjWWO4pU3vMAb7NzRUyBRhgrOfWOeeapmVdeGHdRrX7fZUdSHxR
         Og7tG5CagfAi4OKn0z43uFPbk6gmaY+S30lkzrm2jEEK1ccCB0g+ArgufKid7kwlPPsm
         08FX5IFJztnPbA1plV90Xu5PjEKOOtOhC9LKM1fyxOtCgFzaMnvKEtS3GAKzJ0tlt2Oy
         AaJMeLuEOnGx3cK5EXdFUx0EOKICI5IW6u/Lut0XVpgj5fAR7/cs7FR1oI9v5AGsiO5q
         WCKoxug+HlqYguv6UG9gaMIsxyFlvy1jaTJoXc9htdmfhnFhDeUoochJzSbxAfPlRH+W
         Lxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
        b=uJm1YSAlSMjE5/d6h+4Zrx0bZyK2XTX3rZBOMcYNrEm9et4jcRmG2Tf5B83Aq0/STf
         j+/Cx16cmW3dr5ssKETUKR3dMmPsxN5euIAS8wqD7OhuWOQu112Ej6mMfczgFY2loRGP
         24smMmIi/eOzu4C0iwq7G2MYAfrUhpKZHjHGlAWrwyrxHmnGXoM/5gVS4L0p+7q3FUIl
         jZ1c7/3D8LDVa8lpph1JK0wBGHMfvvrTi0z/nvP9QF6OWmtPK/IMA1zi9sVUbXirNkk9
         +HrAs4pjEuqMdK6T+9aj/dw/sncQhI1QV+9Er+mFq/jXRF8qrY1lN1Rvj3n+McP6aXGs
         drmA==
X-Gm-Message-State: AFqh2kpKCl2nC39U3x6siWDdMMvuyFHi0nLzkhVlsD2j46xfGNcXpz0y
        vDwTvU1Ds2El3H3LdCx6N9JhmIV4IK+hdUrmx7s=
X-Google-Smtp-Source: AMrXdXtapK6lO/YsS+pE/BacOLARlYbBOVA7De78mBLUQGZr++WDdon0BQAcfGSQFfr8EKqD06kL4g==
X-Received: by 2002:a7b:ce8e:0:b0:3d7:1b84:e377 with SMTP id q14-20020a7bce8e000000b003d71b84e377mr5787454wmj.27.1671761445427;
        Thu, 22 Dec 2022 18:10:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v6 16/18] arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:23 +0000
Message-Id: <20221223021025.1646636-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d52123cb5cd31..e8a15b9cee18f 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,sdm660-dsi-ctrl",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

