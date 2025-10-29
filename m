Return-Path: <linux-arm-msm+bounces-79496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D129C1C138
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88F075A57B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCD4339B30;
	Wed, 29 Oct 2025 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psXYPhMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C92EA473
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752460; cv=none; b=FmPKs3b3wzbqRuki9WsGysi4MUbNXWe0SoWsOG2vYMaMEyz5RkJC9Z0oF6gZ1Jsoe7/fpVPWyDmx870IXGKIc4OzDIrBIJYbbseWPXtBA0gIZEtvf29jk+ObrgVL2HWAKqcmIS7hKA1NQ2ayvKWeT18fCidrCc6rNLQkgWMCfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752460; c=relaxed/simple;
	bh=XZh7Co6zslMBQjbIXCr9v5B3gCRv9boi3KNiCtrOq7M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TMt9G329wrOi2MM2IOijzl7LSm9+vtW9MPxRdN0g/2RSlMLvmQGhIfqUxJmx/znmUSSynpiV2RtZ3u6X8hc+DHtnXfO+7kiNjrh1VkPYox8OByLEGmHxyCEGMek5Fl01+IhV7kl0+N2kfla/0FthZi90H0S7lMCyT5kRmx6uVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psXYPhMk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4285645fdfbso960521f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752457; x=1762357257; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDt91SNIDyuEo7g1pxTkmePyL8nY5ebc1O1twS6LBZ4=;
        b=psXYPhMkUm5AETXhX3qqViCknno+TxnmOPaOsQKdBsoy0gXVW1G9PYXh8GesS1NqdB
         E8a4BzC9RwBdsng4jmXlewiadSTA+rmg9Bs0HrxXAHWOA2pGNO7z9JeQLRoXjsOZIcTO
         GHcWPdtNO2cijUIcJMdLv60SGhyF0OiiNyycf4zVtzP7/JERigZJSTrllfCSFQbN7spm
         AyghfSdJoGR+fV1pT+E4E669B8BdbQFhVtJGx4OB43RAdcCSy/Rygbgflw4JZQewuutU
         hlF6iFH31p+HonIxeWYQhFTn/SrV0qUfKodCw3oaeSz0d/KOloeX6jvclA2aWkGpLAjH
         CQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752457; x=1762357257;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDt91SNIDyuEo7g1pxTkmePyL8nY5ebc1O1twS6LBZ4=;
        b=el4MVJUnF0I5qOi32ujDZIK6D9FxfnYF5AIUn2JqQ4aq6vrMTFLyelsaPk5+mRpsj1
         Lrb+QYzaBAzH9nNYM2/omP7aoa2iUhVFvQcmW1obCadMHSwlo8mut+oqIXUNJTkc9S95
         2RIz6St/ERI78R5kGBmnRsZHpXx/ds5u8RwSrMBbMDc7GlWearG1UDBGCrxGhFwV89hS
         QfM8KtanJMOxtG8xlWn94AN6c9Hb53+vTfLCY1z2iVyyMASZIlf9sCwDNG2NtxmqJqwo
         HDD4WBqzNxznlvXd67rmB7Z1ZCaqngbV9FUxo7R7FlYQySpJJq3QLjvVPT3ZXa+WNWDa
         fJDw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Y0OvA/I6W9AcYkodye2KoeNkjz2+FtDx+JAqoS2QzEt+B3Ps4WpHxbfEGMJxfWnfImyq3qxFjKlTDWHo@vger.kernel.org
X-Gm-Message-State: AOJu0YyMS7MTzdPBdBWxjNqBJK8vgQyXXspnHu8yeCnzSIoPzX4LYPDb
	hGapUfBo8nCwBfP/ywSRgAfpes2md2LwOeFN+YXFSwF8Ey7I37jXLHiZoVgRKAo4QDs=
X-Gm-Gg: ASbGncujqvivZnh3e0d8md3HsuB3DI2nk+sqcsl1cCKAOJDXXg0ipg84cWkIwcFdoyE
	QtvLYtUhdths26yeqFAaBFzfl6mowH9RkHdlnihOhZYUol1gcDPgUvIKdjWlOg/vibnbmSKJ2RR
	JAH2C8+szyFQ8eWEcTAx7o/MSS5DcvEhZ4FVxlSU6pk29Dji3sRbGV3eSCmZklS8q3uBcd9G8kT
	8cir1MK8b/31c90tg3RgovuaYdME/daIm0SE7Q+l8HKyGl5DTg18Yuyp1mYwFzzKq0kbxmok8y2
	mPnzsN6buYAnFowFuMe8vbCoHCAp5uxHw767Q8ok1IdVdu/2FzspAURqWm/+D3GEZiFQqdVFTyu
	3V6/15z3aZUnKQlVGJYRMdpbmwwH8A7mn7hWKxsXLcCwZh4pCSiiBEXR3nXb7c6CwrA5S+H9pdU
	Mb/dN8/P9dHccc7q8Z
