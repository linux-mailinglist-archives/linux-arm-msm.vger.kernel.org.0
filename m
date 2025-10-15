Return-Path: <linux-arm-msm+bounces-77410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DABDECD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9D719C5C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F9B244692;
	Wed, 15 Oct 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDoJpcGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A961223DEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535809; cv=none; b=H4F1U9+vafRB7OklPrHYCPHOqJ9e4gPAYUkDcRWK2vhyXqk+epcQRt9SHSPy74i9bwXhKzM5PlZZo6FsXvcLgSZbKck9mHOU9xjW3CKrsunGUc0lJ/ncC47DEtOlH+82+Gy58NoJwATdZxKXJ25My2bYPH1S85ES4o+mVwwNpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535809; c=relaxed/simple;
	bh=HVFgQkDcaeo3PqpmL4D1vFEkuL9MmnS0hS0eZyXaDjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isDeb45LwnAs8ZQ+pTdWnb+zMaE67j3lmHSTrMF18Kk1SqfF4NchnTwl+/rvLPGEoccTQDBFpPlCM/wttrR1QSmFFqM9Yn1HLF5mN77LJ7/beyq+eRUa3JpAZ/WgRveN9XSsSsmud0sXFDvYtIMRsyG52h3Ea6kmOBuX88LOjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDoJpcGO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471075c0a18so4889025e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535805; x=1761140605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByogZXc14UT9n3SsitnEg7RC0BO7/uaOAr3B9hBWHyU=;
        b=EDoJpcGO5rW+uwjenxBFghrh/uuj1pLLiPvxHmPqILy85wfWl7r0p4jvqVtn2ZdP2W
         85LxEJvKs/5iJwv20vfo4FMZV4hY+aLntjUhdqteyR1bBiVYQ86iDlAgx6ubE6pBWl8M
         ul8fN791Y5TKk1jFMKTfHLwRSGpZLk0/bu8lLYm63OyCUFNYb3vKvwZwstV5UeYugV+n
         50dvJYiLaKiw22YYBxjGtBV7IEIDuqZsqfTQA6+l28+X5LyNREp22gyG/vjgFLtzgV3I
         DOjZHdqwKr7LqGWPHvmR4baW9Nvs1ZGaxmQkwCXpwW85WwYL/vrvMGKQVXxZU7kj/ODj
         jx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535805; x=1761140605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByogZXc14UT9n3SsitnEg7RC0BO7/uaOAr3B9hBWHyU=;
        b=r+GdtlWWn0qO1JAcc01mucmAbl7KFXK9P9t7nKA44mj8Wd2JNXzLffTgzdigUbYHnn
         Uhg+gQbFim5ieUhrvFez1iMiDXfluj3Hlji2iNSiqsKNlz4XkaR9wZvAbKIhKsL842Eq
         i7wXvmqFlyiAxgC5Imba7tLMoJd41dtyKWmoC3scWmP85zKDn7Nzpukz6cJxFxv5Y1of
         6iUjlu4DpG6ZUsSmsicAWbou5/6PllTxJ2tcExzYODUB2D4UAjG8Mh4xBwx5YOFJwp3x
         A1VQ4k0dX1JA6HN8e90by/rLJzMyxUyCrTCFyS4NIiEPO3zQ0uBClwGFJ8ax67SD/QkC
         FhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhl2sOyC01dbhdJdCQaigfdpkTyhErxU8pynvBPEs9nMt5xSZa15HZNZH9g3zKYzovpxFwybuLekZZCPmk@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/QIT4+z4FOw4AIy7VyODiHMbf9AemAmBj7TXRnAQD2LR4QjU
	AbPhmFel+bsS9GPgSwAwqj/BZqhraZ/3b89GDZ7mzQxOtjgiMTPIIK0Z0DMDbj3fw3WrYakGzoo
	bSkLs
