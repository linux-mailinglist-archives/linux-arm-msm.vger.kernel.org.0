Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D254261ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242303AbhJHB1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbhJHB1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89ECC0613EC
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r19so30681539lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFp/7m8gryHUoq+f87cJCv5Sr9eZMzxJXjwT80w0C30=;
        b=Tv3hh4qqM6YTzNxLirtrWtJHI2KZWlyziAvAo2x1Fn3mC4o1c/5cqgcDqUEXyEQQfb
         n/Szj1rkAiH8cT3FlLrbP8mtb36kowJku+OJ9erYxIufpJWBkq8mrtnrFQfy0LELDS+C
         lMI477cQ3HGoiA9xkVim8SJ3v18Cm7F4GREaj/vyT/IASXUDKtw/EYhyy6qC4zRj2Oss
         JVVTnWOhPm/O1KhDx58klUyBmaDKvg5lRc2NyLcY1BxfrKdqgRvx1rQP6UNAky76k1Sp
         qu4hSre2FwLEKmdpEAIMDfWmf5sv9vaJ5GTsxRw1jrD63zb13EXBbCqce3xYIatOUxJd
         g+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFp/7m8gryHUoq+f87cJCv5Sr9eZMzxJXjwT80w0C30=;
        b=fVEfbyDDfAzy8eWoIIdoFCEl2hE2+CLgOz3qkDJTo3Guxu0Vnb+uSzgCBKlsTSMjIm
         l6joHSHx9rk4ZQk4GP77Zj23g9vLOltEcWNSBFRXaOIG4BbqcP70pZ8g0eYVVzK+OrrQ
         uWm22GFa5xyrVhJJglgnF1S6xXnSQQ8IjO35A2hdFVT4YWWM1UNUZo4WKT/THE9ozNlt
         QFAiwTNKW4Kdg/PNJM0frCyS+idzPBvvU+d/bOKFjZSR5lFgCNEbSehrIW/Vjhryd6//
         ezMfeAxmQbDbyBKzR322fPZyuV2+aOjdsFCnN5t8I8tKrIZfCT/Tw6Tf2xggqPq5qvaY
         3knA==
X-Gm-Message-State: AOAM5308b0SCHCsCU/bFnL0lXEePugg/h5nRrOhr5HK7wCahyL02wjKE
        d/bGb2d8Vrdm3+kRAenmsf5DZw==
X-Google-Smtp-Source: ABdhPJxV89e0kPC/Tpiw58wNVSg5OAz1aGgdQw/L7qiP9anRB9rkUCO885Gbxkb09xyCwG4mUKPH/g==
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr345526ljp.367.1633656341223;
        Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 20/25] ARM: dts: qcom-msm8660: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:19 +0300
Message-Id: <20211008012524.481877-21-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-msm8660.dtsi | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index d404d386d392..21cb58ab68ac 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -308,20 +308,8 @@ pm8058_mpps: mpps@50 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&pm8058_mpps 0 0 12>;
-					interrupt-parent = <&pm8058>;
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
 
 				pwrkey@1c {
-- 
2.30.2

