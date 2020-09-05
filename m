Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DBC25EA47
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgIEUFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgIEUFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:05:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAE8C061244;
        Sat,  5 Sep 2020 13:05:13 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t7so1601670pjd.3;
        Sat, 05 Sep 2020 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yNzi+IfDJ+cNS2yHIl9Dls9a4nGW3uD+2qdWnyzD8M=;
        b=UTKpz2e0fmP8lundyyLqa43ZaE2gfiYn/WFbs0DFE91pu/FrF/6vCvGUxBZlKPbPRm
         fAMS4auuAv1QVfBXoLkyzv9TY36+tSXGem18lPaiRHlwABNE70meHg5WAabuPrtSc6KP
         6kLGaNpVoDUlHmEs6IAKlNAKoi2WxpMMTchmRXqRWeKEbWtS6dTqqZBf2o9CiiEUU6JZ
         kepRLPknTnJC+UphLKOnCh2Z3yeAXsCgDrv94722++cjfZwn5JkWhUPXuJARlsaLzX6c
         5XhfoZgPIqmCCOix6dYY1jpSwRJif+rgxOMVI40UKcWq0qQHm8LOl2099cdzCK7kGkja
         8pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yNzi+IfDJ+cNS2yHIl9Dls9a4nGW3uD+2qdWnyzD8M=;
        b=LoK2keamjltwlZZNQtD4wzrlmBVcnn5dPb5oXGkK4ZLv/MEoxGU+v5pJZBbLsncPIJ
         3NfVjHTJ8fLulAZXXvzB17nkwRG2g/c5XY9oNedWMowBigmFwHJqi4kQEfVZCIinHzCX
         DBmpM8/yta7fVOgbSKmsmmEKs3gGdF5edbL5sO57cYpKfCOBGgh4LrD9QfiC9hDs3JYP
         OVErCdgLXBhgMCNveTYry6nrNltBnB8lkqHpmU6NzAgw6p9Fp+UDT+9w/dWeoVKNS1MS
         yO5lpSVYlPDDRDqM7vZDI4BTz8tRvOH+uX59eQmPjE60Nq7RyNclkxPJOxtJz2l9QP3a
         JuYw==
X-Gm-Message-State: AOAM5330SdktDfhru6umoKjjqu5HT0eAHUOkNpK5lkdO+FMRSJRurwIb
        aSUCzRosMKatuYAB2tNYCnY=
X-Google-Smtp-Source: ABdhPJyle2EeXQmObRAlh9fqauTMVZ1Ol+lTwAdWYVdznQgUP1KJFr1LiTJu0OLz9LRPeIb7okWUtw==
X-Received: by 2002:a17:90a:5283:: with SMTP id w3mr13912915pjh.201.1599336312677;
        Sat, 05 Sep 2020 13:05:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j20sm10591603pfi.122.2020.09.05.13.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:05:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 19/20] arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
Date:   Sat,  5 Sep 2020 13:04:25 -0700
Message-Id: <20200905200454.240929-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 9 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 64fc1bfd66fa..39f23cdcbd02 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -633,6 +633,15 @@ &mdss_mdp {
 	status = "okay";
 };
 
+/*
+ * Cheza fw does not properly program the GPU aperture to allow the
+ * GPU to update the SMMU pagetables for context switches.  Work
+ * around this by dropping the "qcom,adreno-smmu" compat string.
+ */
+&adreno_smmu {
+	compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+};
+
 &mss_pil {
 	iommus = <&apps_smmu 0x781 0x0>,
 		 <&apps_smmu 0x724 0x3>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..76a8a34640ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4058,7 +4058,7 @@ opp-257000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

