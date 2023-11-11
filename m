Return-Path: <linux-arm-msm+bounces-496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A97E8B27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 15:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F2E1C20370
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B2214F79;
	Sat, 11 Nov 2023 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QStNDfEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917C14F83
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 14:20:11 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA1C3AA8
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 06:20:10 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9df8d0c2505so608252566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699712408; x=1700317208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA5Nkvzxmv6waoHDPDTREWJStX6OwLvfiQxW2MCYDcw=;
        b=QStNDfEzI2aT5TOWfQd+PxYiQeDmqDSzC8tzgDP4dhlum50RJBRxNX0gi6+rAusx/P
         whIsngMlw/ckA9MFhZCQoGmVpek8hHfdwB4cpxP01vGRcHCo1nuPIojZp4eqJhuf6OIH
         gaTARXo9INXhi+oE/RoZIxRWr47aQpkyGki2rjhE0o3h2PYWaodaqUMgLuTHm2hdF1Z6
         IimMWD8YCWUmyBtuwM8gIX8CIy0bH/fYwl/S977bnoykXkRBaCq1ZimWaFnb4V5ex4eh
         lepytkBqx1dqkooaKUeZpRg8ARL7ojGKyjCIrMZxn1SuSCNTSNmcVqOhb96X2zXq5u9+
         I4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699712408; x=1700317208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA5Nkvzxmv6waoHDPDTREWJStX6OwLvfiQxW2MCYDcw=;
        b=GEOsnABLSaKOGpOt0E+1pkyjp6p55gM8BeFZG3nfkiAePjYY1iMAT1f2t5grTdQpKF
         x5/LSrdB2sYqizaC8UaZ4udR2qROgOgtVsmgay8uEAyrqY4r8aGMpBsQMcBAEBkQKlUn
         DRemdF8AWw7HAc+yJriX0b3HTGACJpqWT58yE+btt6dzcx23H+PbC1LXRjz4BL0EtSWi
         WHT4SNKq9Gm3EXWZfn60JMWBdrnRYgb4xdRxwz2ls9LnWgERt6W+gWHcx1Ryi3O/S2aD
         Wbof+Pb+HWCI+5SDui9aIu83WGHSWg2P3hy9R41afa/+iJ1CGjaoAZ+BhshgFrwjFCup
         1F7A==
X-Gm-Message-State: AOJu0YyeUaaqTRKAheVxWmlr7OkFhINDYQtmT8qri1G0D34d/PM98p9A
	3Arnwz79AvMJ/gzErxsnohswlQ==
X-Google-Smtp-Source: AGHT+IGtbeP7+4JYvN4uMG6ZHD2gLZqCG1nqHU+QMwNuFtqK/5Swfy4XnFEUyGdXouPKYfwHzmaGfA==
X-Received: by 2002:a17:906:c1d6:b0:9ba:b5:cba6 with SMTP id bw22-20020a170906c1d600b009ba00b5cba6mr1805887ejb.14.1699712408679;
        Sat, 11 Nov 2023 06:20:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dc3-20020a170906c7c300b009b947f81c4asm1123864ejb.155.2023.11.11.06.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 06:20:08 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: PCI: qcom: Correct reset-names property
Date: Sat, 11 Nov 2023 15:20:06 +0100
Message-Id: <20231111142006.51883-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no "resets-names" property, but "reset-names".

Fixes: 075a9d55932e ("dt-bindings: PCI: qcom: Convert to YAML")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index eadba38171e1..8bfae8eb79a3 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -88,7 +88,7 @@ properties:
     minItems: 1
     maxItems: 12
 
-  resets-names:
+  reset-names:
     minItems: 1
     maxItems: 12
 
-- 
2.34.1


