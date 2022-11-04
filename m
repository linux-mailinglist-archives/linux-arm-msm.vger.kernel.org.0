Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4F161973B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiKDNOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiKDNOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:14:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110332E9F9
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:14:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g12so7372046lfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0A+163PsmJ1ptBHVITMcGJc85uOhQS9+0yCpVsRSF0A=;
        b=gs5fqzhhKvrVEkw0m3PxqCwS3XU7Ha/eC7UnZkIgDKPXNl6mMBrEs4g3n6kv5P/BLU
         n6srU+YmAXb8O5n7O/zykMB7QxzgGq8NyuCG6tNswAaPuuVLcxlH6eSuMuxG6lP48H4t
         7Jw4w2XD1n86b+sfaN+90ntGLEpxKii1TK++ErUAsrCzzpp1DmRgMTMrMrazVG/RlgOK
         kWzi7l6TgcxiYzlBwdmDUU4phfutGvCW76YGhV9Ubiggcn1qVsGl2VmhL3XEPbjuDa1d
         uYKrrJYfi23Q5g5cDbqwoX8HUq5tN6mK0Q/yCoV2vZk2GqtHNjLxPBOqeB+r64CPURPV
         iviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0A+163PsmJ1ptBHVITMcGJc85uOhQS9+0yCpVsRSF0A=;
        b=MqIdccVw/jjltSvhUp2IQBycIAzjU0gjKors6zVZEHxRSmRq1xlmqBCJsrsdOWAo3Y
         9nf0eX6hFDb8IpOk8AQJrAwOW9xaEub0i8Bsn4DNOhBi5xsmXp+EIR7/ouUUHXTMZJzJ
         Q+tnjC548/Nzvfz6it975DMPfkC0z9uIFqDxxiRThtn6GJqiitkfPkP5IN+4UCE5Ht08
         fArNcDAluW9tMbVLt0RIbMD+rBTl+G96T9cwV/GDrvZZFm6sniQ0nk/eHfhW9f09FfzN
         LMKsQXfz6B/9qWMXQIHR8IPPWN4/BtXouEQF1komC9DL5nRpEjmKO1Db9M1sxacFy2qA
         N2WQ==
X-Gm-Message-State: ACrzQf1o9/r/+NNOATHNpJo1zVviJ2h1m8LjUWbhG866fGgBYw89VU+7
        sxSyvhnOSyYW2RThfveQ5U7bOw==
X-Google-Smtp-Source: AMsMyM78O/BAXjokK2yZirFBQBDA+Dd92E2KeDs1dZNLPbeZ2SBLnHkkbYexiP8Obr8tEv0r7+lKYQ==
X-Received: by 2002:a05:6512:282c:b0:4a2:1c88:e1e0 with SMTP id cf44-20020a056512282c00b004a21c88e1e0mr13111661lfb.501.1667567643428;
        Fri, 04 Nov 2022 06:14:03 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:14:03 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
Date:   Fri,  4 Nov 2022 16:13:56 +0300
Message-Id: <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 38ccd44620d0..e1a4cf1ee51d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -442,3 +442,21 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
 };
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l6b_1p2>;
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5b_0p88>;
+};
-- 
2.35.1

