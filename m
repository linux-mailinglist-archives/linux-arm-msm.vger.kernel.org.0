Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C57654AEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbiLWCLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235903AbiLWCLL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:11:11 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C553639C
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id z10so3370519wrh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
        b=vqeD+GlPbNoU1iixZcMJrhkLCEYwaPHVNlmadjIDM660EGop7Dw+juHhBEMfPwDR9f
         V93Qy/Ni7W5maOq1BnYYEoIamCBIaplOcqJR5Aj95ONahGt3xG5tZ/QNjg7mYQiq9jKt
         NCuTcmYROOfmCbirKfz9qnws180iOP/gI2d2KvT2mQfzoJDs0BzW/l+qP0nvxApVxerY
         sxK+eypnJgn9srIcGKLRU3jpGeB73ZTVUFcXQJxKM3rBB26kY1jh+mTR5zBAdGwTbT01
         qG4Fo6o/gsPXUQdvHzMWa5FvFtUew0c99FxTpkBoTXGA2eJURv/CzaXs5XnjFBrAQFwO
         EkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
        b=o075fbwpWOXsaL2K5M17Kr+v1LyG5GuP4jObkSJx3GeWo8Aq4iOz0YgDztMld3ugDD
         DnL80VpfVjTPGFEnpELVtwWRtEWL5RoS/FV3+fsPdQCqs7W4a5hHIyzeYgDW6B8JmNiY
         EmabhIonTGxmm5tvfkI/Hf6plmkcQfvAzBsCVpR/Z+UlVh7wmNAHeG/PE3XQgGN2EAdO
         IZUGf3a62J2xsKl3JZP722yLQujlux4Hhzmv1MQqbWvs6fxeI4CHACsFHsKQQtPTk06s
         PbYtc+6H7eaZr44uhKt7fJdVXCU+12aoicoLjPw9a2RhvGsT8GY7EZp6ZCUYraKGHSTG
         6zCA==
X-Gm-Message-State: AFqh2kqJqiEqDwzRTzw70dMJgaUbDXY3BGJQbxOTzBiQDTYByMwugCXY
        zxeT43YLYVquqfYeHTfJg0oxxiOccyjSs6AaRLs=
X-Google-Smtp-Source: AMrXdXuNYc1TxK5uyXFod8fCjIYDorJ/xtarU5lUvC1JFyaHnMzuOIxlwK+dAxQK7vlDSOmjld4SVw==
X-Received: by 2002:a5d:4578:0:b0:260:6b09:fa17 with SMTP id a24-20020a5d4578000000b002606b09fa17mr7750880wrc.9.1671761443341;
        Thu, 22 Dec 2022 18:10:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:43 -0800 (PST)
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
Subject: [PATCH v6 14/18] arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:21 +0000
Message-Id: <20221223021025.1646636-15-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e649..a437ad4047f52 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3906,7 +3906,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

