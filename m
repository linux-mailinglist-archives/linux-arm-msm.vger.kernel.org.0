Return-Path: <linux-arm-msm+bounces-11956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B685CC66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB705B21EF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3434A155A25;
	Tue, 20 Feb 2024 23:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sVhGVHk8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526B155308
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473537; cv=none; b=X8MsdEKPUgcK20/axHloQU15/5X+ZAgxgzrK1121E6B1t30m6Ws8JDZJgclC6VdzVw6LVd/ZcbaSQvkSG15QrNBNPRo3p7qrTuA4AYx5wg4CF4cpEIsNGcsobMg1senFxrbFhHiK+cgiL1lXO4RTsXW9DTULHY7NmBDoAzN2ruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473537; c=relaxed/simple;
	bh=I72GnJCLd9/WSa0N+ty2v+dNI2zZTTJ7yTodRVOBsLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZhwpgqVDAViLYHpQo8rKbzZHWr7xv9XT4jtcxfKWZPbYzMicVzwcESsZ+GPNC+ehVNPgHmVBOOjnJl5B3N33bwV/4TW/Ae5i8Qd9PaO2Op0vsJkghANuL2ZYoktLGFPUrN/RuAM3aLJ1EiHv3rzbtOfAv7al0aJC3Kxi7nrsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sVhGVHk8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512c4442095so1852385e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473534; x=1709078334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4dH1ivAwHXEfRcTfOF8u7VTWdZsEwOMNlr3FVqkNPU=;
        b=sVhGVHk8+qu5zMFpDYMIPwZRNQUp8dTSGoC8Lyv+FDHDH67lCraZ/SNGxtNWDSEeno
         /PEh79gtDYRMeBD4mMjem5wSVg8HVNkM9w7mQ/TG1RON7D84YC61xfbsrCJXvq/s2OY9
         HROT1ouoH2IfPz965cVifP0/eEN+jcA9HKYHgBnqF1LQkWoW8yb4BFQYjJy0V815zBty
         br6auFElcBvMvpkEkhOI0Bnlvy0FJDvQn2KfI1kFesvfq0ZmKmrB+14JDdjniEY/d0XR
         hFxZggi8dItnihaIEeV+CyZUSNsIEA5naOd62Z6c0Wz4L51fyVoo6TWbY1lPCI9YH6DX
         U37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473534; x=1709078334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4dH1ivAwHXEfRcTfOF8u7VTWdZsEwOMNlr3FVqkNPU=;
        b=sqbzdhD4xPrOvFNU56FhR+oYwENuvGjeIgaZUf7sX0F2NAcEuCHWJmloRe5aISpJuL
         Be4T0bO8QO3M+l42m51HOAmzVvryQbKWDe5aUMIpcldjjAqMLX0C2jW1F9mo10Fro2SK
         l7kETrB2/1z2+SDuZapxA2rOPXLt1rG0JzGSIBdb3e4BkIfcjvfJ2k298w8aj0ZGGhCV
         /swjqAEeXnwEYv0YzPXnf5evhtakmRhZV1hvivW4GTuz90aoSY3oF4oPFTINgSXTwU7p
         UJvcKFZR9HiQp3YnZeZtBnDGf5kOBMLLpns7hlO8eoeCh84UUfX4Oii6DKZYUdwmqcQ9
         SMTw==
X-Gm-Message-State: AOJu0Yzh9mH6aI3dqlwU5Wlnrr1Lp53+rOr8JmjFwYiCWhjF3ygjAzTF
	SLi+SR7IOQv1+domfh/FUgKA25Jr79NQz6d0n2xnqsRGhc8GkpPCKIQku1M14AM=
X-Google-Smtp-Source: AGHT+IEOWHRu0nBY2wHAv0SKzD6r95/9wH2ZYJzxXoOE2qLCzqw3mSA1gzeFO97Ol7nFNqgpQ5fBag==
X-Received: by 2002:a05:6512:3f06:b0:512:8d30:6dce with SMTP id y6-20020a0565123f0600b005128d306dcemr11672739lfa.52.1708473533791;
        Tue, 20 Feb 2024 15:58:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a056512055b00b0051167de8560sm1438831lfl.38.2024.02.20.15.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 15:58:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:58:50 +0200
Subject: [PATCH v3 1/3] regulator: dt-bindings: qcom,usb-vbus-regulator:
 add support for PM4125
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-pm4125-typec-v3-1-fdd0ee0465b8@linaro.org>
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I72GnJCLd9/WSa0N+ty2v+dNI2zZTTJ7yTodRVOBsLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1Ty7+EA1phDtHjGy+z/YkjXb+FB1VvZvKJ3Tz
 kq2i4NHmg2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdU8uwAKCRCLPIo+Aiko
 1YUKCACNKbnhPO+7xDqVxHPQnHkNVFl5x3SNvshghflafN/vNrZ8ObGn/Ip0zE2ql1T04xserQM
 JAyqmTjPU50+c2PVmJRv/jCZs/4l+mkT2McD40NujQxRH+h1fgjJunD6hzX9YwM1F27JXGNjspu
 x07YaP51xAtmDKrZd8OnEGxZjx9NTOWAFQnNrlExaVQCVED/+Dgn/ibz7mGkAcpC5EM71Dd1IPi
 w/gUJu3cCVu2yHWNl4pFDNxlyzb98LaDrf6XqLCHdNyVMB6cvwB+dBkTD5YIjjn6Lgqm9SRIirI
 aU7Oy+I90nlGzyx/rV3ySgSNVg0LVKC7ENY81VP27ZYcAXfA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The VBUS register block on the PM4125 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index b828a69ccb84..33ae1f786802 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8150b-vbus-reg
       - items:
           - enum:
+              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pmi632-vbus-reg
           - const: qcom,pm8150b-vbus-reg

-- 
2.39.2


