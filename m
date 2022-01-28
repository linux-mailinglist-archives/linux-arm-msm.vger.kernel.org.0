Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C41249F0A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 02:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345149AbiA1BoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 20:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345150AbiA1BoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 20:44:09 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAFFC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 17:44:07 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id me13so10613027ejb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 17:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HYAm1F77RPQN0eWNzWBYS84OsGHZddpN9Npn+gwr04=;
        b=YS5sEXiZJH6TE9Vq8Qh+0OE7MOxbU+rSeE0TV3XqOWICrjG8XwIWMqg5ElqjuKj4B/
         oVvDms5gUMNvVo6dki7KeNrb4RZwwOyC4Ww8bpDtfcORO9HAqKJRc60iWWlm0XznW7nx
         N95dclDBCUdriCTVWX0zpGDk4pCyzTwW4BodJZDp34QWsoH7Tmss8LlbxBwhc50UHCMr
         ygsDegvWAt9shYKXbpwRM1ZrK4qaUWeJ6c8zIDABhvgZ6Z5wYJ0Yf8EMkhk4tjKUCgTw
         gGknmAESKBROlp/S3FeBafQTUhCLfhcRJeiCJVrM1nwVOFZvVQ+iULFq1RuFaE622W0b
         kBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HYAm1F77RPQN0eWNzWBYS84OsGHZddpN9Npn+gwr04=;
        b=bVsBMucT5FRQ/QbPhlz1m+E6oVnKztJDTVgqnsOWuKqbi7Kq6w1ne24VQDH/CsCqmj
         4AlT7jVOha8Eheb47ij7ZYKuiwEdIh2Ram20DcJ4IxdpLGXQFL3MIze3Nae0B4z65IGl
         7UhBA4SBTxrjsKuztpu93Q5oAXA2/qP0fK+Mbx42EnXaJ/mnXqQYHJWREHjFQGHbnr41
         otaZ/Ok+BxfbTIEw5ejF5nMljz+VI7J398SwLDVXcg+5WmE40Q30AUtYLJG2Bqj/ueNe
         mVpQe8s21OAu1N3qzgjcVUlwPKxd0/fDDF42EhKmbUR9vUbYZ+wJ2LGVGakC0t1VJY9d
         HFqQ==
X-Gm-Message-State: AOAM531OafmNhMp7zdj4lnLr7BLKxMhVwPlMdD2IGCovPuBi0c+HyIDO
        c8qllZHcGxFmmkoUVWwPEidT8h2PC3xu+79d
X-Google-Smtp-Source: ABdhPJw2kxwEDllvYaEYSpFUZSZ65TrJ+MGbBsPUmW38a/NqGv4Eh7678RozsRprbESDn4gkjD4+PQ==
X-Received: by 2002:a17:907:6d82:: with SMTP id sb2mr4995612ejc.3.1643334246208;
        Thu, 27 Jan 2022 17:44:06 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id gr24sm9214672ejb.185.2022.01.27.17.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 17:44:05 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8994-angler: Use common DTS for RPM
Date:   Fri, 28 Jan 2022 02:43:57 +0100
Message-Id: <20220128014357.262236-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128014357.262236-1-petr.vorel@gmail.com>
References: <20220128014357.262236-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

the downstream code had:

&pm8994_l18 { /* Sensor VDD */
	regulator-min-microvolt = <2850000>;
	regulator-max-microvolt = <2850000>;
	regulator-always-on;
	qcom,init-voltage = <2850000>;
	status = "okay";
};
=> same as now in msm8994-rpm.dtsi

&pm8994_lvs2 {
	qcom,init-enable = <1>;
	regulator-always-on;
	status = "okay";
};
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index 0e3dd48f0dbf..7b9796d896fa 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
 
 #include "msm8994.dtsi"
+#include "msm8994-rpm.dtsi"
 
 /* Angler's firmware does not report where the memory is allocated */
 /delete-node/ &cont_splash_mem;
@@ -41,3 +42,8 @@ serial@f991e000 {
 &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
+
+&vreg_lvs2a_1p8 {
+	regulator-always-on;
+	status = "okay";
+};
-- 
2.34.1

