Return-Path: <linux-arm-msm+bounces-73378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36BB554EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD3D5C4CA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 16:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71203218D1;
	Fri, 12 Sep 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdZOiPeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AAB320A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695633; cv=none; b=c2m4jLAtlOCad3tz/+U8csgh3QOXlARk38sQkHCFGXJnsZDuygDXnYnVU8qjeWItj6Jpg/ZGUZamtTJzQvDKeHDPrmlnQ86ikxfGslazRhSC4byWIG6L4TarMMFjgI7xk8f+EcdrdcYXGRYM/nIu5aOTpiwVLBe0NW4W0bWV5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695633; c=relaxed/simple;
	bh=8UBOYDmFEJfs4WfLWSXxz7SHIlZKP8MvbGWWCwqj5Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ay5KczJLH3twD282H/8op5lfw6Kt5+vSp7m6Ou8O+VL2Pagpt9az86RloDXLCkC2NLmBQF2e3XkbcVKZIVIJvTUvn2E9MuSek/V47osMsBZylREkWqUf10mtX3K8nMpC+Ng6a5jbR/nTgvFy7f8VCsNYsdx0y3gIlq7fW2nLYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdZOiPeK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso97358766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695630; x=1758300430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBIH/6xFJ4CKHkmrUYz8hVrY+f0TiaqC0XoZQc9DTfM=;
        b=KdZOiPeK9w+REahr5kTwkjuoiIN3xGG2dd6ekGwh6zr7dWHvDJBTU4tHiCF/aqLZOl
         HqTEM1Sqg+YI9+f63kuOE4jDIyyonCfJUJkhGMYEcViBFwZAH+vk2JcLnK9bkwxa4rVO
         AV7Yx/ozt4bzipdKrGPbyxdFSb1HFEFING24NZzIzcySDeGd+oG7Hsr8CKwP053Hk/Kf
         O1IGQ4G+NVp/bL138iJG3sy0wr+T3f7tu02fftH0f4BOgUQMy15XQqTJ1f3Zne5gxcbV
         NmMJqAWEDxrdoYAlzlN4RI1S4oC6TQC43fPidvEXtPWrM9dZJKvjsQz5qDKKx1dcHMTj
         08IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695630; x=1758300430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBIH/6xFJ4CKHkmrUYz8hVrY+f0TiaqC0XoZQc9DTfM=;
        b=gCS0rSK2Xi8EC9ssHmVmyJ2t2bnalmbiEGoIWBrQeVx1HM9FMQ6W0HTiX0UZEtbE56
         sTSMwmEjKwU02up0ZzUnbEpQhSrBbEjT1trgYTzcAQJjmng+EWs76HX1C42PUdGDcFAp
         u8VR5TGbS7LLB3NH4iyHnFNsbD1IgQ8WZoJTJifOjzmQscoNk+Z9LPLLVsXiYYrHTsOF
         X+Qod5SKu7n+oQJm8pbKjI90G83VCZFihlrv5V3wYj/xviWR1Ndb+9M1zvQFw5WnxX6N
         Aoubwh7mMrNtRrbzh20lxK099TvHUPM2Ag8omIlbrqXIrjRQr8T3LlMoc9tdzFpEGsGb
         2GRg==
X-Forwarded-Encrypted: i=1; AJvYcCUhHdS+VIsIl2LTToQCWVMIzFjt2S7fuw9hggDNgbazPkRgsN/MEAoURy9Zl72X3APXwNJtRyrrhLPOQojs@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDwz74mAwY+DYmL/ASTIpvOouKoFFVovEq64yj4vvPSjfrfTk
	AAtOQ5jL62d2zv7yw7a/c7hA6OirhohvDU3xJv63K8vr6V5B+ptNGUsA
X-Gm-Gg: ASbGncvlxsxFB4EbiGXhEtLnJIw/Rad5atztX+GduUAiiqxm4Fl5TwA5vwM1BZm7Ma/
	7oCrRYXPE5BgGUO2SolgrzYr1nE0X0DG5Evn7UurLKRwL8AFi0p/M//uvw88uJ87Q2jRtsLK1JD
	5+RVxWTUAq43monuQ3pHsYOsHTB357bzwKnxUoArc1Y+6mKJx2Z565IdmY6+qNmKoG/KowxURFu
	f0LkyWYq+8ARuRPt9UIy2gw+HhMMGGIubwHEhVxamhNxdg3AdK/slD4zw5zVvY6QShBHlG0UFLM
	HOX2b333vy11SSZ0eCPItu8nJVTpdDDRycnPPzLOVWMsG44t/97jL8/+ZP2NwC8anYg31OOkvX+
	430eJTw+pkdXk1zOpg9fJ
X-Google-Smtp-Source: AGHT+IEVnC1vZ83W/1GFOzBnUJcvLRKjrNWZhs5wWRl/ds6ThahAJ7LWa6sYegaQQ3ntCXaxEZGyPw==
X-Received: by 2002:a17:907:2da1:b0:b04:2105:e226 with SMTP id a640c23a62f3a-b07c34ce55fmr387180366b.16.1757695630023;
        Fri, 12 Sep 2025 09:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c337e785sm229786066b.25.2025.09.12.09.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:47:09 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 12 Sep 2025 19:47:02 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: sdm845-starqltechn: remove
 (address|size)-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-starqltechn-correct_max77705_nodes-v3-2-4ce9f694ecd9@gmail.com>
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757695624; l=1056;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8UBOYDmFEJfs4WfLWSXxz7SHIlZKP8MvbGWWCwqj5Hk=;
 b=uvwH79S5z8HxhK9T/W0ZDW1ZaKqKCR/2SEZqe3+MX+wl+HPd/yzUJq5c9bJZUnO18h1zugNcJ
 ScXPnAsaPDkBRuPLcqAg4yuweeREZcco9DT35cYYLGc2bLsTGYv7RWq
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Drop the unused address/size-cells properties to silence the DT
checker warning:

pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not
match any of the regexes: '^pinctrl-[0-9]+$'

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v3:
- fix commit message to be more clear
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 9eeb4b807465..8a1e4c76914c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -591,8 +591,6 @@ pmic@66 {
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";

-- 
2.39.5


