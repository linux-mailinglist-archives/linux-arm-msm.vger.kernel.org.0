Return-Path: <linux-arm-msm+bounces-64272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EDAFECD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 617337B6BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E3D2E8888;
	Wed,  9 Jul 2025 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="o4+qvPsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD32E7196
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072930; cv=none; b=Intuq/KWm/IISG5dzerzcR87MPzkOQKUE8QRIU1LRlnndZ5Mcvg2HX3b/elNVs0+8Ar6WrzR///dGck4SrX8erQ8Aux31CZCQwBlcZRxJfCQ2wGouDgzeDn4cXwrDtxKAvJcWA4CesIlG47tW+dzvBX+bmxuk2QXLvYjU+EkmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072930; c=relaxed/simple;
	bh=RBqmm6y91+jO6MdXINPCWCg3viAFwnMdKUq3SgXL3z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/aTv/IFqq4sYb5PdYUuKvl2VikWg+aoVaXcDZfyQbFOLEkzaaglpK2GKWSd2R/jwmkhDcGnuTMnBGHOPxVbFo4X7RlViV/rv2XLGjVECB5Mr4rS8OOpCnp/61GDNRdf2QLI7c+upW9Q5OLnonAqsPfVqSjRZt2YYdSM8bRoqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=o4+qvPsY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso7408766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072926; x=1752677726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN/6WRtWv+PbFm6J3y+B0W74bkmxsW5QkrIaTbqFnB0=;
        b=o4+qvPsYfRKiUoqwQMhbRKBKXtpc9sslGmFMAlEvjAjAtQ1Qh7EJZ35fx2bKlvcQs9
         EXNhYt/6RsDTy/gzMHzUnLgexHGGWTM8Uc10u0S8Eyhq26b6y5eisZa4t8n+gN1GcOvM
         eJwrSD2n4uC062WtV1v7vsK9fontsS0nlc0WIjc4ibUwq1gwzSMfthuHxybceq4GKB95
         3HP4bsC5lIkaxQ4RTwuM/pkyCU0kvwQf7rw1Q3ARl2uruQgHb4do/vPTkxrq13/aDiiY
         iI1bmPsIbZ7JWs2XXNBV2ESSgiGVOHq9wxpQAlliwCRH3s7Y5u1YjNaGgAV5QDXCx20M
         fUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072926; x=1752677726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN/6WRtWv+PbFm6J3y+B0W74bkmxsW5QkrIaTbqFnB0=;
        b=u4BA8xq3go0xasNqJnatsx9M5tRD1iC3tSW37MgZ9v7aJeCbThJz2fmHrOx1dbeIgS
         e/xBLYSue+/knHDK/x18dmOARgNe7eU9y2PaaZ7R6VFVrqn79aqawGOT5gtywgr9Q1OG
         sH4whwKUnlyvXkzWNXK/1gRYzLBXiXVJwn7mboCJ6odXHKDRlVjacPvXbJoEZDytPJ9e
         hMzqAq0riUEO1QsZ2q66GQPx5SIB309osUHnSEEh3hL1xZ+Q9X5B3uwci8BgJRREdF3h
         MH3f4bZG0GiGZIb0k2G0VPskPMQKATZV5AkiM0be0p04OIC3+n2+HHa7DDsA97VX0ox3
         sDfg==
X-Forwarded-Encrypted: i=1; AJvYcCWI7HyjmjzuIpBtLd9VynXhmRslSROEPFCN+0Kp8T/IRacX5YLsCtepk3jBgGgw06B+t8QcknksPyUuFTTX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy603Ig4HeQ9M3zDz7zNyHSvCC1/drkTpDN1YygU012/3alH3c
	UHYLnEBaoSz6wtTlEQQThAJlJ1L7fB9pjMDRDertz3jcIbqVxIfVQb/kBO1XjprZhMU=
X-Gm-Gg: ASbGncs9/kdAhFjAcvSlt2QXS+AKvNBcx1q4dYHiSWMMXAJ/uJZJhlrT9q7mXz9v/rU
	14c8zKNZ6XVpF9TMYLlKQXJeH/p+bLdnjrZ3Z2dBwltFrBV2BrES22upb7z09CxnfRdbOmSVt2P
	OzGdijrfJA6qr8I4smQj5eItFJCukj1vvTydF6Z/erG3E6J5A8Q9SEKeMqLo8SPzId9I9Ss7vQE
	qSz9GSluRmFuBbH3IIZvuB3Kemt7Bjq3HjhCheGnYXFHGeK5uqCB0hG4QkBYd3HevQocK/NRCRe
	ZbtJuurW/k+mp33Aa9iYQK4OJqe+C++/8/KRkor8JXs1NAMaxubl6YswrKtmeav0D6wnHzl0uOc
	G2SbzSMlcPHKHuZ4wRm+3ZOVb+NOkc3jC
X-Google-Smtp-Source: AGHT+IF2i3QqxTWjuz5P1YW6xQ4cfF5i5ZqOygwIXICALdfEZ1j4uTvDCh18CLGk4T33wWsNXDP94Q==
X-Received: by 2002:a17:907:bd96:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae6d146ee2fmr277785366b.24.1752072926007;
        Wed, 09 Jul 2025 07:55:26 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:16 +0200
Subject: [PATCH v2 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-3-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=956;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RBqmm6y91+jO6MdXINPCWCg3viAFwnMdKUq3SgXL3z0=;
 b=hwGOCiTQWIof7HrmAiBGw2P9RUOR2R7YKLzD2dtTwUYTAmNlWb35hTXpZMFEfFaYmjFiUHBqy
 d2B4j4RXkNvDSM+jA2uL6VWuTxh1n7b9WZPphpHedP0CWDus6dVYyYm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 6bfd11657e2992735998063b3ca390e04a03930d..5bf0d6c9c0256300d00f84307b7f6ccf669f17c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,pm8550b-eusb2-repeater
       - enum:
           - qcom,pm8550b-eusb2-repeater
+          - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
 
   reg:

-- 
2.50.0


