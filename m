Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D215345E2E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 23:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344293AbhKYWIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 17:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344915AbhKYWGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 17:06:38 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D03C061758;
        Thu, 25 Nov 2021 14:02:59 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu18so19521785lfb.0;
        Thu, 25 Nov 2021 14:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sjNM0SmpprH2Ybt3lGnDr03lBtbdsYNvqzNEYejWd8Q=;
        b=PYKkfTiTWkYf8HvGWbMcVxPSDsJb6kPY2+lTxviXtA5LgWGkD258oHR5zzlBWjHM8B
         u/z3UH+Qd67RTQvNeQo6oCo3lH30Hm8uniImTK2FEvYh5RrmkjOtwP++L/fjtI9NPrsq
         xX1mvH4fTNr4xsF4IfqAzgSZYLGJNvLdxZS1d8iKfQN0DXT5gZNnhgDMeA0SwGMvUsAZ
         V402AE4RUTLHq2eV1UYmow6l1cGGK9+KmBvBpronprAICQINMNOmpzp3Fvy6GkFi+SyQ
         yadvmffsnm+2Uv3mNvRGUWyjbPwL6Zn85zKtDwuusg1AMVJa20hd666a0clnTIFiyY6v
         qOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sjNM0SmpprH2Ybt3lGnDr03lBtbdsYNvqzNEYejWd8Q=;
        b=XmDCM/xjsKi2noinCtyZW1c1MKdPrGsS31fAGIg0k6XF1U2ZQBX91UWVa4v7miLfpM
         BN8p+vUHyRMxT9l6/I1qRn0tOALxkYOtLT+QFp4kx4W/fJ2xYQms/AV6w1xFJq9uLJwe
         f1/IdumYrLP8P69QZJyYEO3veB+2rKWsAkf+NVxcCCSrGI6GZDZ5sa3WwxnDv8t1HG9V
         oDZclypp7U6PgzOla5sBEKTSVXpau/pcJtMEZZdiUQxCMXGozFNGpIRPbrzZnKALjqbk
         3e24H4PQFYx93q6fmlLz5qcwpGZVfqs1wuuip9cs9RObKgMfVKigDFidZwT4KgkK50dG
         vkxQ==
X-Gm-Message-State: AOAM530bXMHXs7bQwlfCEsrti2lM2D33Zktg8ubep6TQIA51Bj5oSEm8
        f7yC60dN7sQNbEO9mw8FVgo=
X-Google-Smtp-Source: ABdhPJxNL52UiWFbYeqwEGrMXJ+nV0qL6DktEPN4uXUgMqYCgi03MNvgXvsPFqudLKWRhqupELw6OQ==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr25360757lfu.170.1637877777392;
        Thu, 25 Nov 2021 14:02:57 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id b27sm342732ljf.52.2021.11.25.14.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 14:02:57 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH v2,5/5] arm: dts: qcom: pm8226: Support SPMI regulators on PMIC sid 1
Date:   Thu, 25 Nov 2021 23:02:44 +0100
Message-Id: <20211125220244.62586-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125213451.62010-1-dominikkobinski314@gmail.com>
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8226 PMIC has SPMI regulators on the PMIC SID 1:
add the spmi vregs compatible to probe them.

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>>
---
This patch is based on changes done in the following patches :
 - https://patchwork.kernel.org/project/linux-arm-msm/patch/20211118210210.160895-3-luca@z3ntu.xyz/
 - https://patchwork.kernel.org/project/linux-arm-msm/patch/20211122235230.2467246-1-jm5112356@gmail.com/
 - https://patchwork.kernel.org/project/linux-arm-msm/patch/20211123003256.2467776-1-jm5112356@gmail.com/

 arch/arm/boot/dts/qcom-pm8226.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
index 25780c8fa2e9..49c2fac6f287 100644
--- a/arch/arm/boot/dts/qcom-pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -62,6 +62,10 @@ pm8226_1: pm8226@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8226_spmi_regulators: pm8226-regulators {
+			compatible = "qcom,pm8226-regulators";
+		};
+
 		pm8226_vib: vibrator@c000 {
 			compatible = "qcom,pm8916-vib";
 			reg = <0xc000>;
-- 
2.34.0

