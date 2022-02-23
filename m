Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF164C1C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244391AbiBWTao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbiBWTak (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:30:40 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83904830B
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:11 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 195so21072688pgc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJgvldvrl+SGje7vrvMudPyYsFoVLhwI/Ka2l1gBY/s=;
        b=nTOsXOYFNaeVYWW9de9YzaPs+KiyjGUOfNXdvHadquxYeYwIpEJdNzVHUd+8yDk0NR
         8b5ejz5XpC6YiQ3cEhC2ebi1ty7yAJ7CR8sk5aZvWMl/JC1RiKl5ythybqNLqSh3mgup
         f45OiV1fDI2T3F2J01nU7IojZXo+pCZF3kEw2UsBNbEb6N7tt8qrn9l3UiukT7mJm2/k
         gjhzslST8gBJanCE6rXTdIYbyXkB2dAL/pTA+mosSfAAQxi0u10Il6C2QVUVtgFjpOsX
         Fku5Qe+nb7SRVvMjmxLWVFVmWkGEQ6Z3LmSjZmyj929AX3RAfh+rKslxgHYu9JdlWWSk
         +fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJgvldvrl+SGje7vrvMudPyYsFoVLhwI/Ka2l1gBY/s=;
        b=0qVJ8Kkblk18KjmlLPm3l3MlnkjwKFesvt50CrwPYtOPte8DCSLtpogCHNBlbasuZ3
         2JS+lYs/E81/SlBk0WscAv8oR/Em0V2S+9vbo3yUYVd2BYAYNYJK1EaiJDGM9gfb8yV0
         ERPB7Xwv9jQG4kdlg5KMOjlfCadFVgj6Ug6QlnCi7lTDN9/CrkUm5u7Tg2L0azJ+Cj/f
         G+NKuGlqN1zWV2Bsm9LHENKvz/J1lrViUVCKMegUU8Rt0ViNDYZrA2HHyVkDGnac6d/c
         p5GpDvIYYhGg2lMkdXJj2PJ0NhEcCoo53GJUqmXjV/YBaFVZcNi4J4AQo7f0WfVrepXL
         MFww==
X-Gm-Message-State: AOAM530ER6iVxmN6NFbH5fUs8FQx8IJOA0HX/AXkEySDEBMGeiPsqo/x
        VZYPCCl0KvVOSQig4vxVevspBrlLzo5C3g==
X-Google-Smtp-Source: ABdhPJy8v3lO9IlpWN9arBrpt9H5a+nAzLOyyHuBDoQ7cWercOLLTunpCdmZbfiUQ5Ym7b1qfpvlJQ==
X-Received: by 2002:a05:6a00:279e:b0:4ca:91aa:32ce with SMTP id bd30-20020a056a00279e00b004ca91aa32cemr1186844pfb.36.1645644611121;
        Wed, 23 Feb 2022 11:30:11 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:180f:6b3c:fda0:57e9:7d44:2aa7])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b001b8d20074c8sm3719917pjn.33.2022.02.23.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:30:10 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/6] dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
Date:   Thu, 24 Feb 2022 00:59:41 +0530
Message-Id: <20220223192946.473172-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
References: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the PCIe DT bindings for SM8150 SoC. The PCIe IP is similar to
the one used on SM8250.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index a0ae024c2d0c..a023f97daf84 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -14,6 +14,7 @@
 			- "qcom,pcie-qcs404" for qcs404
 			- "qcom,pcie-sc8180x" for sc8180x
 			- "qcom,pcie-sdm845" for sdm845
+			- "qcom,pcie-sm8150" for sm8150
 			- "qcom,pcie-sm8250" for sm8250
 			- "qcom,pcie-ipq6018" for ipq6018
 
@@ -157,7 +158,7 @@
 			- "pipe"	PIPE clock
 
 - clock-names:
-	Usage: required for sc8180x and sm8250
+	Usage: required for sc8180x, sm8150 and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "aux"		Auxiliary clock
@@ -246,7 +247,7 @@
 			- "ahb"			AHB reset
 
 - reset-names:
-	Usage: required for sc8180x, sdm845 and sm8250
+	Usage: required for sc8180x, sdm845, sm8150 and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "pci"			PCIe core reset
-- 
2.35.1

