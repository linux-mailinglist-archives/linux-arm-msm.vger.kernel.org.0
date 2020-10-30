Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F8C29FA4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgJ3BH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgJ3BH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:07:26 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE39C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 18:07:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id l2so5799002lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=EiSlkpd0XH2unr8aJvY/q6JTRASNiATl26sdbbRIjuwr/d5hZJP6EdRnKQYTegfrpm
         0mKW9u4t9m8mXIbG8sycs74KNYqwfLoHQkQ3k5GJNkUiB7a8zxQfCqG1jyrS6/qBvaTK
         HGx0w+GlihSwPT08jKop1iZe4IsurKZXEZXMbGeRRsHfodMn1LxmUYq4sVwXH44OfzTO
         LY1Ct0OJZckvjhjK+FQpKViA1g44z2XVzpAPw2qZjb8/WraH89RxrWDrwL0H8CbH6Fnw
         P7WieOfF9Oe5Xd25P5PA/irE3DKZ2H8knSpkok3DdgIRYTvQPj0DOXHsRPUc1sBIJnaz
         ZUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=CrFKFOMLj9Qkj4svZdZbpQOuGfY1S9A/hRpChZDsDU15yMtTFYlLH9IRk5Vt67zveB
         2twCb6NUanMSZh4yK8u0P6WG+/UOuVQmnUa1eYrY3bGGckTn03uecxqSn9UgRchajiYw
         i/00tAEhozUuPrm0/2S/odauAbCApTFhbRunxrApKwTaK4fwOg2o6X9KbHmYwh4Ps8De
         XmHFPEhKwFzL223R7TidOTUrSMa1FqnwF/wSYOboQuaU1CUJCEa45/danIbGCAmqIIUv
         gbx4oxboDOXjDcQuqbIDJPlBURJbkvgjmQp+lEcP9LXEwemA8fTlSB14JQKmS7AluLL0
         erVw==
X-Gm-Message-State: AOAM530IsUguX5VSZFH7OQYmxqtXgxqa4hF7TjBHWaVUB0nG/rIn9hxl
        us+daVTTolKyjcIgRfImCzZy5Q==
X-Google-Smtp-Source: ABdhPJyyl9s5LApPFxXLIlRSqMYgSw7DuZRZYl7P1j6O1xPT1cHbru5qAA46BRXkKwMt9T4WVysPIQ==
X-Received: by 2002:a05:6512:2154:: with SMTP id s20mr2819398lfr.467.1604020044443;
        Thu, 29 Oct 2020 18:07:24 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id c6sm447130lfm.226.2020.10.29.18.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:07:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: pm8150l: add Light Pulse Generator device node
Date:   Fri, 30 Oct 2020 04:07:12 +0300
Message-Id: <20201030010713.247009-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
References: <20201030010713.247009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node defining LPG/PWM block on PM8150L PMIC chip.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 9f214ceec2b7..e8926d6c32cb 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -114,5 +114,15 @@ pmic@5 {
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8150l_lpg: lpg {
+			compatible = "qcom,pm8150l-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 	};
 };
-- 
2.28.0

