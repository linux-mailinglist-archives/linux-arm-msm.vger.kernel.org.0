Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30584634B2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiKVXhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbiKVXhF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:37:05 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3DC87A6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:04 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z24so19650956ljn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kArATDXyd0v10YSpzBFZj7xDn7196LQ8mvJQOtKXJc=;
        b=DdGctuyybWE7Q0hGSsNO/mzjqftRZGwcyHbOP64Bo62pNJ02747bjFH+ixj9A4hmYN
         t9aMdf7cICumuX8AVvrIESiqHeoWosu9R+9fKWO98P/Rt8edjdF56iN0Hxj8RgflwBO9
         d05LZhQY1KOPcMNwpH7JwlclcigBIvpDHGghDaJxMzY12Qa98ymV2YsIi/52Kg+OeNyQ
         RBZheWF4HiKtntUiVSUINYGNIA97jqzNhq2E4paNEqC48ujoslmNelRlAknCqGU46Ymd
         b23sF0gkDyz8HRcJ+8n/Mf/Kj3EPVXR96CUbfqst/RM703Df7y1QpRwBD36xt6xfyY9j
         y60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kArATDXyd0v10YSpzBFZj7xDn7196LQ8mvJQOtKXJc=;
        b=heAXW4UMz79Y8MNMA6OXuKwPzwPmJU6X6MPuOcfRFOk/uzQn9R6N1+fpQSn15gsPhm
         et9yK/330aY4vuCQerwbWMW1yEGm0AR8GOFWA8TGTdP3Nn/GNtZEtV2ss/+tbifqbdk8
         +BofRZCwZ2yeiBUfe4o1WvE2eK2VOsOEVXKmH/1p2o2mvImG7x9N7NR77ylRODuakqNs
         ZaWjDkvDco+6PaAcFZwPk3fR4KVqDqMzS1aLHHx0PLRSWYCHgGCD/fpHbRQRzZR/1cXY
         B/zf4hiYP3ZAqOX01yhAK1rUOlbPtiQDvnUYI9Xs+2TwNS+TeaLglDStNL5jSj0EA8bI
         IFNQ==
X-Gm-Message-State: ANoB5pnjHxAcgtUPHPeQMDbheCI8UXJxa0tWGoopee7t0bFnPvcOk7v0
        HtLtf+ImU36Xok+jDZR4FZOXJA==
X-Google-Smtp-Source: AA0mqf4B6xZl3zEIx+pTp2bO6JbfguaAicxjLecA9B1vl7PGNv1MTBTvSOsjPGIipSp9nPPCxiTAhw==
X-Received: by 2002:a05:651c:2004:b0:277:9e5:6cc4 with SMTP id s4-20020a05651c200400b0027709e56cc4mr8742268ljo.137.1669160222608;
        Tue, 22 Nov 2022 15:37:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:37:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
Date:   Wed, 23 Nov 2022 01:36:57 +0200
Message-Id: <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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

Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
configuration (yet).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2dd4f8c8f931..75b7aecb7d8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
-- 
2.35.1

