Return-Path: <linux-arm-msm+bounces-71975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F2B43335
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0B18684583
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D932882D4;
	Thu,  4 Sep 2025 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xs/DDRJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF4285CA2
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968986; cv=none; b=bvsJih3br/vuMxhLb83h/5KDUxlCvgGcDQ6Z708ijaeF/BEfEWsiC/30wTuSqaPsBe1hDYqRSXuVmo9zLhtBTddo34jCFDrsAfiXUvQmVSt1glt9mW3aptxyDaFmCRMI1uNS9wi9FJDHtqEbMN/T/wiI7Kxpu4z9qMBmDEbi+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968986; c=relaxed/simple;
	bh=HgvQOvx3m4CvBoE5dHF5Hd62HhuXy89AaUrS/0C+J7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUnDx10PfASE/PvFdDa7TnfBtYlKIPvCXwSsIyW/QSi5GEeiCrdyIaM02jIZq9N/dBvrU0snecKTJdbdbm+FgxCrJnUeewl9/QNeANQ/+cTmTDk6qNVRaT+t5hEMVblKFGO2NAeuYN5QwDu+NqrnBOgKAY40opUDHHuzzuM6goc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xs/DDRJ8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so212239f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756968982; x=1757573782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIJW4DOs17I8IE8cnSF1Ab+QfY3CXf+qZq5eyyQ0/Uw=;
        b=Xs/DDRJ8kt3MdXh6qHwRZ2QZ6ZSJh1mZ5XJLJe4eCOnaNcWJ2JAxIU5zXzOD3xnnIG
         xt7CGjMrUD50i+hfLaDmrnJ/VVVEZddmd4QwCIb/ah/JnckrgZTSx9khgpSwzr7O+fzf
         B89omWpSSI+WYCT8EbUbV17PIuKF6XfwYrt11a80d95WlNoSycxnO1u6PEsJxF7YwVBd
         lEtvd0BA/6WhP4QsF6m7+332dRsg9Xf+rUFBDHEAifns3CdFdAm8a+6R7++rDaMo99qE
         VMVw1kC+pl6y2LdS2Yr4lHAwYL9FFq6M3rGh7SlLd9qszh7fyuHx5BSGyW4Kk2lLsN2A
         TuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968982; x=1757573782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIJW4DOs17I8IE8cnSF1Ab+QfY3CXf+qZq5eyyQ0/Uw=;
        b=wjS3vGhXLXqslVHhMIifqyUp0XEgk+onOCXBz7YCebRicsc2lTeyn6YXCdm5KKpZnP
         Fm326v2XDXIhrUGyOUK/nGBdEotbuP5Zbq8cm0tjuMZJK7c+WwpE0hxwT7313lQRAvIZ
         c5v9+KNLt0/jiEwDqOBQQxHmkrgt6BgwGuvIw4/abrBRn8ftcgClU5tftCVnRXvGrB2y
         Rzz8wKtDGEjGLuws0y5Iv3IWjpIE+z2J1btNe82P84ST7eae9RcTIqA4F7kxcyettbPs
         +P4LqrqlugHY3LowKHuR+RU+K89UQGy4L8WudVDrnDjIsQXnpJJfYjP+ukt6WALRFM5u
         j7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmiWGMmWvaTsnyjlWrgAMoe7PUKSRAAtlNC7/9MOqaTlxeghLcZ/JokVEkUiCiFRbHBsbwJ69wEGK8Tk9h@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHpxrP6rNZjPeileV+pDFbA4raHSw5Gm2/aPQgd/U0fqE2qcJ
	tNSdozxs9+v9SWWLQ+odwKZaudmwOF0rwhf9Hn7+dP+znNRb0owQwmdBcpLSVPkA/44=
