Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF9D544BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243256AbiFIMYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245363AbiFIMX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:23:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F7D5FF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:23:57 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a15so37697341lfb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lCTRhbt4okJRARx9L2zabx0wSnnKkG9VZWoKlVnWoCI=;
        b=FxBHFuNNV6g2mDYqLVI8qNabQ5bAOYPreZrHx9tNp+QakZlANSFHu59alRdTlo+g/H
         XrwNOWLPsgitI8krbzF0RsDzSOXPKEIDap96kF1MImZpCmIhnpQJghOGivhTxUcCSr+7
         v3/R20+yMbPsSZl4FyEcQqqeYNSZXGzZht07KXmGDPPketkf3COzVgxwHiAiEUAL8lnS
         ARDhM2yNhjOpUqs0z2vzssgCP6QdiTBDTiaxLFsajOX4bR5JP7bi9Hwt/IpCwuVqm7me
         ohZ9Nnbg4C/csUUmokNVdGOCVhKouab2ktRAEFLozXQtryfHglgE1Sx3tgySz8Son8W9
         C7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lCTRhbt4okJRARx9L2zabx0wSnnKkG9VZWoKlVnWoCI=;
        b=TrQLYIXEjs5vu0fWOwEKqkE0iSQJ0TcPYIp2l09oYjzhVXjIfu9qwy5q1WFrpeCvjr
         qh+3P9BZR3HeRsFz0rTec+Y3uir/OvVIE3reTauVDCESKyvW4v06ElSI3Z5mvhl0RD2k
         uuFs5k00nrtml+FyUOkH+/hi8lBio4WLQgNeyGcAKWuT3jnjZxOXSeaFm11HU1UXoHct
         TBTPTOLbbpTbxskP+MDLOSSD7odhzj4ygqdvqRW9x439uWDM4JsKw5XzKac72ayuIGic
         fGgTsGy/HuDhP6yoCN9bzZqUo+J8J/VY6N9Il0ijmINOXGz7DjNIyve7AQRvl/mITszk
         QIMw==
X-Gm-Message-State: AOAM5304o2Oiqzkm6ZIV9quNReUsaT5KDDtRJR8MxYys75V/sTRL3Ujf
        OmvdSO2D6rjE8t1PEWIvtLQibA==
X-Google-Smtp-Source: ABdhPJwa9xE9mTnD2qCTO5hii7wZiGfDsJYgAE7WCXsQJ9ks73Rt75W2ZMDJfEiduInDO+yL59QUKg==
X-Received: by 2002:a19:7708:0:b0:47a:bff:509c with SMTP id s8-20020a197708000000b0047a0bff509cmr3995533lfc.299.1654777435530;
        Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 04/14] ARM: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
Date:   Thu,  9 Jun 2022 15:23:40 +0300
Message-Id: <20220609122350.3157529-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
hdmi-mux-supply property.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2638b380be20..eb6b1a1ff117 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -341,7 +341,6 @@ hdmi-tx@4a00000 {
 			status = "okay";
 
 			core-vdda-supply = <&pm8921_hdmi_switch>;
-			hdmi-mux-supply = <&ext_3p3v>;
 
 			hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 
-- 
2.35.1

