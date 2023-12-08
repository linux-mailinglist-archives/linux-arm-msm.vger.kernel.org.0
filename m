Return-Path: <linux-arm-msm+bounces-3915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD380A17A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A37C1F21348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2E913FFB;
	Fri,  8 Dec 2023 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NbuRrBrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79CC1723
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 02:52:03 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54f4f7e88feso646114a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702032722; x=1702637522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11veHRxQhePRmTa5CrJ3aUmZgsLlL/GI3AnVt9qonDk=;
        b=NbuRrBrTa3g7wYBGRmnyliJ0l2qBse6XpnP/d4+rlSS3MzgMC85XNu9b+wCu6TWgXT
         imtUQObgZw9O8jkWCioJ0DJf6tn9lRZ1i3XpcmnehOtl+nqmIzAJ8QHH8n/OGDZ6T32i
         z5qHrxaq5ddfRyzJJiC3EcIl/acbrL1dLjhZiX9G98xXh2ywznkmj2cDxJMOvOi+5yPR
         UYuNS9mYoX0MFALjnKiVL3KedAUzGmaItX4/0M7iKXLaEmdQTY4eqBma07Zgp/OkO8wO
         OW0rx5sIyzOAP02MSo0uJJlC7AYEWu+HGYC7Mf2G7OONEtFN9BYoKyH2RGRgCDuFElUO
         ZDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702032722; x=1702637522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11veHRxQhePRmTa5CrJ3aUmZgsLlL/GI3AnVt9qonDk=;
        b=G8fIwFBqKWAvjkDHJMz5bBhP2GC+lc5RpUtgM7iSSNaBj51B7QA/uRBsPIV+KVzMIw
         NfcSaXtFldO0w7EWdwnoB2bB2huaxn2S8H7tLg8Azd4JIPceYWGhhqgpv3RAnsH9Ary7
         Vv0NtuxUMzu2d8KE3Of9bRCAGLYvNNrmOCEG0AksYKozcFcWPINq1fkeXIjCJj/5MtSl
         LwxzY40tQXXCDmr8fUOZtUoUDIMjtwRz+a9zURABVuM4DyZvc7ovSs0xMWHT2y96te0h
         Etq4D18PQTxvRfavASm6dgR+VliujHMKxxA+RH2Q9eKnh7al3B/CaCmASvEb8UbrI8f4
         1qFg==
X-Gm-Message-State: AOJu0YxKpfxkBahxgFQ7G95pJkfF8ZrdaccZE8HMS+MjrDhHcdOwTv70
	/hP2WKSP7pllYSsVLAbR57lqeA==
X-Google-Smtp-Source: AGHT+IFy/oY2zqBZqwRcRdiTxU/NBEEy892xMZAtSwzJby17iOVNew42umLhhA8HnKertNw0LYCfyw==
X-Received: by 2002:a17:907:9518:b0:a1c:cd3b:4c2a with SMTP id ew24-20020a170907951800b00a1ccd3b4c2amr2129103ejc.72.1702032722112;
        Fri, 08 Dec 2023 02:52:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tx17-20020a1709078e9100b00a1b75e0e061sm849976ejc.130.2023.12.08.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:52:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: PCI: qcom: adjust iommu-map for different SoC
Date: Fri,  8 Dec 2023 11:51:52 +0100
Message-Id: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on SDX55 has five entries in its iommu-map, MSM8998
has one and SDM845 has sixteen, so allow wider number of items to fix
dtbs_check warnings like:

  qcom-sdx55-mtp.dtb: pcie@1c00000: iommu-map: [[0, 21, 512, 1], [256, 21, 513, 1],
    [512, 21, 514, 1], [768, 21, 515, 1], [1024, 21, 516, 1]] is too long

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via PCI tree.

Changes in v3:
1. None

Changes in v2:
1. Add Acs/Rb.
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 9dbc07dfd48f..5056da499f04 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -66,7 +66,8 @@ properties:
     maxItems: 8
 
   iommu-map:
-    maxItems: 2
+    minItems: 1
+    maxItems: 16
 
   # Common definitions for clocks, clock-names and reset.
   # Platform constraints are described later.
-- 
2.34.1


