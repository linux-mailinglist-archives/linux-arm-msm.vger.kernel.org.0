Return-Path: <linux-arm-msm+bounces-34768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB219A2845
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B28481F22F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E731DF245;
	Thu, 17 Oct 2024 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5PGKa96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903513B5B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729181757; cv=none; b=DQVOpDQ+sXQu45GAnoKP5M4SFCCbGIWUJkrBgW9vcxfAdAQI30wUsUOuKu06RO4m830P7FSNV408O5rXhW92Mmx0MXQlTZwx0OBa4l1K/Pc9cfu6g7bVhw7WCYnOXPPPrnTmR93Ge4+Y4iwlljiaqbzEfIsy1Ow98YbO1rVOL8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729181757; c=relaxed/simple;
	bh=aHdq0KrrFzLyJ8iKoDZPp7QVJBr/RhzWlbygPyC+JbQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=is7/OCWqBV7ZAAvh1AId8ke8Fqiu6qFFC9h0tOciGbHfBB2+RMrBf1Ez/sqMBZwmJp/TTAES6kUZL2OYrr3oraTMNMFxol8rOReF2w1uxJDtlev+L6DE1vrg39vL56lBIUvzORE5xHS1J0xzmDSK/10XVuJsnHf+HhugHra6+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5PGKa96; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fb49c64aso1688363e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729181749; x=1729786549; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JbpBkaXQrORXfY0uK6js7AaoYT+obPImzYVSfpHmMM=;
        b=B5PGKa964VxwghxdkKzgnc+VpxOPc0OtZs4PLvFLKineFg/wVuLPDbu5lnvmvTscM2
         CXVFL9wsM7WEHXis+xbxsrRST+Wlz6E18/+C0cNVQFbVIuoPt5UEg356Vwp3wSLjufVD
         /7c3ucYlAey589V3mIEFjuDtUlCST4LqQ7VkSaG8PSQWCquVrBmgDfD6F9vTt1Sd1smK
         jdhNbJGI8CWF7CCoNCccp4EjeLgFdbnmLklAyZqEvopqGhA0ujcxd+d99KuZm9iraWgh
         zK4MjqM+e0EOJFHCZT4fVp/6dlvVJ7wms2AbTNP3YNXq3kpvFB/75OlnLcH8X/aF9T3+
         bqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729181749; x=1729786549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JbpBkaXQrORXfY0uK6js7AaoYT+obPImzYVSfpHmMM=;
        b=hMfkYktMLhcCgQBYJ0YEgG0ojIZJuTtXyx4LQg9iuTS3JqAslFPGsbFqpk19SWyV18
         0hFR8r7uxGE0CCTKbUWykes9hjgha1t99K7GR4MgLx8O+vV5cdSQexyIshE6GF6/81uK
         J1wyJhzUZSM9yvyU7aatwU48lwgu+JnJnW4JfV05x+q/RHO+X/5iurk+7eH8daFHr+8k
         0E106j9YyDPkD8Qv+y1+dLkGy/9x39KFdCeRxHB8L4ATZpDasIe6zWu26glIFgBZHM9f
         PoOr5ZJhdshSQMCyxJgnQn/SU3f3SXAy5sqImoTApIFIS+YwCp60Qbk44gjDjKQPcA8I
         hr5A==
X-Gm-Message-State: AOJu0Ywl8XfSTNvCH83LeCaE2c4z65IFaan/DKHMM3pQMHHo4CxLw3Q4
	06ycDvgCqW0dycyJ2PEz3hhJ29DqazRpQt1anBB3ngWEQHbUWEOLLEmnCCuE9VI=
X-Google-Smtp-Source: AGHT+IEkeRFvHRlCSwwsTjYV3YxfJTw30fxHp2WSkWkiORRLCBYCW2AYXwAFzFOHGGJ9DAN/a+8n3g==
X-Received: by 2002:a05:6512:e9d:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-539e54d772bmr15422677e87.5.1729181749391;
        Thu, 17 Oct 2024 09:15:49 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa88f0sm807114e87.44.2024.10.17.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:15:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] pinctrl: qcom: add support for TLMM on SAR2130P
Date: Thu, 17 Oct 2024 19:15:44 +0300
Message-Id: <20241017-sar2130p-tlmm-v1-0-8d8f0bd6f19a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADA4EWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Nz3eLEIiNDY4MC3ZKc3FxdM1MLY7NkQ2PztERjJaCegqLUtMwKsHn
 RsbW1AGD2A0BfAAAA
X-Change-ID: 20241017-sar2130p-tlmm-65836c137fa3
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Mayank Grover <groverm@codeaurora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aHdq0KrrFzLyJ8iKoDZPp7QVJBr/RhzWlbygPyC+JbQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnETgyadZwr5GloAsq1VrC1fJCv+PjwjcUgxVyQ
 rEbt0usJgiJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxE4MgAKCRAU23LtvoBl
 uNIbD/9loH6TyOi0cC2jva3oFMOAPTxh9R+5HrCzcAOnfHBfBKUzWszmCH+UnZp9fNcklOr0U6Z
 +5zriu56i20xcJj6uAa7H/x+9um0/HspLgZNqupYYMFLlRG9b3gZ+mQuib+JpUJzKIJv2/PbS+I
 IETp5qSCEg8brMXEpvPZHuKdXlYJZH7lD18Cib0Qw364tRdsPFg+UfJ3bbbtJc410AaB8FjFKH0
 fIrWjwabqn9r6/qfF8o+TzhV3h02yIX+juKoU+f1zlOdgv/cWDGkjige9V9EKR3+JkYE7/5hphF
 h1wYeg8BtyYbnCdB15SY6bDaZL0ZSABTXof3tUqJDoZNMXgXuLoBdOANQlvSg3zM8IrZxnr/V9a
 g75uZNBgKPOcYBrKKLUYg+h7rq0XaJIOjZecbDOYa+RekJhfI1w03WSN9hl5Tib/3/7zKqxMODE
 joy3LSh6tRZ67cbttoF9PSRFOMD7LEpYarqwt/Wu1eZytqFSqrpMdozpKh9pCUavJILQLkmsxVc
 y1L+BPcmSAZS1V4cSIhVDFVarpywaIoZMPmDpg7G2LprSV8BHeZ9Zo8Rl61DK5frV8SR3e80rhC
 HvT4D4b2og1FxiWOlIYWq37JDeqY730bu46oSVgRmMgoZYApfzqJkdUlTMRMdBixofBWE0JyTbL
 EbOROLBBV/c3Png==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add driver for the pin controlling device as present on the Qualcomm
SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      dt-bindings: pinctrl : qcom: document SAR2130P TLMM
      pinctrl: qcom: add support for TLMM on SAR2130P

 .../bindings/pinctrl/qcom,sar2130p-tlmm.yaml       |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sar2130p.c            | 1505 ++++++++++++++++++++
 4 files changed, 1652 insertions(+)
---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-tlmm-65836c137fa3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


