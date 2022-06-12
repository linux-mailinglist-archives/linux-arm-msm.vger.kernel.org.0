Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE355547CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236764AbiFLWd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbiFLWdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:33:09 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A525186D8
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:08 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y19so7840373ejq.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eR7xY6lS7qy0axCQrfpxoseWuY+nQOhUy4dsHTTM5IA=;
        b=NvJgifNMb1x8COC/Kt/9DX8Oj59RbXf+Gh45Hn3bZNvf26PQpvBWV9kyNfNmm4r8T0
         Lwg41UH3RTq9EgR8k7N+yytVzS+op2c8StzfYn/GYd5E11/Y0YyESmaM8vTdsdfKGa3m
         3JTFQYVQHgB1SYrB7VRHB5KY+57Ry8tX6AMVTE+vwyjFPphsaH7S6GJ21ZPp97d9wzkX
         u840GZxM8C4y9t3utyGXD/7N6FVlhfDPzpRqijnWOF3loQQ+/u3Pe5KnRm+9CzaOqcNS
         Oe0zArRxosOzrlhn3DQ+KP3DxVV9lYWLGJTkf5zK4AB7XcQJc7RsDVJzWanbUnPLTWMp
         EEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eR7xY6lS7qy0axCQrfpxoseWuY+nQOhUy4dsHTTM5IA=;
        b=Ms2tJ2FMHeNbvOA8f3u0vjOCf64JFAkDEWRQua4lCd2Fg8uiSYHn6Kw2q0eo1ICK7a
         t8SfeISCbpjEeaNom4q2e0CP6c8JXagoPcqYsh1t1kYW2BRnLmrtW9ME/T2dpRTn7hha
         FGP5aA2b1sCzyNnsKCQLX/qjKhR3MdOD4m22ZFDxwbQaCbLPZGV5EQNL3QuixVMbhzs9
         5LChRbg1uaeYaaCEa04uoShEHnaPC3PRVy5jf5JFg8cjwe09QOHIo4QbqsA+UcLvVBxE
         Zes+rHijg8JXRL574cso1YYaF+9AR15VCYZ7kxAW8BteU9IRNi87VQahZXfs7VLiadM6
         T7/g==
X-Gm-Message-State: AOAM533tZSC0yWr4XG90Oa8Mn8u6oZIIKiZj31R9/3bAQNbr7QRJ7B6/
        deZ6vCEEWzidR6nt+zgeTuJsTw==
X-Google-Smtp-Source: ABdhPJyQaI5jxkHFwC6iLgltLRmFbZGJcK+fzDf9TuEySPBD8isx5N+aDO4aJtTpXgkUCVltjh9MWQ==
X-Received: by 2002:a17:906:5a4d:b0:70f:7d1c:664b with SMTP id my13-20020a1709065a4d00b0070f7d1c664bmr43946954ejc.540.1655073187991;
        Sun, 12 Jun 2022 15:33:07 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm3766559edu.97.2022.06.12.15.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:33:07 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/6] arm64: dts: qcom: Add missing space around properties
Date:   Mon, 13 Jun 2022 00:32:00 +0200
Message-Id: <20220612223201.2740248-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing space around properties before the typo spreads to other
files

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42af1fade461bdfa..03c18c74da3081a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -34,7 +34,7 @@ framebuffer0: framebuffer@9d400000 {
 			height = <1920>;
 			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
-			status= "okay";
+			status = "okay";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f1619b3f97ef80d0..eae185ced74a598c 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -817,5 +817,5 @@ &wifi {
 
 &crypto {
 	/* FIXME: qce_start triggers an SError */
-	status= "disable";
+	status = "disable";
 };
-- 
2.36.1

