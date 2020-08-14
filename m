Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8067244368
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgHNClp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNClo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6C9C061757;
        Thu, 13 Aug 2020 19:41:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so3702703pjb.2;
        Thu, 13 Aug 2020 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
        b=OZ5AfjFtazVgCqyUoQKl0fVe4Zv1HBrkEcINpNZ4TF+rbwR3vfDA9C9hHNqhcfyovd
         hZ0VTlsSUQGx3HzvF866Vm87XoGiPc05zzEE8XuM080SPnyPJg7B7rLW8KmgJ70BHHF4
         zuSCrRo/Feri8CzJPWbSPNyKWMQRNkaZqHnQXvB4FIe1sWs2HoP3IZfCaJ3jHHjohB91
         R7iNeBNBpJM8lEn6KPKCMvKuUiUHWOk6KDMEIgZjNiiA8cPE9SSyOHHs45CBiftnkt2D
         cxK4wqvStzkpHkn2HCgopkUqnND6mu/tHLkHdk8vgl6ZBEIWrRjfD7ip/MJGFtVsGphZ
         sXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKA+x0uy5NlO00Iqox0wh7pVzFT+/CgBiD5qZahgaMc=;
        b=DYyRChiRKaV+5B5LJo3tkU2omyqzLCEtbOhXBc+sSrGZkooXE5I+vi2y39i1BgI0ON
         5lKBwSVNb+v+VVO1x0HLELrddFqvygSlbml8rZQgznmkqCvE28UsKbVxukxd70vQL9C4
         Dnz+e+ihPN+pZFlcs2tBljULB9hxRNT6YoqqYXLNJRw4/+GnXMOxLONa2KXaGeYTRJZj
         erev6XWhjY2EF/oup+wmLqa+0zSwYr+QSBrsbSKIhjkfuaZUhc6I/Fyj6NNW/P4fELoI
         K1MjRB/kR7E5LgdSfXjEj+eMlb5viEDYM33NGvDBgeUyB/5aDUgo5iWxtJ9hGnHsHRtu
         NFTg==
X-Gm-Message-State: AOAM531ytrF2RMv4j+auf3L+s/0sXzyho4Ilq3gaCkpynJok8A9LpIeZ
        GCl+pfhmlAgbB5fxt+tui6c=
X-Google-Smtp-Source: ABdhPJxRU2uTcC7U1hC33YEDToytochFsUhJDPj0RKliYV1Cr2UAtF1I/WVfqPUwtN3PZCCpa2huaw==
X-Received: by 2002:a17:90a:2207:: with SMTP id c7mr557865pje.206.1597372903537;
        Thu, 13 Aug 2020 19:41:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id e8sm7219856pfd.34.2020.08.13.19.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:42 -0700 (PDT)
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
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/19] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Thu, 13 Aug 2020 19:41:05 -0700
Message-Id: <20200814024114.1177553-11-robdclark@gmail.com>
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

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..5ec5d0d691f6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -40,6 +40,10 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.26.2

