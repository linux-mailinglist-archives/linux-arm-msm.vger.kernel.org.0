Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDADD2479C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgHQWDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729487AbgHQWDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:03:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A73CC061389;
        Mon, 17 Aug 2020 15:03:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d4so8296373pjx.5;
        Mon, 17 Aug 2020 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
        b=ZL8fnDvw2JO35q5KslLETY9tBaGJ6NBbXqEA7vYHRSLYx4P/opOuvZH6Mnw0NP08bX
         jPvTBwPIAKH37k3g7Jk9u+swo58YqYz/aTtg2qzWBIQjlE6Fz0nWrJY1Wi62AIZ/XAL8
         zTxxQ80xVY123z92lHmO3OtQdR7PSR1OQH/2EA0pKUfmIGOKDseiT7j1cYQ1f8KLr54W
         fzAWM+IXCZnD0oxyv6NO8WxdmW4/BW5sOKEYN+WiTR+vb9FME4m2K4+CI3flRms6Txvx
         p4YWE7fWjSidNKQe/De9YjSdtotAtG49tOwbIXVLbZb9eTY9k54o8InXzXnQUVIeMja3
         GtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
        b=aEbm/JRqMOKpaJGm18xhKbZFsP13u0OzlIBzw94Qyi/7pd4wQKgfMw6TIprN70PtiG
         Os/5IEHY75CqIRVESVgY+2X9SVwmKPy0yOl/yNmonAN1F8zuHaAeCvKecg5eo05/q/IP
         tjZe89v+CLOhOb2LvrQ6+EBaOMmVK37dAPHoCJ7EPw2dqwnaeebDW2GTevGdPdQu7E+2
         L+8jow3ghlxq+BZ2yIUc16G1xpsA/o8OvW+Ika4iwQRapUga1YOHbefcp00sEx2lbC3b
         Z0fw2UshF4Jk3/toOzhK4YZrCmy9YvJFyWLhcMeDCz6ZYylMzlTNBlyNsg2msGv46JmU
         igSw==
X-Gm-Message-State: AOAM530Gig/fvESZqsODEGn75fXoobFbK7CUngpTm9ij8PxwHNKJ6dUj
        mHsIJY8YV+MExqss9pj4aRo=
X-Google-Smtp-Source: ABdhPJzcpHZhmDBtp9AUC/rTQdXs//5Wga3CPsk+w6f9oGQlu4dMZIhJfEHvZb6UuQImgc1is5O1JQ==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr12962504plo.218.1597701809511;
        Mon, 17 Aug 2020 15:03:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id f6sm20966585pfa.23.2020.08.17.15.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:03:28 -0700 (PDT)
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
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 17/20] arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
Date:   Mon, 17 Aug 2020 15:01:42 -0700
Message-Id: <20200817220238.603465-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..6a9adaa401a9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4058,7 +4058,7 @@ opp-257000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

