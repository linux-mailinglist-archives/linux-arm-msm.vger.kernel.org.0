Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DCF48159C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 18:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241020AbhL2REo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 12:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241042AbhL2REf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:35 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7BBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:34 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f5so88540498edq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fU4lJgFFLNi34Q6jN2fh2OUVWTGIe8WuwEeiOESTqPY=;
        b=uHAR15vdw6dD0eMtCy1x2zscdmySWkKp3xgs3JsboysksYSf45pApIbXdwohX0p1eY
         GIaFB3cdTNZAKZjlpeR8j58Xw7oqNASnlySNrEXezQRRFS87oEFaJD+J/vwVaOykYMT7
         MEzEdJqFcdZPjnYm16aIxhdjpVtId6o1cJh7qBsTeNCRXYxdALpm96l00BHjWJnJMSpK
         UFhb+GPaNcFyWZfbs5IqLuIPgY4PUZO2dlPmItDjUHKJwgMSmbVSN9HYUX9u05uxk157
         i70gXwQMPQ/w7dEw7kDzHdkgj+KzpDedp/rUGFihBkuN4FQNnLxR6FcmXp+C5h0/OXw4
         ZVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fU4lJgFFLNi34Q6jN2fh2OUVWTGIe8WuwEeiOESTqPY=;
        b=fu89CzxtZz+H/YLMqyO71zfPiJtbRPTzaOstNYw/3gIvE2z9lGV05sIMMpPvwkU5aN
         qou7/Pw8AxHmEaH87PGtbepeze4N0YZokwcKWNF3h7puevljBWE3l2DaQWFDgeVTRY5k
         +UdJxttHUffsOhzxL3rOwnflWE7Rk9VTtc03GVlAh05oDD4+81A/Jn+lyBzSbN50tFmp
         7Xx4NcgbNrHysg/Ax5yG85bZTTZWqY0K4uDXukdA4PnNgcQ/gMSJnkIHgykM/hkUTEGH
         SE5K0PYavfTKX9zRork8igfgaT1YKQ9klNx5pjmJybUXJ7wipMKeO29gSq/yx48eo9GK
         ei8g==
X-Gm-Message-State: AOAM5302Q9TJfSkLPcHRGJi7DqC+J6RvqukbVl9kkPMKy/csgDLgPwn0
        lLnU4tLc0K8A9xK/KsSaG4ZoDQ0Luf0qWvP7
X-Google-Smtp-Source: ABdhPJwX2p64MO5RE2Ic1XIVJN2f7CeiKvsCmNESLMqR+7qjUUUvp+fMK8sOnD+t9ugHJXdP7W40nQ==
X-Received: by 2002:a17:906:84e8:: with SMTP id zp8mr22404806ejb.289.1640797473304;
        Wed, 29 Dec 2021 09:04:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:33 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED
Date:   Wed, 29 Dec 2021 18:03:58 +0100
Message-Id: <20211229170358.2457006-5-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WLED is used for controlling the display backlight on this phone, so
configure the node and enable it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 8d6fd22873e0..678bf55c710e 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm7225.dtsi"
+#include "pm6150l.dtsi"
 #include "pm6350.dtsi"
 
 / {
@@ -268,6 +269,14 @@ vreg_bob: bob {
 	};
 };
 
+&pm6150l_wled {
+	status = "okay";
+
+	qcom,switching-freq = <800>;
+	qcom,current-limit-microamp = <20000>;
+	qcom,num-strings = <2>;
+};
+
 &pm6350_gpios {
 	gpio_keys_pin: gpio-keys-pin {
 		pins = "gpio2";
-- 
2.34.1

