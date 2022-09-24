Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685F25E8A64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiIXJBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbiIXJBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:01:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259F3868BD
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l12so2376591ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
        b=YnoLM0y8AhGG9ToxHsUlnsYxMNsaLZxpSlgp7WGtpNa6PZ6o3wi8hAmx+WXxKZSkSu
         lRGSMq69N61RNGainjYUAGwZsF3XhUytQzKNtq0XBuMcvNEM7xaAlRL2/bqORnlzyMJD
         RSxiz5MRxcc7taFMNG8iMXPKKtdaZGqTYpt8qG+Gee+pu+OLhpV3dvPE3h/G340a6arG
         WqxpiO87de9brfH2Y+qA0xnLOC4J+6YAOPhPz5KXQJNcOVdKgOpjcPUq2VzYRlQX3fDv
         DV2c0rZi7cduJ7k0as8lGCHDpRUjrSnTN+3G01izuN+2AWuXLTIgTPdSIORHKVTWHJcG
         kjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
        b=yp4B8qeFu0e0lIyeFBX27Aou/FOQiIhr/z+AVIrvg4R8o+zCewkxfODD64mgWW+U4t
         AUEGIpWYOSL9oCa5/PWV/R1O36HwnBu35JHj7bHrtom9+K17olJfr85XTk8htW6fzEQd
         GcKiBgs2HAJB3o6gygOXHw8prdtFdC9YKV3OUkQcXaVzBtpzIaTe+Owcl3qZ0mqcnvDn
         oX5wb80t+fOJ2aeRq11jiMQEL+gFXc0F5vlZIqkVV3oG3wqRY5rI7GcSWS15ZHmGBMCa
         /bnoS85QnVvXnv7BcTSG5dL6DNu6Ix/E4HdjgGTzhO0KhUy4fcg9m6vpbun6zh8fJtf9
         cUVA==
X-Gm-Message-State: ACrzQf0BndPx2U6fJBrGNg/2iRGNNWRY/SkranaFXCoJ2ZQSrjTXVdH+
        irTMr43SyoFJUCqO5xAIYF0DjA==
X-Google-Smtp-Source: AMsMyM4fBEsoQRvqBRVpB3PfI7JBuZLag/KTlUsaqinmzb5YVo0OIT8IaaJB8tuIjyiIGtafJ+ofjw==
X-Received: by 2002:a2e:86cb:0:b0:26b:ff26:ebf3 with SMTP id n11-20020a2e86cb000000b0026bff26ebf3mr4076366ljj.445.1664010073478;
        Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
Date:   Sat, 24 Sep 2022 12:01:04 +0300
Message-Id: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b82c335c25af..0002d92eb29b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3057,7 +3057,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi_phy: dsi-phy@ae94400 {
+			dsi_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-- 
2.35.1

