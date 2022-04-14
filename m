Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDD0501D85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 23:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346900AbiDNVe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 17:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346903AbiDNVe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 17:34:26 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B961C3CA76
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 14:31:59 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id cw11so5960464pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p5umN/eT2yUlngm37Zc5I2AOTVEAYdcyPGsqi0WLgoI=;
        b=rq+D7FgkQSefBxCU9ED8GK3ke8819zxBSsQDmlKMR6RzAanoJ+pIUhWFqGsCQRhn5a
         T1b7M5p10Q77JtdA+STmiITCnnYLP6ygw3UTMjerkhQXYddkvRMnkJeGapa7QFumdrGh
         uDZTSRHXa8+a8A5EkfScSm663N4mBd8FOwtVbbFIvJF+ZPytgmvX3awgIv4nS2WWQVen
         pZvOtGqUVgroB423PTIhk9DOg8BEofQy3l+7udrziRMjslAvX81WFVWviAu9V3nroG8a
         o5S3EjLJkXdKv9ZU3s6c/By0RoiEBt/i7gIOBzjTaLxqwLHB7WaWP7E13jAH90UG1KeV
         2kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p5umN/eT2yUlngm37Zc5I2AOTVEAYdcyPGsqi0WLgoI=;
        b=IK5E1DN0Ji3vVW9lKigEwhpgPVCjHBMrFWjEEWZ11P7hpPG+oRbgYiGAoas1UZ9z6D
         EY77xfBDzkVfP7knG/OrG08ADUsgmSDkLW1oae2PSchFBdLldPP/3LRnSH1Tfn2j0IIM
         L5TjHFtLo/9Z7FEpkqvqg/0wjV+I6GRgKvChoAwidm9ndJpsENM9nh8Hb5TczEsWj/ID
         lei6PIX4HeWaHr0Lr/4duu1Ms4o27Otm81uzZYSqtkhA347y5kLBo0SZl0G9PA0yk0IZ
         a32/Ybk++OpIwOhzsSp9GH2rzqbjz0AcCcp92/70Qb2GW8Xo5l5EskMZxgZRBQA6xXGo
         AhoA==
X-Gm-Message-State: AOAM531H+m0BenoZx4mYquQJxo4UWi2OyydKxvBHDd7tcUEyOYDYa4xx
        Qln8e5IO0RhP3K8zWLPatRMJBBTDiZWP5g==
X-Google-Smtp-Source: ABdhPJytmCsb/e3RCFrNvI0gjCXUWASIQxycQtme8apNI4BdaG6KnfjbK3+CC7ZKEbaqbGCHu/IH5A==
X-Received: by 2002:a63:4721:0:b0:382:70fa:479d with SMTP id u33-20020a634721000000b0038270fa479dmr3916862pga.259.1649971918877;
        Thu, 14 Apr 2022 14:31:58 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id 5-20020a631045000000b0039d942d18f0sm2673706pgq.48.2022.04.14.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 14:31:58 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8155p-adp: Add support for uSD card
Date:   Fri, 15 Apr 2022 03:01:39 +0530
Message-Id: <20220414213139.476240-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414213139.476240-1-bhupesh.sharma@linaro.org>
References: <20220414213139.476240-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for uSD card on SA8155p-ADP board using the SDHC2
interface.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 8756c2b25c7e..b561a8139cb9 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -317,6 +317,20 @@ &remoteproc_cdsp {
 	firmware-name = "qcom/sa8155p/cdsp.mdt";
 };
 
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+	vqmmc-supply = <&vreg_l13c_2p96>; /* IO line power */
+	vmmc-supply = <&vreg_l17a_2p96>;  /* Card power line */
+	bus-width = <4>;
+	no-sdio;
+	no-emmc;
+};
+
 &uart2 {
 	status = "okay";
 };
@@ -390,6 +404,60 @@ &usb_2_qmpphy {
 &tlmm {
 	gpio-reserved-ranges = <0 4>;
 
+	sdc2_on: sdc2_on {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;		/* No pull */
+			drive-strength = <16>;	/* 16 MA */
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;		/* pull up */
+			drive-strength = <16>;	/* 16 MA */
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;		/* pull up */
+			drive-strength = <16>;	/* 16 MA */
+		};
+
+		sd-cd {
+			pins = "gpio96";
+			function = "gpio";
+			bias-pull-up;		/* pull up */
+			drive-strength = <2>;	/* 2 MA */
+		};
+	};
+
+	sdc2_off: sdc2_off {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;		/* No pull */
+			drive-strength = <2>;	/* 2 MA */
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;		/* pull up */
+			drive-strength = <2>;	/* 2 MA */
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;		/* pull up */
+			drive-strength = <2>;	/* 2 MA */
+		};
+
+		sd-cd {
+			pins = "gpio96";
+			function = "gpio";
+			bias-pull-up;		/* pull up */
+			drive-strength = <2>;	/* 2 MA */
+		};
+	};
+
 	usb2phy_ac_en1_default: usb2phy_ac_en1_default {
 		mux {
 			pins = "gpio113";
-- 
2.35.1