X-Google-Smtp-Source: AGHT+IHfW4idvTSP2Ah3w6TfkGF/17Rr24+yasDsIjDvlkJDa3pwbq9RzRK1P0QDGji5PJoM5iNpwA==
X-Received: by 2002:a5d:64c7:0:b0:3f3:3c88:5071 with SMTP id ffacd0b85a97d-429aef802dbmr1640035f8f.4.1761752456995;
        Wed, 29 Oct 2025 08:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:40:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/9] dt-bindings: PCI: qcom: Add missing required
 power-domains
Date: Wed, 29 Oct 2025 16:40:37 +0100
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHU1AmkC/x3MQQqDQAxA0atI1g1oigP2KqWLcSZqFmbspLQF8
 e4Glw8+fwfjKmzwaHao/BWToo7u1kBaos6Mkt1ALfVdSwPmD46iWXQ23JLgO5UVJ/mzs/y4Yi5
 rFDW8hxjCMBJTT+C7rfKV+e35Oo4Td6w/QHoAAAA=
X-Change-ID: 20251029-dt-bindings-pci-qcom-fixes-power-domains-36a669b2e252
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XZh7Co6zslMBQjbIXCr9v5B3gCRv9boi3KNiCtrOq7M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjV8+rRwsh6mtOgt9cwnJyDBWBR90T9DNg1e/
 fAEZX9j8aCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1fAAKCRDBN2bmhouD
 1wxlD/0eFmxwUES2BznztM3ZTBcUo2UEJN5PYuTkJgH8y0sWSON51yeBBxwTK3SEA4IYe+HiQTQ
 i7Ms7eOUIjsmTT4/8qYW6bt/BCR7ZLULzMzNpfrtLfWJzqZCGzoj1fN8sPINtmo1XiO8V3ks4Fd
 jUB6qp1ldl0MXpWwLJzs3ck8JP6GueflzYZGH2Tq/IRLWLpTtIgkwL3Bi1qNcFZMeglCtBWBGkQ
 eoU18LISRmP+hWNrjaqKs3aA5Dw+YJtfouNyEdcvTmqtDviwV7rv/0H5oLQfARllF+2Gf0/Trnw
 PNjCqQSHtscaKZ9E5MJvCzjkcIZ+BoMq2A7GovFhWcLoMOdrfEBVA/+ROS+e3SJnAHYr/rwsqpu
 xNQfCzkurb2KyIYNwgsQKOrzJtEnbmN2ozK7k692z4hBWDv2c73DRNxPSmplr8i3AucNs38EZuB
 +WXhq7A/96rRaOFHAqCcegRt37R21Nn4YYmlVVbLgmyNhkYB8wHluSrZhqCLuV+jhuL9yapwWN6
 EQImQRMwkuyj28c+42uISguJX/Fr6tl9LBZ3dn4NAo37lKzfm0Tw519lZizr+e/jkL13elDA0+2
 I6VmNbLlSk88QQxlXXo1KF8r7FrRfrFKbh1WYryLK7xTHr3Zc+6iqI3BDcBl9KvI8S0yIUbUQ+k
 uToJGQdKF9rcLSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Recent binding changes forgot to make power-domains required.

I am not updating SC8180xp because it will be fixed other way in my next
patchset.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      dt-bindings: PCI: qcom,pcie-sa8775p: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sc7280: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sm8150: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sm8250: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sm8350: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sm8450: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-sm8550: Add missing required power-domains
      dt-bindings: PCI: qcom,pcie-x1e80100: Add missing required power-domains

 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml  | 1 +
 Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml | 1 +
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml   | 3 +++
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 3 +++
 9 files changed, 23 insertions(+)
---
base-commit: 326bbf6e2b1ce8d1e6166cce2ca414aa241c382f
change-id: 20251029-dt-bindings-pci-qcom-fixes-power-domains-36a669b2e252

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


