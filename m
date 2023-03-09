Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA206B2190
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 11:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCIKiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 05:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjCIKiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 05:38:01 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561615BB6
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 02:37:58 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so914745wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678358277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0O6KLG4AD6cU6QR8jdZ8943aOzJAUAKXP/tQx0/IXw=;
        b=MLj4MA+MwLBpY4FzxYXotzt1+CkD8LOaFWmjaO489j9Zq4NNFvTNXFwEsJYojZ515G
         bDHvmK0VDNhe8eiocgv6sJEDZyCJRLdVC638hdBnpZwYDvv7XlhJQ1gHRX6cvON+SFiS
         kh6JjiKyXvMxVSDOpOtHS61qKpNYHjBMMgKqCbzHUCAVvCtLqNuQV8UhQBdHzxIllivY
         0xIdbVOnbaMYkAiLDx8d+oS4BlukH1hy4cjI/3O5nd7s4cg6LtgYlA+M54UUDPLeCY4Y
         L+a9exzIUXvpXiwZ83zy1vD45FODCWdxbV/NYU12QiZCUtYHO2cNxp+YPmZ8rhYgmFs2
         IJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0O6KLG4AD6cU6QR8jdZ8943aOzJAUAKXP/tQx0/IXw=;
        b=5cR+eXMc/9p6DSFqTHTr2ALhQrzo/YUvyUPkigHRDzb6wJzsg9qW/oB+kc/NVmVlUA
         8ecTZBHpTfUQ+OpRLXcSj5jQPfOTjyUnmrol8dkEmHgxdLBSX+KUHYQRRD506nj5ob8M
         hjgQaDGqsW97teeY+8c7mQqIScnp56+vilSqMQawuMD91eQ9ryLVQSKbUfxthCEtOPiF
         9wTiSOA6y4w/4u3ERaikDIhSVGQXIzH060dB/JwHdkbIYfPbYxrJ2f+6HTPCYRwal9Pp
         A5ygXfoMZ8Pha2RQbg3gzznzGfEmIqMWPZ/6+6kSyANiOeAKEczpDAI8Xpkuqf8m2p1F
         /N6Q==
X-Gm-Message-State: AO0yUKXfusUwGdPAyrQznaamIoqAKMxbdbDHShzwROcRTZtCA42Tsv4B
        SmO0wxcwYP0EjNG8KEZqQrbCLQ==
X-Google-Smtp-Source: AK7set8oXgyyBvueHWBWEivRn1c3k4xHgg/TEOhR8OderM+2Ft2QDcXhdNEuhAB6+K/3KuiE7uzAvg==
X-Received: by 2002:a05:600c:35d2:b0:3e2:1e01:803a with SMTP id r18-20020a05600c35d200b003e21e01803amr4505099wmq.9.1678358276815;
        Thu, 09 Mar 2023 02:37:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d58e2000000b002c56af32e8csm17638119wrd.35.2023.03.09.02.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:37:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 1/9] arm64: dts: qcom: sa8775p: add the QUPv3 #2 node
Date:   Thu,  9 Mar 2023 11:37:44 +0100
Message-Id: <20230309103752.173541-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230309103752.173541-1-brgl@bgdev.pl>
References: <20230309103752.173541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the second instance of the QUPv3 engine to the sa8775p.dtsi.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 565c1376073e..9e30c1e3e66a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -491,6 +491,19 @@ &clk_virt SLAVE_QUP_CORE_1 0>,
 			};
 		};
 
+		qupv3_id_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x6000>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			iommus = <&apps_smmu 0x5a3 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.37.2

