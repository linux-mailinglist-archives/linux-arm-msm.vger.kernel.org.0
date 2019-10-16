Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F09ED89C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390688AbfJPHfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:35:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33878 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390374AbfJPHfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:35:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id k20so6408532pgi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=03jpeb+1aJx4bxpcdPiavfJJhVJ5WBvL1EOxBoz3J+I=;
        b=X4D5Ac/vX8qbhhnG/SRIM90B0+FmV6AycTSj/JtrullgPcisRI70iJjTkjiIMfyi/H
         QhssR6y42idqaSNfRGO5AVREd9915qBuIXFx5EV+4gIzMHAQr/p1a8REtGA9cfSZKsmI
         PWp5a2RaRyTOA8Ki2AoHQ3/WAxaO3Rg2RGtb1Z1GvMXas458/hA1SSPuRzfojyFyWFL7
         td8pqUQrvLIhjkogvgzcfK4BGdZzYFhJsEFJxSn26/snm4bs1h1urgmrwhLPPNyIxmWz
         ONpJaLJ3eApPbWqGwuOBFv5BOLamb9huJXIkx7cabTmnkVM7sFciLLaBHM7zV6jpwMvN
         g+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=03jpeb+1aJx4bxpcdPiavfJJhVJ5WBvL1EOxBoz3J+I=;
        b=f5okji/imEnCvCBHzZDeAX8sVurMRXIROoPygp5XCkGhHX7P3FXJy8TVhd/vWLP3R+
         z+gOol8OzkbVos/w9LhVxrbdw00tUMAiRnEJffkG3R8oUMb0gO4uPjWkjnwf60FREPf4
         eJyPPzYFYh+oF4d2GsnR+tlsGT8po/luh8IafxwLolfOx53Ayl/dDeG6RoMOTck5MpXZ
         uAnguaCM70IYNICiL69le7fJOnPikM8Brq3u40cruRE/I0SJu68V9pOj4H3Koz0BrjMu
         ypYiQcwGAk+DmuDFA50WBBRKdzBQMXHpAneK0Djjw95ON488MuqrS/LNmFc0bLXXXToE
         oVuA==
X-Gm-Message-State: APjAAAWpdhW5wDCxYdl1InJrIyFCFB5JWUQ2uNeH+YHbVTyXLImErypv
        K41iZuwY41EqXyRnc7rnTtsZbQ==
X-Google-Smtp-Source: APXvYqxLAdFUelj0nGlA72+kn0HnBJlREcJf6ke7gmZg2QchUPKPdi3nc8YGKl4qzUSdSd5kYYWf0Q==
X-Received: by 2002:a63:c748:: with SMTP id v8mr43605412pgg.348.1571211310066;
        Wed, 16 Oct 2019 00:35:10 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id z4sm27413149pfn.45.2019.10.16.00.35.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:35:09 -0700 (PDT)
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
Subject: [PATCH 13/15] arm64: dts: msm8916: thermal: Add interrupt support
Date:   Wed, 16 Oct 2019 13:04:12 +0530
Message-Id: <88eff964b708c8aff57b24370d2e14389ace09e9.1571210269.git.amit.kucheria@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905c..807f86a4535e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -816,6 +816,8 @@
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#qcom,sensors = <5>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

