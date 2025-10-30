Return-Path: <linux-arm-msm+bounces-79611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13920C1F24F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF3F188AA0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A1933CEA9;
	Thu, 30 Oct 2025 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IPN2B2RW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE9C338F5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814270; cv=none; b=JwKD5pisZ5MaPh6eI507m8WzVN3dov2z21Z8vlJUqyr44ShwJox0zwsAZbk1n0BPXqcHQXd1DiVKXJOue5Vx7s8VHc3Ng8gJbpH3lJ9JyU9SO9fVyvNAtXEVkSCBurxv5zs7TQKLn+he99pu1e1qqUewxuieGHYB+yoZqXEn4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814270; c=relaxed/simple;
	bh=rpjdsC8YDAR4ce9DkX3G6WOQjqex1hTpcjV1pmb+6FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BySr4IMdwE5CS2sj2RPHxZ2OeK5M8QFXEKhqEUn/BgcvYo34wX7g+560zmpmU0GF6vgbGAaIF0fJLSUA1C4eCr3OULePr7t6Wbs3XW4quFQIBqtAvtiAUGxjsqO8zFA4Sp5jecjzN4I1Gm3MTNkc0k5wkiYZ7ot35PMP6by3inM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IPN2B2RW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d535e3610so15991266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 01:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761814267; x=1762419067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeZHkr4YD9H0TDPFAU8SBi/+IlGQLxtOdn7QyZP9pFg=;
        b=IPN2B2RWR1Du4Ggu02p+DhAOnm6HVqJo9XvTxmsFlRsCNJ0HrZMDsajeQ64I6KbkLC
         I9hFjp6sJ0axUhP/DYYt3xwQB0njuQ561eKeYVvKAK0S0hKgy/4Pejbneu7ZzZGw8s4s
         ahlJfJu4hWe3iHODptBoWNJN4XF9Sar2g7rosjLdZQg6LB+RBF/FpWlRYFHgtqr6b94e
         KKHgXQ6frtKmOtk19toapMyF7i7kMMccqc8FYn4HSVzV/HNJXRMQRcvXbIMTmZT3J2Lk
         0zc2W4DEBeP7yB5PHZXiWAvt3Gd+DaDsJQVQUtfvrKFAfDX7+rNo9nU1k/QNV/8S59MC
         rp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814267; x=1762419067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeZHkr4YD9H0TDPFAU8SBi/+IlGQLxtOdn7QyZP9pFg=;
        b=tf8T/JfKRd6gyHB0JkhZK1plV3ppQDCry1PDSABrgkopz+oW5UsJMPb2OctR099mda
         2Q7EJJeJsafhv+gC1G0iSjvNjVWVR24tm/jndKLFVHuMHI/fLjFcHcMmDbPPAiTwTSUO
         /x+MOZNVSL9U++icbSGJpANAALWbv+kb9e/+Tt42IOUlDSWDzatHkd76FjXfEDBnLWKO
         rljWA2YPk2NgcLf7eQaA5aXZ1HqNgMQubPf6G97UxL4wr3rm2k4S9SGiACy+sPcg5cHv
         SDxOO+5SoX5Ds2e0PM2YFk5mbIetVYfsNVldTBVz+2fBK1qmGBdwMXi4R/FgvXT28idP
         GBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA5ABykkrUpk50mkNH2t2PD7PS9FSPduKV+rn8MOHfykZHjThZnWvAMZOAYArYiOZh3a8LNIznCiUS5CVp@vger.kernel.org
X-Gm-Message-State: AOJu0YxDgxSRUSDebIxsN4v/AaG83KiHp4y9icmSifWCoTdDH7evaQM4
	aCEr9onOcOncjI8zxOk3kVujIdyI8hXgtk+st4si8rwttdT2+A2kP5o9IKZobKM0/K4=
