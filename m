Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4AC244384
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgHNCmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgHNCmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:42:10 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D090C061757;
        Thu, 13 Aug 2020 19:42:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d4so3694386pjx.5;
        Thu, 13 Aug 2020 19:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
        b=WSjYyuU3IicqTzGKZ+qyMjOajK0Y+CUj5/an3UNid9VEFQQQ/GpitZqkA4Xu71HuQ8
         uyDetJmFxIA+LZ4XKMdbTacXBdQ0BS3SOFEr+zfj8Vs4H+aqeVXRsK6JQK/JbDEBN6KL
         KRMXnTA5bzHXH18nGWyEk4Oe0sZ/kKopVL4uPgbxwS47tJ5mL4kSYON0DOcpPgu4ncj3
         JPOGnNh3/vssv6qpnjwMjU1C0PCegmTgZmDWFyDlNeNIQ2ThNiwnKSOI0nCAg2qqb6AX
         sLmkxHWNJBh1RrM51cityB+EYPnBq7MWoZfATphAbQy5D3+kK4PBubVAY2hgGHqvs2Xq
         TPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RMbEO1wS6ve28JkP/1VJiMbFcTiFM9NBrI4zgQscQM=;
        b=tRNafEInAB3MERGu9lVdOpYuq3usjoa99/z0Sj38c9TiKyMv8ZSlS2LbLd9jPyOwc0
         2Jk+Y36p4T2uRY82k79yD8GYji0gSv/Je4fvzD3yTGlQsMAf/khwy+wPv+XkMchlgQsI
         4PDSC1kxk4hELy6fXGuB16glyAYk1b1ETK5qHwtKIty4ahtAxqCa3V5dDOS6iI7Duuju
         HvuTNgoNlYGrAwtfeusFft9FFvdM8zDNH+YGpFq5CPQ/YCB2o9jN3753cKMDvzwo77PF
         6ra3jUFYNAUmfOhNvcI7VZdx/M8PmpSrMMzkNMJq526isUqV1qh8cY/6JkDAt2U9TNuG
         D/kA==
X-Gm-Message-State: AOAM530W9mQN3kMWHMTaq/OmNC7qj4K7rW9At2+PgVd9apmntBl1dIqG
        CaGKiY74lx+8Y8WNIXcWsCY=
X-Google-Smtp-Source: ABdhPJx2Hm4qJq+ws1Wzuo6A7am1wv6hPi7gD/YHP4Z3vqtJe3/ztGrQUEPhXJiyo9idH9IbGNEomw==
X-Received: by 2002:a17:902:b701:: with SMTP id d1mr562133pls.92.1597372929283;
        Thu, 13 Aug 2020 19:42:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x136sm7189060pfc.28.2020.08.13.19.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:42:08 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 17/19] arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
Date:   Thu, 13 Aug 2020 19:41:12 -0700
Message-Id: <20200814024114.1177553-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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

