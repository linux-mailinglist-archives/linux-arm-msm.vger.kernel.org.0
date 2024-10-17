Return-Path: <linux-arm-msm+bounces-34777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36B9A29FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24932283034
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906B01E7C34;
	Thu, 17 Oct 2024 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOklv7Fb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418631E1A28
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184238; cv=none; b=tDs9jUfrPv6W1u4/c0eBYy7twHyu2WzKnOje0sQEh3mQnIWmJj+YuUeCfaY1sHu2hvgpFEIJQSxdG160zc2FCh0KZg9wY8AfJatUqvuS53npWg/Rxr5vRWV15f3urcUMmsXRHu73qiBjd7NODGYwJVcl3aM6324NszVmFWuIxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184238; c=relaxed/simple;
	bh=Bx2eQxGp0RF29+QUY/ufB1DhIZwqeSmn4ux3YLXYV4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQTsXbSBDW/IZbL/ofV5IB/PUm7EUZp64nsW6CL5KNr1hITqsNZ5ymYne0QrzvaDBkhdgSPYFFltDTc+PogwoWLTDcFkSZsam47eVnSbl/fs4f0LoVhMaxEIcqMPqGe9rLg1qGSS4mp+6sWRre0HCPnZ4dfMtP/FRA0QVqKMJUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOklv7Fb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a007743e7so1519491e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184230; x=1729789030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yimN+yREz+afeyqqzhay10kgPyw054AnTbgMeMYQ5Zo=;
        b=eOklv7FbPRlzlVqhUDn53ZaVI0smAgI2G8DPazCMVD+fxxrWmeYdZOWzueR8FBdFx6
         vFi92rV234HkndKQabJBkL5GN19Hk+8niHSjAa/unfj/dVXOllne/9phTDLJ/F+4E4RF
         zQdd/aZFXsh1w7iQCP2Y1nBY+c2yVY75d7eegsHA4CJExnlphstq86/U9KHyCDinQ5FB
         zYrI4D6MWGR4wjUy6NqyXC671CJ7DlZ1gA4mk9R7Ru40GRQZhlur0zAQfzBC9n5UpECh
         lCS19lqsNVpI3VNIbbIZ0oOkelKDXkD09axVEqbhi+DE+PMNJ1QUdDBn4z3CwHjynIOe
         WpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184230; x=1729789030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yimN+yREz+afeyqqzhay10kgPyw054AnTbgMeMYQ5Zo=;
        b=r+EhQy2mq30JvAyrfBJfRM3MrlQ5gEC3uZxHrsqzGC2nnWOmc0O8NR9gvue++hzkKY
         PHbNJpfxv+hNL8qWsX8GzBIJL8gdij3RENJ+vq6hjfyq4iiwywucBPbKznjEcupIWTE6
         JGsr4FKfoGZrYSiv3lQrHII36glVZofgdf5KiwCmzHrQH3q+QcD94MbMyil6HYUC3znt
         h7IDU+vCXGyymbwATGwI3vS16MfADr5VWj5XkWgBl2eDnWwQ8QcgGgP0K5tQmjOpV8xW
         G+eAElZaODNWrZzDY5Rq37+rQQMlB2Rag46377LoGaVsWJIy+p8dfM0KUXN17TeiQIQp
         dCYw==
X-Gm-Message-State: AOJu0Ywwe1Q1g0sXd91hiAtQfUylo4M+DJXKNGsaYwjTKpmVzpSq4Jr7
	ymP63BlSJI1JCML2Qe4lBfK+e56akDv1uywB6EYS/WFUwBpIwaUS0WvrASYmKKVtqICVAVWBGKP
	HtFg=
X-Google-Smtp-Source: AGHT+IGYF9uU1n1C1YSfETv/Y+Qhu+W/qKUavudU4v6pqsDvXiOx28iCbRn6W2v95lMUD41wG5bHBA==
X-Received: by 2002:a05:6512:3993:b0:53a:aea:81cc with SMTP id 2adb3069b0e04-53a0aea856cmr3573924e87.57.1729184230174;
        Thu, 17 Oct 2024 09:57:10 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:53 +0300
Subject: [PATCH 03/14] dt-bindings: clock: qcom,sm8550-tcsr: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-3-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bx2eQxGp0RF29+QUY/ufB1DhIZwqeSmn4ux3YLXYV4I=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHarvw0B3LkgUTtKB13GcxV7h3MBAXu9EcH8
 0Iiexm2zr2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2gAKCRAU23LtvoBl
 uLB2D/9L3f2GbYeTHqQ6PCU3Q2PKlGH9sbCJxTiW3Oz9T2s8ZjRBMBAXcEha87jMV7buoB8wdRb
 qbFxJZZE6W5/PoPp1vyYcuynRVlTuwG0e17jHYxiafi5pWRYcbDpwyr25eYQG/S0SlV0dVB2VPv
 5Ux7taAAbpUS8bJ4qkWf7GlKf5e/pboWNriw1lmUy4cpFTQdtdZFDt53uqUFXGlh99EqT+FDped
 tLPZ9JgrpY2kvH2mEZroTc2aXcZQZRXK5MWOhZ5oAlzzXlvnfPM3vMrpzPvhs8fiHqKm55mKWgF
 G2DXZiICE2ok1WFtF4h3c7jaENY9s+/ioYnaR8UT+fptIisfFqejtuHVJjSNBi2d2GGW+sJGPXV
 pdNxjYYjMtOqfb2VRHj6IzG+EFSXmPqAaPz0tTO1K1PU1YZ9VFjE6w+wza0wu5I8TDDHPmwiuQh
 nWOmmWiT2H2hgcfQW/Ye1rr3jEvylCwhhODeLuGq1KMANecBhfIlSvq9Ca8sPw2zTd5LU/Cf/+e
 tQIS9GIoMUf1wcVdVXU5bHpCRTlrH4gdMKPHEWpyZTOsnmj09ju3uYmgjRRexkdhumbgfyqxo5R
 1OorcSliM1HsQlr4Ph/wv2zB9jPWjX8N622fipp3z+kacn+C99CBGxo/M5+HHVmB1T8wLzEw3xY
 43yyIV3Y+FC3adQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the TCSR Clock Controller on SAR2130P platform.
It is mostly compatible with the SM8550, except that it doesn't provide
UFS clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 48fdd562d7439424ebf4cc7ff43cc0c381bde524..3b546deb514af2ffe35d80337335509e8f6a559d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,x1e80100-tcsr

-- 
2.39.5


