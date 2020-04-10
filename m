Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F206F1A3E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDJCcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:32:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39032 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:32:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id m2so383111lfo.6;
        Thu, 09 Apr 2020 19:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CEo3THdQrqkALDacLlhylmnLwp0CQxNGpQ3ynPcoU4=;
        b=i5j3PFiPlZ8UAFsg3Mc9PbC9MGmVfAMp+JCu6mGobqXbOoD4kkLcRyI8pdXvgVziZq
         r3T0ewRzae2SHJUlXCLK/hJIqcSA1WvkJacWSmfxyVMKr75+VYErMrcWfdicZRwauTq4
         4iIAPKcVLqrB6SIMaF7snuB3i+1uL8/xZID+gqOrW9fKM8KV7OHV6ZvfhctEc/zR43sl
         8V69c++sPsLIWp6ca4pY3zbLuMNWyz2rgw60ZAoiYmAzrD5O0llX8LOu8xrmgYwYYyF7
         0CLxGdiDe14PqIoSvVVeXSjbcclRDkJ24MKTUuojgRixlQc90tPaIYgCoGTRxGz0ABdl
         W9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CEo3THdQrqkALDacLlhylmnLwp0CQxNGpQ3ynPcoU4=;
        b=uZFW1X6s4IpcXf79jpLgFuRpgptsJesp695dB/rn37SIyop/wCu6icxykYtSsny3o8
         b2klhJfj96kcOhrzlXcuo7B/vDkDiigcp2/6r2k2BXEH6tFI4OV9k+l1f9UkzKGofXO5
         pviHKVIHCEoQ1gKunfjWHXuLFd28b0P+RJwzl8apG0ONEGplbT7a6rMzm/JewJp1Qqkb
         GYmUIOsbvN5TPH6N+9Fmh/sfhJs6zx2vHVupmm484m/kFRp6sZNg+NIkJA1dfwcb56G0
         f2Angljtthb1WvunfzwtKnf6kseC6Vf5iRq+vc4QKROnTvirGbENqk+vIXg4ebqZlQEt
         ETEg==
X-Gm-Message-State: AGi0PuaPRM0Z63j/PV1L3Ksuc2La6yYSRze+PpgIrw2/gXiXt0WGB4ba
        o3pm/aJ0i2hUA7FIHRdLotH5gQCGgMwqPQ==
X-Google-Smtp-Source: APiQypI4Ks8H4DdYDla9cXARasH4ua2bXjOd5Bm7Ywt/vfV7gQQZJNvS1R6zkzo6MGN0i0z6LldHZg==
X-Received: by 2002:a19:e00e:: with SMTP id x14mr1295936lfg.111.1586485962299;
        Thu, 09 Apr 2020 19:32:42 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id x17sm565567lfg.36.2020.04.09.19.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:41 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/6] ARM: dts: qcom: msm8974-klte: Add regulator nodes
Date:   Fri, 10 Apr 2020 05:31:59 +0300
Message-Id: <20200410023203.192048-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410023203.192048-1-iskren.chernev@gmail.com>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

The voltages are pulled from the vendor source tree.

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index eaa1001d0a46..6b184819f1ce 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -2,6 +2,7 @@
 #include "qcom-msm8974pro.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
+#include "qcom-pma8084.dtsi"
 
 / {
 	model = "Samsung Galaxy S5";
@@ -14,6 +15,181 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	smd {
+		rpm {
+			rpm_requests {
+				pma8084-regulators {
+					status = "okay";
+
+					s1 {
+						regulator-min-microvolt = <675000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					s2 {
+						regulator-min-microvolt = <500000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					s3 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+					};
+
+					s4 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					s5 {
+						regulator-min-microvolt = <2150000>;
+						regulator-max-microvolt = <2150000>;
+					};
+
+					s6 {
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					l1 {
+						regulator-min-microvolt = <1225000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					l2 {
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					l3 {
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					l4 {
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					l5 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l6 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l7 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l8 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l9 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l10 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l11 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+					};
+
+					l12 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l13 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l14 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l15 {
+						regulator-min-microvolt = <2050000>;
+						regulator-max-microvolt = <2050000>;
+					};
+
+					l16 {
+						regulator-min-microvolt = <2700000>;
+						regulator-max-microvolt = <2700000>;
+					};
+
+					l17 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					l18 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					l19 {
+						regulator-min-microvolt = <2900000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					l20 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l21 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l22 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					l23 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3000000>;
+					};
+
+					l24 {
+						regulator-min-microvolt = <3075000>;
+						regulator-max-microvolt = <3075000>;
+					};
+
+					l25 {
+						regulator-min-microvolt = <2100000>;
+						regulator-max-microvolt = <2100000>;
+					};
+
+					l26 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2050000>;
+					};
+
+					l27 {
+						regulator-min-microvolt = <1000000>;
+						regulator-max-microvolt = <1225000>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &soc {
-- 
2.26.0

