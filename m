Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FE5675F58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjATVBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjATVBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:01:32 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700CCD0D85
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:27 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id vw16so16942483ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
        b=UblonUr+s3jct0bytTz09CEi/dhtVtIrCOEUydaKUCV/nj16FhVjCmy54wjNSZm3+J
         ilMkrDQHn9ekTI+QHM7HysK9lmccuS18P7DqbuUnIAHp1vxkoiUdP8jTxlyGqBHOrApL
         95czCWtwnx3dVgFJ9x6Qa6L4CdiFEUuTlrff5BsWS0WB/XvshTs+WnF2fvlcveY2+bRd
         8Gs6f4pmBQx6Jytc3dBfH7Ia0NZ8yYgBcDQ463zYzUpU0VtJwUodwawbWHH76FuenpAv
         180PMagFbFmzpRk2XcLSTA5IVHgWiciW8XotlLwTP+US0JryCSTsCwqy99RK2ANUZMjK
         +OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
        b=vpxKhZUPxRjvefJ5AT1f6IOe0uZaDDTpHpQ2mHpqGn9V5fhaT8BYFrYVSzRT+i8LeS
         GW4GACQLwwYQZ9wKRYRWcdjR9g/PY+nlFiqBAz3iwyZbZagEP+hQ2rtUVJEhrIlzpTgT
         nS7DJNbA5dmWSEzAtBS+QeAecIFmOEun6o+iGqYROAzoIYTKtqCXPYgpBshg+kOmwgYA
         7/oEOBK9K+59rdcONEfiFGts0JwQ9dI2vZRSDvSt2pkkd8O5GhWmx57Lwv+XQ56SKU+A
         lyWjRf0rRjX/5p29rYS1GDmqy5pkGBzw277sYXFOAsqSCrbsC7biH5bclyM6VbiZnA9B
         5O5Q==
X-Gm-Message-State: AFqh2koB6oIaz+fw9v6vYfyzS5+dWYmk5dElA/h6NV2CshhF0iv68yPd
        Qq+Z9u/i7TLJ78ZjTuo4dPETg7KCBheZiwSM
X-Google-Smtp-Source: AMrXdXsnKTMnn8pBggT8wypvx4ly24qXZso6gSXtYC3gBFgndudQ2tx35A3eKs1c9jb4wVpBxKIXeg==
X-Received: by 2002:a17:906:3610:b0:7c1:8ba7:3182 with SMTP id q16-20020a170906361000b007c18ba73182mr17143993ejb.69.1674248486565;
        Fri, 20 Jan 2023 13:01:26 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:01:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
Date:   Fri, 20 Jan 2023 22:00:58 +0100
Message-Id: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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

As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
wide. Fix that to reserve the correct registers.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 22bf6239c757..b09eb8880376 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3041,7 +3041,7 @@ mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94900 0 0x260>;
+				      <0 0x0ae94900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
@@ -3138,7 +3138,7 @@ mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x260>;
+				      <0 0x0ae96900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
-- 
2.39.1

