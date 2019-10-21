Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45607DE9C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbfJUKga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34732 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbfJUKga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so8190063pfa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=raRv91SuwpaXlGeT2wU6HLI9/SHJRwKCyqG5FDUj7WM=;
        b=dfN7WGSgkXXOa/URlH/ad/gRg6gnfjIsMBdB5HASF7KGk6e3vgPOKuBUdrQonzvxbl
         ZabWSM5RBGxt9NZhV2CYQS7Re/oJH5LHCS76bWGl3dYzeWFKFBemK6203svGG9zzeErK
         R7SubW3IktLLP9997uvwDu5MDI/8VHhY0dVMH+OBFiRIeKkawfreLDLFufFg++ep0JJu
         8aTHfZcuchruuOfibLzKpvpmuCJQOD9bfiZHBFbS7MXOhnnwVBPG41CS9RisyJfs2Dui
         lLPGF0KkbdVE34XIzLU+DIbaUYZBrC2+83vdWkUscpdsWoFc7H15PLXEPR/klZ1ea5qr
         NC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=raRv91SuwpaXlGeT2wU6HLI9/SHJRwKCyqG5FDUj7WM=;
        b=Sxc8IstMcHS91nBDq194AxROsoST/mmkWocdN/5LAfBU5XAkZF3XP0aIqUE27pwhMd
         w+fRzKGkL2WYLIV3fOSEcuaMtmIeMItcyVDGa21lnuy+2UdFcpJkVCmWyZhrvUnNPdej
         b7bsxd+iZHZI+xAJyr0OVeRwBp5VG+r0T5WLrgVSxX/FzuJ4RdzAI7VipdU5JgJuFJKV
         mSdpG7SMhEqQyTyxb62mp4Avf9k3uG3mPMhqfZa5ZTksQjNzOhiCnfKApXfdFwhGRbES
         YddLV7merWxD+v/19cgePfpB/Aw78LmdV52u7hnqNj3co/kcp8eGQAgLCKSbE9A4xagN
         k+DA==
X-Gm-Message-State: APjAAAUqcnwN2s6jhRz2dqUenHiDn3KTEN35kyC4akdWrGiKuqQAPT3M
        CpImn0FxN9889xC/rh7SURntnuzqcJBG1w==
X-Google-Smtp-Source: APXvYqwCpYHYXSMroItXhbGj9D6u5ioe8pubcuLdwxrRirA+DapJicFWgsOu+QaSERbHJmDVv7rX+g==
X-Received: by 2002:a17:90a:86c7:: with SMTP id y7mr26839634pjv.82.1571654189240;
        Mon, 21 Oct 2019 03:36:29 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id y22sm13192289pjn.12.2019.10.21.03.36.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:28 -0700 (PDT)
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
Subject: [PATCH v6 13/15] arm64: dts: msm8916: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:32 +0530
Message-Id: <88eff964b708c8aff57b24370d2e14389ace09e9.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
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
index 8686e101905cc..807f86a4535e0 100644
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

