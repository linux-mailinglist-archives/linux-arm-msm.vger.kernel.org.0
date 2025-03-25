Return-Path: <linux-arm-msm+bounces-52483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C407A70A3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 20:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115233A6E37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 19:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B811F03F1;
	Tue, 25 Mar 2025 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofg2URSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738681E5B9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930507; cv=none; b=aqJtD9yMQmT6AuOuYDsd6NqTlkiUvDSSn3Zfm7UkqHbNSvH3IQLdhRKF1HCY2xf4fldVicHQb7pME6m9UM9HHagU7kGqO6uPPZcLwjw9gngTdlhroSvwSj8Inl3d6yVQ9Gd63AU/dJq2GNYMurUuIE1eWbAaOzYUl/ZzN45rDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930507; c=relaxed/simple;
	bh=tTDdAbM6FEoC6Rnmp/8WdmqaJi5csQEBgAAwOs8qGxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHhmG6fyKyJWCNse3RA2MwTG79Ml1FCyPqLkZ9+O1GzSjX4lzKRftdg5CpLPFuCh7DcZNxhGuryTvqdLzwGtmWh1x07WY/+XiJNp6hRY7Jth6AeYz7GQbHsnWT2778Y1jsJt1HgHzxVUq74f3k4zwPf+JslbP8VGTLcfZMY4Rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofg2URSg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912c09be7dso4059242f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742930503; x=1743535303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xAjj1ZGQzbODWEBIkfTAWZWQleeUyTNk6b3kRAxKYM=;
        b=ofg2URSgjEEXN29tAytCupZuL9oSQ6Fo2sTWNzZzXxVb1rVWZYUMCQW8qTIRPC7u50
         5D4/gxc6RTw4G1xgu/inrK3t6E5jZJVgNpn6cEZFfg6NvGFbjtfUsSjsfqT6+Na5zBpi
         05HK/0G9HudlvL31UHYfIyF0p+Joxfgsn+3EwctN0uNcltXrVGtuFvPg31Rqzuv2JrTK
         jqlMLX4YH/49piUSka587fhZ+uF/CM7sSZrVuV0tYd1T9mcvaAzfvrJvInMfR5S6Qv90
         VXhnixcL1u5V9MSJ52FXVks8JGPJWjnXX/WNLM6Rf0kSKtqwy7/r/nerBvXBqaZGCeju
         AMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930503; x=1743535303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xAjj1ZGQzbODWEBIkfTAWZWQleeUyTNk6b3kRAxKYM=;
        b=bcBMrfL9XexBaRocr81pQrRIvigBVSdLsZ1hD/T1P+aXWdy6nQnw8eC2+31L5WVkcU
         K5K+gexbves0a8Ji2uXqeh3fpm7D4jJ9YQYvL1NS1D8nRT7hPucMyS1eVjIUubvF4k9i
         5NHedS/Oykx/LSxTAdNDjmRvPYeTNy+cTuXvKlXRoSmElXB1rIZCbBdyLpU0KRfDznXL
         qpBetW4kiqfwXWtML3i01Uiwo9qVw7dd+2LR8K2DeLoVe0k0OJSvUH3f4iotfFvYVO9F
         S6zEkpjic9+maRmysCmhbScqWzLqBw95TQh29rZmmx/1l0dUUNaoQwkuECTw+t1hwymc
         xOPA==
X-Forwarded-Encrypted: i=1; AJvYcCUHn2jV02Aln9ZyLnrystttKMMLv12vkvnO/2D4Y+nsOpCQWzgplSUw1Da+AIXiYXA5Qzf/VqEghI07lVSL@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpbhrN/VFLJOxfc3bYlakz+iS9yuS26VQ3R1I5jEPFNLrwynx
	CxcfeA4PWN+kCu4AHt2xDPbctcr75vNN0vi1HwSZepuD+m3h5fW7mUB8Dw27NcQ=
X-Gm-Gg: ASbGnctSnJcYoxqiHlWab41uvWHirgiRLqh7k/dchfeSXHvFU4RtLzG1vwMDw9ZBJaP
	J+UWpeG1Wz2/+Ec1mNWCBDhdpxYlt7C7Z0C4mMQXf5XN5Mx+PwhwQ7U9wfT2VZCv/M3Pjp6XHAG
	8CI4V/EJifHMqIdqswfJ53oKcP94kz2xybyRwW9TeztWqP9Ekiz8P/Pm6YAZSGVSfMPTvKr/YKB
	+XYB1bx1Mj8X5eLmO4ZFaflPCu53B927JSQyqXR3y0CrTjxBUYdWeV8ppLXNy5u3vUUPgg4Uw1U
	sNolci8c7TADYoSvpCil9xjpIbi1ogc2nfvqLkW4ZvFJixzKYqafAZCu
X-Google-Smtp-Source: AGHT+IGmYbu2karVwSKvKAwF5XS/np1cbnnSftiOniiKevwsN7ksXMbWmbShuyMDFyF/HI91Qcd+Vw==
X-Received: by 2002:a5d:6d81:0:b0:397:8ef9:a143 with SMTP id ffacd0b85a97d-3997f90c860mr13768026f8f.23.1742930502791;
        Tue, 25 Mar 2025 12:21:42 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e66c7sm14633284f8f.79.2025.03.25.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:21:42 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:26 +0000
Subject: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=tTDdAbM6FEoC6Rnmp/8WdmqaJi5csQEBgAAwOs8qGxY=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJF7FGQSHT0VbmZT2yMBNAiYq7fD7bvHw/lr
 4Kq+iRYd/aJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +CBAD/9APoHHKoz5Ux3QZFEQYB/24B/r4/Cw8EeywzGzDKkBf0HuS2/jarVACiKA2KzyIRnnA0o
 OrHx39pDhVkO+0wBl0FtK0cWjwlNsEGsrcy5OiL3rZYsz/xnmzeWCu1UJGgbgQ0KJvK5eSqaC1y
 /U++rbQMn3dbQlj16/sWmFiCqrMo5C8qWb1uietBgKlm5hVIUqnTfdYLvxlBi329pynqa8K/AHO
 1Dci97G+SK6X/tXR4fru7iagN0AhcPUH3HI+og/zVqV7/GywsupiSAzy+8Usvv8qXxkE4qhTD31
 ini7tAYORal9ksQn0fhM3wTHa5nZH04AuznDcMTXLMUq5r5cR1UjJOPmj3aQG0AiRgmymtD1n07
 mdKNAXwq/o+vfXNRUvcX36tgjIhWZ2NHhkwnWURqM1hM4fKT9IdoP3FNbVFcqM4S6KSX8GrUFFu
 t1ttLx4Y7s0ko1iXSyEjYa6qv4d4Olb1+RvfdjJ6r2IzBpEtv1JdBxBiZ+HVtJW18S2F9SUZGjO
 fD2c2yfHSaytSFx1SygoVDQgwKJBoFwcWF5B9igCXjLqKX1B48tHjs8EmyvdlfCGx3VF2EtpG8x
 5xYnINf8wSFQHl4KP/DUdhBM8vHvqX2/2o1gOdavJc4IIzFU7+iFzj7CQg0+CzNifKMfHsfB1lT
 pZiCe73XMa7poUQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 684c2896d2387077cf2d91cc5a025e0838c0f536..31f0c0f038e494234d896691f3cf0b9b7cd8842d 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -19,6 +19,8 @@ properties:
       - const: samsung,atna33xc20
       - items:
           - enum:
+              # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
+              - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna45af01
               # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel

-- 
2.49.0


