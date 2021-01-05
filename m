Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AEA2EAAC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbhAEM2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730193AbhAEM2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:25 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA49C0617A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:14 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id m5so1598237pjv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVgPs4UTz0m97kkGkS/Y+gkUiFLrmZrneiZz02HakNw=;
        b=OQaxZLZrGACL8Q54aGsrKM3UtdQOc3d9oBz5rGsFK5MYTq3dzA2t1r6lgPaRte30RK
         7Zho0nQ0IwZWdj97ucxShx8X4W/CO36KVqPKs15ohWVWBugVWtZE0W83Zs5nQkBF6Z2b
         odoEi2OR3OBDiv2o6fmfwBcxjSOoYdyQhx35nfLv879JlufiBWEsePYyjP93elxNNhGQ
         eG2gVQm+fLEEoM5YMdXo/2s7wfbTIxuXnkRH+wvQOlWdiEXUjh13nlhhL5iwIG6h8drx
         WT5kq3QTGe/gJ1EDTCPbnDfwHSWmTLKagPbS6JIWN6XW87SjYzES9URdK2CQ3f/W6X1e
         uyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVgPs4UTz0m97kkGkS/Y+gkUiFLrmZrneiZz02HakNw=;
        b=qDXOZLCpuGoQkmoRfpb/F+1C6ILG/7e8D6tXGoNi8UGh7p6MmdIwcItjiX1hZxIWOe
         ky2WuzvJn8Cu8XAEtE0AC57ev4kExg/nMN58e7PlrDMyzDKbJS4iL6zUffQzisXnvGWX
         i6xKj40V923YQWnrvxyzLgaCGfVzxLYlipKillT5udxpBNV4q2JCHiZDth53VA3M06K9
         AXcwTj3TUBk0d2WLJRZChFfdxjZBGrspb3ggDzv1DVjswiAjlEcAuhMgLIOzgPXCrHQU
         N062DySXxIhmGzHToXQS/pXGWdcUG2wt2w/TAY6hQvxf8gOuwgNXnoFjlq82AD0aDT74
         8kaQ==
X-Gm-Message-State: AOAM5332SJDi9ZaQ+T9bUOlvF8uly7eUcvv5hI26zK5Udisn5YXvj36X
        vEmCccl6jOFkWfnxC+IILQAW
X-Google-Smtp-Source: ABdhPJyxoMT1SpuSm2yhcMnDEwBBVoOFnTvmNvyODOP877OQwAFbVMVdWDJaKdU8QGhDSPTNjhArMg==
X-Received: by 2002:a17:90b:228b:: with SMTP id kx11mr3968531pjb.122.1609849633859;
        Tue, 05 Jan 2021 04:27:13 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 05/18] dt-bindings: arm-smmu: Add binding for Qcom SDX55 SMMU
Date:   Tue,  5 Jan 2021 17:56:36 +0530
Message-Id: <20210105122649.13581-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
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

