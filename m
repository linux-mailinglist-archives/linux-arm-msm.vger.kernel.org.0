Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CBD2C8A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 18:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgK3RBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 12:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729258AbgK3RBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 12:01:16 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5D7C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 09:00:30 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id t18so3502859otk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 09:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qYtC9M1bspDFOXZgZ8xo6XSnP8FNfyQGj+HdlUXi5ic=;
        b=IABMGf9WrjddPqSaFG9QbmVHsAaSw8qcauxtUQ6cXcIPXN8G1K2SuaUeoXePjSaZlm
         DZkOPqSvBnkFT05ytEvshm1Jxd8nKMz/Ez1dV1XthOtZxQjV4dV5GyWkkny6nYQRhq9M
         vhdH76yVp47kyxEgU1dTjgaFb7R02c82BQnZhfk569gGPu+zkQ7Z4f8EvtGo6pwjnNaZ
         X1+mkdhXO+EHQkSna9r7pgd2X4fovP/Eg54MW3Af6BrhuVdxDlj/T84nEhF18P7w/ZJg
         EMpeMlRl7CGf8rtocAhHpK0pA+kAJL5a/38YaSViWI0xRIGLiT5Q/9HTmAcWTg9rcS6R
         gFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qYtC9M1bspDFOXZgZ8xo6XSnP8FNfyQGj+HdlUXi5ic=;
        b=PunqFIGogTMDh2V/BsJVCpN5e3DKLbwe22ces2j6+CkoryrvSkVf/cCcYPP/CodZrU
         1y5J0CufP3m14Vpyur7iRlEC9Nz+CEj4RvQ2+HQCjnVQecJ50/4HKP+yIZl6w5+lkOr1
         bt9xDHRfxjfePB5B9I7S6c1kTRPIZIZ8Oj7j1hJzc4uB19bz8heNt/bxAjKtc8VDSDgz
         NCeG6ViFuBBMy8Uoys8XbQE7LozTnTVSwOAh3KzR1KGP6uLHKeTghKX5Pzav/38Sg6zW
         jATZHD7ROLbdc2nLNH9s695mVOO8VOF0Dx7FoLaQ+d4Q0s3oTlvwEd5mua7WM3lQdMqh
         hKqg==
X-Gm-Message-State: AOAM530c6IbnbaxRf8p2QI7H19cZlUcv+kAu+6NJoX/Ny4pG7iro2bAg
        HUwG3N/8W9f8fhESXmNvWSx0KLLnGx2C5g==
X-Google-Smtp-Source: ABdhPJw6EST3+EemQHFgvmqWIHQ0jHq/4hXRRphea3qDzv6XB92yP5K5TLaNUluAYKEfpnhQoltreA==
X-Received: by 2002:a9d:694c:: with SMTP id p12mr18481707oto.236.1606755629679;
        Mon, 30 Nov 2020 09:00:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x131sm6373327oif.52.2020.11.30.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:00:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Fix pinctrl pins properties
Date:   Mon, 30 Nov 2020 11:00:28 -0600
Message-Id: <20201130170028.319798-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "pins" property takes an array of pin _names_, not pin numbers. Fix
this.

Fixes: 44acee207844 ("arm64: dts: qcom: Add Lenovo Yoga C630")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 399aef2a0951..bb314973eb0c 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -432,7 +432,7 @@ &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
 	i2c3_hid_active: i2c2-hid-active {
-		pins = <37>;
+		pins = "gpio37";
 		function = "gpio";
 
 		input-enable;
@@ -441,7 +441,7 @@ i2c3_hid_active: i2c2-hid-active {
 	};
 
 	i2c5_hid_active: i2c5-hid-active {
-		pins = <125>;
+		pins = "gpio125";
 		function = "gpio";
 
 		input-enable;
@@ -450,7 +450,7 @@ i2c5_hid_active: i2c5-hid-active {
 	};
 
 	i2c11_hid_active: i2c11-hid-active {
-		pins = <92>;
+		pins = "gpio92";
 		function = "gpio";
 
 		input-enable;
@@ -459,7 +459,7 @@ i2c11_hid_active: i2c11-hid-active {
 	};
 
 	wcd_intr_default: wcd_intr_default {
-		pins = <54>;
+		pins = "gpio54";
 		function = "gpio";
 
 		input-enable;
-- 
2.29.2

