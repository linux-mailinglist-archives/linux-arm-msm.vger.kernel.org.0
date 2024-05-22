Return-Path: <linux-arm-msm+bounces-20210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 442758CC040
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75E431C21ADF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B0082D72;
	Wed, 22 May 2024 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTWxnShD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF48288F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377414; cv=none; b=ht+u+E1opcjmXjg6/Ri1LUZWHpwvQU2M9JHCyAF8RAmQtvzbiDoczpLZpFAi/YMk4iG7ET296Mc5+SxYvvqR5+YRx5yz1gvs1THxVWwmy83yWN1BegCWvsbXkI8ljcpuS3iJMtC58x4cwiGaifwrv58OKq6Bn09LIeeHFywgvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377414; c=relaxed/simple;
	bh=8fClpFzgbj956EFn+uaJ6XnDcz4bIDEVxAzQg1CwQNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBxUYri3YMtTY+YE5Fo/Qz+xBPmP0Z4L8VEWVvEKpjsNWyRNBRteXPTlrOZac7GXeL5ukp4UntJdoUl4sfJ5gLQ/zylsvHVYwEUU9Biy/F2iXw7V3JTh2q0zkr9sUk4Tgwbx38Ant7TmDUqKckVWi8phMg7nOrzZxVz77oMhOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTWxnShD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57825ff689bso1997294a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716377411; x=1716982211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZoiqpvOKZDIGgJEiGUZklf8/EHotP3f2aXxSG+hvYE=;
        b=mTWxnShDD6qW3a6j4koCt4teJu+mT5nvGaLkGgFGtM3snjpiy1sGhdp2O9gq3LKahE
         oOBYoqii4KAEo43ofcU6hGzJ9CMeb8vfgEmOIKuM6xtHvZ7nPr2womhWbKrjt5kDRzhG
         DrgytcPc0NtZ4kL0dHmddCFni9+ItAYmMxhTpEnAAkyh+ljns/TP7nMQ6mnKDjkUmuFq
         pkNUtTVmXIBOfESME3Ax9tEzqRubXzm72HF66Paxjm0JGPzLZPa3ZV3bdYRjdiqOjE7p
         6QCxLDzQ+QDZXOFoN4JxyyuaFQlrGbezlEGzvXpmUa01ud8eBWO7iXtRWbahs2Ul2AKN
         Hzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716377411; x=1716982211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZoiqpvOKZDIGgJEiGUZklf8/EHotP3f2aXxSG+hvYE=;
        b=mzArHTFjsb+4ELcYQ9sc8W80M0c8y5JEX+/y8ikx6s2++BdMCLlNWlxRweJZ10ux/h
         xY5gnDhRCzErmH72bxdujhAFXpqhVX+u23IwNsneifiIUH62rTT691S8ztXKQ/qSwKa6
         Y5MHNZY9myQAAIDwDu0s8AYddwIEvGopXfNgYI5YxCHm4KpPYZcPa0ob6IFxnX8d66ro
         reZpGZR+bY2Fmeh5/lPCcu8GelHIJRIQBK/uliAGn1eR1orcrPUFSiKXjDZWmF+PVaqm
         PuydQha+JhWeQQTIwkTSjavxQQtoBqqtqflrm8pUYRXvnAaBGI0oNcS5z3QKHQbJAC5B
         TnFA==
X-Gm-Message-State: AOJu0Yz5q7HmhOX1PoPi7Z+UQ3S9j05iuDqYK/sPF3e/Y6k53zCT8pyo
	hbXYYgC4YDKR2oaKLUCR+bSHsPAAOFlSS1Nrp0Aa2U1FUH9S4ptPCR6l/K2T/U0=
X-Google-Smtp-Source: AGHT+IHsu8+uMqmAFNEqXh0NM9TQOod+Je5R+HNL20bB1H5C4/766DKxa0EsQmQkXNDRxRajWzKPiA==
X-Received: by 2002:a17:906:404:b0:a5a:377e:4c4a with SMTP id a640c23a62f3a-a622816dd71mr103849066b.63.1716377411043;
        Wed, 22 May 2024 04:30:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:f41:c55:53ae:4d0a:75f4:a9ea:5025])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01652sm1768363066b.167.2024.05.22.04.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:30:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 May 2024 13:30:04 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMC8380
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-pmc8380_gpio-v1-1-7298afa9e181@linaro.org>
References: <20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org>
In-Reply-To: <20240522-topic-pmc8380_gpio-v1-0-7298afa9e181@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

PMC8380 is a new PMIC used with X1 SoCs. Document it

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 50846a2d09c8..a52949526a2a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,pma8084-gpio
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
+          - qcom,pmc8380-gpio
           - qcom,pmd8028-gpio
           - qcom,pmi632-gpio
           - qcom,pmi8950-gpio

-- 
2.43.0


