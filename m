Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D60652095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbiLTMh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbiLTMg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:36:56 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA6D18B37
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:54 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id r206-20020a1c44d7000000b003d6b8e8e07fso56962wma.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
        b=O9ARsqeRlkHqlFnRGCHa2dOCBlZCTEEToZrHu+6qz0OfBUJFX9Eot4K8S7utWQ/yJ1
         ME9jgXI2WWeKhbGPNAGIPaQIhTNdVHWaoaxdy2fsSucCXHdhc4tpGmKC5+J8ALRMcYRK
         /fBTXmKh4PJMs+tn27WR+vrO8QX/3mGmgJlYE6IL7tKZD2eTK9j5I0RrzAHVHWd24rmV
         wTq/fWL4pUhevnKQzdUSF6psVU3yDvVzIOpF8H+2FjgJaUmMH1Lo7E0F0SLaQS4bxTb/
         Iv2j7ldZ/kcAVxmBUYxYEldS9MON7Nvu3+PhCamN6hNs8vWyknFoMxleSZ026GhJIQBZ
         2RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
        b=jlwUgkU8R2QBQuDrxNJyoREmRMLK5hD3MlBTxIvnigD9O044maTFbkworzbQ+CdkVa
         OGo3rnbXE6eL9zGxUhoaEBBXii/SO6h3eH3AUOYczpCN1IilwCisetwgPyAhdjO1OXGa
         dg4AaceIjT+Af29aMdbOaag+mVeGT/Lbdc9WcvUUECBX0DdCyyx1PdXqS0qJ/jTckQB+
         mOFKo9Y0toXYCfnW8rZ0ukSa7IrbdP1gqrbgSNYoJFsWtNOg6KnD6UGCAroCG/ipwsbs
         hm2uCw+6C8VIBDFjrVfBGtmywGiLmGf8lqryKl9s3sBBRantBXojrBYBpbBMuItavwJZ
         F3nQ==
X-Gm-Message-State: ANoB5pl9BBUdnZL6zx4mPy2PF/08e0DXg4w1mQInbFYppgH1zuxp0V01
        YAmvYtIblsu3vInvqYsBFComf16pPdU2UEDVQaA=
X-Google-Smtp-Source: AA0mqf4NXA4SWHt2nfjNUNn8kBNAzpqqphrFZ89q8nt0gHH8Yeya7czTmnjuIooMSUSU9Z6PAkWGgQ==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id k1-20020a05600c1c8100b003d1e90717cbmr34576993wms.1.1671539812355;
        Tue, 20 Dec 2022 04:36:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:52 -0800 (PST)
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
Subject: [PATCH v5 13/21] arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
Date:   Tue, 20 Dec 2022 12:36:26 +0000
Message-Id: <20221220123634.382970-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a9..ffb4ce8935b37 100644
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

