Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB95C654AF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbiLWCLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235911AbiLWCLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:11:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DE19FCD
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:44 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o15so2751476wmr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
        b=hBupnYDo+zrPv28OUFZcPoKWJ4rv8AzR38rSar7HaNpKmPE+tbCEjJbbHiY0XtFinf
         K+RTF8xkxwVQAD9mRmrCsFyLFh8IzP/jvKf3zmZ1dmPZFjh9qYcwsogWf9faDqYsDcS+
         6lg2LMbXJx65F2WCjOlEuS6D8oZ3zo8yuPQWWJwbe0+IP5cu/x0NbPlYf4lNCHTMhgSZ
         OAHn4PHtONmN9uoqqEN/bSdvxh+jLEU18QZ5WFtvgihCi8wP4NwexK+vQ0FAXx+TEGFz
         1s8tC+Tpzr59hMI+1DXaKrty8A1a0GwcLmgG4/au8ihK9sw1vSPVmvtfD3btUaFoOmX5
         qtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPzBwr0BhPjdigQ+qhuhYo7cFKy33u7lIc5bsk5u6zc=;
        b=hqRhCLiN77ILipBdvpMy3dYtuNu0TRZRW6RSyy2CLLiB1KeGQlTHHUZPAMtkIw3cnD
         4k3Vz05tFrPI6lWPy8isLhwBIVt4LT3mDZ0ezN0WqnaiSgy4BKS3tMH2pxrtFgwFP7Kg
         OUJOyYMnm8RXEZ7h1E6Tet2MIgDD9cy9H9c7oPltMzn2TaXxStgp5QLb+FTCxiADjVCh
         XIcBi3CTPlESv1zfA6SGUyjTOcAimiwRlFQWdPqEQFcc7Xpstm4ncGa9/FoA5pdcxE1U
         B49ykV36CN4qcnA8vXMxZoWRv/izm9JrRBwzjZuvWtUC/XvGukqHc01t3MTmP41m1HEV
         bwAQ==
X-Gm-Message-State: AFqh2komDPDBBqeLdX03j+GordPfpmJxCkSwy+X15Ud302z3Pqe9W0YV
        FWPQQIOE+7sEtJYqc96qu4yz1XhGzkG7fB2d3bc=
X-Google-Smtp-Source: AMrXdXvcexuVZuj1tFe1orRuwvBa9r6Rhxee4ZjTIZx1CzvQWvxftsQ6BaeJBN7YTHfH9Jc3J440jg==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id 8-20020a05600c024800b003d35d47271cmr5685315wmj.12.1671761442338;
        Thu, 22 Dec 2022 18:10:42 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:42 -0800 (PST)
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
Subject: [PATCH v6 13/18] arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:20 +0000
Message-Id: <20221223021025.1646636-14-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f71cf21a8dd8a..fbd6a7b31eac2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3022,7 +3022,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

