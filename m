Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E060E638A2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiKYMhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiKYMhL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:37:11 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498644D5ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:03 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id s5so6596380wru.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
        b=HewUI0q3JiGBKkRoIELpg8nbjCjuH8cpAkd53x1g6nujXHUTGpJlWiJsaGeMS0QI+o
         WN1tIeREr9cv1rsh2JOJAMu1fd3B5eI0P6OIFHLSxUXf1+HOUSszUn8urAD8AoSbzeWf
         pStkO5vDtE6A+IDMosKbktRuds3zBw1w9tgahaXy0Ghs9BxdkOttNyj+S6Kp6sTwXsyD
         ZkRJw8r4cS2Ne93lfFvbpue5MPWBQdQfsikW5SoMLU0BJwpJ1hqMEKskR7DqdEojolQs
         dQvF/fYZBLbm9ZD1MRI1kfvEbUFgZHfCXikICSfbd2IrAZdylqymO6YeDMZ54zsxpjQA
         RoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
        b=MpbYtwsoDJUNKSyamu+6vXqGgt0tHjztJA0ZhHzoP5lZmSvr/yKRlXW1zOmlP0etGG
         H/aGBc3YThXDIjFg5kPRt+KWOOtbEMKn3btyJtX3qLVXIPS4vdCZMU8XFw8nYy5KQxtC
         TmlS7O9Dq23Egdl9+JPRelI83W4WU5MIfhs6qCqACJgcP7QVRWJemx9Q3I1PeLN6s8pm
         uptjNm7lZPr1e4VDTyCROlBWlL6C8eR8VWb56UDZNRDhQU5GVZVHf9RbMrXiMeeBUidq
         vrqLicUXtju0AlKzOyMCtqrKQSmy7UTy5J1J7W9bWbe6Vpj6WgB6+yDUqKq4bZTNBw/i
         HbEg==
X-Gm-Message-State: ANoB5pmT35pVZly2fa6U1Np4lqlrUcgNHU/NBv67fQXxb0zJqfHJ9dyo
        pc4K2PVDdwsLUfwAF81em2AcvJpLdOaF2g==
X-Google-Smtp-Source: AA0mqf6uYcqHm6pJSFDYrGlH5uVpN8pnpSEtO4Xpcd119fJlRZqAf2omUuW/V37TYfnf9GTgSRw5sg==
X-Received: by 2002:a05:6000:114b:b0:241:d199:1a04 with SMTP id d11-20020a056000114b00b00241d1991a04mr15971719wrx.227.1669379821520;
        Fri, 25 Nov 2022 04:37:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:37:01 -0800 (PST)
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
Subject: [PATCH v4 16/18] arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:36 +0000
Message-Id: <20221125123638.823261-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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
index 10bf1c45cf6ec..f8ec728e67f3d 100644
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

