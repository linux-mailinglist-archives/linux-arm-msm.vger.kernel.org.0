Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756CE27994E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgIZNAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbgIZNAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:13 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14777C0613D5;
        Sat, 26 Sep 2020 06:00:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k18so2092313wmj.5;
        Sat, 26 Sep 2020 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNEOPS5izWVikcRm4bTXQ52QCQiNW36i/3Zouqjok3Q=;
        b=A9RNERA5Z0JtArtts32dJtxIbwzWJEPmIymAOBcQvNw36j9us40HuxH87DxMW9ooFp
         337pjQtkLJCIBUjsCfSfnaIrflUnvxrO+zvLIP14j6VpM0mYNkRFk6jbGZlCif2x6WV4
         qrzk3bKDxNallRtDENEe5QE6k3RMtC2X9H9WnPlR/+iyNBpYPaxK4rpnRZ8FTv81Ys97
         6vIRumziqpDPcUcc7e/KMPLwk/XvPO8DzvpEQCwa+n7KRHEBWIKabMUjJ2d/DV764q2c
         PRCjAW/suXDM1gzhcMsGxsv7mD5fYQeNadmrMH9nkb4+pKg/PE6Cf3A81pkfPdz67vkK
         DQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNEOPS5izWVikcRm4bTXQ52QCQiNW36i/3Zouqjok3Q=;
        b=m8R5AgzC0fELR8d4bMiexSyOV4Y61N3IAB4UCPbZ/EGRmzkWnEEetVfsTtzDHMMYvn
         Z5fEFkbHO3Lj/h8K2OKTDp7qTFVW04hr6sxs4qdvGqQUIiffCwV4TNOzadZldBaFkYKU
         GmSvYZR0z1w41upwYwyorkN0ZodYs5/9glt47H6Anoe2Iw5/VVe0+5mfkJoShWiwEyxf
         jW0BA14KJt6MHP2cG5xH0DLy24Omc7YygICz5eiOGNQe78m4O26JitFbp8dkDMd3raUU
         Z3ve1JhBmxKQTSzpER1jHGvN83mF6QuXFgARwKvaJD6CkpHtY9jXnSonAo2sfgskBF0G
         moBQ==
X-Gm-Message-State: AOAM531g0VHobdvHqHw3klTU6FQt8wScRArG5ftRV8g4N4e4Hi9jjjfg
        eVr85yBhVugM0ojjdDS/ile/uh8doc9B1w==
X-Google-Smtp-Source: ABdhPJyTSmYAr3yteHYhVxa0Sbc5g8/MwW/505EpkDKmmFrjOLvZjv2ktKOEVc+l+prgFKJJB7ImHQ==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr2617471wmi.116.1601125211625;
        Sat, 26 Sep 2020 06:00:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] dt-bindings: arm-smmu: add binding for SMMUv2 on Qualcomm SDM660
Date:   Sat, 26 Sep 2020 14:59:59 +0200
Message-Id: <20200926130004.13528-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the binding for the SMMUv2 found on Qualcomm SDM660.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 503160a7b9a0..fdad89fbf130 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -26,6 +26,7 @@ properties:
       - description: Qcom SoCs implementing "arm,smmu-v2"
         items:
           - enum:
+              - qcom,sdm660-smmu-v2
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
               - qcom,sc7180-smmu-v2
-- 
2.28.0

