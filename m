Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E71BD89B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389903AbfJPHfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:35:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40156 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389892AbfJPHfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:35:03 -0400
Received: by mail-pg1-f193.google.com with SMTP id e13so5552340pga.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=aMdrJzILxuSr5g6YT+uoh2+W6L6BuGxRIbKk0lFLJqE=;
        b=eFrfxwuX98m0mVPWQgy0cowYXczi0HbPFwOzG0WXPWDMKhxZNa2L/BnbDyE8HZFs6p
         1d3qJ+Oyockzuq8VqIuYGZPTvcKemsVj3el1JZ9vK/pt0K8Twj4ysuhMHIBDJ8ZYSOk/
         L+eWvz006UruJo4tnbK0GyQKVPmSD/7O+EyqoKrifnBP+uO0sT7fHmCs0C2+fEVqyu/s
         5lloeBdzKA46Vja3aVGdGAnoTe7EEtvl+7AcP2yGDSXUxOF+uGlrZrCRawPY53gD7G0O
         a9K7iXwWZj6osIOEXgS8vMp8NJdpBD6G1hA9BiOoDDyqeaEPDQko0FJLQbkD1QBe46jz
         HHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=aMdrJzILxuSr5g6YT+uoh2+W6L6BuGxRIbKk0lFLJqE=;
        b=FAzpGoGvWp1/JPc24qdOZrFx00mokZTDjELzxQr8kzGPAJylTMhhsQHMTtlf6UIDwa
         WQs2bC554GxEcRFiVau5z78XCy5lcDZrqghBz4//xzBCbRWad5vrhgt7BKuV8i+XjJuF
         mJYZLAK5nMPlhrrmpvtoBflZcqBjgn4eSJyLiYvnoXMrAxR+gNIMgsMqrdysfcf2EbeV
         Siu+Nn/ej3g/a375NEZiMdcAsgN2B3N0WRTGDZvG8fnHALMb27+tbgJaVT/rD/EMAuBD
         uSm+Nx2nXNBbDSWS0nDU2ye5Z8FAtWWklCVajznJoF7HU0NCScTbrEMmPwIkqvhEW9su
         4AGg==
X-Gm-Message-State: APjAAAWXdYRbzQoc0jdZoqMp+ubyUvHRd15qnlgGffjMi8qJyWzd78Yb
        afoiaAwHckLWsH9HWQOxob8/Dg==
X-Google-Smtp-Source: APXvYqxVG9NAkBqkoExE8mqtLpk30e1uae5egg5SfnPaBqxGtmxrby6ezxyMeLYuZDb9VA2YQtT39Q==
X-Received: by 2002:a63:5520:: with SMTP id j32mr2064328pgb.162.1571211302908;
        Wed, 16 Oct 2019 00:35:02 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id t13sm21590605pfh.12.2019.10.16.00.35.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:35:02 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Wed, 16 Oct 2019 13:04:10 +0530
Message-Id: <63d6b0b8bba0d217c2f7bb4240c587ead933b6be.1571210269.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c0..b6a4e6073936 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -290,6 +290,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

