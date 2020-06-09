Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACD61F4754
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgFITmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389286AbgFITkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:40:35 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19F7C08C5C4
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:40:35 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id v79so22004593qkb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHWV6OU0cqgaqdPacomRMLT+w3Ah3p0WG4kNzV6/a0A=;
        b=R4aWwk4htZqHave/9h/EmzzlTvfpyow5xa1HrixdbeagLWiDVCahZX+fvgd72MMhKH
         mifgYvUj+jhWaMGg3Sy/QuCRU/M6RKcSTiv3XoeJ3SlLx/OpCDJihfdQDGtJHK6Ma2fv
         57K4OCfyNvmS7Mj4coeIZrZFaJpqmVEx2dQAQ48cfDir+BZHYiiGfFlO10AOnFVbaQ4l
         xacFlXm9XwJChbkrL3Ai0A69gf+8Aqb9dKIOsXRf2SdsS9hTKPcwi9G1oIrDRlCBi1AV
         k2QWPQR6Xa9viXBp+BOnMgIdZtNoxs4Gk5hOWjYWXe04l4pzi5HWgoRZ0X44+xTY6pZd
         w7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHWV6OU0cqgaqdPacomRMLT+w3Ah3p0WG4kNzV6/a0A=;
        b=O0fwXtZeZgxyB9816+lHYY0O270cf2JPEOJsqKwHXNWkVfSZAGU9huwUdDIKr5KghT
         +irzSCXup9qtC4wzig06NcGcLHxM6HQeL855HbgGs8U1fc4HEmwpzG8/wjekLnXR1XjU
         Ox/6lZJFi1D5AkoKXXI0AGBvxqVS88NnNbNWnAzLUCqhZkAKVV1OTksVIPTu0DHNFzzG
         CFYbznWqkZl2xy/8sxZa4d8bADLZATaqajoRS3Y9ra6Tjvk1W91YcNcy6O7WHiSVwm58
         jtyxcZnA3bIGwuXqtjFQtr3Wp4WeXjr4q9+xtRW0NQSY6+WGt+2GUvcX+jjZLblm3Csh
         Whwg==
X-Gm-Message-State: AOAM533nCrXBbzKXCJ84/4LRlis+ZExHnBMgfXcUpMYy2ox0NeUlqM9d
        cMYkXzx0JMlXnSS1RIOEdUBQdPIIdQSLXA==
X-Google-Smtp-Source: ABdhPJylYwtTWOmAgXhVLnUMhpb1BZNqKTLwO9QHJOFRb6EbibLEywFO6AcZedPsGIptantkT+8xEA==
X-Received: by 2002:a05:620a:49c:: with SMTP id 28mr30284895qkr.168.1591731634848;
        Tue, 09 Jun 2020 12:40:34 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v8sm10513181qto.21.2020.06.09.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:40:34 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/8] dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
Date:   Tue,  9 Jun 2020 15:40:19 -0400
Message-Id: <20200609194030.17756-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible strings for sm8150 and sm8250 iommus to documentation.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..3ac741236c8b 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,8 @@ properties:
           - enum:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
           - const: arm,mmu-500
       - items:
           - const: arm,mmu-500
-- 
2.26.1

