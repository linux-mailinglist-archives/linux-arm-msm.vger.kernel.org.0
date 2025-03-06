Return-Path: <linux-arm-msm+bounces-50494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A553A54A41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785EC3AC89F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B084208973;
	Thu,  6 Mar 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKVVCaRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9F20AF96
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262648; cv=none; b=XmO4V1vN/40Uwn4FzMtSjCyBBjYFltRJpe75IOYWinVVsYWjiRrg6kc1JIMpvxKsUVDbhIWLKfLvR9xsmqaZUDDWrHI0LgG/sL6HrpYe3Sldvv0iE5E4yxGiGI3dMQVqPDHxdEnVUO7PK6iwG/5wlYjz4GFS3X8UP2JkjDmRmqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262648; c=relaxed/simple;
	bh=H+blN+AY6Sf32G1iImcjX++bgpIWJZ6HRPzxVBJtNh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfTEb/J13R7yT6XkKTPVlrGM7Ekw2uJW6EhxzeNtqLfVQ3nZ2cyO3W2pxz7eJ0a1YeXpocg592F0IbNfuTTGgOMaylFd8PNsZTen19ohwk4k6GtzKcGWr0sfaAQ5FuU+5j+WqLBG31Ksd1jTY5V8FAqJQbcfm/uSTmkQRvvBr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKVVCaRE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43938828d02so825455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741262644; x=1741867444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iW/7ufkwxaVfB6Z8KpV6A4TIvWsG8TiS8t8AIg7CwAk=;
        b=FKVVCaREBxQrjie7viqDy4VN2kKbatBkNhNP20StC1+nRkApaUm9hgiAekY5y4bHYF
         AV/rbs947G/AAEE28LmP+h/0S0wf5A7tsKwWMM7IQOrk1Gkk8PUStvSDVL3MaX/D7cCl
         xZ8aqZPWUNnlbccoA5pW8yK2SNzvh5S8AgO16vA0sqh+gdJYZ49YAoi43+/I0XQoFrQ+
         vbZ4WYV7rlxAyTxGGtZRpEluVQqfpmif0bQVxeqY4yFI3/xh3wfbTiMeEpvS9V3N6yOk
         hXFM5KOT2Xk9Vv1e7V1HwH46/rlsfi0EsL5i/HY4NdfFrm6CL/rhNIVDmQM/94SRPeg9
         Bpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741262644; x=1741867444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW/7ufkwxaVfB6Z8KpV6A4TIvWsG8TiS8t8AIg7CwAk=;
        b=VMFrTKMTZV7dbWx8cg2azQlGqSIUQckuKFYMaiTVkSrNpvJ5cN+oqNegf8tJB3onQR
         bfig5DRF32nMwnqEJRhcZx8gyAl395EFcPHZUjtN+VS1KR9zaAKtNATdCSaYGosM2+Ff
         yEict3ZX3ZbHBtVliSYQqzHwqVbjwjGJJdS8enC5VyLJOyZBZDqtQW5dSYCA7p5IVO1N
         U9Uo5MfkqRYRk8ooVHNTnHREHGPi7SpDBiM1X902sqpqnqQJUaCiUIqKpepxaS99DRoM
         /5IhjtX+HTOEiCxv7OIo9czC/mz6EkagaaLvuF6hyanQJvTrid41gXpE1GwwtoAIlH9r
         I2/g==
X-Forwarded-Encrypted: i=1; AJvYcCVfE/X9Y0Uu5EZxYm9prQVtrULkdyPKV1bT/+xj+MNbEWBxrJ4QQbEqJ6VfjaheFV5FBcEUbDqHE45JCCMe@vger.kernel.org
X-Gm-Message-State: AOJu0YytaSAT0hZVpqSxpStlot+YjdAIFzgxuWAa03qrPkgrIrkb98Ix
	XfUz2eYPCPRxphxj3teISspFjnMwfFcxhXbbDYG8pSKI3DUNV9RT9KfyopS9lZg=
X-Gm-Gg: ASbGncsCp9bjZFjw2D5BS50iuVKaPdRHXuRZD7QKmW9k+o390XLqOekI50amxMo9F+e
	ut/hV1jIbQM8n5yaX3RMNlEPc/Abq2MWJd4KJW7AcVgpVhMkzpG3mvduyu4FqelVAAljoDeTXXC
	Y7X8jF0F4lz5KHAACZuMXD05gYPNJD0OMgfc30S04ivJubc3KfP0iAdM68f9dpcDIZpmyo2g4p9
	Vl14MiAWet/brw/RbNc+wi3RYdOk8dO0br8Z+0k5pQYLB6jCxoMKE1TaN8ov32GHVWQgpWnuJhF
	HjN5Iio61cX8EQzC2rmTNuJpzr1QXQZXkH0jPvVrHu4/gKqN+rgP1Sc4xFA=
X-Google-Smtp-Source: AGHT+IFtFIdlbkW37gMswhBT+eNceXtw518TWjmHeaXf4l5MtvNMofEYAjbb/s/QFM3RznHJQwe32w==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr2273730f8f.8.1741262644435;
        Thu, 06 Mar 2025 04:04:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8c3173sm18587315e9.11.2025.03.06.04.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 04:04:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH v2] dt-bindings: PCI: Revert "dt-bindings: PCI: qcom: Use SDX55 'reg' definition for IPQ9574"
Date: Thu,  6 Mar 2025 13:03:59 +0100
Message-ID: <20250306120359.200369-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. Drop double "::" in subject.
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


