Return-Path: <linux-arm-msm+bounces-34798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258B9A2BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 275102860C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F3E1DFE2F;
	Thu, 17 Oct 2024 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTlbmQ/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4D1DEFF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188299; cv=none; b=hBvKGaoO5+I9ULTg3l2YWwjKeBrdZSCh5xoLqPX+Px8gYsCQ4CfZL3OLBuG1HXPJ+FBygslr0sDvWG/yKClC3zBXPXuFAzdaue4G20l9ErT8Xm2mwZBUYQNf7ia2MJ5ePIppMPSqZ01UDYDNZNWfW03h4hQERncKvLuw4Y7EeTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188299; c=relaxed/simple;
	bh=O15mCh3VtZU97Mpx6hgeP/jWXAjP95Snr2eA5fDon0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KE+jldzrLZjxhhg6mhdtVKL7sSrdW1Wv1zhrZdEmkAYKDa7sZVLtYaAr9nGe41UVAedRl6Zd4yTiWZ6yPjob/iCZuRnDGxmm5McBaf2UEoQuvl+sqAMwCT4kkA/6lEKWVg40rNgAz2X2M8QT0vFuZsAVaREqVW49Pl6uQDRGKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTlbmQ/d; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2133114e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729188291; x=1729793091; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XaymF0ZiBA6V8Fk87JggRvX+rVkin1b9pjhriuc27Y0=;
        b=pTlbmQ/d+gL46Dwelxm0zknNBSNnSbZF/+KyiowAFCFexcvkIWcaETHN+CblHQc9UI
         EjGxPao+pKLiK+4/q79m5ZDroquXFPHMPgdnc6+YZBKKJ/+sGZtFE9KGsDzcY0ydw5t0
         gV3kwhHIuUt9oqn+bmqcfXDYebQUQYzm7dd4/THk1jT/mOkcd9Lkpf6ohi2l67zUhycm
         Ui8qVIbERCeddqFiIq4w3gt7mr420t8YET8tIlnybfFmkyP+ryKO4RmOkFe1cEBz/6G+
         9Gb84ZtVCl2a8uOUPlV/sEUNRIWCLpUbtoHunUSOUBR1kr9Vcv+mEYvgFib9RP4YcJYg
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729188291; x=1729793091;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaymF0ZiBA6V8Fk87JggRvX+rVkin1b9pjhriuc27Y0=;
        b=dA+Iwim8o2L4JdsJ0n97ne4yA1PpeHaAO+VHiluF/LgKANRRRsjfv4qWfd0WmojAha
         BOATJL3lDU8n9T9fd8J41djAxZBqi3JJdJcneyZAtSNEPgI2wpWQqmNds0c885s1iUzH
         zUQMzihmav8joI7gCs9q9qhwN93BkaV3RKRoIaUiQj/FRSbQA6UaeSz3kOwctUC1tnu3
         NJ8sQKKWCwm4c3Kw0sXYXdvRlZ5GxPwTehgDBMGF1W9cue7etT4X13vOKeU4QN8ifxrb
         HFvu6VkTwNtMx1jrndcBoEd/MJCc1UKrkbgfxofqgP6Q1r2t0ZgyLhxsexrUL6SKpEyK
         GkJg==
X-Gm-Message-State: AOJu0Yyea0Xy7yYmO4xnSyGpPKw6kGV3A/RSsm56fqhwI0SWOJgByzQU
	ZLGuiI3VNK/TjHkipp//oRRsgzbb1Hn+pbWT7NUCAiAllB4mMp3ItSy8K0oyRbg=
X-Google-Smtp-Source: AGHT+IEtaSRfi/zuQd0/3BxDiMd84LqpMen+1AmFAWxym0m/1Njhxs+M7M01GS96rbcHuSvVwJ/8mg==
X-Received: by 2002:a05:6512:2244:b0:539:ad93:f887 with SMTP id 2adb3069b0e04-539e5522d3cmr15495948e87.36.1729188291239;
        Thu, 17 Oct 2024 11:04:51 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3ddfsm826195e87.149.2024.10.17.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:04:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:04:47 +0300
Subject: [PATCH] dt-bindings: PCI: qcom,pcie-sm8550: add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-pci-v1-1-5b95e63d9624@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL5REWcC/x3MQQqAIBBA0avIrBN0CoyuEi1snGo2JgoRiHdPW
 r7F/xUKZ+ECi6qQ+ZEid+ywgwK6fDxZS+gGNDhZY50uPqMdTdKJRAcyhLiznx1DT1LmQ95/t26
 tfUdn/YZeAAAA
X-Change-ID: 20241017-sar2130p-pci-dc0c22bea87e
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=O15mCh3VtZU97Mpx6hgeP/jWXAjP95Snr2eA5fDon0o=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVG/8G68/lf7OSluZpPo++4hB+Ws2ABn0W8AS
 w2HBjUHOKSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFRvwAKCRAU23LtvoBl
 uDRFEACjiiUvc4JlyT2BHMwSCQBB6n2qjwJjB4kkuTTtHGHF+okKp8yzFPhmFz9ciLyRfK9PxG0
 kmHEh18U6z4glv7vUbjSaT4wR8gphPEyKAHN/gpXEikXSzlsFKCrwUoghPyDrqEl4+i7yf9Aepf
 PxIp4xfOBzW4QdR2ClFzmPQky3yO2kNXHMO1jH4JyNA0TZk1K0TNRAXlfzND+gh50INLD4eJfMp
 5AqY4nlKURTtrTIwhF0Zwp1t3rXAE94Bz2wjfBbXvwnWUxS+PXQ4K60bNcLjJ+2piuKDlcHlScH
 +eYTeE5Axqm0GXEmyxyOfcX/KuXwMoWl0+NNlSnt1iWhDZPkyLVcQxWI2uAwjy8stLVU8LGItR0
 mABUBlaZ0ATnbP9u88hF/9WiBvXpbhzQvT6U5tzjcv8T9z35xOxzA0l71yovAg4dBX0SdSxS72Z
 MqCVCEdMZSYDh8TScFbynwLi9t+JR+5Af1jls04vW1p0agbKT4dMtyHp/jhFz2ypUERoh4tWJYj
 1n/bLUUV3pJPrqm3HO0Rv0HaGGBiRWJryPcXZWBMUsjDCWg0Xe0dVq+Ky6+b/WX2tXnGol7qbUP
 MnAsIKNnKR3QLNiO7muZFaciN316JZlLBfvEByXZEJtg0a4XfyIpar8qlRlyFS10YWX9RgK49gq
 SIqdnb06KAadgfg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm SAR2130P platform the PCIe host is compatible with the
DWC controller present on the SM8550 platorm, just using one additional
clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 24cb38673581d7391f877d3af5fadd6096c8d5be..2b5498a35dcc1707e6ba7356389c33b3fcce9d0f 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
           - const: qcom,pcie-sm8550
 
@@ -39,7 +40,7 @@ properties:
 
   clocks:
     minItems: 7
-    maxItems: 8
+    maxItems: 9
 
   clock-names:
     minItems: 7
@@ -52,6 +53,7 @@ properties:
       - const: ddrss_sf_tbu # PCIe SF TBU clock
       - const: noc_aggr # Aggre NoC PCIe AXI clock
       - const: cnoc_sf_axi # Config NoC PCIe1 AXI clock
+      - const: qmip_pcie_ahb # QMIP PCIe AHB clock
 
   interrupts:
     minItems: 8

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-pci-dc0c22bea87e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