X-Gm-Gg: ASbGnct+KjmMu9midvnVybeIYJZJJFxnJ3mbmN25ZkI3ytmPU+0uKz+If9coWDfiaVJ
	Qt4YGISG/YE8XzQzlO06qAt6qSn9u8tcZ2kMacijJNTU/7lxkB/ZIDISeHScxOb/GBvbOmMOKr+
	zBz9LglGG+UZ35IyL51iUBph9jpnA63KgaujezJZzalPCGtOFqdJr3dsbV/V5HV56cBWAgW0x2A
	VTvTP2DPxb7NR04qdw9ZJEHd/nxAnY9CHfR2q0oLelPSDTKGiXKD6msnjvGN00FF7SVJ2VFyik0
	qKptYyAvR49fg/EFPD44ahm1BGpqDech1gYinRMHa8n3ty6albyF4NRNQmQ+2icCSfwm4OLPabL
	vOYYUQXVkpV1f7GbKwp0cnTuD1vNBw9seXQ==
X-Google-Smtp-Source: AGHT+IHRwoAxbhGuGQIlrGrcSD0ZvA0qOr+60n+D1k6tu3Y07QMfNcWceUEmrhlKDr15ViXEc/rzYA==
X-Received: by 2002:a05:6000:1888:b0:3ce:a06e:f24e with SMTP id ffacd0b85a97d-3d1e05b6b69mr11774429f8f.52.1756968982361;
        Wed, 03 Sep 2025 23:56:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d701622b92sm15256075f8f.58.2025.09.03.23.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 23:56:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 04 Sep 2025 09:55:51 +0300
Subject: [PATCH 1/3] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-phy-qcom-edp-add-glymur-support-v1-1-e83c6b9a145b@linaro.org>
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
In-Reply-To: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=HgvQOvx3m4CvBoE5dHF5Hd62HhuXy89AaUrS/0C+J7c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBouTgLKxxjCn1VZ7LJKQe2QBBMb4xTCaRUaHPLM
 JriC34hbOOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaLk4CwAKCRAbX0TJAJUV
 VuL9D/9cfeQfJtA3v5YMBBvcdx5o1Luyr7sQmCGbcBDCJnWnfVzfV8QhGxDYu7Rx6vCmHrnhnXw
 Jj0ZlFpPQkMMj/uCSF/Knt3kXvHWDymMKh2lYCoLlIupYFPp4RDpexcI9QkSg0Ikl1xhgLgrJH7
 wbd4LrxcOisyQUUCGUPiMVnOHK6fRWcGUuUXYnqLkQzdwWeRFAs4vvthrc3tKuSXRDw+c6sGzgK
 0V2YxWEnd3QaeH3p2kaZDXbFBLf9t71UCDa7nsu/4Aw31rNkZNuBO66+ISVGU2BGL1xcgI/NxZ2
 POgfA3u2+GHoNY0mtVyWgM/yV7XrQRbCp764ySDnjcZKCDkWdODq32XHbZw0ZJp0p5OeYz+ixNp
 arsjjBsYszJ76H+IWzQNJ+kcu4TraacMZ5X9XynwnbxuPxxnVbV2kpCHGGRJUWoFIM5CkUa7qWS
 uP+H6oFI7jY8rRnbia1+fv2CNiwicOy6TF0Bk8flxQzaU/3r0RhRajq0keAMoKcZ1JKl7eBWoBV
 zSO5LNiEPGPT3trFD6BAeBjme6XjuA/AHGmxVdazsLCF5AL8Wh7Tzu60jyJzmyi4uEIMOzb2W7A
 GH8DXtVlSNogh5UiLgwK49A/cnnoimNlBD+x/PmPlRYt97Ro5ZRzLYqb0KizIiM9bGbv3hKw2iC
 yA6ENdLZMf4VGBg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the compatible for the Glymur platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index a8ba0aa9ff9d83f317bd897a7d564f7e13f6a1e2..e572f6ea3523a483f701aedab383a63af7abe0e5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sc8280xp-dp-phy
           - qcom,sc8280xp-edp-phy
           - qcom,x1e80100-dp-phy
+          - qcom,glymur-dp-phy
       - items:
           - enum:
               - qcom,qcs8300-edp-phy
@@ -73,6 +74,7 @@ allOf:
         compatible:
           enum:
             - qcom,x1e80100-dp-phy
+            - qcom,glymur-dp-phy
     then:
       properties:
         clocks:

-- 
2.45.2


