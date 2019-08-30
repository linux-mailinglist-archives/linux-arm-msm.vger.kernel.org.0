Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185B3A2F48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 07:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfH3F7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 01:59:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42983 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfH3F7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 01:59:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id y1so2816849plp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jO4YbwPpshjRXrRtdnKsiPqTv62oLFxDp0znvn0r310=;
        b=e20AqBFDFVWkdR1wusdTgK85hn6qx5BsyLzD414yFsUs9eiUB9AqiR+gl6bTCgHTyi
         BWDhKMlPm3tA3v3lypx5ITJemWtWG8uA/PsQkkOVqfJ1d7tf/ik2kEF0qleHn6Kx4QCS
         a1b8fbQjdnMZ350be0Xwa556y3e6xm+/GVdqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jO4YbwPpshjRXrRtdnKsiPqTv62oLFxDp0znvn0r310=;
        b=ngk5l6sy6yAOZTE+olodNZBHjyTtbi0KVeFe8bCZw5885wlnFoVu2JfgnUYs0T+7rU
         4fH9QdBasCL8D/9BM3VlBpWvouQgrpHLfqlsxu/9fnTAUCxYE7yXlbl2kPKr+XT2TdqP
         T8CDMmng7JlUx5eFnc8wnrkbJlgBiOpF+k/HZWlaqNrqV56wHZnKL/DQG1rp7CxY75DX
         +DJ71MWEJGRSakB33WHgYkOJicp4EZPjkPkUUogNDwOWKh1btaam+Xaoc0qdpCXWenbB
         VTtFARnKXmrXu+OemZ74Sh0IhHxzO9Zrlh1zS3Z2AY7B+S1XrsWAQHYN2Bl2eY3uoXxy
         W91g==
X-Gm-Message-State: APjAAAU5JQVpHgW3mQcHQbB/1IszdGHDw8p5v0dgZxzt7f8K8JjfIPzH
        W0QeObQcoT+A2UkPAb4uprK/sA==
X-Google-Smtp-Source: APXvYqyVfXrG+2FXh1BpVdkZ2V7aBPjGLfrpcGp9iQT1h+vPA7EpNL2HvQr32RUUEQugXGtvCp6O0A==
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr13864866pln.37.1567144764304;
        Thu, 29 Aug 2019 22:59:24 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x11sm9467280pfj.83.2019.08.29.22.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 22:59:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845: Use UFS reset gpio instead of pinctrl
Date:   Thu, 29 Aug 2019 22:59:23 -0700
Message-Id: <20190830055923.11893-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We use a pinctrl "workaround" to toggle the UFS reset line. Now that UFS
controller can issue the reset, just specify the line as a GPIO and let
it be reset that way.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 51 +---------------------
 1 file changed, 2 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 1ebbd568dfd7..611ae48437f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -701,9 +701,8 @@ ap_ts_i2c: &i2c14 {
 
 &ufs_mem_hc {
 	status = "okay";
-	pinctrl-names = "init", "default";
-	pinctrl-0 = <&ufs_dev_reset_assert>;
-	pinctrl-1 = <&ufs_dev_reset_deassert>;
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 
 	vcc-supply = <&src_pp2950_l20a>;
 	vcc-max-microamp = <600000>;
@@ -1258,52 +1257,6 @@ ap_ts_i2c: &i2c14 {
 		};
 	};
 
-	ufs_dev_reset_assert: ufs_dev_reset_assert {
-		config {
-			pins = "ufs_reset";
-			bias-pull-down;		/* default: pull down */
-			/*
-			 * UFS_RESET driver strengths are having
-			 * different values/steps compared to typical
-			 * GPIO drive strengths.
-			 *
-			 * Following table clarifies:
-			 *
-			 * HDRV value | UFS_RESET | Typical GPIO
-			 *   (dec)    |   (mA)    |    (mA)
-			 *     0      |   0.8     |    2
-			 *     1      |   1.55    |    4
-			 *     2      |   2.35    |    6
-			 *     3      |   3.1     |    8
-			 *     4      |   3.9     |    10
-			 *     5      |   4.65    |    12
-			 *     6      |   5.4     |    14
-			 *     7      |   6.15    |    16
-			 *
-			 * POR value for UFS_RESET HDRV is 3 which means
-			 * 3.1mA and we want to use that. Hence just
-			 * specify 8mA to "drive-strength" binding and
-			 * that should result into writing 3 to HDRV
-			 * field.
-			 */
-			drive-strength = <8>;	/* default: 3.1 mA */
-			output-low; /* active low reset */
-		};
-	};
-
-	ufs_dev_reset_deassert: ufs_dev_reset_deassert {
-		config {
-			pins = "ufs_reset";
-			bias-pull-down;		/* default: pull down */
-			/*
-			 * default: 3.1 mA
-			 * check comments under ufs_dev_reset_assert
-			 */
-			drive-strength = <8>;
-			output-high; /* active low reset */
-		};
-	};
-
 	ap_suspend_l_assert: ap_suspend_l_assert {
 		config {
 			pins = "gpio126";

base-commit: a55aa89aab90fae7c815b0551b07be37db359d76
prerequisite-patch-id: 2f2797d174d16a953446039125978c024c34d497
prerequisite-patch-id: 4020423c7331cee87d7679d325c66bafb56a6b69
prerequisite-patch-id: 46f8bd1aa2aee384021beefc9b6ed7315690f96f
-- 
Sent by a computer through tubes

