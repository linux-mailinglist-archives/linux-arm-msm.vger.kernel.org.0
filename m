Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112C34261B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbhJHB11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbhJHB10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD064C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r19so30680137lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XPJhiyssMgP/Qx7CEDMKniXc51YWsJz5iKb0grR309U=;
        b=zHkhIrBZsf97wg1GpfqsWTxEcnvewzjvW1ZvTbuX+11eHJpHmbkPgUgxjeIW0Ra5DJ
         AE6w3pHGdyNVCPo2ikh5V0TVJoftg0TRxJ4M7R5ALH/qmwjP01dN7YbTBDqOnA5CKjrh
         eyNQd/sh3/8WLyLjHA0zS1R/29dst3pdBHtMQhskY4ZC3lQn3BKtikTWEe625wkWe9eO
         4ybVmizrPyFMTKzmghiTACVfYBChfezA8kOg9yRxKQYjRDDWahzLr0ahzalkXMFlGhKv
         4sxasp4UvZOoIULwV0DjTVxPxTtkPQNpV2gBr3XuiVzoI3/hoqTMaGsswkSvP1qxPdtw
         X77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XPJhiyssMgP/Qx7CEDMKniXc51YWsJz5iKb0grR309U=;
        b=UNbHBZmP2YXB0usKCqROjKpVnJOBlFy6RqbZe0Jm0F+faQGiZlV7nr9nUiATFrMnli
         wWyXdc28XHALNiIHtnxWZQm7UEBjz5ZmutsaypMLCh+xhu82OCbVD67A7y3DG1fMOAX5
         sXFYSKKeiKjK7v9PlxDTPMUCMb9gE2okH87b3v1qq8zXJ8St5CDc7hSaJjSdOEs7WJjl
         84YsCBcD9jI9lbZllGJZcwqQL3Yml/BSBqltkR+wYxo1mY5Jeg5eB1Q1w5UwKtSYRFoX
         m6dxPWMl5Y2LQREo0jTDleCpn/EP/tGuY6aSGn095R5lG8qmD0azdoAeBDa7XDQpV1VK
         mvmw==
X-Gm-Message-State: AOAM533lJR7TzIRW+sAEmxJ/78NuT2ZpuKxnTxRU+qJprKQRcYnaRKNI
        wgeIbjccrYyRUOnvNmfKM9ymcg==
X-Google-Smtp-Source: ABdhPJzUUrhEF2sHoU6goliUT5IHs3yhFcdNw0i2YUFBJszwRX7KApT2n5LWAONbuXn/yo66Jn/jHQ==
X-Received: by 2002:a05:651c:1793:: with SMTP id bn19mr307276ljb.475.1633656330207;
        Thu, 07 Oct 2021 18:25:30 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 03/25] ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
Date:   Fri,  8 Oct 2021 04:25:02 +0300
Message-Id: <20211008012524.481877-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add gpio-ranges property to mpps device tree nodes, adding the mapping between
pinctrl and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0b2bed6e7adf..cbc9be8a69cd 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -689,6 +689,7 @@ pm8821_mpps: mpps@50 {
 						     <27 IRQ_TYPE_NONE>;
 					gpio-controller;
 					#gpio-cells = <2>;
+					gpio-ranges = <&pm8821_mpps 0 0 4>;
 				};
 			};
 		};
@@ -726,6 +727,7 @@ pm8921_mpps: mpps@50 {
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
+					gpio-ranges = <&pm8921_mpps 0 0 12>;
 					interrupts =
 					<128 IRQ_TYPE_NONE>,
 					<129 IRQ_TYPE_NONE>,
-- 
2.30.2

