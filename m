Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69BD0638A11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiKYMhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiKYMhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:37:03 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CE04EC21
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:59 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so3304678wmi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
        b=fJJR4QeEbYbrdwi9ZTqdfFKUfYSWnqAF9EsGpW+uixxx2zbe9q7zL6OjmJDVxo0hMd
         myn/rr/7wFhiBZK6cB5qCvfGKPEZtb+sRmw126yZDnQwCxANmo0Oh+U4EFrSdp2x1iJl
         7UiEwCOzYCrdFXVbEvP3xmPo1LlYddEPa5BeLWNC9uN/Y07gDn6T4APWzdU6VnfYkl/f
         YgnnPFhlo1K9NH8gc2xdQABhjJNkSIaSJfI/SIzJ2kJp9bvf6WpqooO4PqFuUwijSl9Q
         Q0SX1O6YKPIDBWjYNc1F6gMZPbKITblTsOBUf+xzeu3d7iIVmmGvDKCQTPUOmu5Py1nl
         rrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
        b=dv2Ux6zygrapnR5uqGm3a0tfjUu9ZDXwemn5cCHphDwluCHMrjy08T7wLV/9cL9wAz
         k/gfSL7Xfo6VSr3vdRsAIJ0QHXzKkIZdCC7UgAV0N/nfy9vPMZkDZkelGNhG38MfpB4v
         WH/rNu3oQrwHAi44jPFe4eCOabpV1EgjwTH0ekynJIbLOyA0umG36JvbJBtc5iTkF0D2
         ZuY+M+0eieZcVq6+6UwL96gvQgJ8w1UcEswn2vKVVf0zVe42FRWw/85mSDf0T6Ob9dPt
         XePiqzngCcHUJSpRkc14MU7woz1MM/Q207ETizg0TFgD9JsXNLhzZlSyIKeB7s/ySVcl
         iCjg==
X-Gm-Message-State: ANoB5pnjB03Ptby8/I4HIo5ZmWnqSfzakL4sGWa2fIsKXipLexgp3Vu9
        6k5Gsk3AOPh819hgvAXhApdVp8l3xiMVzw==
X-Google-Smtp-Source: AA0mqf4C+BIzB93Y+GyJoAW9Q84AZU7HlHwF5CeORzNqfFwZ5t3SbSpe4RxDy89uLI7h+t3HQNpsJw==
X-Received: by 2002:a1c:f216:0:b0:3c6:c2ae:278b with SMTP id s22-20020a1cf216000000b003c6c2ae278bmr27105879wmc.127.1669379817884;
        Fri, 25 Nov 2022 04:36:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:36:57 -0800 (PST)
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
Subject: [PATCH v4 13/18] arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:33 +0000
Message-Id: <20221125123638.823261-14-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d2c374e9d8c03..cfe44afc52b4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2985,7 +2985,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

