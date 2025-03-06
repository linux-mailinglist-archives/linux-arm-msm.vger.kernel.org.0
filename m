Return-Path: <linux-arm-msm+bounces-50493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C1A54A39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E00E83AC53B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF43205AAF;
	Thu,  6 Mar 2025 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZe83yYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F27201018
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262605; cv=none; b=BmuphsEKUWOABcg9q28I+bRf4CH1WOC/CYYjPG7L1Z1IO2z4+ulxYb6t9yJKD5rn1O2Hl0aszEpOLEcQvXEcj8dJ7BpQfMrjVDnkXZ1ydtSnY4kqIMYsvSfJXT6+USl3/s2QZt+pPQFQk8RtDgb6LNczlcs6B+oRy1LSl1UclQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262605; c=relaxed/simple;
	bh=gGxnmraNZe8Q/xOLQH6kZuR8AkdvqJ9awxgGCS31jpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdvcGErzQL3c5GemoOoaPTQoMxY47V3PBVk19TTRzqrD+GF/1rGfpAJsRP2Vm8RhSRSGMMh+02BE/abEjOApOIle69aDi6pEck8nHq7Ugxs4lsjIZdZqJYWf86sZ2H45pSJ4uUNi7OuUQdZ6zN3QBWu9VXhZ6R5Sk0BHSFg2asM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZe83yYN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e9e44807so79497f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 04:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741262602; x=1741867402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGk2GIgwQpiYu5Yel4uNS+HbqVhI6i7/CI1/SuQv8FE=;
        b=RZe83yYN8/PlXWjqejKOzfvoewsqHIvyVOhCUFf5RrDILogNLW6jP0YTAAND7sZWUX
         8BDyBCg3R/Y8hkvnGoZik/+7+SM/bG2rjonuNOovMlOj7kPRl4C5ThIRifJmetWPGm8Q
         C3QUvOSI5CYPzk8KNjHpcLFaDSYTjr6RTiNyKdQ+Mu+KSsC0Q0FSPaAeJ91iSLwKbQ0L
         lZBI42YuQZ7yvAdPqEXCblgbv31Ze0ktrEjRY5zLMW9jysBYZkzPu1QaA0wUGBwfKN9R
         qlK4iee1r85zFD90RKjfSG2YPFg4QPaiZDfUdjljiRbfyt1gWw2hXU3KquMbWG1JDkQN
         rJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741262602; x=1741867402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGk2GIgwQpiYu5Yel4uNS+HbqVhI6i7/CI1/SuQv8FE=;
        b=ZJza8mYqfyqvADwYhCYcv4nNUrXE9QDYyb05JYkLviKgrUbewcvqbM0IHQV1tuWj0F
         Jm3OD0+ukL/lV4hfU1YKAmngJv5KNPgjAOZpXVBHcvOSzXWe4vY/9F/EiAQ2E4s4H6at
         /pudcdw1OB5p5lJLhXAEwDF7dHlYfXW2xDDgckop1wydkpXkKsd4Ccl7BryUzFKbIY6e
         7pSZ07kPFRhVCgTQ4HjLTqW1m2O7vUowlIFX30l5ZuTyPOlPXEm/BmhC1WeHjQexMoUx
         X1FbvuWDWM0gcKoiScIU8j/+RiqqXmEEoMkGMWip0lFgT75EwC/Dz6oPp87O8N1dFIYY
         7ifQ==
X-Forwarded-Encrypted: i=1; AJvYcCV28Iwevry2dUUL8u+Bl2u9fRhFByG4L5OLwlpoBE/0bClScMnHedubyhIU4+/a/LpDreoKuj5VDYLZVHga@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfz2gXX5VjagqdHMm64eOiWdq8xUXhZypKZftsfprquOL5fnU
	qnCYrucXDPXOYCQjCX2Bcy1CG5wKJBxxUg+Tgl3TFyY6yqLdXArZfPYwZqm4raE=
X-Gm-Gg: ASbGncv9D3QAyU6MoNdyT39YLUIr7qb2Q1UkOYs+DgyE/X/uBuzdIXzKzf7B/TbGhkD
	H7fIiugnfY6XRPddq/gfumpH7HdQMkvsAGWWFFm3l3YVMIcjaDEaiV/tBqn5YEkiT3HGTPtwIP1
	quoy5XetNsPsNxu0TMCqfMSrKcsMH1q0Tlvy3YtmLOB2N3YhJF8EFpaoBI/bybkgtqmaLDAF2s/
	ZtrmhtOzbcj4jYwx5XUgf0D5I8AeAmm8+KuSDa8uXS1IMfjDxuOo7lU9Jmb5Wkp10fnuOkgKd2H
	SjejIhVR5d3D1TW5A/rRjQhLKKhy8VHJOT+ccrjR/BBbnU71siZ/sqw7C2s=
X-Google-Smtp-Source: AGHT+IHWVCk6Fgh5QuVOuSqxO+Qal21JaZ2TqyoYfqoerG0z/hBOKoduA4Dwpb7zBfJiHhjp0wyWRw==
X-Received: by 2002:a5d:6486:0:b0:38d:d69e:1316 with SMTP id ffacd0b85a97d-3911f72725bmr2118733f8f.1.1741262602316;
        Thu, 06 Mar 2025 04:03:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2eafsm1886661f8f.68.2025.03.06.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 04:03:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: PCI:: Revert "dt-bindings: PCI: qcom: Use SDX55 'reg' definition for IPQ9574"
Date: Thu,  6 Mar 2025 13:03:18 +0100
Message-ID: <20250306120318.200177-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 829aa3693f8d ("dt-bindings: PCI: qcom: Use SDX55 'reg'
definition for IPQ9574") because it affected existing DTS (already
released), without any valid reason and without explanation.

Reverted commit 829aa3693f8d ("dt-bindings: PCI: qcom: Use SDX55 'reg'
definition for IPQ9574") also introduces new warnings:

  ipq9574-rdp449.dtb: pcie@10000000: reg-names:0: 'parf' was expected

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 829aa3693f8d ("dt-bindings: PCI: qcom: Use SDX55 'reg' definition for IPQ9574")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 6696a36009da..8f628939209e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -170,6 +170,7 @@ allOf:
             enum:
               - qcom,pcie-ipq6018
               - qcom,pcie-ipq8074-gen3
+              - qcom,pcie-ipq9574
     then:
       properties:
         reg:
@@ -210,7 +211,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-ipq9574
               - qcom,pcie-sdx55
     then:
       properties:
-- 
2.43.0


