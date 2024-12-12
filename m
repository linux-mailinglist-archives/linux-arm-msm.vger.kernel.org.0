Return-Path: <linux-arm-msm+bounces-41798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96B9EF49F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDA217505B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013B1225403;
	Thu, 12 Dec 2024 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RisfHKDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D182253EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734022253; cv=none; b=HlvHiGQuBU8G2ZyuI0mdqQl97BdwuznZ27AR/nLYhfkQg7Rtxt/5bwabwMX/3PO4SaWL7uU8tK3VP8qukKkKBxzhRHIFokNYtNGJRx+mVpyYChbtzpZgmky6W8NrJGuYTsac7Dn1N7bY1UqLWd3Z1SdSYlXbk4QIKb6SvxSzz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734022253; c=relaxed/simple;
	bh=BBhhYc6WiR9lrxb02YxPKhDO0cLFxCtxBdQvIJoPBZM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=smfaLZ3281tAg8hZkiVOc/6d72iLuJtRMFXtuqSapl9DIqlmMOurbeYVNzSOZxppyZ02cFayXGixWmmhYkWVfXrPz6BnZ1M373ehWvroo2MVtKw7T1Lh6DOCZ14rUEyLBZtiWR3d4FW+Ow0xWHdQdoVx3VQ0NthPK3glnQYC+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RisfHKDb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862a921123so591421f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734022250; x=1734627050; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPR/U5M933Efza0Sv+7ys+dvo2ugrwOUgeWtNHtA3sY=;
        b=RisfHKDbgWpAHwnFsKRGpKvft4Y/R4Tsc/mdkBsBGMhPZ5fy/XVK1XrJQ4TSpiMa1m
         X29sC0L51VM59G9saZU8bUalIOYJFT22pVXsGb7HbUYCuTmfqeRfsvInkhoFiuHwnGVu
         2YgyCgUWsD4Gm8IFajR+qi0c36koKtcJfQv/439Gxw1SqshNv1ZLzuSLI0DHnetxSO9H
         XjQQG+HYthfq/u2GP+ZsbfcvSg3NPaqG/otMnPhNcWKYndc2q38sQTNJq4VeZUarbCeo
         cnj/swtHkaajSz1RuWy/fF2Vk4Z18+FJrQm2YDeLhd5Em4E0qMngDFBxXzL2xuqOmjKW
         Yx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734022250; x=1734627050;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPR/U5M933Efza0Sv+7ys+dvo2ugrwOUgeWtNHtA3sY=;
        b=TXH5tLugKH60kLuz0k2AkWPXvkp+apXub79TYtdjFGIdJNTI0iGRmSatjoKzSm+v59
         a7NGGW7s6tLFQrG1cyZbwIcdAv5YSB2czJ/PvMp2chzo6ZlisLcn4RGvVE3hd+5BWTUK
         SM6LFji7mGIcbp4j0HwafXBLBM17Ru5R22mLYp4mGJnFq3T2KXtQWJ9yWlKQbnsSkiIA
         A5D9ijVDKVN+KH5dFaK9xrJylZG4qaTrPV0MBZFwCMJHOzpyFPBM8XmFzIB5CfpcXAMq
         zgpC/EVI9Ry1UqGoG3rkikJCRy8eR6C+vLQLWfgx0EmsAavXUPXvzcPFL/w/sJs9p4y6
         JJOw==
X-Forwarded-Encrypted: i=1; AJvYcCUgDlFNAOrd0s4+bIEUT1pen8c8mnxe4aU+MzX1MEzgI0aEdEqQ8JzRiIhWDhxJjCtfdJ9sSrlUNAicdkRf@vger.kernel.org
X-Gm-Message-State: AOJu0YzzL6M6hZJMUxTV5yitHlxRyxgZXZEAEnt1OwPMf8Jsk7h3dNDk
	e+/RnaBDIU8q0WidJgcK7SJQ2d2se0srr12muvmtxwy2fNSNQpr1LyNhhI4VhG4=
X-Gm-Gg: ASbGnctjC4FDKAjLIXj+OANp7jf5Xpu+oitWmBkulCnrzCG0VPMd86nQ7XnzyH+7W1X
	FNiOzKYTz1JpM21wejSM6tO+gLV4dkQ4Ln0QId8qkMVgrOop4P2ANtrT7312jksGs3LC1vWwtaC
	jYSn/DUr+VNTnDoGukp5cL7Gtzrblm93oRIzK0eo4fbFgMuLwH/SvyLv/6akvcmDDt25akuI7Pn
	AOtnUsi6hr9oELnsqnaI92LzHMnoJNQl/pUZvpi0GWKUws7zeGSL2n3
