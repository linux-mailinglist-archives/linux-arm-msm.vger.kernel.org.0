Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9CE250845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 20:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgHXSnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 14:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgHXSnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 14:43:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29982C061575;
        Mon, 24 Aug 2020 11:43:04 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id i10so4999329pgk.1;
        Mon, 24 Aug 2020 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
        b=cKnPnNCTWkaPr7f7iLMlg926WJU4UrOaPzfxFuLlQmLn9Y7XcZslcjvmp0E6xfwtOz
         gkZQ4IxM+pDxd4psoqGqo7WxSHhR+rc9dYIzzwOlOCQ54tBGHD34WnB4UECsRykp5Z8O
         en2Cp+5/9BQErxsjVk1881aQLuK1GHfb+6Audna0letrJ1mnS+M9eeRvQ2l3nnk7CkYZ
         VuSOgl2NAMCIReBC9EYVI7F2m71uuDLKcVLwZ/+E7fsvoPVq3BNE946SmCMo451CQMyq
         H0ykDMGQU5viHtIQmzaf397UPKBZhq7vuQRH58n7N/mCbXaIvgplxyPjozVjUFMh4ZGu
         VEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
        b=d1ADKgK73DlfDojQjudEzNPtZLv6VWtcvVlNa2ANsJbbSNiR1o6WVVM5zGMOZQj0Cy
         m1fMCRytwQTyKPhxaC9C2dmlxvi7H7tdRK/Hiq6qM6xoJB9rs2QhkEOpjQKUMnUnkx53
         UTZJDkodcz3+2PuCQeNCH2dKVJE0rFjBisWG5k+LLqdU+hnFJZP1f3DefjAm6xMJr5Uv
         vJtGQ2sHwruY3+7RHBgFDa1+cRnm0RCnboAgIB2kPxbiCBzltzzS5xTmbH3SWPiyjZRe
         iJRj/kOs4OBBVqhSmhgRInRLVkmvEMzTRx56JWvxTtq/3XxQ0FXQnFqoWOOeYgs+iKxA
         97iw==
X-Gm-Message-State: AOAM530ZIgJz4izT2JTJeWU9LQ52I/UzZsV2i88CZ0Ak/J1U7S9uuLNi
        jItzQcEGnDRvsp2ZRcI1joI=
X-Google-Smtp-Source: ABdhPJziwKfT/ADuD97U1DcjSVUyIfoo1r/o3mFvVUDV/G+U1SSbfm8cvQlIS6s62gMCK8gPj+Br6Q==
X-Received: by 2002:a17:902:b193:: with SMTP id s19mr4902466plr.194.1598294583688;
        Mon, 24 Aug 2020 11:43:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id in12sm241872pjb.29.2020.08.24.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 11:43:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        Eric Anholt <eric@anholt.net>, Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
Date:   Mon, 24 Aug 2020 11:37:52 -0700
Message-Id: <20200824183825.1778810-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
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

