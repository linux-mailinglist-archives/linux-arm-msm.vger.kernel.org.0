Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25059638A46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiKYMi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiKYMgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:36:55 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8704C254
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:54 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p16so3357092wmc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
        b=jQ6Zd7GyZIgl/JY44Vp2h+1APXR5T6P4Kf0y0vEo9HUPL9nTB/TV5heH9EKYPYL+Sz
         lzws6Vz3Y8Q6ZFfnK6Xya74aiexAZ/TrJLfW9tKffNBEwOewRK+POhu51QrxJ2HQjTPt
         SwV2JDLZuI+3CVXCoUKmjoTwA0aFqUnPJI+FeHmVHun3/ou9HYOK7ZbE/QlH85rVxrG7
         tcu5soKz3zJgtKDj2HV7wqB2gy0JQQo5lJ1T9jk/ocnGegzbTx+Ohh7KisWDX1hzntcr
         TJ/1Dp02dlvDYpq/wqHbj/m6XLt56kDa9+SgTORGoB8PgvZdY6rHey1HhODZrddJ+NCh
         GMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
        b=lemWLGaT38osyU19kYiBFvX7xxu8CP85IXCssxmkrJdoywX5J/uPobusitlHcdcpgv
         7ZElGbdEDuydtynqP9socj+nZaLjEcNgEGDjX2N0mxxRu/max6VEH6GdvFWyMuu3vgXT
         hO05WnSNGgGN8E9CMSS+Gu+QW38KQnX4M99TYY59y+3SL7ROFWdEahjKm+Ms6amDy4L5
         F4tY6toQKH7HixhUmPv2GuXx9NFdoeZxzOW1o1VCYUMUZwy/Nj+xHac/svlnxHtqOQQH
         tOc87+mwa++cKng5gyXJPkHkqEEw93hj4bUDmftEx6iuBniTsh1SpVcZPp1FulzMHKb5
         8CAw==
X-Gm-Message-State: ANoB5pmUXVSkEl5fluLSEEGATzoR8RF1B+b//GUVd7xrLvT9S33xjyiI
        y294ariIZOrQ2iHF+e9Tp7LptjZu8X7eIQ==
X-Google-Smtp-Source: AA0mqf4giw5RG8Q/UzlwLRZ1kyrijQNXVYA+s9uBtjUGeAdawHL1V0fytg/2MVZEqDg9+4Ck722HxQ==
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id b41-20020a05600c4aa900b003cf68bbf5b8mr30754573wmp.67.1669379814001;
        Fri, 25 Nov 2022 04:36:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:36:53 -0800 (PST)
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
Subject: [PATCH v4 10/18] ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:30 +0000
Message-Id: <20221125123638.823261-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 21d943d4b02d7..b4361f4318ece 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1545,7 +1545,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