X-Google-Smtp-Source: AGHT+IHqsOvfkm0NoySLQIwm20PgIu1++eFjQglP2vu3YdstNmTRycFfmHYYlymuN6Ezcto2U0UR6A==
X-Received: by 2002:a05:6000:1543:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-387876914c8mr3724631f8f.24.1734022250298;
        Thu, 12 Dec 2024 08:50:50 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a25sm4518264f8f.27.2024.12.12.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:50:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: x1e80100: Describe SDCs and
 enable support on QCP
Date: Thu, 12 Dec 2024 18:50:38 +0200
Message-Id: <20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4UW2cC/23NwQqDMAyA4VcZPa+jiVXrTnuPsUPXRi0Mde0oD
 vHdV4WBY97yB/JlYoG8o8DOh4l5ii64vkshjwdmWt01xJ1NzVCgBCFKPgIpkSb+NAMPtjUcclN
 CYbWtZMHS3eCpduNqXm+pWxdevX+vLyIs26+mdrQIXHBbUy1NhZoyuDxcp31/6n3DFi7ihgC5R
 2AiVKGoFFphTuKPyDYE4h6RJUIWRgqgDM29/iHmef4ADdtXqTkBAAA=
X-Change-ID: 20241007-x1e80100-qcp-sdhc-15c716dad946
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=BBhhYc6WiR9lrxb02YxPKhDO0cLFxCtxBdQvIJoPBZM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWxRiNIn+O0vKaFBYIqig8fVqQg6iFcWFAi7Qb
 MsKtTzGbraJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1sUYgAKCRAbX0TJAJUV
 VrA4D/9FjCuVtCYWL1NzbPmJ4SG5pwpxiXXPAYzUkBijxiM4nzDEN19c0Gz75XJkIaZnGbv5ezF
 b7bKJRjOU3PxvvE4eMJVLmDq8LYjxaQF6Z16+V6qlb1EHSl9wnD3xie0w303b2ZvAN1FkROdjMw
 UFaj4KRw28IFfh2P+US6So9kLg7S2rlbu19JOaOlKtg/d4Dq6fQ1gfdcFCSyGY0kX9TXxyoYmbn
 ma8RAVr9CWOMoYCsOgoYMPEG97V2Su8XIe9QWnMB6gKNFFkJB4zQclSgjWH4Y5QtN+/vgS4ysaN
 N6Ac2GDcpOZwydpC7xOjzEvkecSN3TjWtTG1+r738XmfTwyGOpC4slYzRlwA4zepOOz6feyd7BH
 JpFZB6rgDWGViAHn1I5gwFvzlXh50vKUYJfx4RWExebvjulYZau7IHrYMnCCkniw786X2QZWIEz
 IuZr+vHU1Ar1o6HOp961K2memMkuQ8yE4vj9Yj5xmNm9ygMW5dAJj+3lEorat+tbxTjV83vbRpb
 yJ85AfCzYd4ysX/Z7PLq/c/pjB3muI2L0KWPwUl6+v517JXvBtiAB88awxOVv83TN614M6RCO7+
 qUzhU6AiIafM0DYUEsRA7V2OT+mc479u638ZIiEnMGIWr3gdZnrAHyZBYShsqtNAB1vnfALWYBh
 GTAlHF/eJOvCQ3w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
Describe both of them and enable the SDC2 on QCP. This brings
SD card support for the microSD port on QCP.

The SDC4 is described but there is no device outthere yet that makes
use of it, AFAIK.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Squashed the pinconf for SDC2 into the patch that describes the
  controllers.
- Reworded the commit messages a bit.
- Link to v3: https://lore.kernel.org/r/20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org

Changes in v3:
- Reordered the default and sleep pinconfs. Also the bias and
  drive-strength properties. As per Konrad's suggestion.
- Link to v2: https://lore.kernel.org/r/20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org

Changes in v2:
- rebased on next-20241011
- dropped the bindings schema update patch
- dropped the sdhci-caps-mask properties from both
  controllers as SDR104/SDR50 are actually supported
- Link to v1: https://lore.kernel.org/r/20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      arm64: dts: qcom: x1e80100-qcp: Enable SD card support

 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  20 +++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 142 ++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241007-x1e80100-qcp-sdhc-15c716dad946

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


