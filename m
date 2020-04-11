Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8801A5357
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 20:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgDKSWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 14:22:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43302 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgDKSWP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 14:22:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id h25so4938457lja.10;
        Sat, 11 Apr 2020 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKI8/vIrSeNG/JRzRpmvFSBgWCKAHHoTosK6sbG966M=;
        b=qnbmybcnWU1cTq0pEE3TbtoTGHbYWV5wuLQww7nzU/DFnE/YG0wvQJicC/eWaXF5dL
         zxVrm4dc7x24SwRjNYbEZ0TerfJYo+ITAkywudGWEXr58UiBC1RA/Hp8Pmufe0TJVGfo
         jY9WVgx1yIw18urvjbDBqR2Y1/x7hWu9aeCF8dPFN/U7x/X6PCV9G8OxQUx7WJlGvBCf
         FH2IquWLSX0vh8k0wj3ULqfFBbObpl09cEMEStzblYhkEKihlBDe8jK3TmBzGJPlsZYq
         pEVx8Gt42lTVKNSU7JQlzSvVqkK2gqSL8ibTMvqVX3unMfAN9TY0HBdQWj1wIib3Vpmr
         xr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKI8/vIrSeNG/JRzRpmvFSBgWCKAHHoTosK6sbG966M=;
        b=JuMmaV/jhtiKM/LWF9I40OJwy8yolrH2tjFNqZ6EDSHbpPeqwWv3FoHc/DoPjHw6Md
         dzW2MzT+ZZc0yOkmt3k+8LAUcW9Khw9UnIUMke6GXiG/oMeC7S05QYyWX5VIxN+dfJPD
         WnKs7jUyR6ods9fj+qcwzDmDuV2dFKhiTiDaViKlNsk1fnCqiOUnLgbTx9DWH43FfbJM
         LZ7Pt0hBbe83CflswO0y+OBYiYJdvZ1/SIsrArAfl7TIRhrzp9mgRUPK16qQBGCCkaiH
         cpHNhget1CjU6EkBnM+wWovNR5i7O1vbYOHH+GeygkJFHPnH6R4CbeOawPyJOErFnP7w
         QOGw==
X-Gm-Message-State: AGi0PublKeAHxbeyqaBwT1MjInjePUtQn9UcJ5ZtnJcDcEDg5YXGdjgG
        bjaC+9/XYtvvJ+zb8445BcG4AqPT0KzcFQ==
X-Google-Smtp-Source: APiQypKfE9VcQ0FI3X3f55LKexDyh5lk8u2PE5/y8Zxy9zaiyXu99AnS8sU0XyuFHM14mVpHPx82VA==
X-Received: by 2002:a2e:8017:: with SMTP id j23mr5967997ljg.271.1586629331207;
        Sat, 11 Apr 2020 11:22:11 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id o16sm3889971ljp.53.2020.04.11.11.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:22:10 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 4/5] ARM: dts: qcom: msm8974-klte: Add sdhci1 node
Date:   Sat, 11 Apr 2020 21:21:21 +0300
Message-Id: <20200411182122.2677248-5-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411182122.2677248-1-iskren.chernev@gmail.com>
References: <20200411182122.2677248-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

This introduces the eMMC sdhci node and its pinctrl state

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 752ab9e99a8c..42fc18804021 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -152,6 +152,9 @@ pma8084_l19: l19 {
 					pma8084_l20: l20 {
 						regulator-min-microvolt = <2950000>;
 						regulator-max-microvolt = <2950000>;
+
+						regulator-allow-set-load;
+						regulator-system-load = <200000>;
 					};
 
 					pma8084_l21: l21 {
@@ -240,6 +243,35 @@ volume-up {
 			debounce-interval = <15>;
 		};
 	};
+
+	pinctrl@fd510000 {
+		sdhc1_pin_a: sdhc1-pin-active {
+			clk {
+				pins = "sdc1_clk";
+				drive-strength = <4>;
+				bias-disable;
+			};
+
+			cmd-data {
+				pins = "sdc1_cmd", "sdc1_data";
+				drive-strength = <4>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	sdhci@f9824900 {
+		status = "ok";
+
+		vmmc-supply = <&pma8084_l20>;
+		vqmmc-supply = <&pma8084_s4>;
+
+		bus-width = <8>;
+		non-removable;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdhc1_pin_a>;
+	};
 };
 
 &spmi_bus {
-- 
2.26.0

