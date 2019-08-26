Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA149D46D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733194AbfHZQse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:48:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44834 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbfHZQsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:48:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id p17so15983936wrf.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6aBjlsqiqqTgtzhykCGPDbSLi9lpwGSk1XF7w3yerKo=;
        b=WiPY2VmOXE2RfOnc7RuUSWUISdyh0kDQACH6it3uiL+kBd9CDRojW1+O52q/0G/GcP
         D7svA43QS+VHwNxAcKEEsbwZTbgyPcbqmAd0TK5Zu8K2tQf+svofB6BtYgbtRArhefVy
         ykf1eE6i++k/AqZIYazKoYNOwaEwTLci5TlsC2cBZl05TASDWrv71e/Wb7o3/oQ55mPR
         Gc3j5GF1+FuGGHmJV4CddZpZV7zLvH6ACHCgZkwN9I64kPjqvbXnZ+sANkkq4JwBT0gL
         SS5X1mP2pHHz6BXEf2cPi+PSeznAFwkEFR32mcpmXGDZAgG1y3cj71u+SUu3jZRXFGLc
         UbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6aBjlsqiqqTgtzhykCGPDbSLi9lpwGSk1XF7w3yerKo=;
        b=gOAjFgMG1rPwTQrE1cBoHBmaF3JIj4Fb3JUdEJFe9KtTAR4CDcqwvYvT6IqP89QQpG
         3lLL1FKqZOsMkqIxIG3xuE+HYKU9kKjTIUg0YcgNTKdBGumfumX+TyfWnmwjDPR5qJKw
         M7cOUE3iBBTjgvxPIBbJxDosJjsmeTiOE/pf/7ra3gty3EKI4GdAbjYtqM/DSg9uq4zj
         eZMTEtcCD8dgCdTFb5sefsyPbRavWprAp5NCs5dhuUPjSp9QOZwEfhmAMV/iB50Vo2c8
         cZ/HdXf52+RxB/KMpldg1tjiWLrmowqFGBhww9aB6CtDdC4HKNV4jP+WXT6zv4tARMjp
         oCPA==
X-Gm-Message-State: APjAAAW1MJ6kwLMcRzxxJdluvk2q/8Ph5eOIPS4DiPChd+AEr0P+YS+t
        +OcQEMbmhpFKhH7yRGKPUWGMBw==
X-Google-Smtp-Source: APXvYqw3p4P3r0H+9quDr52MsyRO8FZmUmK1/r9o83Uq5Q16H5ZoPaWVLV8HDV6+oKSknAjuK5OvOw==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr20629210wrm.297.1566838092355;
        Mon, 26 Aug 2019 09:48:12 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o14sm21800076wrg.64.2019.08.26.09.48.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:48:11 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: qcs404: Add HFPLL node
Date:   Mon, 26 Aug 2019 18:48:04 +0200
Message-Id: <20190826164807.7028-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The high frequency pll functionality is required to enable CPU
frequency scaling operation.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c0..75ea356a3fb0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -869,6 +869,15 @@
 			#mbox-cells = <1>;
 		};
 
+		apcs_hfpll: clock-controller@b016000 {
+			compatible = "qcom,hfpll";
+			reg = <0x0b016000 0x30>;
+			#clock-cells = <0>;
+			clock-output-names = "apcs_hfpll";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.22.0

