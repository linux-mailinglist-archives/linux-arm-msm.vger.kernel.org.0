Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0038BD8B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2019 09:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442439AbfIYHDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Sep 2019 03:03:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38837 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442433AbfIYHDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Sep 2019 03:03:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id x10so2672329pgi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2019 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QtDjGuT6GYExoPUWAryXx0/SjRXtIy1CTdSczN1NQCM=;
        b=RmY/xOXe2eKL26y3uj55F1Fit+H+0WrrZaOHcLMNCDSNoi2kMXrhnE0ucEForuiEA+
         JyRluTVi28yl+sTJGSRelaPvSKuza6Hk+Q9GRAPSRoAwq1VWLfr4h3eTKtsojFr+xrG8
         zaY9vImby+VTXEwcWMmtB7mGhtQcEn/Gbn+gOrIIVg6zcpp/o2JX2j313Dln/oC0dVVe
         dwrSa+J5kDasv/Awru0qA99xL8YL5AZEQYzOpVkazBCDdADqsEzMLVdWX8iGhVjqi5wq
         IYNJJ7jeetpPukK/+WzB7j4TGb2RgEWr7x1WdwwyLnhmEJcVT6h0hfP3bpj7kkLXXnLb
         GK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QtDjGuT6GYExoPUWAryXx0/SjRXtIy1CTdSczN1NQCM=;
        b=frqtadVUDcnaCxasRAaq+GXhf/zS7TWSh/93z2ScQ/uAifzk69DDfqoybdM2D+d6pa
         lMJiN/j0JoOZUYvTgDTEpJuTvTS3NNjxjngBKwSIwe/XjB550CH8OuTzzr3JP83QP89Z
         48+vZlJ8XTPpK+aOGEfC2HwC/ACG0PqLWt5JyV4kFDvlxXjD/Pxp7PyjwQW9jpmm/F0k
         0SKywTusZ0x/g8DKCzwQ8WcQdPaZDJpLHaPxIZ3CBKWm0LSx0h6TgP+3DncrlIyLUgbg
         /E0A4D9iaiWXTU9esaQOkrG5rHYiLSG6loOlh/x2ijXwtTs6ta+Wf1eqXtV+MZ9plNZ0
         6Eww==
X-Gm-Message-State: APjAAAUvmvcmsZ54OTWN4BuVvSLc9t6fVQ72ogrn1dnNmgI5evCQgjia
        zpFkcPnYA0ckkYzYdP9a8m0mHw==
X-Google-Smtp-Source: APXvYqwK0vMFcB0zMbrgYeYbjpMtEMvsl5ew0HFiuRMmFs5VRtF6LUvKhv2I9PfhGnJ3lD3U/s/nHg==
X-Received: by 2002:a17:90a:fa02:: with SMTP id cm2mr4735395pjb.133.1569395011749;
        Wed, 25 Sep 2019 00:03:31 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t3sm1541054pje.7.2019.09.25.00.03.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 00:03:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: c630: Enable adsp, cdsp and mpss
Date:   Wed, 25 Sep 2019 00:03:28 -0700
Message-Id: <20190925070328.13554-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the firmware-name for the adsp, cdsp and mpss and enable the
nodes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index ded120d3aef5..d3c841628d66 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -20,6 +20,11 @@
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/c630/qcadsp850.mbn";
+	status = "okay";
+};
+
 &apps_rsc {
 	pm8998-rpmh-regulators {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -229,6 +234,11 @@
 	status = "disabled";
 };
 
+&cdsp_pas {
+	firmware-name = "qcom/c630/qccdsp850.mbn";
+	status = "okay";
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -296,6 +306,10 @@
 	};
 };
 
+&mss_pil {
+	firmware-name = "qcom/c630/qcdsp1v2850.mbn", "qcom/c630/qcdsp2850.mbn";
+};
+
 &qup_i2c12_default {
 	drive-strength = <2>;
 	bias-disable;
-- 
2.18.0

