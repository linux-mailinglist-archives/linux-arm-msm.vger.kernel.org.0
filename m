Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B243D26D67D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgIQI1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 04:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgIQI0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 04:26:34 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0C1C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:34 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so752665pfi.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D6h+xKCe0NuczXnbv5vYewO0odIcXWf9WH9+tSHUU4s=;
        b=jeRzzBbGla5iVfHIc+qJ9qx4GzGPi/zWJQ4LIVyclPcn9BrNnPMvbWAcAFa2KDmwmT
         D7RcmoRqojesewmgDOr1s+NTJPLqP1odGzqJ60qq30YO0yiTGMec1QrnYd+V1Igc/F+g
         tzW1xtkI7QrIRm7Rhj4QsihBAn7X9LFT/blGUPz26kUoCacIyASTFxOI+P8qXLrcTnD8
         1AmG6L27t75St2az44hf+92q3IPbpA1I171NADTszerBFuS7MC7cLkuaaXInGly43CQj
         fGx1NmqxEwqA3xb52c/RXOE0dhKnUZirxV0KrpOFo3Tk8ABQkSKBE0b9LXM/So58BAly
         24MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D6h+xKCe0NuczXnbv5vYewO0odIcXWf9WH9+tSHUU4s=;
        b=pcJU4N6h54WRcYkrqyC85xVtFEOPF/ZzIc3Hj/eZWf/i5zYnkq2NpED91qliAlfI03
         5aGcCteeyimVqKuD3dsGMHWlLv5bkq3AnwY/vsQ2PxY2g4NAyWKwtC8F3nMplJ26RAFj
         6qFoKnnA41u6po7Omj7v9VyTIXLgjlOug3et9bPIpsVVcApgaNUldemqTLRtb60zGdls
         C2PQJ1HOP9OrcyVOjD5PH1lECWPL3DUpmT7OtprLu6rFez6m8q5w4YB/wyW+QvC1l0tG
         cSpXdoacd9VqSx3F+De/F4euMo/jqdSRDm3ZOt70UWcITGYXn4UNohtAW6m80t1xntX5
         tNAQ==
X-Gm-Message-State: AOAM533GP43AdVTJGBQeVq6j93qsnCbFPPL4PY0OmyWkGX/cYOgxmqiH
        d5V8ZtENfP45CP/h5KYvAHAe
X-Google-Smtp-Source: ABdhPJy9Y8OG1St1V82/Rim83Og6yn9eXU5MNTY3PLcUoiyZV1gPfNN7PwQa/rXhQMXAZ3qZcW0fLA==
X-Received: by 2002:aa7:8ec7:0:b029:13e:d13d:a080 with SMTP id b7-20020aa78ec70000b029013ed13da080mr25243462pfr.23.1600331194008;
        Thu, 17 Sep 2020 01:26:34 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id g129sm8233194pfb.9.2020.09.17.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:26:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8250: add apps_smmu node
Date:   Thu, 17 Sep 2020 13:56:20 +0530
Message-Id: <20200917082622.6823-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917082622.6823-1-manivannan.sadhasivam@linaro.org>
References: <20200917082622.6823-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add the apps_smmu node for sm8250.

For UFS, now that the kernel initializes the iommu, the stream mappings
set by the bootloader are cleared. Adding the iommus property is required
so that new mappings are created for UFS.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 357e4bfba70c..3b3eae732da7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1163,6 +1163,8 @@
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
+			iommus = <&apps_smmu 0x0e0 0>, <&apps_smmu 0x4e0 0>;
+
 			clock-names =
 				"core_clk",
 				"bus_aggr_clk",
@@ -2125,6 +2127,111 @@
 			};
 		};
 
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
+			reg = <0 0x15000000 0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			interrupts =    <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8250-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.17.1