X-Gm-Gg: ASbGnct6HCCeJMdY2OXs4KwfYYWhaGxujeILY/evWsMO1mF4mwfuRKSTOXZ2MpAPI3R
	EOkIV9b/lYzmlU3vu0inBkUb3OR+ua5poGw9ly7mUTRcJ1mxPYsFgxw6rLvUFkMgIiFXd9zVDh6
	DckXX313rNF9IXSbLiVdFxXLmmhEqjMlkVrjSpQaVRjsyEv01HNzjpNZgY7UtON1UYKU5afOZUh
	fa5sydXyBxm3afWfoFxYlGpQKBKik6Ah+Fldmj6KMEQZ1RZHoafDuGXxddDto790TURXt3wbdHd
	uDBSueHQAXwSUx/vfUPhOfvv+7NN8zL4mZs7zYcqiT9QCMw69OpaakezUTbB2IXVJWLPwcTM7A6
	yNZJIKuiVSzcRIKkk+RScDnhKHWfcW+e4xnGiZoHbaNrvdlZTywoPrkHeeA66zx/GleVsC8KuN4
	La1dvF2/xSVryhKP7m
X-Google-Smtp-Source: AGHT+IGa2ZrCMJ941md/YaGSeVQ3cz4WZFg2TaBoGEFTfFX7GrykK6ynC7BBGxsj4Kqgr42s5r1Irg==
X-Received: by 2002:a17:907:7255:b0:b46:b8a9:ea6 with SMTP id a640c23a62f3a-b703d568818mr370592666b.9.1761814266546;
        Thu, 30 Oct 2025 01:51:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85ba3798sm1691789366b.39.2025.10.30.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:51:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 30 Oct 2025 09:50:45 +0100
Subject: [PATCH v2 2/9] dt-bindings: PCI: qcom,pcie-sc7280: Add missing
 required power-domains and resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-2-28c1f11599fe@linaro.org>
References: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
In-Reply-To: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rpjdsC8YDAR4ce9DkX3G6WOQjqex1hTpcjV1pmb+6FQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAybvXntta9FsaICcpfmprRUQ8u2uaIde10GCc
 2STDIF0KwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQMm7wAKCRDBN2bmhouD
 1xNYD/46QXqnYkaIGSMZZXc3CCIa5r8QA8x6uVCG8deex5AnM0Cv6cpu8/OLgT6PqgPjYdUpLIx
 j8LQodj1MeEEMOjmqZrIfAVq9/onEuPEfSGZMni7Ltf8uw82Wt4rqF11IHXiBg7hScSAop2VXIp
 8Tp8+8vacfoDLLdJ1iXu2dgZo/tjQW1IECcIBUSMd0lNsuH9TEnqrazOk/ZikVV5tOtnbVMdIwJ
 AM4rxtHheqEnH4Z1cXc8f5aivkuMOQ8JKwHvAMTOkh/QBoTiAV89LbkHyhZcPOvpwgAc08tA6L3
 MZxYoI2SEfhrJcX9ZfrElJxXpGeAavzw64nZji8uKYJAZm+4gZ7SpFjC1FsNhR+Hm2l1zausrYd
 MZmkPsRYjm7DfDGKa0/7rHhgcf9yemb5G0aQNd6ILASUDyeKWye/Te1/dGdVpJS0qx3gNuog5Er
 rtpsjVLum+hMgKJEL/rJTDsYLQWXjSwEtNlDbvVTSK/OOAkK5BP933vqZ34xFOz+xgcD5MNy+88
 wcnRGFsM1cT8lcFeDAbUPBG9FLGqKeg8nSo0vMMlD5jD+XTdiSISPeDcLUpCv8mVA6jhYyFuQOT
 9s38CAF9I04uf0KUzEUttomHR/5dJmu0X5GZN4iSZVTPfOYIjakMCgzsjJzsF395tQ50w9IMUmD
 u0VKS/Tz9oi7ViA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains and resets for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index 4d0a91556603..f760807b5feb 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -76,6 +76,11 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+  - resets
+  - reset-names
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


