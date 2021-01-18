Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52FF2F990B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbhARFMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731490AbhARFLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:11:51 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94015C06179B
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:33 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q20so9504738pfu.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQQRSZh/NmNyBOTuzvTdIbgV6cYNRh+ssF+27vc63k8=;
        b=G78Dy46vudxGiu5QxUrtUYK1Tz5iy6FL+x2iEqL70SzaNxfiDIM6QIqZ0riiTy6vWY
         i0gDpYqhWOS86eI/vKOAqiIa+1d9lGOVXEMnNRfUHNEUl82BG/dfzAM1QKN++K0o5js1
         nMD5WKg3wmiVVQeXKsazNgQw0+spY6j8VHcuAViVj+oovAkwcg7NNzguSjUdq2zObNll
         Izth/A+eeVjiWsO8ZLW+4xDe+FhQ4EU79JaMKeWGfRPb9US+5iQzW/U/nPY5ZFj12qzG
         0vkVHkbowOtn2KgW7bHIeMM44d/9krEe0l/pHrWY21k5NKuOMpDuuKlZlhcIjaVp/gsS
         k57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQQRSZh/NmNyBOTuzvTdIbgV6cYNRh+ssF+27vc63k8=;
        b=lt2YbmObGXhasOyib1nhNmYOB8/0lUNxJDRF0ljvaY+qz7BGAZL7ptAtL8p7ZDNhm2
         /WxlpDv4oxRN8Ao0CEu4jY5qg7DKStt1Yh/3/8KmsXDjdSiOjSMZdPg5xwy8wKJBHf9q
         a0a2TPbpQYqX6Q93GAAzkSe5dwtHp6K9lgRSJULOXjGcVoW58wSfgc6XvEhYJarslTP4
         p0QU+Bd9ihSD4iP0f7EZOvihLpjiwaijLOovwnHZv4T9Ii5NNWz/rAr5qr/Y+dVo5W8c
         rmJJn9Rk08hDBWzjUNYUAoeELORWeTYa+YUOThjQS9QsMLyix1C6FIwWqUcjJadjEZKV
         wGfQ==
X-Gm-Message-State: AOAM5314C9gTE4+YGhljlbvD2RCIiJynN+w9Ss2uRuIvb/UPziHIsmQp
        aG6Kjll1GXjojl8eio9VqktfR5Ejvu/3
X-Google-Smtp-Source: ABdhPJyCkdBdUAECsYw1lfAO3MnQ2CPvcfg+T8W0K9mU9MHB6/zjA+iU7l3NtuC9m+jZDv9aUPFSog==
X-Received: by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id e190-20020a6237c70000b02901aa22ea537dmr24226771pfa.56.1610946633127;
        Sun, 17 Jan 2021 21:10:33 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id j3sm14703571pjs.50.2021.01.17.21.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:10:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/7] ARM: dts: qcom: sdx55: Add pshold support
Date:   Mon, 18 Jan 2021 10:40:04 +0530
Message-Id: <20210118051005.55958-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
References: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for pshold block to drive pshold towards the PMIC, which is
used to trigger a configurable event such as reboot or poweroff of the
SDX55 platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 606244fbb91c..342149abea5e 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -292,6 +292,11 @@ pdc: interrupt-controller@b210000 {
 			interrupt-controller;
 		};
 
+		restart@c264000 {
+			compatible = "qcom,pshold";
+			reg = <0x0c264000 0x1000>;
+		};
+
 		spmi_bus: qcom,spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0c440000 0x0000d00>,
-- 
2.25.1

