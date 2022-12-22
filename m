Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5A76541E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbiLVNbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbiLVNbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:31:44 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A081402B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id w20so1992617ply.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU2cJ4xdN6chDPHsl9Khfnqy+f3tWHQm/Dd+taYpQwM=;
        b=a13h9910piJ6N2dL4cWrYiMpA01qJ7gVhjne6stZmDoxxqCW/F1Kx3hgr0N33Ukg/0
         yRxYv5qfOrJ/rZHXx1gktdcSw8qCTEyHqH1s34NPyt1wI+l7G6BnTOp9r4K39lWtJYqe
         AISaekgUHDVnX1w5/a8BBI7VoTrOxNfuSc3vwbCmMfaQvD5HIbF7b/mlwUCFGlM2ldeT
         1Br3ll4E2pcUU0b//Lg+dzHlRxmPeT8CMRzd3z5L4a4u4hY1P8tOzqzed/YHofNDQ6F1
         EHC6EUehQFtOYxKIonvpwqNpAvG9hWoTk3hgXcYWPv68VqXqWrzSrfMr54aMh9sklOax
         4HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU2cJ4xdN6chDPHsl9Khfnqy+f3tWHQm/Dd+taYpQwM=;
        b=SqHsdxzG3qzpNzbl2yvkewDz/xlQjEgQ2K+xoRzu2iLaA9yc71vpbuW8KRK8sOQcAS
         XRAAhEFcWK7xY0yDlyAu6gau/kiLn9+0nQYLP5+e2KL0j+REA1o7QPzQxP66UmdvzMPP
         pD5Hxx7Ts5zXAYIcaFnRHAdYB3Natdz8StX1D738FTjgKCybHKGyhkQ0cNk1oCQhlK1F
         jPn4mFUMc0MtyhUCjcUvOE6Cgz6kSs88uTZSmbePdT1O6Fh2RF4oMOyaczgAilfgW0Tw
         WmI3qiKoID5BA2goW2u1u+MytWBGnaZcSMVGklPlKQeAriwzIZ8uCKE/FATZOuel0w/Z
         T6eQ==
X-Gm-Message-State: AFqh2koNpbmSeBPKmrTSeHju8SdSPV/+pTL2QR8JJz0sEEdiocRH7Is0
        +y1kCA0oL69dpPlYVYL+Y67c
X-Google-Smtp-Source: AMrXdXuI0wnuKIh/Wo7LU9h7ikh+A1AQ8D7iEuAsCzphFUQz7eAsNLmv9c1XePmbJkZTe/NRGGj/uA==
X-Received: by 2002:a05:6a20:1b1d:b0:ac:5429:e609 with SMTP id ch29-20020a056a201b1d00b000ac5429e609mr5977045pzb.32.1671715903121;
        Thu, 22 Dec 2022 05:31:43 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id f66-20020a623845000000b00573a9d13e9esm737467pfa.36.2022.12.22.05.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:31:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: PCI: qcom: Update maintainers
Date:   Thu, 22 Dec 2022 19:01:21 +0530
Message-Id: <20221222133123.50676-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
References: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 54f07852d279..02450fb26bb9 100644
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

