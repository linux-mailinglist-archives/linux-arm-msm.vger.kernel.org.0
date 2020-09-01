Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A59D259A42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732296AbgIAQrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732292AbgIAQrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:47:41 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E17C061244;
        Tue,  1 Sep 2020 09:47:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so811561plk.10;
        Tue, 01 Sep 2020 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
        b=d2/URyDwjchuggwTyHw8d/OgnYrxNo2olK6OBqsGffjs9tubNZacMeAts3N4QEfxw8
         5Q6mP/Io1kZ6ShbzKsdMp66CaPux8VHjQyV2cKCN9Xa0KLS+9ZSDrVarpGKC172y1hw6
         AfTeVgZ0r3PwraILILQvgL8q68+6/C3O3c2itMcUplLuX4Uw8as90AeNj4yxr2mng2/D
         U9PHtA6MttoyqkO7LLkNGz6fP5ePa4dmCRHpzecQ94K0BOVx9z2rfL9ZetZaMKGMMvxC
         zICl0CqJ2zk04r8CDOMEUTsvAtNeEM+44tgYS4vy503g6QOoJCmAH7g2srag0k4AM47h
         dE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
        b=RiPcsywsMm5UNbp2o2m6BwzxSrDC7f0S+50/i1g5k4Jze5MHWM1mmNDRGAEUPW7+UK
         zSKw0CzGYdU6OLFQ1kVrXUQUCiK3KuFEYV4ky2VsAFT6lhoxvQjmahtWkSm+1t9/G7wK
         kktijdDri/Sy3v8YrXybqzyOkRXeJjSXByvfgHhmsogo6Z9vRlISfsj/YDFHEjcZa8Mn
         Ka09NgT6XDEIi6RpGWdXbtHSd7hi6CZEka6v5EkLcXwKxMoozejEt4ObRo3yUs7bgSmk
         Y/iLkSIM43SQsnOURQ8VlGNb/u4NJXA0WJhB28njTCnV5W5bAOlPIM3SiEeJWm0ttbah
         j6Jg==
X-Gm-Message-State: AOAM532BxClB/cRx0KIja6eUebGp033Qzf9RhGwGuf2WfydbzAM4Rn/O
        1mWlZoxVe1yVZgDwpBiic1Q=
X-Google-Smtp-Source: ABdhPJxfV0FiOo9Kg84TzFlg6WinbO0JkLmr3QdQ0ZPhheez1khfYC5+K4MYQGR60MpSKWKBwCPGmQ==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr2397826pjk.101.1598978860386;
        Tue, 01 Sep 2020 09:47:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id k4sm2755950pfp.189.2020.09.01.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:47:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: [PATCH v16 19/20] arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
Date:   Tue,  1 Sep 2020 09:46:36 -0700
Message-Id: <20200901164707.2645413-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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

