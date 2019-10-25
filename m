Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA54E55C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 23:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfJYVXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 17:23:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36777 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfJYVXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 17:23:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id 23so2360208pgk.3;
        Fri, 25 Oct 2019 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7mM1YAB7j9cvjOb/HqAxXCujobS240Bo0w21vdsY1w=;
        b=pi2tVgiT9aqazAYDlnNx3FH4kOZg6SRZoAAgVBh6VR/3pAbY5oJyJTHkSiIyF4CuU7
         DMqs+bSwx/Crk7vDa/RyaL+R7mbs/orQI8QxMTaK8RR8cGZuA6ZnJ9y5dgAZPnASD0mu
         9W1EPOyymwsRZqmkCKC0gw+5wWwVIiOyKhG3ewSsnDU/fKHV+03XVOf7jZczPLspH+8p
         5z98dtNXwxLfcB/vZS4zvK7sHv54NVtq0N3ARlz3jcS8rQ24s/W3bA5PDZ2KellSPrRL
         jJiZYZ/16rn5upnZ5Y1MjgLd6jC/9dAmyaaJC2MlHDFBiaQR//9cpX21UOVEzWIJ64Bl
         3Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k7mM1YAB7j9cvjOb/HqAxXCujobS240Bo0w21vdsY1w=;
        b=oRpfid64KGBkoyri7jrsK5UpLecGD5W09QUEt5f+nDHyS7gK3l1yJLR5w3D4XRDeap
         kErbmx3Nti+bnrDjqXoDKRDlgHZTzpHfG+NB55YBSyNL9O9bfhxsDimJpLYYeaHreniL
         25ljUJPVzJSQyOUtj1ID4htJiLUwe5SXQAKljRraXhlsQ1pEhVg+2hTW3trttY56dTqS
         pOoBfY6ioFqb3uFTDt1v0Dlo+Hiu5g1h0tGNs+wrm/hcEHPIA656ecdAF+6v8AO3m2Ru
         Hq6M57oV4Mv0a71Tb/YG7+Qk9laT9kLcbLHtNPwhn5BbHN6dMFcwBCrF6cyfQBEER1wE
         iA8w==
X-Gm-Message-State: APjAAAVJGQ+MfqDnv5Cvosyv8fVLh8ZOFLsE2MS9fXizPQowQcisPQEs
        mdXNtF4qXB8F1yYtdV66Xw5qoZ9XvZI=
X-Google-Smtp-Source: APXvYqzTFCBHjd13CWS/a0Gdd1iSXbr8uW7LLcyfqefhI2rLGrPSDKHAfWAbnkuii4ydDR+Pc8ayAw==
X-Received: by 2002:a63:1d60:: with SMTP id d32mr6843817pgm.37.1572038601840;
        Fri, 25 Oct 2019 14:23:21 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id a16sm4238064pfa.53.2019.10.25.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:23:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sdm845-cheza: delete zap-shader
Date:   Fri, 25 Oct 2019 14:21:06 -0700
Message-Id: <20191025212106.2657-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is unused on cheza.  Delete the node to get ride of the reserved-
memory section, and to avoid the driver from attempting to load a zap
shader that doesn't exist every time it powers up the GPU.

(This also avoids a massive amount of dmesg spam about missing zap fw.)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 34881c0113cb..99a28d64ee62 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -165,6 +165,8 @@
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &cdsp_pas;
+/delete-node/ &zap_shader;
+/delete-node/ &gpu_mem;
 
 /* Increase the size from 120 MB to 128 MB */
 &mpss_region {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05..2287354fef86 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2824,7 +2824,7 @@
 
 			qcom,gmu = <&gmu>;
 
-			zap-shader {
+			zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
-- 
2.21.0

