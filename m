Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6870F259A47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732300AbgIAQr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbgIAQrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:47:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F60C061244;
        Tue,  1 Sep 2020 09:47:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g29so984280pgl.2;
        Tue, 01 Sep 2020 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
        b=Q9J0siRiCBTUvlTt1kvK7tVe6kE41TN+kIDNXErBGCMEu1mS9WGl+7HnaY7AizAAhM
         MGgJn5r7Rof/eu1Uou0PMSTw5hFRpugiRYy1Zicok/Tfuyw1H3V1tq3kahNYERz3c8YT
         bXHl75p+tvjsOILMrKaZDr3cZEd5sXyOpNnNhuqDgkx3L6L6Kb3YuoljJJBZkNLHwbFo
         soPQIChGhslKZccNHRLkXXS2dp3278kCoXtym2UYyH9+JavhTLC8/CcPIIx8CECq/6fQ
         wY6/1CctuejLklrAEC2Nb6tplD1fgnMzEIXMROD7R3A/ASkM5gP75Pv1ZPmEFTZQnh5W
         DuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
        b=VAWZfuhfSKn0hTqZeWTT7OCeqA+NkxkNVuZJC7sDNZEigCU1Oh6hrA1J6VAljnpX0y
         hlkbq1nE3XhhTpv28W5Ka6imnTv9Zny0YxH1Rm+91wjiqJ7YAXx/g4PaPLtdcAkHuVvK
         jvg3iuhOqxhr28dGDMWpiXiLBok5uZ3EuuHLzybOaVEicbwC21FOb8y8kJx7niR3wGvX
         hgRDk2Usqpniqim89Jn9hG71A0MUXdo87TqePesFKAVk3/sjqB5aaFqZJ0BEn+6FYCT7
         a21SmhsIoopJQDj7vL/oCkyeHKKQsb/+epuFA7O3ZpcyGB8WaTN/icae22xV96v3IIXy
         5Tmw==
X-Gm-Message-State: AOAM531+JUxHrBAQsYVoYEzaQ3m+CXtxwZ6R6mLFcFJzVEu4fweBakpG
        yyxiYD8VRZbcENOfcoGMHbk=
X-Google-Smtp-Source: ABdhPJy7payz3Vghp5VrIVR/57rRNtRm4gc2iwL+b/6W66VztvW4dVIOty7fJYRx21hhgXmVGY0cFg==
X-Received: by 2002:a62:928d:: with SMTP id o135mr2763620pfd.22.1598978863218;
        Tue, 01 Sep 2020 09:47:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w66sm2622381pfb.126.2020.09.01.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:47:41 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 20/20] arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
Date:   Tue,  1 Sep 2020 09:46:37 -0700
Message-Id: <20200901164707.2645413-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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
index d46b3833e52f..f3bef1cad889 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

