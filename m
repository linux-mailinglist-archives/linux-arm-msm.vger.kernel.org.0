Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11991EB74E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbfJaSin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39318 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729362AbfJaSil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id p12so4598204pgn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=K+JloZswXmm4BpvcNOHfxY9LNAmaq3HM2wD0uVSFvPc=;
        b=KSZdj1zJv2GvLd4O864ZcldaKnhZoz6bCSebULSUHlHdvAeTRSWcsYaHmOIsJHKVrv
         LygrOpOmjAv8c4lYFXAwyjwuCLpTQz5o+gqgPP1Itid7sQeqou3wh8xqS/t5QI10Bqkw
         xzAacVbALyH6tC7aCG3dvK8JhDKmLgu/yPslGGmCQ+O5TFEdLRL7/KDeZLy04CFcAc+g
         00qZ+A5CFicfm0UA5znHCZNxstePbXbY6nH/QpXRScnbem/cs2RWUc/i5C6hd1+pyP8S
         h96do6BtT2b5D1GAIOoLqOev9kGND/N/m0a+H6co92hPVSO6Pj50GMBvD3rZr0tqhsss
         ZcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=K+JloZswXmm4BpvcNOHfxY9LNAmaq3HM2wD0uVSFvPc=;
        b=aBhD2lsdrsyiOtWRBrjgzS+/xoZINV0/bWM2lEMsjFkmo+06jz40b7D1EDKdQmrsD1
         aWNxsMeIWzrJUKjLTUE8jtkng6IVUZsgy1pTfCaXp9cQhN8ODgNpUFl2gcJYEcgBDlGF
         l2FZeUykHAIg8swv6IxE/W0PD8wNJtBIEhASUWXHhxrV2E/kWJib3X95K9ADRIBuuEb7
         rzUnTQ9nyiV24Sfxa9qR10EbAh3KBUT2zIr+FsWX7cC8duTEJm3WRKT3RAvRjdCx0A8I
         sKSRMDYL0RLVjs/ChwkaThHxJslYcS7MDJw52W6SOl85i6CY0kGHw0skIuySdHE+DHB8
         LMFA==
X-Gm-Message-State: APjAAAW3+icyGsxhunJZfeZb0m3+Lb35nVO17TayiDgViou2Z9Mqrwhl
        RuPEOdwSzZyolSWnnZ+sTidbmaplKluwrw==
X-Google-Smtp-Source: APXvYqzCa3ZVFUg0FjzDNLXiznBXVFILjuh+IdF21SDpyZsvRcv8+TdaV8GDoeo7LlfWk8T3RMYNYw==
X-Received: by 2002:a17:90a:1446:: with SMTP id j64mr9539892pja.142.1572547120980;
        Thu, 31 Oct 2019 11:38:40 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id j4sm3332265pjf.25.2019.10.31.11.38.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:40 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v7 12/15] arm: dts: msm8974: thermal: Add interrupt support
Date:   Fri,  1 Nov 2019 00:07:36 +0530
Message-Id: <a2a70ff28e72a14b163a9a9b93ef474ab0836398.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
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

