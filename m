Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576942479C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbgHQWDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgHQWDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:03:32 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952A2C061343;
        Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a79so8910262pfa.8;
        Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
        b=ON3+IT8Ii061pwCIRRZqlM9dlVHI9VqTJH+YgqCVJh08kX4Wa87xBftx90qimud4bs
         hoV/afh5Gb91orSJP31DsykdtRqKHhTX8T6FzxOg9HAAKW5uixwIGFTHaGaIzqlpkaTp
         QXI3gdMrm73rnYCJlvYVTmfDcYNea6kPLUYU2muv65ubqjwAKEetUt2WCmpPY6fVKs1W
         UOeGwRgYvcGKocNyZpk4dVMW+KMbgXFaif9rZdJd8n/KRbKHz5sttxdGREVQR4oKm8Nx
         sedk3E4hsHzD4lU0wCGki/wwMi0KdaQ+hOu8IjJUqIzrcdjVU5SLAoB3SWJHeiNOFX19
         bVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
        b=G8ZwBNJQtIMSdmpj7s2vgY57tFrTbw16w3JxQxiKe76pDIjo/A/d5tbolulu8AuzXn
         qc5fsbUMRpT8JWt/eZeBq2Vv3fMheIZhExXq0ptzM/Xm/uzkgrKgRu+FSdonAaA2eAHR
         +21F4Ii2rkrptA2LrwQl0uP4klU06LJvttfeKxRTSeJrVYx0ZG4GgB302pZjjZilHLPW
         bkIqwFEA4kPjJ2VFnpDDQY6LJY81yvL5l/ZCstlDo0bhDviw9q8NtcguKMUAvmZZ7WOt
         FJp4NqF3XpgH9f/DCn/rMHjwk+RUovxfYPVZctnmOSHPPTd0vnUpeqalT5mMMU6oLDEh
         s0gQ==
X-Gm-Message-State: AOAM530oosqsUD1lFGqgaRiGmwzc5QxAOrrys6GyN9rlfJt1MbOjmDxd
        GgHIE1SB/GpiDU5iBm/beqI=
X-Google-Smtp-Source: ABdhPJyHVZ2OTKAViaAMnr6GsfifqWWu585AcJLDTY67ZRAWutmwR3M2K3MJr2/0BsfVKF6RaNHzqw==
X-Received: by 2002:a62:26c2:: with SMTP id m185mr13108433pfm.115.1597701812121;
        Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id bv17sm18615468pjb.0.2020.08.17.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:03:31 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
Date:   Mon, 17 Aug 2020 15:01:43 -0700
Message-Id: <20200817220238.603465-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..61ae67186691 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

