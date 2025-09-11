Return-Path: <linux-arm-msm+bounces-73174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA3BB53BB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DE93AA6DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 18:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9782DC788;
	Thu, 11 Sep 2025 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLgJOmrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654436CC79
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615934; cv=none; b=s8rtl6Wu1rNG10IyqieZ/f7cqgc1YFY14h2wuXKosbotmrE/BhVS9ULH8vNWw408UVDg6urlNRVAKEWi32978rmDDOcASW46uKW8Dbve18DQodwYUtWbSC6WzN2p8orK043b72jkrbmTHNmuKydrmlSXL8FOFxjlkwCLhI5QjaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615934; c=relaxed/simple;
	bh=cyIuzam7bLo5cww7G8I2d/pYlJRYJ9PIWcnedS7TTIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ojVrY21/t8xQs0bmLeS5LYab8fifGbIglhCCDH/7oPkw9ukN+RoaTRW9g7cVm58c7l/VSB9Z5iOKskTL1lAEuyh4byKDybVIX2hevaNvONjY/+ig9rGYTozWkTf0GF5tL6W6j5YfHExQQQagnxL8JCJm28fLu+gdvGa7I8p5GD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zLgJOmrz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b079c13240eso177319966b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757615931; x=1758220731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CYEVlIhuAwsxdbPBZNCG41bzVEkVebpPHWLaYcA87E=;
        b=zLgJOmrzC5GlulcBkb97QZxBC5YjcKtaqUne/ywS4ffr0xBRyWOXpOA6BULPNUQHlN
         Cgf/H86llw5qT6jfSLxOV599mFEyf1yF7FBzM2weQ4Z/AL77QBytZvi9ZU2YOy9QfCC5
         646GqtrZW4sHcmMJxKKrKERLFIiIOR6E90MvHi+nCNUTOqY/FlddITSWNFBRYBDeiKfJ
         SCzu/BHSqbz2sUi+A66ymABKJKjPmt4x4IInfnYkA40O8MnEOnWoTYAFIaK7Q9DE0jkg
         dea35AII/I+hTFfSgttJF5HfuphwuE4IqPM/QaP3PtwfDBKSAUJur67ZEazN0L2mHs/A
         fong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757615931; x=1758220731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CYEVlIhuAwsxdbPBZNCG41bzVEkVebpPHWLaYcA87E=;
        b=hraYPunb1E2zZnZP0DrKGDL3S1uNuOPAsdQ9E11jIFWCc5TwrzuUjdEetOnaz6n6uO
         268+kNUVs1ckd5Rt83PCzcCwbTW+0e1ezGLrIglcHfHKhduKR4jEByE5HPj5jIR6o97e
         p5iHKCv1Yqo+KKFngS7NaumaTtdxJLTDryka3jxIX3qZNWEqJjvPtx+NirOAZ4nxlOQ1
         e1xEeNqfX/96NnshqI4l6zYMGuvWuIiqbGJoKg+KiBvcf4YYVeKIV8/GODHo8O2fYOcd
         /U+EyO9VPXOz3H/vLXeUTX3+mPmuWcrnG6uOwF0WeDukrhsNlqqTNhjhG8B6desJDCgc
         ENWw==
X-Forwarded-Encrypted: i=1; AJvYcCWsVV1mQqKRM267YaN2QX3layJSNhSPV1EAb5WhQmGYeR/Y4iJZ/xDmyvPWcRVJuRp6gAaYhZubt73LfUB3@vger.kernel.org
X-Gm-Message-State: AOJu0YwBq0Kzd31HsXItMs8I0F59MUNWoQPc5CXhv+uDz0mH/kT0tUuJ
	/j3NVrXWvFXQzO12G1BF0+1AKj5kkbpsSfcklZb/3Xbyo3soAlPbSKMJNR31P9Jd1w0=
X-Gm-Gg: ASbGncv02bQ1l8HpZknwjOA22X/vTntcRB+cwPjY2tI/D9Hd4bW4FoI1szyUR6vc3Xg
	NSy+pu2utqWU/Jz0kBMG8NmZs0gOQ8nPOnIA7Cck0rmBWZQeIjBlBzXvKADGrs/kRaX4XuHDNQR
	dCB79mVjWv4GWnHirxN5OC9mUQUZt/nWJ0AzDCo85woK/6rQoav4BlmRU8MaC6+FRKO8jdlwY5O
	vvHKyWwuPM/kQIMMJnkxNsAa9kTLsoMLJ8IJmVsGK1IQy2O9eGLaEQQ0Ks8C2F3g5VWFKEMV7bb
	Hh5iaAXA81jhWCJlGRfeKe//T6m8LGHuXQVIdP6CkrPErUkQ+wHIvPrrvkkQk6xdVtDoSMX1/LK
	ug51opicsFuIUO6A8I1hgt4XCwQDkrLyBsg==
X-Google-Smtp-Source: AGHT+IHuyID7DG1/KskiWhcy6TIsIYPl8tY5FAE3l8iO5JPheONXetmpMP+YXEkW+CxLttaXcg5qKA==
X-Received: by 2002:a17:907:da4:b0:b04:2cc2:e49c with SMTP id a640c23a62f3a-b07c35bbcbbmr17109266b.19.1757615924030;
        Thu, 11 Sep 2025 11:38:44 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:725:1e09:bed1:27ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm183999166b.49.2025.09.11.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:38:43 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
Date: Thu, 11 Sep 2025 20:38:23 +0200
Message-Id: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACAXw2gC/x2MQQqAIBAAvyJ7TljNDvaV6GC61V4sNEIQ/550n
 IGZCpkSU4ZZVEj0cuYrdlCDAH+6eJDk0Bk06gktWllUV4mzDI+kDY01To3oHfTiTrRz+W/L2to
 HgGADEl0AAAA=
X-Change-ID: 20250909-x1e-iris-dt-eb0494a130ca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add the necessary definitions to enable the IRIS video codec for
accelerated video decoding on the X1E CRD and Lenovo ThinkPad T14s. The
additions are largely copied as-is from sm8550.dtsi with some minor changes
necessary for X1E.

The PAS interface used to boot the IRIS firmware is not functional in EL2.
The code to start it without using PAS exists already in the Venus driver,
but was not ported over to IRIS yet. Discussions how to model the
video-firmware IOMMU are still ongoing, so disable IRIS in x1-el2.dtso for
now to avoid regressions when running in EL2.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (4):
      arm64: dts: qcom: x1e80100: Add IRIS video codec
      arm64: dts: qcom: x1-el2: Disable IRIS for now
      arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS

 arch/arm64/boot/dts/qcom/x1-el2.dtso               |  5 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  5 ++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  4 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 87 ++++++++++++++++++++++
 4 files changed, 101 insertions(+)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250909-x1e-iris-dt-eb0494a130ca

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


