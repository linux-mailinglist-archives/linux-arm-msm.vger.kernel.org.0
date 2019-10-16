Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F47D89C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389952AbfJPHfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:35:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42506 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390353AbfJPHfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:35:07 -0400
Received: by mail-pg1-f195.google.com with SMTP id f14so8643566pgi.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=K+JloZswXmm4BpvcNOHfxY9LNAmaq3HM2wD0uVSFvPc=;
        b=gc/KMCmIeHHhA5CTiQuXhuXCGs8zdCkC0+uXOGsRaewyOVs3PwC8r5E2WjzwjXxZnR
         iFmRDhGszAMo5AnU1BhzDVdlXBedkCtZUjiZzJhGWuXWgjIhBT5Q4145dmaZpuDPs7pX
         6rx3SuzudupipdVWV2LQeuuFOi7vO+/PhqV0cCfB9O6vkt3I5D+i60vv8JGSRqpZWemb
         dVWEMwyqWldf4vE/7AvgMpTzZPro4CMXdq42i7ZYfKSyx7tYT/a6Ef0uulvNv020OAPD
         jKd7sqRbpLTGIlgm8auFOmqUDk+eBROQvmyH/xW5XBX1Wt1GtEpVvfkLPuZvadrcKz6T
         e0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=K+JloZswXmm4BpvcNOHfxY9LNAmaq3HM2wD0uVSFvPc=;
        b=jOsh3JebzwZQA3b5GX2o1K1bTbgoegQrykgjLgjXFwDc6pN7eitxfYO5FZoknYY8zP
         8TDkE2tgLRL2ip2A1mOPAyD69JuBH1s84iPiI4eZ/NITuc81/t0sPXqZI+aHhZl+kgm/
         5dVZ1Yt10nw6zq7fSppuL/xFUWIygRSUN9twWTOouBPDsbMSArqywirLWQvItb0A0Afj
         cKEmgS4VfXzJBShvkt82Dd8HJh+vCCy/dhjZV98w8F3J97ihsJMGXpHHYyGybP6nQ5Y6
         khHWlhNxYS22YxZvgA2y4n3xoC/AmzZ3TsTvBKhi7CuhUCl1W80K1IN/CIIuwoKcNaeH
         Jpjw==
X-Gm-Message-State: APjAAAUq76ViXvf9uqKBzUs/bhAvdAAm+XLw3wiEzF+TL0l8dNMQGa1H
        bxEdGSfRPUO2SfgQeB9epKJAyQ==
X-Google-Smtp-Source: APXvYqyM69gXN9ucY0u0Z331l43PMGaxd5Nz0wHcYtRF/zyAnePozLUY3rayNt3oewSq4CFpEwzWrg==
X-Received: by 2002:a65:5586:: with SMTP id j6mr614871pgs.252.1571211306505;
        Wed, 16 Oct 2019 00:35:06 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id c4sm4194968pgd.3.2019.10.16.00.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:35:05 -0700 (PDT)
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
Subject: [PATCH 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Wed, 16 Oct 2019 13:04:11 +0530
Message-Id: <a2a70ff28e72a14b163a9a9b93ef474ab0836398.1571210269.git.amit.kucheria@linaro.org>
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
Tested-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 33c534370fd5..c1a3a7d7161c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -531,6 +531,8 @@
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
 			#qcom,sensors = <11>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

