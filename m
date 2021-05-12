Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC1037B549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 May 2021 07:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhELFDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 01:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhELFDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 01:03:07 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9873DC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 22:01:59 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cl24-20020a17090af698b0290157efd14899so2638601pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 22:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kV28rAtg6/cJqxa6L0uFVR/mfU9lX1zrmLV8fppDItU=;
        b=iwLzr5pmew5OJo5CQFzgBj0jslO+7vz5dByxxTWAeZpRV/z+RqDJIQDgSBxw1t03Rr
         MiPNN/btszqQwaEnT0vkYa6bp/0cRsBXYQQXbeSHIo+uh4K05ialB395CZv1xEbl78xv
         FnI75QWbbQUcvHowo1SUM38VTDT+6XUv5v0ok5Nu7oc3GTobZF0BN/8Qa1jreGUeOI+c
         dMo5IIesQOF2amnfUBOz+dqNMWYyuqa23Fk595e4GaAdoWzVtBy+igQGN3MaSWBF3uKY
         bgrxwrL5keuA7S6eJ2LHLEuFH72XwZudHDperZBran+hEWOMKsjJ/5Xrj3AVTqS5ob1e
         Ea9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kV28rAtg6/cJqxa6L0uFVR/mfU9lX1zrmLV8fppDItU=;
        b=JmlCON8Ma4y+ATJzcb9HT9UrVbfaHBQoLXEfZkXjw5C/n0VhAWHTiW1pW6LDNeupId
         bXB9gYU5z1IaXM1v0irYue7fag/2GtQd+WowNKt4psWDqR1bV7PuJhsv1i8c3Xq4hJ26
         RnOvKwqKKGT49gFvdxnWluqULE1EJVWWDpmJTAgR54WPE/EaeEMk8N5WnAhmLtzBf0CC
         075Vf95gZj4CxmTvfuTW2XotnKglAOShWkCXRxY1ov00XJHAatEeg2IEFzqL2dNtFQw6
         sL22SOdfjR1EIRtsbCpDAPM+CeyJZVSvZxdLZBLpxOx7owpLu5OjlJ2yLzIcgejkQIfI
         xRRw==
X-Gm-Message-State: AOAM530XmgNvZvNBhsYqAje2x7CXL5U3x6NxtRl7eGucp3oiDILCZe2h
        /r+lMwT8fN/DXupPXUc79wcTLER/2RVS
X-Google-Smtp-Source: ABdhPJx5xjK/8QZOtBWXz3035wTjDEnqZhH+czFoCXrgQSkmPrz2TbDPdP0mO/GXr0aV6FnQQcJCUw==
X-Received: by 2002:a17:90a:c28f:: with SMTP id f15mr36764078pjt.30.1620795719133;
        Tue, 11 May 2021 22:01:59 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.142])
        by smtp.gmail.com with ESMTPSA id g2sm8115559pfj.218.2021.05.11.22.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 22:01:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements
Date:   Wed, 12 May 2021 10:31:41 +0530
Message-Id: <20210512050141.43338-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512050141.43338-1-manivannan.sadhasivam@linaro.org>
References: <20210512050141.43338-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The corresponding MTD code expects the regions to be of 64-bit elements.
Hence, prefix "/bits/ 64", otherwise the regions will not be parsed
correctly.

Fixes: 6a5d3c611930 ("ARM: dts: qcom: sdx55: Add basic devicetree support for Telit FN980 TLB")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index 3065f84634b8..80c40da79604 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -250,8 +250,8 @@ nand@0 {
 		nand-ecc-step-size = <512>;
 		nand-bus-width = <8>;
 		/* ico and efs2 partitions are secured */
-		secure-regions = <0x500000 0x500000
-				  0xa00000 0xb00000>;
+		secure-regions = /bits/ 64 <0x500000 0x500000
+					    0xa00000 0xb00000>;
 	};
 };
 
-- 
2.25.1

