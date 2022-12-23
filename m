Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2141654AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiLWCKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbiLWCKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:10:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BD926AA5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:38 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w15so3381599wrl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
        b=CiW1w0oCZHCXgJsT8R3B2c1vyZI4zlQfpLkGHE2GzyCyMWoTTOxCBRGtT+RmnlOR6O
         NZFGvyKwnMdqXPjvmKPeTVkSvMotx43T9psSkpa6BlKvbgd4GSTqs3Q+sbls5KdIhsOT
         tUv4Iv9JzeE5BV8pIy06G1N7tHJR/eEf8FbIuR2ZDeJHGrsTLZJ7/fIOj7gL+8zDGqP5
         aGBad1khwIkRzSAcbiJxy43+LycN1vS0AdkzbZFL7vr2tbMWNp3RIbMnSEBP0pCrvHXf
         z+J77eyPXzJdOu1IrZOTn+dlWJ8LvXqGfEZ9/AK3EuWqFymgn72svLnxMJfC33rGPSUE
         NcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
        b=FDhxXbQU0AF7msrToCWQ0xTRAhsIBlLvFfUGDLqHBAbYiwStuxeJn8k9o1w0KwkNr6
         zQbaU40VVrhO36O+qOLIMkto6MWmRs62xpmkNlJbWA4h2tqXfjRzL0VYb54mKbJYf0x8
         MVQ2FB3SnFOBo6GwboC7yRaxwd9KrNDtdt35yuCXCccUneFMkkfdU1W4z3jf9FA9tfWM
         6L/V7xctZiEtJmAy9QACu1MmAbHJQws2J8ankI8KP/9zHsuP/3y4fcMffaFpPY5xhfmv
         doAvib1/TjO5YtoX+IvJg6XyJc9aq4SNE/RwrOPxQ1LRDKTVybZsD/331GF13DrTh2fN
         PlmA==
X-Gm-Message-State: AFqh2kqaIN2VVuFnuXwMT0lP1f4sWc8Cg+pQ/D74hcPCMMR/9cm6YF7v
        48k/KNjn9w78aVw9Piu+V1ehO4BaY1LlTAM5GTw=
X-Google-Smtp-Source: AMrXdXtwc9SVrhYtFVOUn5bx/CPe1cbdMJyu51vy4h6ZyOByTQzyyyc/SQ8PT6md8GTVTHTNTzlqAA==
X-Received: by 2002:adf:f74e:0:b0:22e:6227:34e4 with SMTP id z14-20020adff74e000000b0022e622734e4mr5078206wrp.0.1671761438317;
        Thu, 22 Dec 2022 18:10:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:38 -0800 (PST)
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
Subject: [PATCH v6 09/18] ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:16 +0000
Message-Id: <20221223021025.1646636-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8974 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c08511..3ab3665b28aaa 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

