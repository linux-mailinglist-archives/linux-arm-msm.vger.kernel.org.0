Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B7D319336
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 20:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhBKThX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhBKThW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:37:22 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6DAC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 11:36:42 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v7so216531wrr.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 11:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0oJrlLa1XWix8J18XAZ23nQzXA4EZb1A3RY1JzHR5A=;
        b=wdMZ42DQqD7GenhjCm2sSpLmUB3FNGnp0Vb8PP9wcuaFQEbgjc653pIS7L5OamomWq
         xzytTTWnQomw4i5StbKFfdyU/b23hdiAtH8gN6JnRgVm0m4P9nSkxxJWpVKVFu1PGIej
         BsjQncIVFYMt/Pouk3uzBFl6/ikvPGPBHcTV8mW5oPNVpaJpf9pLBrBBrX4A4q2pWcgt
         C5DttvZwbFg8+0CHPJP0jIwhAYuQxlJaTM7aX3OG67gy1Xmy2a+iDu1Q13dGMymuDuWo
         p/uBFbcpmxH4fM1BF6tDTV9lWC8LWjHKmDy63uJHnLz31pYcuaopmVgCV0NGkbgN5OMb
         o3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0oJrlLa1XWix8J18XAZ23nQzXA4EZb1A3RY1JzHR5A=;
        b=IMuN2oniVh77ltgCas/5C4rKUShkWYSFLwCS5Wu2zdOS55v0PexAP3NmhZolnhEJ5D
         x259ur73jF4JtITBzWFAU3QJXEevODG2Vbq5QAIzF2PGh7R6RTgHOZLwQ4+eOjSuQGKp
         u7DQTE4I11znFJ0+DTbrZnQ+SzZv3WnErshYPq7LW187LoOlXnyS9zZNCvHHfLIqZsSu
         zUGYRpcZ9Ca6poXPN1h7Cfl5uklO6e9hyq833luefXPU/Jb3OoTUTa9+Furyw7+/+cNz
         0ACr3JxOrOHPflbOBm69I+OBLitaKEr11e3OtPkp08jsaYwU4wukTXZ8K727VLw3teQv
         qrnQ==
X-Gm-Message-State: AOAM532+wDiyec0bnuFHDUoVdgOB8fgtPkF6zH5NQtR7q8ZWRfZXxyUf
        xHVuYTMvr/qywqogX4nF2g89OQ==
X-Google-Smtp-Source: ABdhPJwAwFnT4K2bDQJyIX0+wceKSRYQFPASVcjdOZDRI7g5WqoHA+9e7yYMRk/DT7Sp0zz+1ktu8Q==
X-Received: by 2002:adf:9226:: with SMTP id 35mr7232631wrj.408.1613072199441;
        Thu, 11 Feb 2021 11:36:39 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id j23sm8788649wmo.18.2021.02.11.11.36.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 11:36:38 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     sibis@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Fix epss_l3 unit address
Date:   Thu, 11 Feb 2021 21:36:37 +0200
Message-Id: <20210211193637.9737-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The unit address of the epss_l3 node is incorrect and does not match
the address of its "reg" property. Let's fix it.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..80fe1cfe8271 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3721,7 +3721,7 @@ apps_bcm_voter: bcm_voter {
 			};
 		};
 
-		epss_l3: interconnect@18591000 {
+		epss_l3: interconnect@18590000 {
 			compatible = "qcom,sm8250-epss-l3";
 			reg = <0 0x18590000 0 0x1000>;
 
