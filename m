Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E932970FCD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjEXRjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235815AbjEXRjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:39:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B689F130
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:09 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso10309485e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684949948; x=1687541948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yraIyPA2BgDA4BIOOp7PQH949sD2z61pp/1v2JrtXPY=;
        b=DY31kIh3aVYnf4wn/0At0p5yFpWyKnjUqsxQYy7bLxQHzyFrKSzTBlgRRHbdcTLFgU
         Qgg+DRA9Mcw5Xwe8qB063u3aZaqr9bIsv6w8y1ar6Vv3np7H/CShjxccdEalR/+WMZ5x
         +O1kKsPuzOoldU00zzPvW/6W77Pi0Me8+L8i0S2CsxEYKagO/kOpKPenNrLvc5GgXeZp
         yKl6Eh16JBjT5Q/Mze+0Liq/Rxw2/SodmpcvBUq4rQd/oQ1pJatzabv/CN7pDy9djXB/
         eNAd1E5cnsWN1Z89ruCBfyggY1XkaCit/ttnVAOh88MiKX6p4ljCL9RKXFOQvRbOveMK
         Avdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949948; x=1687541948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yraIyPA2BgDA4BIOOp7PQH949sD2z61pp/1v2JrtXPY=;
        b=Gun+6Jl8M/isOw9KsoaLDSZKwRyOPk7yDjY1rlVSdUmnSxDbzFLQgbGglU3fA+M/SU
         jMTXEtSXKLXpwhum/93h6+uHh49wSKVu6F/k+BUJ39jEKwW7dZ8raffvPe42U2/1M8xf
         ExOGHp8cYZn9QNDEJqLMP0+nE7J0tLqOsrmwkg5IZ2rILF1jjYTsMLeKoRDunLnCwK1p
         83aRoxKtWC+CHqRhgv043Sp3Rb5Siex0kHKkV+4LCeofJPGAU0Zj3iOdSqJYnvLks2Oz
         qK+BPYh+zdp0po4FILOB8qwIyMMZ2ZDY9ZaqjBLrGIX4IhKxpZtWvMdgZQWyzVpqlNFf
         o3ZQ==
X-Gm-Message-State: AC+VfDzBR/rmL01GEv3TbXL9sLymn3ac6xhcRMEzn2U+4RAw/qzyPkf6
        yHVJrRGfPo22INCP2rp0Fnwr7g==
X-Google-Smtp-Source: ACHHUZ4NaKC5+C9EVQJYZF90OvpHsU8S0zaefx3Fy0napWhJqMm0j/KvuVGrHLcKuqFoH/Sf2BkM6Q==
X-Received: by 2002:a1c:7415:0:b0:3f6:11cb:4926 with SMTP id p21-20020a1c7415000000b003f611cb4926mr497885wmc.22.1684949948093;
        Wed, 24 May 2023 10:39:08 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003f4fb5532a1sm2993053wmi.43.2023.05.24.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:39:07 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 24 May 2023 18:38:57 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 pmi8998 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v1-6-f9334afc4505@linaro.org>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=ToLXeAXHYgqFaLcdjgSd/3kgLEeAYg+/fgo08zw4cTg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkbku19HgF5fzwDwv9U2d4P8Fejop2E9wPj6+io
 /2YrwJpojqJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZG5LtQAKCRAFgzErGV9k
 tts0D/kBmYxYj9KrLGWdwPOVNinxqTdresr8OhmwTdMqOfYymjS3B/F+eqhVCAJEG7y/7zYt8Eg
 EZJYjN0rCTTVmnjwaw2nXuiVhdlPy6ZzApN9+sZpVWEyKwDCWOFtXlIT8UaWQduum1jF41J/Jf0
 rtTyXmfwp034WkiC1K8bzz79szRThBWd0A7YlyDmw6rTmSoxyXl5Q5NNPlQtYqEUYx9QNHD4j/U
 zymKWWwbI4/whNxj3MdPEx5Nas5EECSMxhMjpXyy1Yb0RpUagCL9mFv6AvAwtsT6qNjikmJQTLM
 SvdDvdcNIjZej2w3yo8IrUGRCifmx1tonxGm+olDCyh1AxeauPvH70YUk/m34VRgexkbUwUHdaj
 Iy93sbdoP1dWbW414mOXs5M79hrKTzIXfS2+v3ljXK35i3JvQGBQjqmwldyOHW5+Uxv2Jh4aX83
 lCR149QAbh9Y2on4VHYadwSZ7AU4iO7w727Bo6WW+yUb+gJaaf8UA0+Lhr+5/qPCv/ClYEcAJsy
 u3GlOzIhpgSdyevteZvWNcOOmHSaMzWUi6bVWZRL2FTxnzy/oOW1GB2qd2fvsa2GCMmknZRcw3c
 HQNN9gCFIS4YqBL/3M7QSVg4Jlqln3u5lFK4mGvIHPGUNTl4njNQSnlSbAAJ+ODWGTABJ4n8ata
 ojZbcl+0E4UUCEQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable the pmi8998 charger and define some basic battery properties.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1915643f1c49..2060b31648fc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -115,6 +115,14 @@ rmtfs_mem: memory@f6301000 {
 		};
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
 	vreg_s4a_1p8: vreg-s4a-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -341,6 +349,11 @@ &pmi8998_wled {
 	qcom,cabc;
 };
 
+&pmi8998_charger {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.40.1

