Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EFF2B2332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 19:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgKMSAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 13:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgKMSAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 13:00:01 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17862C0613D1;
        Fri, 13 Nov 2020 10:00:01 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v20so11755887ljk.8;
        Fri, 13 Nov 2020 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uw0QicBXorgBvHkVMMUveBzTYOdcTlrlkWfYL8DrooQ=;
        b=f4axpBtm11tg1JMtX2IrPRlI2vGjB68er+3shdxmBj/Uo+Zm9NBrfoZiIS5ZhqrWYr
         9HHdWTYIFjqelqr4hCGFHaM4AcVcVxJKEYqlvN5pO/cGG+fhNfeec3X4N/J/bK3RYiv6
         i3ZSFAz+uauB9zflPpw514ufhzv00ot4TJunOQUqLJ5DAvEAlujj2F+RiKpHYvdlbWr/
         WAdnk1i6x2OeVc0/zPzJ9clpxJTjw3d4HTqqBNh43Y2nxSQhzCdD/3z0m7zvsRdiySzz
         0A6XxQVyDXfblhRVHeENJpKTYpY4iidVuBAMbkwStE7h9tXJwqDdTqOHOiMNblgtJaIN
         WDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uw0QicBXorgBvHkVMMUveBzTYOdcTlrlkWfYL8DrooQ=;
        b=KEVBGiNbsq8Npp7txm/NP9kkxRDS0Ja/DxwRhKLmx49NP71kweVDYeA510Ks9SnKaE
         Ju8eKPpj2UdnmKCx85cQ566q6tT1gaetp0ewLlZggnbs5fDccvWj5LIwFsulK9fU6geg
         zYzd1cHtXEt7HiDdZ9q8dy52IXiFowsjMw0mdHRD+0peIlbjYQ6LahBuGCN98ctKMw4s
         wr/+Z+M6sXIVV31nz9CE6Qx1zNHKuYHT716VqbMFz6nJDvjUUmebKFvhWSz2I7KCcRe0
         rzMlKJoOADLXneQbKu4CHTxO91zeEfb5cDUbcgRtcByIadmztPlcMdtWc+qa8UbOXpYf
         3y3Q==
X-Gm-Message-State: AOAM531Fu7T9BoGafSXV+47cbYDoI+KvqTd6uSzaqu+5VnuB0HJ/lgpX
        h7e4BQQyRdEcO4TbBE/DvS4=
X-Google-Smtp-Source: ABdhPJy9aXj6cy4HoVjjs5LcGHaBYPc5vZQvtxUU44wkCLSHKx+ej3+ZRzCt3bnWI+3GEtUPIwPcJw==
X-Received: by 2002:a2e:5853:: with SMTP id x19mr1549091ljd.232.1605290396985;
        Fri, 13 Nov 2020 09:59:56 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:56 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 6/6] arm64: dts: qcom: msm8916-samsung-a2015: Disable muic i2c pin bias
Date:   Fri, 13 Nov 2020 22:59:17 +0500
Message-Id: <20201113175917.189123-6-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Some versions of the firmware leave i2c gpios in a wrong state.
Add pinctrl that disables pin bias since external pull-up resistors
are present.

Fixes: 1329c1ab0730 ("arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U")
Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-samsung-a2015-common.dtsi   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 0b0dfd3059de..f91269492d72 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -78,6 +78,9 @@ i2c-muic {
 		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&muic_i2c_default>;
+
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -304,6 +307,14 @@ mdss_sleep: mdss-sleep {
 		};
 	};
 
+	muic_i2c_default: muic-i2c-default {
+		pins = "gpio105", "gpio106";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	muic_int_default: muic-int-default {
 		pins = "gpio12";
 		function = "gpio";
-- 
2.25.1

