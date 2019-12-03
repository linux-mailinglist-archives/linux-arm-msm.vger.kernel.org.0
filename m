Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 264A210F711
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 06:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfLCFYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 00:24:12 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:41487 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfLCFYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 00:24:11 -0500
Received: by mail-pj1-f65.google.com with SMTP id ca19so1025175pjb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 21:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=XTs9jOzk9TL0hbRB6PjchZQOiZjWYWm9M+GqSi78t2E=;
        b=Kfohgtuot4VMjzMiYs1RTN4CFr9Jv/O7n0D/sGYRNzskj2k00jCBksRHVQfvnqUxAA
         2IbaRwkzM9ZN4Ci0TmKQ5Q2rUPnUKyEP8UtqkpfbOdifaxkbf92SIpyTA6bGOPeCHzku
         g5zteQaD96IhVul8m2Qn2/GwP1eh8em5lJ6jLEQzFmP6bc7XWnohjp2YYIyeZbkbE3MI
         ZnE3VIXaj3BwDiLB7VM60MzzpHGCZ0qMfHYlziNEzGnNBj15NuHbf035kLSiPA80k74E
         pWvKpE4Ql/uLYJ3e4ggEFrEVbGcTigkR+E8s/rYckZ+ZT++oeDFcO/pG/zALFSPy+oAL
         t0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=XTs9jOzk9TL0hbRB6PjchZQOiZjWYWm9M+GqSi78t2E=;
        b=U8v47Jv6dJ6vvAMCScP9DvBMVOmQrTS8fsp5fWa23R0/pcysCXYLWs7pRvC8TyPvyV
         Spb/kNqAvfleP9ZeiLLchxVbRyZbAF4HSvXxNhC2Inu+OM+iAT+wUaOuDF5Kh4POLEnr
         tlOWmZnA/2Y/qJpltOW/nnl9NhEMxx0Y7VF2zPxIMMoZbnw6qEcguo7GDUOxm+XS+8Cl
         wJ+FfR6XK8HbAMQovklFOq1gHfrQRGeftW1cmZo2yI2dZRltKhS3octPyn0Ne7toQYVz
         BYFeARUqSFPgbJGVERrUIu2C8Vnuv0W5mSggEjLjFpecy3FyEek9ZTVC9c8TgnStWSH7
         Mz4g==
X-Gm-Message-State: APjAAAVW5Kkrx/Df+a9YS1vf10iB2/etNgwaaZU2JFUuN5GH+uTQ5HMo
        5sKYPyF2tzXNiF6yXUMbth+KnQ==
X-Google-Smtp-Source: APXvYqy8GFCzB0hsgDh30sxoG3uiLFI3/zW3FYzh5VBo//Uenr05GQzjstP9U+bCmlG9zacc6MVthg==
X-Received: by 2002:a17:902:bd97:: with SMTP id q23mr3255257pls.310.1575350650547;
        Mon, 02 Dec 2019 21:24:10 -0800 (PST)
Received: from localhost ([14.96.109.134])
        by smtp.gmail.com with ESMTPSA id j17sm1449689pfr.2.2019.12.02.21.24.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 21:24:10 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: msm8998: thermal: Add critical interrupt support
Date:   Tue,  3 Dec 2019 10:53:30 +0530
Message-Id: <3ef309a98ca6445c1982ec3ff1a70db39b18f415.1575349416.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index fc7838ea9a010..4b786b8651a90 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -817,8 +817,9 @@
 			reg = <0x010ab000 0x1000>, /* TM */
 			      <0x010aa000 0x1000>; /* SROT */
 			#qcom,sensors = <14>;
-			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -827,8 +828,9 @@
 			reg = <0x010ae000 0x1000>, /* TM */
 			      <0x010ad000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

