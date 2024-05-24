Return-Path: <linux-arm-msm+bounces-20364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25198CDF22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6286FB221CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929255661;
	Fri, 24 May 2024 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxcJ/gEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60C816;
	Fri, 24 May 2024 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716513676; cv=none; b=jhjgjDkgdr5DgDUTlnwTOdgDwwh35QyUDOJRqyHGQ1PAJrNqbZ9ekGJGw+M3M8WjiWQQQ5WHFrIGVFgVFB2jDOClAreSdwonBOnPtCWrvo1GiW1Q1Cvt/4/mV547UUxedv2QqrrGDjIND8WCY2IQsMdGopHy5VMxpmW3c06+zow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716513676; c=relaxed/simple;
	bh=scpsQzdvDUhvTe/3dBTLqB9k9c1Eb5zONGw8PcZ7J+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgG9azRJb1uOaP6SWhSvE2EUynOKFVAr+lEYxZqsC7emfDSa0pX5WbyvGj2UTyB6zq0iIRJyWWTLEOiltvFm8qmvU+K8mnB/zkUGdxrWWQQ6APxD3TupAK/sTi6f6OXv0FZgRfbRkYsz7eNIFhza3FN0cEWyNmXbm9TXLaHldG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxcJ/gEt; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-792bdf626beso264602285a.1;
        Thu, 23 May 2024 18:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716513674; x=1717118474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTbz/VeL9l2PNJjzVe6X5dz4LfPGyPc9RfqIAHD5tDU=;
        b=YxcJ/gEthdWWG18hO3xvvCYUwZ4uk1cKU4rTb2nxL2yC6Tm8gl3NL6WxaytKQQRLSq
         pZFSDKup1MfrX0HBilrUpwSbfHf8uhs32vLqAOGvtSJ/ipU9hXtAP2T405P27mpQJqrd
         HlT89BL0Mhk6gV0V9IgBCJCZtdv1mbW+hP8nr/IeMCFlaYMKFhjmsdcQggRT8frvTDXs
         5SenlcrWSr4bNKtW/9mlBQJQpW4tVo24elVxc2OaTYwGLN/m6XbiAC5X0quMFrH8zfcA
         r7MgQYspHdOdEZWVWv1oW/IZs7BdoAWJ18T5O6L3iTKsYosMPEeNCuyqEi5nDaHC07ce
         XLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716513674; x=1717118474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTbz/VeL9l2PNJjzVe6X5dz4LfPGyPc9RfqIAHD5tDU=;
        b=GKqicm04Q4nlkAbj/Nk/kjp+4+JIa7XBnv4/gMw9B/Mz8j52erQDnhd0LEN2iXlWoL
         De5jYIf45RMln2Zib/fqmSugfejhzBpp9OfVxhHHUm0OBW7YQ6RJpTQGRgvaK/RfLarR
         mRLHBLZzx0TMYRA7cnJ6Zka/HX/DWwh+LcK3lJQLlG8b5Fa8X5Ln2e2blAWmXJvxVfu6
         KT3T4WBsZCdvfZhabBMasWVHmlebtikQVi+AJG8hLfNmZgOLeiTV07PBGf4PDDO16UXd
         kvb/FEOkWzyQgFEJNWyRhEhH6kjJW0WsKOaZqnOkbiYwKYhSmm1KBivJOlJ3RPjsJvgd
         llJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIka8VYrnuMq+lwwL25RNV/f+1+fgq+43w1Rx68ZsxvjMCR2ocsP6l1opEuesKBvMVImpFHlcJG/kvDzxr19cHduNx7zaGZ2TT+SmCSv/0ZR3Fi3Wg0SpuUZ+LLT2B+ojLe8O1U9ej/DM=
X-Gm-Message-State: AOJu0Yz9yX9GkUwPHLExS4XNf/z3y4MXuKEooR16RYtevSF91c0zn1eL
	+1SQlBf6sLSzTXxLT6dZD367iI2SNztAwXdPh+ijoFdQU2JeUuW3
X-Google-Smtp-Source: AGHT+IHPKqwwUCeIuVGrXCw2Pm7Neo+FjcbQc52BFa1IwARHx3uYgPPDL6BvOzqvB1zuzNhM24jcUw==
X-Received: by 2002:a05:620a:258f:b0:790:92bc:7a57 with SMTP id af79cd13be357-794a0a309f8mr747520685a.36.1716513673803;
        Thu, 23 May 2024 18:21:13 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd3345esm17467985a.118.2024.05.23.18.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 18:21:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] SDM670 shared memory and socinfo
Date: Thu, 23 May 2024 21:20:24 -0400
Message-ID: <20240524012023.318965-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the smem region to the SDM670 device tree and adds the SDM670
SoC ID to the socinfo driver. In addition to socinfo, the shared memory
region is also used for SMP2P and the remote processors, but they are
not added yet.

Richard Acayan (3):
  dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
  soc: qcom: socinfo: Add SDM670 SoC ID table entry
  arm64: dts: qcom: sdm670: add smem region

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 ++++++++++++++++++
 drivers/soc/qcom/socinfo.c           |  1 +
 include/dt-bindings/arm/qcom,ids.h   |  1 +
 3 files changed, 20 insertions(+)

-- 
2.45.1


