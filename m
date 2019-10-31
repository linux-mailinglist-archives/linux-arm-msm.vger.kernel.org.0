Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56488EB73C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfJaSiZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:25 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46782 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbfJaSiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id q21so3057776plr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=G1RY5BCmh8InAkONRa9lruWuMsHWqlSh2+WDeebx0SM=;
        b=m98kdvgI2S5N3BmltWHCwwfREQrCi3jfMjxrtZJQoT4Vuf7vAtpC/4SgaAghY1rIHz
         W5SlSO1a8egz+YPhwpCV2VFbOQI3JetjehPvT/rZcRaCMRYWQDl01crsyaz7YKQUwp3c
         uuZZVRFQWcRyEFxVU5DlE3VQ658SZxumOVmIIiCSydl8KrV0t4/iuNuiVWgMNBGcTwNK
         LDQKWnC+3Hv/1GDr91mhI9Svv6FFJOiTNy1KJAw59kmD6Qj6bw5gAabaHBEy3NRwdCVW
         zWru3O2N7V8t5tP3q7SCgoZe8xM0ApLmS8Jr+nI9PBp0PzsmnI2cBAE4LNTw/32CsT0C
         Skug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=G1RY5BCmh8InAkONRa9lruWuMsHWqlSh2+WDeebx0SM=;
        b=djFXMBxRPIO8f12bhofOVGV+WfR7q0EWTVf4ZbnQ64x8K0WoLuxYp+ShETlZBG+b4E
         pdpkUMk43vXoTAAdB2F6bP+I7+Ircq02cw5gzV7KnxjPkV/vL6cL7/ZCu6XL736sFLL7
         gSGMMGT7RhjbZVSVElpmuVej60CY6/MaU1ANvMEtycAA0n2f8QJfjTzqTdcvqVIhcZSK
         x1q6ztDFzyq8t41rd37USb9IIxMM57DIbnR7+XC2ibwePE/IS5K5gD6d1flzZOTGjYa/
         xPvX37uRMU3SEPZHP685v4Lp+sfi8MY6bSTRIav17xy1eVG4boeILMtcioE+WEuWNhLG
         fEbg==
X-Gm-Message-State: APjAAAWT4GMsLQm8rT5YPPqSpnIkYHoQ7TsskAokNcC4482SuGt5hIfi
        Ft8J+5v7KoVPV9BApWdpZu/76J5BjcnKwQ==
X-Google-Smtp-Source: APXvYqwisWREQ3gJDfHQtkfaf6SuHqNIjaIRxilpaofB9+ABWSCmhK1USBUY5Zw4bz4/KWlT+rGwWw==
X-Received: by 2002:a17:902:6802:: with SMTP id h2mr7814361plk.135.1572547104331;
        Thu, 31 Oct 2019 11:38:24 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id d4sm6747792pjs.9.2019.10.31.11.38.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:23 -0700 (PDT)
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
Subject: [PATCH v7 08/15] arm64: dts: sdm845: thermal: Add interrupt support
Date:   Fri,  1 Nov 2019 00:07:32 +0530
Message-Id: <5a96df48e546576f90081bbde218e7cff88ae8ce.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05..0990d5761860 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,6 +2950,8 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2958,6 +2960,8 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

