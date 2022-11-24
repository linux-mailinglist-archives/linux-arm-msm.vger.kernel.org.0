Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441A4636F50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiKXAtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiKXAsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:47 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4762ED71C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:18 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s5so269100wru.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
        b=X1ktmbuxUtprr95vwa/Jqij/BOKG3dAJ70YWLdPNa4R9yOaHzbwEnM7EmlhJVOLnQ/
         YkuiIHEJdvxQva+YwrJJzKTzIGqg798SZMRGvcmwqbCdEQdMKqiC80kgijD48kMcnfrm
         Nb7lQcbl/WM4F4/EbiEqH/6Pe2S49g83U85bFStaOjR/dUD5y2TZz5Een5C5jCs9W5BA
         j4KCxmn57v+OXYMLRhZKA1UqFyRc0ZbnxWyvDWp5aYNNcdVqpNTOaONfMKrbjFcXpJa/
         zxEEfB+SYOkC48GmICOo5fVLq16KF8vrKz+I1lQBaqYDcK369Kq9OWfJKbclALXt71Gg
         qG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
        b=KsndytLt5RFKkzxpqdx6nbD1N4lqbedzrl/rJaKePo8CRTAhtcuaKJN1bf0tPyxK1p
         O0EeAo4ggRBfypcrlb8xRXiitSvq5IM/Pl+BqNpNzqcmyrnTJLDyOyIjOknWIRA+M1C3
         GzwHESMf29E5ODVG4x+pS0JPPupz7tE+7OQJudV1gtxCY/lHxrjO4iORonYiT3TSCHVU
         OFkyHccbyvipsdDkuMeXmN5PeHpQH1nXCuIccAKM9YV/+na/ChhBpfgXHoEJ/WHeXCAC
         TaywqEOxBjuDuLJbTLX5jborEPAbA0THXPqLtyxdJvE0ftSQb1RVbZgAEcTP1hUi73Uq
         F28Q==
X-Gm-Message-State: ANoB5pkM7S8PjsJ+dvLtuX77k+T1yepYLfeTRSE4ce/da4vEXCt8+p9g
        bM7kS0GKlGb+ACkwUvq1fKPXeZu7ppEFaw==
X-Google-Smtp-Source: AA0mqf7cEekN6X6KQ4eos1UGBo978jGXjtZiZg32pj/0lH0vHRvTIorDX3ON/RRVv4zJAeY6zcF4jg==
X-Received: by 2002:a05:6000:1105:b0:22e:3498:9adb with SMTP id z5-20020a056000110500b0022e34989adbmr7343268wrw.335.1669250898063;
        Wed, 23 Nov 2022 16:48:18 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:17 -0800 (PST)
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
Subject: [PATCH v3 11/18] arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:54 +0000
Message-Id: <20221124004801.361232-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1d8a1b388d27..20e72038cadfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

