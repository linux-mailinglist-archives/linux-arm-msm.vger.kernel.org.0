Return-Path: <linux-arm-msm+bounces-14073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8087B626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B77285BBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EACF4C9F;
	Thu, 14 Mar 2024 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWyH91IE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954C46A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710380579; cv=none; b=mUq01ARjf6fakhbiI2EbclGlTUA+9xdzqau9+mGR8hDI7Gz2miXuDFB5ykCuU+0DvwJJoPeRGzD9YLM4koiLGfRjakO6tr6evnaUMcx5DTMp+KB5gStPgerDKjS5fVrOAj78Ii2cWKBpUBSW15xvpgXQEwwwnKhVy8I/lbVVJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710380579; c=relaxed/simple;
	bh=/9o8wupjT2lFvIVQz6ywcaPq/J3mTzdTMJ1bW3KmM/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JM0dZeVGUuPkJsHKD0DoYLavP5H9DtSs1gFQ4ypmEl59RXB+g2jl2cKMqxvzh7OMYA/s1pnCShPnFCNDwVrd9SYxiu5iZqtHRvPzUhOcPjVwjQIAUapYFYGdmfFM2P6rGzTOp/Z+5PYrDxAGNUFnDJUX2LDCY63QJumB96GcZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWyH91IE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5131bec457eso436611e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710380575; x=1710985375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pr28EdwX1bs5qhBixWH7XvK1iMcKHzy7Xszob8QwMuY=;
        b=nWyH91IEm/gkRPr5MYJbZ7Znir4c1fJh7Ta7BIHHhH5aIwaN1nAV3MBxhfxk+h5ZSt
         /TuEj7DEGIEngiizIs/XINnjoAMy3Tpdbok+Ek/voVYS0EzQk66FdMdgLsm2mMD43+d8
         xY+ohO0B2s9EwawGX36PhSLvNYZriqf5NtbL4bkYXWGGnNino/2hUQZkPWO0dmFdHUme
         uFQPSaHleSh+EVBXbRZl7ad5urZXFrTuPviTujjZRb2ZCyhqZxobhSRBo9ptybH1oe2Y
         ily+kiNyXdoFv8l3ycSzrv624IdYkGKWsnbcsQUEgD2LeGfN0e2GCi8FFf0TpopCx8ZN
         Tdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710380575; x=1710985375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pr28EdwX1bs5qhBixWH7XvK1iMcKHzy7Xszob8QwMuY=;
        b=jPOmSNnEtuvjy9GGiHHchoZHKPNTeLrNnnkLuRc4rRhWCOH6yqwO0j+o5Qf8Cgw65L
         vuppbGaS+QZYWUC++Q4g8mMJHvDlKPjsbempyAeehqR0X2RMT7glzIwNBwN81gTb3VDj
         0gcF5mbTAWGLbE1XStnNHyC7xm4/bYnvI4ecp51EJtEjKj5xYjmK7KAIkVeRpIbOz0U7
         ouIzJkbv+4AOW7Ui+DWYDlPAnYufx0BbtMpQ/ksGYuEhy0N9GHTOdezOuGqUZzQtkYwG
         Q0FLotXGvLOJAeMEM2C9hEkweCAcDYeC9BJ1KX/0RCo20Ixn7sTbkl1wWFBJUG31G8/A
         OGMA==
X-Gm-Message-State: AOJu0YxDu4njaDESQtmRN2imuUmB0jweq3nr/hqnDlOjOL75Gij2sO/3
	WqvridZYMVGZXMe//m9Euw7Dcqo4M48kOYBLlRB8co0hP5V67PpiOPy46g084b+rvsNrkh9dTQx
	o
X-Google-Smtp-Source: AGHT+IGcTBHMI8oHUsiT+fZXBiRNdKrcPD4PPsQcNnRDNTflB8fcdAPSZ/IoAVPm6YeuwnWT7fad6Q==
X-Received: by 2002:a19:2d0b:0:b0:513:ca9f:3c7f with SMTP id k11-20020a192d0b000000b00513ca9f3c7fmr152918lfj.17.1710380574753;
        Wed, 13 Mar 2024 18:42:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u16-20020ac243d0000000b005131e4804f9sm66566lfl.190.2024.03.13.18.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:42:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: msm8916: drop dtbTool compatibles
Date: Thu, 14 Mar 2024 03:42:47 +0200
Message-Id: <20240314-msm8916-drop-compats-v2-0-5a4b40f832d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdW8mUC/4WNQQqDMBBFryKz7hQnDRq78h7FxVSjDlQjE5EW8
 e5NvUCX78F/f4foVXyEe7aD+k2ihDmBuWTQjjwPHqVLDCY3NjeGcIqTq6jATsOCbZgWXiOWfZE
 7Zusq6yBNF/W9vM/so0k8SlyDfs6XjX72T3AjJCyJ246fZMubq18ys4Zr0AGa4zi+yutucLkAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/9o8wupjT2lFvIVQz6ywcaPq/J3mTzdTMJ1bW3KmM/k=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qnMNnvFc0G9pHTL6ru0HYUu3d6L9ei7N6K1MiaebaC3
 Rl16as7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjAR5skcDL37WvK3hmrOms95
 iHXyQYHHPTXrfok5cXTH/e2u2i/+i1l1heEHjrSASG/dhIhXbmqmFhaXryTZ3WFL3RLx8+PcNH+
 B0s68QraSPTdTL616LeZ2zm7tbB1b+cNlveVxRfvbD1mcjC6R3fRlsbt4t+FJgY2P589qerAq3N
 V7rZGazs0uO9PqSTpOOnI1M9+9UjOcf8jqIWPy7vdnGrLa6qKuRyfmfcu/n+2icPRi7Lm7zq/nM
 C9t3BrwrLrwhezVb1YOos+tP6zefMwg9bGgKvOXKXuYOgMjvq6M1TQJsq58szR++Q/H9GRlb+1k
 y7mMRWnOtskbVxV5aFx6nyDfm7qiSmFDynP3k0eZVKcAAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Only two boards ever has adopted the dtbTool-specific compatibles.
However the dtbTool should not be used anymore. It was required only for
the old, broken lk1st bootloader. All users of those boards should have
updated to use lk2nd instead. Otherwise several important features
(secondary CPU cores, WiFi, BT) will not work with the upstream kernel.

Drop these extra compatibles, merging these two boards into the common
bindings case for msm8916.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Drop the compatibles from bindings too (Krzysztof)
- Add cover letter, describing why everybody has switched to lk2nd.
- Link to v1: https://lore.kernel.org/r/20240221-msm8916-drop-compats-v1-1-71acdab14738@linaro.org

---
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom: drop dtbTool-specific compatibles
      arm64: dts: qcom: msm8916: drop dtbTool-specific compatibles

 Documentation/devicetree/bindings/arm/qcom.yaml      | 12 ++----------
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts |  2 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts             |  2 +-
 3 files changed, 4 insertions(+), 12 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240221-msm8916-drop-compats-7f608aa48948

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


