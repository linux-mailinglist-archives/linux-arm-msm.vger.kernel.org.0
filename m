Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0B42EA7E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbhAEJsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbhAEJsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:12 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A0DC0617A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:01 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id a188so5400323pfa.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVgPs4UTz0m97kkGkS/Y+gkUiFLrmZrneiZz02HakNw=;
        b=DutPUSfG8OBa3zh4wMs3OtN5nFmdZp84ZWZtn2s/43mh03TekL7sIELi32Gfh/an4U
         a71ePpilxScpeFmCia8JYpyliB0SUhXY/pJ5shyv29d6L8cMUxyHL5mbSzboLSSbN92B
         srP/QXTLujFiSv06DhW9jFqoisN8ICnmfp1+J7vIQvj5Npl6tpIK+A9veQiNOzwy+JTl
         xX0AdcDN8e6RH26rkXjNsBGx3lIoQbmxpwuLK8yRsmV5fY4/5xstnmNSwRKJ4l6YX2i8
         a63r2Sec4pgNAFAJXs7z+vaj2KkmIe1cFOsewJ8SniwaBOrqR5oo++8cOhEUrqrzPFsF
         AYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVgPs4UTz0m97kkGkS/Y+gkUiFLrmZrneiZz02HakNw=;
        b=gVc65HT5zw6BW7pL478OMHtogakswCQVbsSqFacdzwdK/bOpTWu3tXqqMr7Ia7fOx/
         ja5UB/xoHfe56S19gO+6E4/vDhbECKeXSDD+PBQ2M1NNPggDCVv6MeeA5nS884ULpL4Q
         fePd0/wEbKP1vzJs6i1qPfIsKdO6s0HB/Wj9wN92sZfHGmrncCs8Bfa3bPwgSO2g6ia+
         WSA8VdFIJ2Rb3WL9okMUdAaohdIiXyR9hVtDCM2Oqkij3cwsOZ2wXol8Tmhz+O46fcsq
         eCgdD3n53zl6N05Zc5c97BZQ9RbdFR4ZjnjTP3Dl0lRu6CzOoR1FYhe4TG0BXCnZpdCc
         ja4A==
X-Gm-Message-State: AOAM530ukfRmDsXkUHxLNP9dmu4OP9oXXSJT0qD0sc5LzZZEM3sGxlf5
        iLu+wlQZj23cUyzEayHxS3Om
X-Google-Smtp-Source: ABdhPJyTRo1OjTtA/7Ns0m0WHPZzpudFVa+4Q6SGnm8+dLFZcqWH083kUE4VHfUJqmxJUIdbZwSDOA==
X-Received: by 2002:a63:3086:: with SMTP id w128mr39020040pgw.227.1609840021316;
        Tue, 05 Jan 2021 01:47:01 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:00 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 05/18] dt-bindings: arm-smmu: Add binding for Qcom SDX55 SMMU
Date:   Tue,  5 Jan 2021 15:16:23 +0530
Message-Id: <20210105094636.10301-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for Qualcomm SDX55 SMMU.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3b63f2ae24db..cc48d90de5fe 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sdm845-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
+              - qcom,sdx55-smmu-500
           - const: arm,mmu-500
       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
         items:
-- 
2.25.1

