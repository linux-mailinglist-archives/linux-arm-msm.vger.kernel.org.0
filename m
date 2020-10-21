Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07A62954F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 00:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506936AbgJUWvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 18:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506928AbgJUWvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 18:51:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E451C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 15:51:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c141so5184022lfg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 15:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=mMYojLC4y7LhWFZ4HHoDPGU7gF894ny2E2sByf3XJyfbQ8dXJ5y50Py2imnmaBNCEl
         2eHj/pu/bMM8PHskEfAJL/y6Q5T3LUqAyJh5FGnNsmT1gohNN+uLPByBNe7QLNcDWQgv
         KHFBNupcplqe6jduKdvG408ANXfIaU8aVe9hpvWpBRdXgCw123z1YP/b4d+fsY/SJHoF
         gCO3n/RonRvdNuUE7SLivYTwdtZfBPJagk8cH4PB6mZDVNW1RTSpxxxGOab0UvseG/ve
         t3PnoLVJHYoURRMrrRqfIzyDtSnV3crQtJckg9OpMU/wVvisE49a3wabkUgGohOrCzoq
         fXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y68c1c7Z13VLVISWQSjGtMfYfdgX0kCBgReV2FtuTdM=;
        b=T7ebsEInO7nyjOc1wQ5/lFVkcDCtBERGoG+ZI00MKkzlYSRcmntHdF8q+o98S+Jejt
         WUnUNXTI+1PILEMWAmqfTkChzA3WV+hjaFJE/9XKVgTqlP9H7oTvJjH2NlClvLEoTWiB
         Rm5mNoRSheeRHPmigYAF2mrn+OoEI2Q3n/Tnbnkfu2W4M7N2mn7Fj2rDjIvuXSC0YZza
         YDaRlBGDQvb7UI7AzDaaInujMKtC7omF/77jOAu05GbxPbvh+1t12UdJmlhdQk3c0ms5
         WNmJyJADzLhQytj+uM58tBBkOV4J/x8hOS5kh1Klzc5aZ3R1dc9j72X+ehw5Zmg0OMob
         WypQ==
X-Gm-Message-State: AOAM531vbqTBZDy9NlgXH32h31maXlOV4kK/huQHwKfbSswccu3rCM8P
        1y/+UGvjPkx0y+4LSXErrGF8Ig==
X-Google-Smtp-Source: ABdhPJzSrFyWrEgkely2ncAXUZGPErChj9HT+aDia8Z+Kob9YWM/XyQlsxnRFfcuK16COCt/B/93BQ==
X-Received: by 2002:a19:c3cf:: with SMTP id t198mr1831682lff.461.1603320672111;
        Wed, 21 Oct 2020 15:51:12 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id h11sm652062ljc.21.2020.10.21.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 15:51:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: pm8150l: add Light Pulse Generator device node
Date:   Thu, 22 Oct 2020 01:50:59 +0300
Message-Id: <20201021225100.162795-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
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

