Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE6542FDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238688AbiFHMHk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbiFHMHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4472B1CAD02
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:31 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q1so22495665ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDBKU4xgHvGFrezVeATBy53n8vUXQx7PhLrDpuBLOD4=;
        b=zMmuc/84StRSzomRzYwYkOTluBMw+YRiUPxxGgiwpJBcPSQS8CDIuhceJv/uFsRV++
         mzvEzRCJvXITD//EvJbHoo3wfwmj3qCs3LWO8TTIFX4m68+UqYURFwXnt8VjcSAt4KjE
         1z10+1gxzQY3qsiTBkDL98DwZa35SnFx7LExEWLJDO+ZOK8HM8zV+5F0OezD4BleycKy
         wVnc78tc+bXdEpu4lGrpY01/Du06cpy6hX6E8w4CK5MGL166HfNQPaM3X3Aq+616Sw9a
         N6anojECNgXeqe5CheDJi0H4so3Xl5Vihf6pH6gUeLflvko6uqWoLGAfEoKSAyaWNCEF
         8kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDBKU4xgHvGFrezVeATBy53n8vUXQx7PhLrDpuBLOD4=;
        b=D0KW2KShZVEX76x7rq4pa4325uZUvKIrTCppd5ns6gehjl2OT3bYvMkdKQcpzID2wl
         DuVGRq5myEc9zMyjmSSU9qvbqiWmtjH6XDdGVRez+6ooIS5lrFVQStIenbQ94HpjLwmB
         ++CY7RhktWxMl902p/eZt/BP8sD0yd65oVnbahBi+zaiek+aPU94IunmMfAIQZEyJ2gs
         1Lbcwf3IcPuK12qzqA2tGd1b9CEF4qU4oAknU+jDHAxqChnlcBj8fzJY+vrK60ZP4ymF
         N37thX966Litt22/37a26yE6efAC1jNDAUD+MR2d2lVC/b4UfkeA6aHss/ELSFd0dRc9
         sprw==
X-Gm-Message-State: AOAM5332qJHNVCBX7g63ZDX38WA0Cd6LJNTsU16R8hCt2YkAGGWqjiD6
        XIpLjQL5sDNM0NtI6fkLrfTnjg==
X-Google-Smtp-Source: ABdhPJy/S5pVnSNNP6KRSYp3iaasr5TE0F0eWIvCe2hCYSzGL89wafjDuU8uxmo+hYriHLwvIbJSsg==
X-Received: by 2002:a05:651c:199f:b0:255:a45c:1517 with SMTP id bx31-20020a05651c199f00b00255a45c1517mr6258544ljb.25.1654690049580;
        Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:29 -0700 (PDT)
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
Subject: [PATCH v2 04/12] arm: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
Date:   Wed,  8 Jun 2022 15:07:15 +0300
Message-Id: <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
hdmi-mux-supply property.

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

