Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94144941CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 21:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244673AbiASUc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 15:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357384AbiASUcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 15:32:22 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1945AC061748
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 12:32:19 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id p125so3688989pga.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 12:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqXihKucmnytz8M1n0VHglkxlU7U954wHoSK4Xv6rQc=;
        b=vwQ+Z9Nq6jlaXRSAni70Sjj94YsAimviM58py95W8vr9oQwd0Apg+P5YuFXh/jAPF5
         WoMqRl6nGQkA8kcU7ASPwksXlso0bcxvXqV6OD4oeOuJDbroWKg09GNeuiSTkxqMR8tK
         9qcer4hTx0JXIBnlZIMRO4/TGjv7cdOINiu28BRNiRY9JIvJDrfkuL4Uv66KGc4LlxnT
         HnVA9Pfsa9WuZaoHgTeeRt0c3Qrfbw8LYucW97CVGg2bZ5OheBVTQWJL9m9ejSNCd70u
         eCjBYfNBFxm0mVz6aBPW7KuDwLJxGZDrmXkgYy5kQcUXzU5ktJKD51eHERqdX9yLfPma
         9k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqXihKucmnytz8M1n0VHglkxlU7U954wHoSK4Xv6rQc=;
        b=agMFL0STBYC//YFcQ5S4+w8OkCoJlL8uIZxeuTROasV1Uh/CuwxG/Yk5Ee32HhOZaS
         06VhqAMmPw3Qc9edSqSOe4mwqqxp1lpRYmptmZScgN1vmR+A0LcQktyOMtNJyyBVD5nN
         qgIq2nyCAcPtCd0oxTxR/safy4ikP6D21eBytWKBHqXlTNeiGqATreVg+xpPLS8BcFxD
         3PGXnRONQrnnqZYoTgzgGgBG+tef6JQRCw5WhINPefad8tjk5qiy5Sg2IahjC107iO9P
         OSvjySkUtPahrXSq9Hx/DBx73A+3U4WS+RL747IBkc3T4XeGkzfu/JIuj3lhYQjK+4x3
         doRA==
X-Gm-Message-State: AOAM53192IZKVD9QKgzz1Ard4rpeiD2Ls4UHHLhCLytJ3w7IqygiqUFa
        TzRElKTGCpdbFrxAyVPm7JOHX79EcpAKig==
X-Google-Smtp-Source: ABdhPJyI9L708yeOZbuCJ5HXqNsradzR/S5DMtbz5n9jptiSXc9EmrmxrjwUGSLQdzHasWxQu5djGQ==
X-Received: by 2002:a05:6a00:234e:b0:4ae:2e0d:cc68 with SMTP id j14-20020a056a00234e00b004ae2e0dcc68mr32396719pfj.60.1642624338369;
        Wed, 19 Jan 2022 12:32:18 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:47e5:8bff:a3f8:a494:acd0])
        by smtp.gmail.com with ESMTPSA id x13sm6807552pjq.43.2022.01.19.12.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:32:18 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
Date:   Thu, 20 Jan 2022 02:01:33 +0530
Message-Id: <20220119203133.467264-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
References: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several wakeup gpios supported by the Top Level Mode Multiplexer (TLMM)
block on sm8150 can be used as interrupt sources and these interrupts
are routed to the PDC interrupt controller.

So, specify PDC as the interrupt parent for the TLMM block.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index cc4dc11b2585..aa7e949a2bea 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1937,6 +1937,7 @@ tlmm: pinctrl@3100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
 
 			qup_i2c0_default: qup-i2c0-default {
 				mux {
-- 
2.33.1

