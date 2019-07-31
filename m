Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B38C7CE66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbfGaU3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39002 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbfGaU3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id u25so50647749wmc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4Ts/ADGL+hlApCzzDUm7Jy+bE8lRcdVudPEahwDT9M=;
        b=BSdFLXko4tVMBjHaKYaYHDL9izB4mIFPGUBL4Fa5eQSpNQs2dg4NaxpNg0s7IFH9sW
         soR56XqbKMufRYSoRIyNxV5EijMg23s/ZfDpoGeNIRMSZK9hP3ImW8zG7Sh+vSfy18N9
         bCGOAfBSwh9/3EXyTgv0Vt13l6xwNA4mI0fPBtXOaIG60kSxtuAxmHpyIu3js/+vHH8+
         +ttjzR5Ci15+dszrOt7k5QPbmylx6risjovnrY9KlZleLOpnx09q4sniuDDwMN/BOyrO
         7ndmtgG3t+ML01kw0Yccm+dKWzvXV4hbTNXe9inkVPX8T7vSUgTXHqnt212uI+DWSNPz
         0BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4Ts/ADGL+hlApCzzDUm7Jy+bE8lRcdVudPEahwDT9M=;
        b=gFEDOXsxiTFevheQOvtqy5fvz75j2z3Mwj2Tvt9w9DyKQyQcnqFFCdRP+Vv8WrsuaN
         /qGFjIugMdDJyEh01JXmBRe/tRez2hsvMNCn547O3qsBuliZgzu/KYnHeH2QHYNTjGvN
         whSXJrsjIlbQQ10hpIPtWnFmu//sllIQM4oh36XAE9q4JAsMn1bUTlDH28rJcUusljmF
         gbc1dbFNEQhBxQ4lJ3N9rN1YjRhZQzuVlTzWBZ7LY10yKZ2r6j4yToYjqC23UmIUHv2N
         nLVzRwN87Q5nK9QrRe5X3diddZzL7yAB00VLiCEwLdfafKPztpETL4+r12YNKKdrWhJv
         LZPA==
X-Gm-Message-State: APjAAAXyAfRQXM50i0cnAfATD845Y8uAG8LJ3iWUFtdSgS1kWlSg6NkU
        TLIAVzOj9uw+qZmurtSIMrAWAA==
X-Google-Smtp-Source: APXvYqxchPbC3pvyGV4L0/DUhLZFXfOrdyYu2d7K+NuJc5EcWOHR9bxr3IVmnhGW5j3Lcy9EhRXVPg==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr106546229wmj.109.1564604992885;
        Wed, 31 Jul 2019 13:29:52 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:52 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 10/13] arm64: dts: qcom: qcs404: Add HFPLL node
Date:   Wed, 31 Jul 2019 22:29:26 +0200
Message-Id: <20190731202929.16443-11-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The high frequency pll functionality is required to enable CPU
frequency scaling operation.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009..3714099306b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -859,6 +859,15 @@
 			#mbox-cells = <1>;
 		};
 
+		apcs_hfpll: clock-controller@b016000 {
+			compatible = "qcom,hfpll";
+			reg = <0x0b016000 0x30>;
+			#clock-cells = <0>;
+			clock-output-names = "apcs_hfpll";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.22.0

