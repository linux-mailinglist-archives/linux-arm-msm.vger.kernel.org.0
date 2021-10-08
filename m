Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8228C4261EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242053AbhJHB1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241740AbhJHB1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684EAC0613E8
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y26so32781268lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQKiFrIlu4aY0PWyyaI2rChbhDxGEcd2OHWvmY22ZAo=;
        b=VdvRqe+u6Yol+YioW6CZJicr70CDuUrGovPClHwleRc85YBA/N4i1jWSvugRV8FgF9
         cVsJ9q3YpOspPP4X6vqPU0ox7pnYbduXrW2GtMXdFaBnDdf3gQMwDYLMya88QAHue7Xr
         5XdvfheaytUhZ2af/y1vQ3TkwAikTmUjdTWpW1AP7wyj1eVmfWHDx5DMCFPDeGfhmc2V
         sRwfZ6lgs+3HmCllSNXiUUAXWnEU0KOhUgKjF489DZxJobbOKM9CC8ejMlsb6e8u0Kur
         A2l2/PS7Rj8EPPsqnl4dZ1B0PyJyjOijELe/Ug4+MzylD8RwFW3WezfbFbWRLWQ2QKOR
         IUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQKiFrIlu4aY0PWyyaI2rChbhDxGEcd2OHWvmY22ZAo=;
        b=Mx1f5N9dox8aXDillxp2aGwkTXWAPO+xt9HHjnB/gCWyy17dLxwCNIc+FewFECFF4/
         O/yheRfQBly1oRcRMy6lHckrYICTwLF/FK7cVALD0f7hM5+wms+h4xNUWLCMGaya/4hw
         0S0LEKPMvGyHdOfYn4jsRZiV0ttlzIeIRa9MNmNLYElghppqwB+DZZk/F0EunOj1i3Vk
         eD5Ri53lj9xWiuXM5tCmP1DwgpJThlyuiigFzYwctbEKh9aytEJs/fkWcXp3zYi6DNaV
         HgNDQ1ckTN8yKXStKprbFR3Fbtkw32PQtGq8QgygGb8I57qC7jDW63Uglg8nKrBbrC0h
         j9lA==
X-Gm-Message-State: AOAM530a6+c4Akdc6dW9pCMVal9EfygGwoTs75nPRdSW5zXGr/4gyyiL
        jchtCwSjNw+8PjGhLubY4BcoGrgKh2K89A==
X-Google-Smtp-Source: ABdhPJz/yPBXt97ilRGNphY8eRn9Wa01/2mCI/Ojy/r5UqbQdnZSfb21/Umrj86ttO00zKEC1BBR7A==
X-Received: by 2002:a19:674c:: with SMTP id e12mr7862935lfj.679.1633656339824;
        Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 18/25] ARM: dts: qcom-apq8064: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:17 +0300
Message-Id: <20211008012524.481877-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the pmic-mpp is a proper hierarchical IRQ chip, add interrupt
controller properties ('interrupt-controller' and '#interrupt-cells').
The interrupts property is no longer needed so remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index cbc9be8a69cd..5aebbeb5eb07 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -683,10 +683,8 @@ pm8821: pmic@1 {
 				pm8821_mpps: mpps@50 {
 					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
 					reg = <0x50>;
-					interrupts = <24 IRQ_TYPE_NONE>,
-						     <25 IRQ_TYPE_NONE>,
-						     <26 IRQ_TYPE_NONE>,
-						     <27 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&pm8821_mpps 0 0 4>;
@@ -728,19 +726,8 @@ pm8921_mpps: mpps@50 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&pm8921_mpps 0 0 12>;
-					interrupts =
-					<128 IRQ_TYPE_NONE>,
-					<129 IRQ_TYPE_NONE>,
-					<130 IRQ_TYPE_NONE>,
-					<131 IRQ_TYPE_NONE>,
-					<132 IRQ_TYPE_NONE>,
-					<133 IRQ_TYPE_NONE>,
-					<134 IRQ_TYPE_NONE>,
-					<135 IRQ_TYPE_NONE>,
-					<136 IRQ_TYPE_NONE>,
-					<137 IRQ_TYPE_NONE>,
-					<138 IRQ_TYPE_NONE>,
-					<139 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 				};
 
 				rtc@11d {
-- 
2.30.2

