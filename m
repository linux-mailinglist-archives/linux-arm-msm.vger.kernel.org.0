Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F7A638A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiKYMhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiKYMgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:36:55 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E764E415
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:53 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id cl5so6560584wrb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
        b=hTnWBF8gOJ9vRgggU2IojcyTD3+1Fc67nH8pxvJSMMP0JOUwEIbjTEhxygAGczHvw0
         4hlqWojOetYSNxUNv/Xoq9Va6iFDPbPn3WWDvI0fSueyubthuDFgAvpdmKygGv/igAMQ
         vfJIn9J9OV4x4Vaioood3wuFkHN3Ijyn3j4JmYv0MVXiLq6hpsXx5O++FsLraQ/bN4sk
         bPrecAXDL5J7ZtBjOWtpYJqgRYAsN6MQDhkPIzp+o6CtlJxjg4UEJoh5Hx4AcgL7ml+4
         aPWvzpF3gQSpLVIvE263fX9FMo1dn42jwYqXfSElMqVkMVWQ/f9LOlPRU5SOAFQLc0p0
         pNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
        b=LThBg5QfvV4jGH8kg04ocIw64PO/qrqSD8llOM4l6iXKyp85maCdbmxIYSlCGL8aiU
         QuCAQZYBIP2YwSIzVOm95N7GNL5Sogca/iFUInRPVSAAPR3hp6cWHOWJx/XDzfrxLkQ5
         F/qX0Fv+01EGXylM5WwCeyUIVEcnQyfOZdfruJpm9KSRvkMzggvIW0y52DY/SV1LMf7F
         xL+M73/3PeN6SGm77EqEjmiHSOQUwxYEHqWEDjNEQ2f/keOA7Q6BgWb+y7E4hQustFsT
         rFYCt3LWTbXo7aYeY9voxhV0/DWM0cAbzSv7+1jMUWeHg6yRVe8C1MG4aqhD8Lb2NEFZ
         GbjA==
X-Gm-Message-State: ANoB5plWUG8Ims75P9JrQmct8EE3XTiUiPVH/oLpD8QR3erHGbke9NNR
        1IYMFwhVzbOSNXcEDXnwcF3FiLDeHcX/Nw==
X-Google-Smtp-Source: AA0mqf41spKNpGP4sg5rp59xzmuqV9V8xm7qreYN+DnGAc9OlVl0HCBAqEyf37Gi8iVQWjt21Vivpw==
X-Received: by 2002:adf:eb88:0:b0:22e:3e3b:24fe with SMTP id t8-20020adfeb88000000b0022e3e3b24femr21908861wrn.668.1669379812729;
        Fri, 25 Nov 2022 04:36:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:36:52 -0800 (PST)
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
Subject: [PATCH v4 09/18] ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:29 +0000
Message-Id: <20221125123638.823261-10-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..a8b089eb0dad2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl"
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

