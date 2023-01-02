Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4216465B02A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 11:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjABK7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 05:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjABK7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 05:59:00 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEBAF27
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 02:58:59 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id z7so12759695pfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 02:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+NfyMbTjd80e1uWjdhdQS0ED524lbDIb/XPCdOdzno=;
        b=eWuc491Ck7BlEf4iPGRjz+zCMTpY5mpcycfqiisKOa/K+clU5RnvnGHQPKH+SgGAmD
         AG54mHT/VcMTMuJ/l1iTzsyzwS4/fGqDUUvFOba6gzsqtKCw8fFTrWvswD8LkAo6uLs+
         2Ycw0ErO2uRbCSgxHSDy4kAmc8/1Wj+1hppDvEu4kKLbYZEbP2wBQ6b6IVpS8O4spKYN
         KpCMzXLw0C42j42UMVAqpem72TpWfNjMwR5wWWqV0rjHTKFykEIoJYuZ5EffjWbwWxK1
         RyebhLz2gjjk+VT/sxyDoViV3/CN3FIZ4wTsgJXbgUXshL5W1mz7VdbZH938RfzvgR5E
         jfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+NfyMbTjd80e1uWjdhdQS0ED524lbDIb/XPCdOdzno=;
        b=PeKdIWOOPLpETxNDSDR39fYx5xCTBa0qe1lJ2yxpVd2BwlPhpDMnlxyDBwdqLb3izW
         qYjgfTU80r2Pr/2dQ2UtooNdxqJvJBYWBFUBJLhMEkdqD0VkKAt/tCl+Fv8jwQYwMQ0a
         HbM8fPOZ/whLdNgHs4tA2VhKUXUIg0DpF0fjiyk3fYkWecVW7dibnrvnlOxOx8qOm1cO
         gMH/guiVkFJwrk8/36QA6qtvupObG7HsP1UsKPrkWo0bXZvGfSKoPp5dbinF3tCbm1Zt
         dZQe5dgaArGkJeQCMivq6zJpvPR6MMLfNraYX/AEt630DCKcNCrPfRi5lk40FRPllfEW
         68RA==
X-Gm-Message-State: AFqh2kpJF1hms0gQTTkBhoQVb6R75ZW2Dj0ChXywSq7ogbvVB/1P1lWo
        sxR3lVKBCnVT+t74Z8OBgu4yeyz1KtlCG3o=
X-Google-Smtp-Source: AMrXdXuqDF/h7bvtBhJ6ygeONjyE2Lby/G5L2R2ioAA3C+xgjKKHJE7m+vAg7P+k+YYu8LqolYJVOg==
X-Received: by 2002:a62:148f:0:b0:582:46a4:87f6 with SMTP id 137-20020a62148f000000b0058246a487f6mr6019088pfu.22.1672657138930;
        Mon, 02 Jan 2023 02:58:58 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.187])
        by smtp.gmail.com with ESMTPSA id k26-20020aa79d1a000000b0058130f1eca1sm12756773pfp.182.2023.01.02.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:58:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: PCI: qcom: Update maintainers
Date:   Mon,  2 Jan 2023 16:28:19 +0530
Message-Id: <20230102105821.28243-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230102105821.28243-1-manivannan.sadhasivam@linaro.org>
References: <20230102105821.28243-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stanimir has left mm-sol and already expressed his wish to not continue
maintaining the PCIe RC driver. So his entry can be removed.

Adding myself as the co-maintainer since I took over the PCIe RC driver
maintainership from Stanimir.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index a5859bb3dc28..a3639920fcbb 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -8,7 +8,7 @@ title: Qualcomm PCI express root complex
 
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
-  - Stanimir Varbanov <svarbanov@mm-sol.com>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
 description: |
   Qualcomm PCIe root complex controller is based on the Synopsys DesignWare
-- 
2.25.1

