Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA3F6638DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 06:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjAJFyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 00:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjAJFyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 00:54:39 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF699FFC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 21:54:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id cf42so16677454lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 21:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9V7IctxQhFjqqHOvM2m2n5NBsQdf9FVh6jp3d8ejZw=;
        b=FKBjCgTMxGWGC2SnMZtgtilG9ExKqtnmPah5aZiRq038jV2T+JM8/bOsQG+15l3l/6
         gIuk3NrAgotZYn0yHDXAHl7MxHnWk04Ca3ITsvkHfr8nH7slvwlDlcuDSzcFfmwQlDRd
         R7ZZXdapDthIKaCyaas8O4j3X5D5NzdlNnpNmmkMs34IPSV0HFQr9csyl/yT6O2GlVzl
         4M18QY10TKUH9uEjJGl61WPmOc6SPV2UyDX85JEif+jtWYVq06lWcXzyZhbSlrWOFO08
         /vqqwWcR4dzBDZzWSYWoPQotQgnI6SlsJblOKpJMjRTYmarIux+ex0rbCCvQWnRbOPjX
         7avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9V7IctxQhFjqqHOvM2m2n5NBsQdf9FVh6jp3d8ejZw=;
        b=KfR6AlJhO0bHYSJOEaQEygrJ5oQz/P21rxCIEle0iV20Fh9QsCVzCVNb+6ri5doSeW
         EikcJPijM+8gTjxvDuAj5TBKFN6JvcvFIulj0JSuWgtCK8HE4RraR5z1AZVdk2t4oX2X
         /rMaVGBVjiHMB87VV2fwvkNWILr1AMjRnpFJhk//on/IOK1hrrlJa1ss8J+m62V2Kl9Y
         cHOEnL1wUAWgwcBfhmfaTY87AsPOjqI2Cp4cdcYd52JJ0ni8rLJCSwrCPUnvLgtaybb4
         4vECpUnriucCYj39GDbIB1BynW6BMrFk5WnkDLoMg4/LyiidXiX4+SgQu+4NJ99TLrcU
         Fgqg==
X-Gm-Message-State: AFqh2krNvukPlLGVN7HZeDaATI/7B+RKGdTatOyMyZeitMwDMmMNOe9e
        FE69eDP1BAX8k4VsQ1HF2FePyg==
X-Google-Smtp-Source: AMrXdXuBRJ6AoE5cMdln4pKXDM+GdLkXNO5wAWcrdtKsooiDYDw7hTF53AbF9itFsxzRM9IlZw/iLQ==
X-Received: by 2002:ac2:5088:0:b0:4a4:7be4:9baf with SMTP id f8-20020ac25088000000b004a47be49bafmr18724211lfm.59.1673330076556;
        Mon, 09 Jan 2023 21:54:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:54:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8450: Add compat qcom,sm8450-dsi-ctrl
Date:   Tue, 10 Jan 2023 07:54:33 +0200
Message-Id: <20230110055433.734188-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
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

Add silicon specific compatible qcom,sm8450-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8450 against the yaml documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 0c13e9b428ce..52aa6f1f08f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2770,7 +2770,7 @@ opp-500000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -2862,7 +2862,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

