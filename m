Return-Path: <linux-arm-msm+bounces-48952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28BA3FB3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C2A1890C84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EA11F1932;
	Fri, 21 Feb 2025 16:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmPgyQ3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B51E8850
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155041; cv=none; b=jtwS+gJfSJFmjR3QxMbYaiOr+k4KlvMxDOXli/efrUfhu2Q4QApaG2x+S/Vf6l+CJQrIP9fyP0iIrXzctwSSA4pajYHg6tpHEV/74pMT1H8pub6Gkj2eu/uiEvLKz1zbSi0ZEAlrtyjIWsg+OmZtnT8nQUZCLPE6SDoxDFCBzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155041; c=relaxed/simple;
	bh=lR6PjoPFKVsHG2J5Mucpa/CnvA+OdHPQdfRh6cSHZ2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZ90HCGErCPmJJCZpX/dpaqF+zvr0ylxVfF+rE0hfQXOBYGGoIjvohCeo+thp9BdjCdev1IOxbl4cPyoIWJwywTxUSu7YdRVGZZiCobny1swNX/ncOZS0hF9iM8idX/YZGnDK6ZQWmvxjTBhveddIjl3W4LwPpVauAx55OSkQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmPgyQ3u; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7098af6fdso35594566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155037; x=1740759837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK+UGaMVwf9jHj43qw1MVxGsWYAAC0YY/TWDG0GH+T0=;
        b=BmPgyQ3u3dOvGygxtmHi+uh7Qko1g/MNJ6IbpfbjveYleSUV7ssq7ruWY7xnaeAp+a
         XgpVL5885S3MWik2c9kxAm9B1irAxxsBNVyS+99CjepZZ1gKqlM4tISYfmyykVEVapzw
         iN+QrTlPsRiMxk+VKNpzckaJkm5kPrq0pdKTtIcbHHqkGDsFGArs5mIH5kM2BKQ2+RT2
         9+pDXHUuC6b1lC/7ZI1s1fvmJqhtaR0tKbqpJzzRHn2C2cdeOR3Rbq78fEW4cDeGJmDV
         g06/ZPhy1MNG359gA1SMswUJIVWvC/H45wuE4uxue6v3lVibKFFGR5Jn1kRLhtBIZP1K
         cNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155037; x=1740759837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XK+UGaMVwf9jHj43qw1MVxGsWYAAC0YY/TWDG0GH+T0=;
        b=vgURTCNYlmfNZmicZw016sqKkMME+5iMBSy4G4sGgJMnGnJRWLGM1vnXaiH8g/+os9
         biuJCWJ/Q/rbA1NxWFuqLjsUJMCvQMhDM1IqR7L1t3kfNMDWO+qwb+Ol0WkKiOsggd9h
         SET8TSN8U2XgD4Ks4CjLJ1ul5fRNh9P8inx7OZrWwCMvEct1WG6Psai6Ww7Jwh9I6yma
         7IzU93m02vqFoSeydL+pK1qRxg/ppzKpid1NbcSloPOiwLSrEce6+QfV9u+x83yTNvC+
         sJKFd1Mc16KTzNteIVgvBrKL2kcdvY2LxCCeLYbXjA9Otr+hx4BnWEn5/Hmh2Lzbefl5
         O8aQ==
X-Gm-Message-State: AOJu0Yw2m3g54SuUZgN/kjVWJl+yAucUBLIL4xC1DoRA131pDkP1fJo+
	isObdlbvw3UVt91oGkhtL0hprU81OkaWhPO1+8nQtMfdQwmbKxQ8gNhUGqeUsqA=
X-Gm-Gg: ASbGnct94j7JIdc3PV9kqclceC8aWWqueN7YDsAu08jTVz3OHdtZDAQ0hvyCjAHdsg8
	r2ZEUJcbxJ75rBqaoIrWsd1mn3dfAdyzpAR640FTVuJwPYUpk4efWP0o16S1v357WN4R/3+2aBw
	j2XHYIC4jnjuT7/4VglMk4VYczyyBaar2HVQfU85SiELvdSTV3beM6hHdgRjnAVrCNLgy0f9Za+
	ZL/EYzL871lF2H10oFRd0Hny8vuSYYX7B7qI5SsQNPB4kM08fDHLvH4L3aRhw4emw7RF9m1EbOB
	FDwzaTq7kCVF7FB3ivizrTfTashXM7nC2bZNawRRmGbE17vKVFD40ymgC3/j5oYnjKH3/rvCtYv
	Y
X-Google-Smtp-Source: AGHT+IGQ+rAbSozgRpZ+wRUAQKnKAFtQDyoOgn4zw1NGcBOvfIlN7bnUvJppMq61ZA5CTfKx07XLtg==
X-Received: by 2002:a17:906:4fd5:b0:ab7:82a7:bb1f with SMTP id a640c23a62f3a-abc09bed0bbmr162400866b.10.1740155037326;
        Fri, 21 Feb 2025 08:23:57 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1050545366b.96.2025.02.21.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:23:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 17:23:50 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8750-mtp: Enable CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-cdsp-v3-2-fe2891beeef7@linaro.org>
References: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
In-Reply-To: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lR6PjoPFKVsHG2J5Mucpa/CnvA+OdHPQdfRh6cSHZ2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKiX6zmspgLfQEa9yQXLuTIJ/7IFH1XCEFnne
 /GcOhbKtxmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iolwAKCRDBN2bmhouD
 16r0D/47ZGJeEzfqW5UMPrJaqTikLortSUuoqsmjK83OlbwW/37QqEcxcykllzFO+Ul/SbmH2gu
 Z0n2oALEOH17tCF+g+rgnwBW51ayVKpTOZ4bMf/asplS2vGXc1fTFb4nVB1Ek3dQ+WiQDeD9WIe
 /FAomUWnPhdo5g0ov1E4wTHXBvLUmU5wqbayQegK1qjtn65q80skpYUd84etVW2QhC9KXfPy8Et
 54sJpdCFW+QzC9OJf1romQTKaWHOUf5LQNIDuOFiMyroZSU3oDeqcZFrFuv7VrinUNZNRv86Ymu
 nL4d4BxHhyux+yWcCDNkFoR3BLaWsS0zVTK9I31e0rmsPIzM4f1YU2ClI18KB0SP2QJwfslsfZR
 9M7pkNnbC2atkyYxg7h6Eo+BnvuZ6C4/mh4A4z+zKeOX/oSbfpXRFltWxUeF81jac376xu0ETnX
 tH/KuqDY1rAnNAdqyC+ge3BTMDVU7jF+v3kp8sYMBuMAChjzgU4bBARsn9N+EW7HY3oZDoiPZ+X
 wbkV9IPahZyjO89KYGW8AHfQDdVj5zHU0mzO/kMZbC36WFkqUYyz97QK/CIA5RsgwSEKfVh8RJk
 /woTBfr+MUZOw++aM7tAGp0OOANarhQfG4drdzJdqfqiYHC9zVvIGOHPHhJcGLUPkCdSeounYL8
 rTXhUFDi9YMd8UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the CDSP on MPT8750 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 8eeed7f2f7766326cfc7830002768087e9783b9b..5d0decd2aa2d0e0849414534cdd504714402458e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -791,6 +791,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/cdsp.mbn",
+			"qcom/sm8750/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


