Return-Path: <linux-arm-msm+bounces-5871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DD81C852
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 11:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A196A1F243AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0413A156F8;
	Fri, 22 Dec 2023 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sllWArqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7BC171CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33674f60184so1650592f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703241669; x=1703846469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tOWdLJ/qZbSy8WR0cdDIT9XcPRLZLEVuRq3Zyqwz0U=;
        b=sllWArqxCxX3lrRtq8WfEYUw4auv4L/nGax4xLFx+6S6gas1nHJNRHAT9FGmpfzNo/
         Vit6pr/pTyknVWXkySNI7/3sgLTPkwJGajz5k5+iqmsATQxkKJ7fK/yQLZU0N+025yrc
         U/giQX/ht7TiJjUVU5+UufMNjKaaJXLgCtn7+IDfhKGeSr8hz+3ZzrEcQl7Wn87moWVW
         tUO2bG1Py4ffESMbeDC/q6Abv9IDHr3ajhpNRjrQA8YgnOOcvLNlGZJiNGm0n5t4eie1
         1TeaHvFKVFfETbYqFKiEKg7npK+2dx1zt79dDqAhjjmtAEw5MtzD4O8q63pHVh8cnEa2
         r4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703241669; x=1703846469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tOWdLJ/qZbSy8WR0cdDIT9XcPRLZLEVuRq3Zyqwz0U=;
        b=TivmW3UAs1ORGmmITOiMxhAl9RYQ3s90UlmbbywH1+6oRkzlC/7IggmLhO6BCKNV06
         VQ/OKllKn4/WXjmR1Mu6rk8eX78+0FqaEZaDpd9nyqTp5KGvdQj0t4U7NIZvcsNjRsUJ
         IPMP/tVZ95B0H96DMHkN3l+XL3jwweOlcQcBwAh1AuNxQgKjd7UaQz9bMjykQQ70WdCo
         TcndgOnw6eTsUpd/TeYa/YR7bQqOKXnH1KcaHM9Uw5aX/5x9KCRnpvWtMGJEcZsD2zUk
         Ut3n76jOHIs8gZIzOl1g/6puef0RrXyX+gOK8Q2LX6mApBL0w986HX9FBdgsoGUP8jn4
         iJ9A==
X-Gm-Message-State: AOJu0YxTFpXiw+Vhh+S1wpKPM8X1DP9XFfRRCDDrjYQVJ0W8x3a0hU9/
	aQuSVCFA6Clb1TjjFYXzq5nhbcZwzItOzjjHdD6WEkBLzi4=
X-Google-Smtp-Source: AGHT+IHlgGpHsPmPZ6o7F+D0KoHY/OSoELcVoth/eynYcp3Ou/FckjiQSMxcHoGW4tX/Ngg2HZk+mQ==
X-Received: by 2002:a05:600c:5494:b0:40d:44e5:9baa with SMTP id iv20-20020a05600c549400b0040d44e59baamr439971wmb.212.1703241668849;
        Fri, 22 Dec 2023 02:41:08 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c470b00b0040c5cf930e6sm6348728wmo.19.2023.12.22.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:41:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 22 Dec 2023 12:40:53 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document
 the X1E80100 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231222-x1e80100-phy-pcie-v1-1-b74ac13390bf@linaro.org>
References: <20231222-x1e80100-phy-pcie-v1-0-b74ac13390bf@linaro.org>
In-Reply-To: <20231222-x1e80100-phy-pcie-v1-0-b74ac13390bf@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=R8BI8+v89/SHzkE5IaFv+EDCthFqId0vtwYtd9w6b4o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlhWe/heco18MecLvIMzZeQfAX3Pk29W9uQ8KYS
 +Y2M9wmeHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZYVnvwAKCRAbX0TJAJUV
 VnecEACCZHTNHmkVyl77Yx9p32RdzMgfuZ22r1gkMXlyl4dxu1RET8hK6+gSdyxXaDjgXe1NKul
 qclkUvLEjTu6PakpyQDb4TJrcKHZ00YHcl56HPw/TJM9QYd1ZE7Bqf1pOLQS2L8YE61Yxg/5ENJ
 7vdmfZEpVJTM0RE4klO4UJhrYtVe/QyNMQnmr842sKZ72QtSnC9dvGIc2ZLr5VL/YM3/r5hy6fY
 3OM6GSxCIJYe7GrWcHTqS5qUtGR/aP0ejBaOTR0nI9SBOglMCm5RIM9eMte0xbhP6JuLe6LLWLQ
 UR6AJKq6h+rV6vhUleT/R4WpzD8s+lUu3VPKISE3tIcbyKU3/oSAKvN0089jLFe35kLMa77Ax0k
 MrR7sm6PGRFDhvGRLNFW0lDnxW5UabLH32DxCEcVJq5AHrSDBhx4FHr9jRWQl8ADc/ZSLBJ2zRN
 s84n+kEUZVEzKtqX4BJhGKuWKjYOGmrcsMSD3QTUTbQBURDBOaGn5M9a7AvKTv7T2sUblxQSlvp
 rqfNjdBSMAHL1geFWz6B2ZCD6xCyBpKrOX5luGtkB323XtzH2jGdpSRzMgddzegpCk+yVFrOGJV
 fjMq9tz/nICn2kE4mSEo+HuYSP6z8gM8oVcONgB7et8rinfx9AYyLvH4gr8IZIldPuhVLZpT9e3
 bVhOWiygxz9H4TA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the QMP PCIe PHYs on the X1E80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 6c03f2d5fca3..ba966a78a128 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -38,6 +38,8 @@ properties:
       - qcom,sm8550-qmp-gen4x2-pcie-phy
       - qcom,sm8650-qmp-gen3x2-pcie-phy
       - qcom,sm8650-qmp-gen4x2-pcie-phy
+      - qcom,x1e80100-qmp-gen3x2-pcie-phy
+      - qcom,x1e80100-qmp-gen4x2-pcie-phy
 
   reg:
     minItems: 1
@@ -151,6 +153,8 @@ allOf:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen3x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen3x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x2-pcie-phy
     then:
       properties:
         clocks:
@@ -194,6 +198,8 @@ allOf:
             enum:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen3x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x2-pcie-phy
     then:
       properties:
         resets:

-- 
2.34.1


