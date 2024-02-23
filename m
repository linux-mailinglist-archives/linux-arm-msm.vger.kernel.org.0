Return-Path: <linux-arm-msm+bounces-12314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA17860D34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 09:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39D4D285A78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 08:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A516F1AAD2;
	Fri, 23 Feb 2024 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfgRO46U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F319473
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678337; cv=none; b=aZsECYqDqYaZNsJMS6XL/iyso1jDiyzsFqEqMREJS0batgeCHAYAZmjyFkoXZSyhbg1csFvckwTO+3ZSChl+uJnZf8AWJFVIJzXeAGSBaflt/TmCQ67GCa2d75g49361YxZnhVbRUTK3u0dfyg3udiCGx8LmyJB88NEOPAT4Y9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678337; c=relaxed/simple;
	bh=EQO22abW8bcA5milvZJUErbhe15oKZJEeJtPj2aKW3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huhDpyxS0USY7pdAIN3StoIoa89kkJHmp/erX+kW6vWu6oQXeOONUtgq6eQYlYaZCrJUQ+vkly+Uqa2c6mEPfU63zBd7JXnuITYNi/HsJoELpCR+et+2z139rqFIc9ZhLl5fkwetM9H0fdYmG5g7UB1aKsdYAU6hGcEN/QPGB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfgRO46U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4129015c31eso3983495e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708678334; x=1709283134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkRHnQA3TdEeSotmMCTtjLGOi2rOUesgI3//PK5Jk1o=;
        b=cfgRO46UeAhxgXZSvDd4adGmc0LL0oJUz+xrKINQYxdVhUVU/o8JP9EHAN3f/IQTkO
         C3uZfSedIBibODiP224iwquTWpZmAtes5j4CMQJAFP57fA9VSLVDsr/YNZgMtb5+AVAt
         r4Z3GwvWZ5r0JUt8EFP3FJHvn683iaJJ2Ns8KyfhXh7esBgrJ0W1vdxWo4lWfwvvEFuE
         8v1PjPX4g9i6JoZQ6eI3kibgbo6yNg+2D6xBcXRFcNMrm8th9TFS8ahRDFZJSSlbhSrk
         0URC+73JjvAEvH7Yj3zBoRVLxVvlQtBAf0Ux4p2LFtq5XD1/Idpc43b+f5EcBH6MhaZP
         Jo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708678334; x=1709283134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkRHnQA3TdEeSotmMCTtjLGOi2rOUesgI3//PK5Jk1o=;
        b=jKrSC7ek7aWIhuJ8W1ASiMq9oaA8mJqLLkA1Ey1tPFPLa3CvIMflRGaPTaqI1R5ZNx
         kwL7Y+LaCXeLOpGNuQjt0hRN4NdYZXGdMJENVqUPGFPmB07MFvUd9PMkino/CE66aErS
         ArPAVYO7Kc6ZlivMhdlD4Y236wP//AlVUWnIr2bqJ4vPO4r9JME3kyE2W6R2pyTGnh6p
         nwtFZBQc6FMvZK3mjG7x79XjeY0Db0R/6zDCPqQHdtOZ7nMoYI2ww8YojEUIyrcrNvtA
         9vzfa12gafZRYRaaPUleUTkqTTPmFlnnhXCgCvk9UltwUA6588Gu28993M87isUtpzSm
         EMEQ==
X-Gm-Message-State: AOJu0YzaUklTOZFjXSI8IdPZUP7jOzCNkrjEgvecO875sE+UBne+Zqf2
	Y9Wyp3VDm61kovP2XYOvdwqd9KR2tb+59VjCPqA5EhuhJk6ZZHfxJ2YQvC0iqhKqwak1KdeTi3K
	bOmrNuw==
X-Google-Smtp-Source: AGHT+IFM2v8MWewvT/cRoLLvSvr6O0tj20W39aCtHT2jhUIWHXtnMk+i1hpIrjFMr4CI9IrnoX5LEg==
X-Received: by 2002:adf:fdd1:0:b0:33d:a010:5add with SMTP id i17-20020adffdd1000000b0033da0105addmr1023131wrs.54.1708678334268;
        Fri, 23 Feb 2024 00:52:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 11-20020a056000156b00b0033d1b760125sm2028168wrz.92.2024.02.23.00.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 00:52:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 23 Feb 2024 09:52:07 +0100
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document the HDK8650 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-topic-sm8650-upstream-hdk-v1-1-ccca645cd901@linaro.org>
References: <20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org>
In-Reply-To: <20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=713;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EQO22abW8bcA5milvZJUErbhe15oKZJEeJtPj2aKW3U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl2Fy7h1QSL5nrtuJPpysMfFIPGa7uVvnz/x3ypKPp
 Z7foSNaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZdhcuwAKCRB33NvayMhJ0ZzjEA
 C228C9/QT7FdF69I9BHoLqtPQZMHsu+ja6YCGYVxpt6EdY2fbc9xocjYM9z5G9epvTzhKaE29EZFDU
 zMoGrK3/BrP6DLbHdvC1oWkRtZVZLf6dc8LYh4Gsfe/JFgyDlcVVnVSQWbtI2/Cjaw5xYiTt4MLawc
 px3+1TGJj47LT+3+0u/jQ5/becgRrgIn2E4ky6KzXByNpMD43a6p4yf4Am08SEtTiQ43Pm9UoKC1YO
 NXOrQn4yq35B+CSfSZ5AAF4syn9+q3Lsl40aVbeM9f/T/XLcZFFL5ooxtNEpMiRd9aSClcMgaUsXAE
 N1dG4mSMNWNaldXXKWCY0KpWUioL+5x3D9pTd4IuNS5qzVOmxcVYKuIYrdekdc0I1Sn9MHjxS98hYY
 aptk5hDZF1KkKJheyGXe4zAjzXqPavqMvY76wiGzF+NmZw9V8ShJdC9vvn+3P/u8CjrshoybM5CUIi
 iF188IlsOpesGe97rT3IXqzGh/rmkEtONoU7tCb13on+iCOcRztPVTIMPOAn1zgWgR3rplKy5Zx8sP
 aZKt5a5AzGW2KrbQ2DAuV0Tjkhud1eE/SN73pWWE1RKO0T2qBt9idZOrMXZiI9t9VDnAYSv0KRfqsq
 J+Bx7Q7XTyYIthCEGuga4xBr6Ay2oYG37N9LHt8pka4h8HOQ+94UobANQeoA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm SM8650 based HDK (Hardware Development Kit).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 66beaac60e1d..fc0649da74b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1007,6 +1007,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
           - const: qcom,sm8650

-- 
2.34.1


