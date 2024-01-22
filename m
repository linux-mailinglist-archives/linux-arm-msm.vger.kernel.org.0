Return-Path: <linux-arm-msm+bounces-7749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E0E835F5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61F9EB24060
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF8E3A287;
	Mon, 22 Jan 2024 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+cuAPxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE63A1C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918768; cv=none; b=smAKt3F+oLFppNOG875gkbr09mHWGtNvHUv26WuJyHi5ig9adFx+In/L3Ht1NQeVYBU5pXID+mX8vv3aqC0FD6VASIKcsyP2ZIEHJUN5WC2sGZcEzc1o3K6+C6rh4/w3QCJILMNjtb8qwcI9Vg4E07iDe9O0b+gUs2L3DiUaNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918768; c=relaxed/simple;
	bh=+h107Pi6R3T8pwKgfJZSrLHH4+P8hJAZgW7JoVNcYRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dn4Q9MOZ3OfNNuafvDGtet09lluhCsz2uhxshi3+nhjOORJ0Zfyup8B6ioQDYfJFI9fSAEaU6oKYo2bS6GlHPm2VKaoEA/ye27LvZD6WJ7UYV7ZiJdQObJRv7zbr1y3q9k3P/a666MjJ2hAlcL91yKDKhZSBcxkG+kY1FNibxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+cuAPxH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33937dd1b43so452656f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705918765; x=1706523565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZOHRq92T6VmSLWBDiWm844eGtRdF9FmJdQTFZNmCJo=;
        b=h+cuAPxHPz2+M3xuj2FXZ/fpQsOMg2Xsct0YIymYZs9GHKdoQ49IObkvCgEQowX4Gb
         6zWQ4cHGuVg31wg6Ooufh8Iu7/UaGqmE7LHAewLeELU2yXHbY0gfdXmhvioRAGgKXNKQ
         QETxDlo4KBueV1Tmse4dqH5sqevV7mdwaZHPmfW8TLcsVo46i8Z9aa0txTDqpTzD8rzt
         o3g3FqscPXKB8pq9N5V33X9fIJx/5eZsfQvyDd5BXhWrSitglL0HrlXa7PN5C3oQyYiL
         KEncioGcEgqvmLo2YaIqRA4tSICNrom7GlSXL4IHcYA3ct4BnA2zZWoJEh4rlqQ+qD/c
         fDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918765; x=1706523565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZOHRq92T6VmSLWBDiWm844eGtRdF9FmJdQTFZNmCJo=;
        b=FrXrX/2I10P8AWGe26PURMdG76ASNRx6kpnz8tq3XHEI/pa5aNhWsIADzXpWgKAEsS
         pqGrcC4G0w7/gveGGMIm3CaBJqEcP1cvuYf8iXq8XpRZUGtjE/exUz7Rk7TUrm94oExZ
         D/zykHyEmjmFKfTgFSBwvuIf8cWZBdxcpgjkUBa/HhcYkOciR2OIYSMXrm4Yy5xImpSp
         q9IZcUsUQ3NKWPLBT2b/Zex4En0Cls09Hm5hHQRUzFflIOgMl6AVaKvPTXF+MuhQOewg
         pozLX3ydYOBZZQt9tNE4+PzSxK+xy0IhQTJKHP6svyaX2OKoy+UWBQJjwR7m5Vs87SlP
         LLrw==
X-Gm-Message-State: AOJu0YwBYK1jIytdYGI4rhxRAM9/rAM3t1Xhjxb9EUxlivk5DF/jhE+r
	AMyY8/29WycU/W4AzRIGpAej9LgdU86276xxKQoNHKEvztYZRvadIOlPLsELcdc=
X-Google-Smtp-Source: AGHT+IEy9KakuPbGhDWitVw7y0QoVWnr9CKDbmNIJ0IPB3MSWdK48fbTldAbkp0jLBIXc9b7rEWQ/g==
X-Received: by 2002:a5d:5f53:0:b0:337:bc8e:2ae4 with SMTP id cm19-20020a5d5f53000000b00337bc8e2ae4mr2594805wrb.130.1705918764919;
        Mon, 22 Jan 2024 02:19:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q4-20020adfab04000000b00337d603fd01sm10396114wrc.66.2024.01.22.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:19:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 22 Jan 2024 11:19:19 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document the HDK8550 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-topic-sm8550-upstream-hdk8550-v1-1-bff7eb3a17eb@linaro.org>
References: <20240122-topic-sm8550-upstream-hdk8550-v1-0-bff7eb3a17eb@linaro.org>
In-Reply-To: <20240122-topic-sm8550-upstream-hdk8550-v1-0-bff7eb3a17eb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+h107Pi6R3T8pwKgfJZSrLHH4+P8hJAZgW7JoVNcYRM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlrkEqlMTVRf/1e9Z0fJnfe3p7Gjyh3TDKjfWqvmQi
 kRcO3bWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa5BKgAKCRB33NvayMhJ0cjkD/
 0ecJYl8exTGQ7xWL3aC2ACW4zpQomgVeoakcTCOxvhClOs1zvfsNs8JAI3DegO1rP7Xbjo1ZBZManV
 XzyuphYkrH1WuQfp2jEt6E2aZkODNphwGeaZr1UKoOfBIJEAPm0DnJng46w/VFMz4cLRyXyZkEjq6R
 pA6p1l4JtujVCOv0UbQe3xYwjM/cn3ogQloCOHxIQaPyVLISnXFUE3aHuqOr3oya5DWyPu+Bc2DE0C
 1JRMREB/AuoHMGy95Pmtw5wTUgNZHjndfPtC7un8ggThehwTymFXlBT8brg4DofIz559cDzNiNhhDH
 OyBrOYqPZ67uL2UkUw5L6TyFFzwxUZB43KxaaqEsLcXwrguvsfQRdAqtRzFIe/L4Rhu8Rz82c7lT5r
 ucreSKMU41LPkDanojisIsrn+7zND/91/p8VnByTmP+sNi1pnhjN9yWhS+aySLt06RYu5QDqYxiqr6
 cfpHCvE+H8jWQF7bzVQtsqbr6RTkQd5j9TSbTJqSLCac5tkLQVEOVgI2dUR9j4cGMOQwbH01XsKSmp
 9ErvSjUsxgIrbYe9sqeDuZngsQB6S85WvUhhcSq0XW4/61Rt80zvRBv0tL4P9V6SmJyR0ZS2XzcIbU
 5zp90R83FrA9JhO4+sh/OuI96fTx36+vsnrwqReqFiHLTYWep9eJ5VsWYsrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm SM8550 based HDK (Hardware Development Kit)
embedded development platform designed by Qualcomm and sold by Lantronix.

[1] https://www.lantronix.com/products/snapdragon-8-gen-2-mobile-hardware-development-kit/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1a5fb889a444..5a4b267e332f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1037,6 +1037,7 @@ properties:
           - enum:
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
+              - qcom,sm8550-hdk
           - const: qcom,sm8550
 
       - items:

-- 
2.34.1


