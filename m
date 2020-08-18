Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE7D248B0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgHRQGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgHRQGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:06:23 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB3CC061349
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:06:22 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id w9so15496529qts.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dfn9XeZmM4o8gTNJBJ38GDqi4Uncp7PQCAHP1+tddKA=;
        b=kSCKLuVzVR+D06E9lB73szUHemddwXVMG4MoAb/6ide2+Wf6tLHmwY4DMkRWAfCHTb
         jRlStFbygabD3fWSgpV/dsoMhJ9juDgT4UsPz4pD04B0H8ZnZbSOqwXjljrK5DrzWNG0
         l5S6U8+KNt5MeyA4ZaRuFw7KwWLBV8RVyF1xvdljDnjbWJxal2Uzu0gEUnI5hmnqLGEr
         cBHY6ZTIr/Tg8KQJ7iEOIIVIId8M5WFTKlLFuVxPDd5c7DyhHAoeU6XB6W1lyNfqFNZs
         WLT8N+pDiKaaT153CdboD2/TrsW7RfIyVIfc5kRkLkFvMfic7LKuCCKriCTL4lskYow3
         IfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dfn9XeZmM4o8gTNJBJ38GDqi4Uncp7PQCAHP1+tddKA=;
        b=M2K/RBfK8TbZt/36tNKy0z/g4wyi45XAUpJ+Lf9ky/pSUWhMeabtnX0+kIwZHGDxOk
         O2byI9PYKIKk+z1+rUEbUIqX6/6lehKEotfPLisBhtllUTcrSO4pEnFPLXxUMDphVAgk
         shLU7FRBvAFMpQGiYM5pa4YBNcBOr0TeHXOlD59fEcEvaeOQah/wLtnPIi1RwzufeGHS
         WnZb+/zYkNsQQHh5sB6vBVU8ZH4f9pcRxwUL3Ai8qeLyZDdlUbDL3i7E5099thwwR9C+
         5Nawh58oV8LLFRv8pqQVdUgyd9IAp/gFk638qZjJnpFnzx9nzgD8/H5ltDlt/kJ8q5lQ
         +rhw==
X-Gm-Message-State: AOAM533dgqjGz2kzE3HoNX/vlQTo1YXbN7e4hQ1mlH647BxUF+25F40q
        yn7yuHa8CwsMhch4RTYqqnfdUOFXl9mCGjXr
X-Google-Smtp-Source: ABdhPJwE8y60rTooAMYhCh7JKeLJCmjpZa3kARCDxoppqjc7CTVzkeUAgm7/Q4Pe3BcFjNlDc3ZOmA==
X-Received: by 2002:ac8:5354:: with SMTP id d20mr19239770qto.120.1597766780682;
        Tue, 18 Aug 2020 09:06:20 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 128sm21198034qkk.101.2020.08.18.09.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:06:20 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] arm64: dts: qcom: use sm8250 gpucc dt-bindings
Date:   Tue, 18 Aug 2020 12:04:45 -0400
Message-Id: <20200818160445.14008-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200818160445.14008-1-jonathan@marek.ca>
References: <20200818160445.14008-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Constants were used to allow merging separately from the dt-bindings,
switch to symbolic names now that dt-bindings have landed.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 377172e8967b..b82d8f40fa42 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+#include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -1127,15 +1128,15 @@ gmu: gmu@3d6a000 {
 				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hfi", "gmu";
 
-			clocks = <&gpucc 0>,
-				 <&gpucc 3>,
-				 <&gpucc 6>,
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
 				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
 				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
 			clock-names = "ahb", "gmu", "cxo", "axi", "memnoc";
 
-			power-domains = <&gpucc 0>,
-					<&gpucc 1>;
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
 			power-domain-names = "cx", "gx";
 
 			iommus = <&adreno_smmu 5 0x400>;
@@ -1181,12 +1182,12 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gpucc 0>,
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
 				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
 				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
 			clock-names = "ahb", "bus", "iface";
 
-			power-domains = <&gpucc 0>;
+			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
 		slpi: remoteproc@5c00000 {
-- 
2.26.1