X-Gm-Gg: ASbGncv8sA2Af0ggVYjRGrPexMiR8wcSY5dy39ojxBIptZjIdKK0HqKs/BeoDSSdm+s
	K4m/RO+fZtP4O7uvqNjsc1KvRDWE825cXYuzh0Ah62gl24jR8weCwh1rpAdQusO/j++dngBrnNp
	ZMqTyLs7xFfA6/rzTw076UBg1Y25OUJVkI+ybcI+fhg5cikoU7IVvrv9Y7K5GhHSAR+J9kgKCyd
	WkKO1ewcb+QEhh+Y7X9r+Qx76ZFAJo2Z9cYytMgfVs6LBLCmYnUWCY9SguZUMO3OdeNJcrvII4k
	w+UcvxPPghtpPlRfgLvZcHyETL/kD8l1YOuej+wXbjem9tceVxDyoXqR0od+i4NK78Qlp7ArBc1
	zPdtmjt7V2dTHGU28t2VklNSDotDff5qJrY+EDqQ8TJc=
X-Google-Smtp-Source: AGHT+IEdJvwQMAzflMvzw9Im0rtdAnrqJe/7LKsaDEAVa+Pj9LNw3qX8KbdcOXs3ZMt7/aHq4vZSwQ==
X-Received: by 2002:a05:600c:8b41:b0:46e:4b8b:75f2 with SMTP id 5b1f17b1804b1-46fa9aa2209mr203799815e9.16.1760535804923;
        Wed, 15 Oct 2025 06:43:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d2d65sm174180795e9.2.2025.10.15.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:43:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 15 Oct 2025 16:42:54 +0300
Subject: [PATCH 1/2] dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur
 PCIe Gen4 2-lanes PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-phy-qcom-pcie-add-glymur-v1-1-1af8fd14f033@linaro.org>
References: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
In-Reply-To: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=HVFgQkDcaeo3PqpmL4D1vFEkuL9MmnS0hS0eZyXaDjQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo76TyzVjrNcOQFFfUS0aHr0ePAp/hK4fhn1+rV
 41VNalrHmKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO+k8gAKCRAbX0TJAJUV
 VrBuEADJFwj9fxmLwEXaqLuXTaNf4FRLP/gVP+JCozt/cA2PfCZO0zTTX951h3cHo8qodlDDP8Z
 YffWvqt1F+ba/AgN3OMAJS1HKEPRlR6nwQjiVHGsGarrNchy7rOnOzCskOOoi1qDtJTfYwrDC9O
 ER9mD6uteUkcTMtftbJ6sd8AYZeW2Fc54QsMnJqObUiy7mCwzFP72GU+T+rqXIruXalpPrsqL41
 5o9gCH2uIym5VVvbGbz3ebmZwIINVWVUErUjEQ57AFeVUOiTMVCvyRqldb51RNFbHO/g49p48TB
 oKnsnf9GRpi6sfUdftmt/mImWHdpuSynsQe1Ow6H3QIsYMY1ALmXQy22vdZcpUtBH+j7QLr+0KD
 GB1U8lZV/rgyxDqTQXrjoKANXNetGEc0Gh0FeyOEl5p2F0rCaAZVIovK1j0BoGL77d0f8kYqR2A
 yzTv3kZq9WLjmJd/4eR82NcCz7Z17tP8bv9xlB3BjXDi9uN5bu9TYMbGrl1bEaNtTRDRsG2psNf
 IJG+8TP97hvwaYBMCo/LxlGzF5oxpR2MBc6BEmkQGXflntKhYHlstEAXcziQIhTf0jEqMjMEb4Z
 D1jkDmk5PbpYAZnXiAXMC3FpAbZwQFq+ryT2Fi2G4VQQkVoEhhfL0QQ0AfCMqRQS6htttsgidV5
 4HqOZZS18/Cn6mQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The fourth and sixth PCIe instances on Glymur are both Gen4 2-lane PHY.
So document the compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3adeca46d9aadce103fba8e037582f29ff481357..b0d1efb84fcf5abc3fcd9146f89c903a4ec84dba 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -179,6 +180,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -215,6 +217,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.48.1


