Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5C4669130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjAMIhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240323AbjAMIhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:33 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06068671B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:32 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f34so32086027lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLJMlwIE2ivCM5iNS4Yl4cLBMQjZouDwHRiiDzcW0CY=;
        b=am7RllIibc+4w5K4PgGtPzH98gavdp+XAnkoTcKSphbyuEveEVTFguX7mGPiSFjZ1s
         H/Af6MZHaAxbXS896sBuSK6z8wmewuUO5vPLYn+FeuEcKV19/qqjJRdzzwdx6LPQqicg
         apl2HxJ3DUEGrrydUTA+elfCpkBC8u0xOIDcDcX1+M+M1EIPCTH2i9R0qd4A9W3+O1ZI
         R5JVszRpmVTdVTXQhUbo7l1rZWwBheIQ6DF2lZJ3je0ItK25Og7pRUJ/QfgXp4DMNqDS
         c0Mx2HgyvuniOO0tK1XQ4a6GZE+XwAsbGFFYPOyK8cqbWdzxII6/3Wd5f0kSS74V9rMZ
         VNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLJMlwIE2ivCM5iNS4Yl4cLBMQjZouDwHRiiDzcW0CY=;
        b=wCSQfOx/NxQpdl5ziw32cW3CQNN7RtCEC3xJKCJs5pQdSQlk5emKNbKuaWSXb4YjQE
         DxhCLL2z21FTq6l/xtsPIjkXJH+UpQI/1MPWEwTNaTYuM8WrAgIJXp6CQndMQ+wboD/Z
         2Bgv0V7NDDf6HSEOw0cbnMEJfQtN6s8k5yFOFAW/ucTaMK90Y4c0FzMlLcqxJ89oxe5g
         0fl98teN/LSip5LAi5V5UWEQDLJIuVqJLwBUVDTHszqzhvl2OQ3xDuMw2Iq4PHjxP7U1
         d9kjc7RwidZkeq9ORAUw+ZAB4XAUSo4yVyE5q/aazRyNHqvi99bUORC0MtwQ9kNLjDAi
         +K6g==
X-Gm-Message-State: AFqh2kqsM91w0iz89nU/Tx9N6521e5Cpge2FdsWPrGSj44jtda9sWoRo
        awADCNV0xztkL2ejmeLA9qj9xg==
X-Google-Smtp-Source: AMrXdXvMzCtBw7xkuMvF9lviswazfUgh4vuKBTBKu8bOtElTX6ETEDv711lEA2TMVSbhPLifcOGYYg==
X-Received: by 2002:a05:6512:3482:b0:4d1:5baf:8453 with SMTP id v2-20020a056512348200b004d15baf8453mr171156lfr.11.1673599051591;
        Fri, 13 Jan 2023 00:37:31 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:31 -0800 (PST)
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
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 06/11] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
Date:   Fri, 13 Jan 2023 10:37:15 +0200
Message-Id: <20230113083720.39224-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 3226507a6f09..1d8b8870b990 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1578,7 +1578,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

