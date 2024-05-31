Return-Path: <linux-arm-msm+bounces-21279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0868D6389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B207D28C4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6AE15AD93;
	Fri, 31 May 2024 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeoyGkDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17015B142
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163566; cv=none; b=vFHh6/QOVlQsy//mWDJOodEt7zvnaboEv4GY81PoVuehz1hPXnAwNE+aDrPjJ1yjoVVKKPI0IicNiIdi3dlh6WsjgYQEj5hNE/ZaNZ3KCqBiFQ240VzguT6wVkimgOkFtMjRvk7UvWvl1697kmDAcj0Tldb+5WfYxI8CFdir09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163566; c=relaxed/simple;
	bh=Jj35C2gsmeAKqAGSxKwpsqLfwDT0T6WvwyZo1GypbPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbc4OuRvEBAi30ppTaNkOhBoO0CycqDMdsAZm1IkncB5CcUlQGjqUc9G3co2KQF5EfZCS4vr4TsR17fUmM4weCmVIBmLlQnCxkyQUKgzov5TGuNby6+NLrAVokQhL4kkBeHFOyG2vmU0jekYlCtNBnRqnL271EjFF/1nTM1H52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eeoyGkDX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4212b4eea2eso8706545e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163563; x=1717768363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifHHoOAJfuCZtjnswpV2fZk0gvyupvUNPvgcYygKpcQ=;
        b=eeoyGkDXJPHkUta7VNGAIWWNVuLd1cnKf9zNyKzG4rm3WRG8VEPBljAQ/Xrg1xWKgs
         Ske6qPkTQ6xWRudU0Nguaqm+bHW2OZq7xuCGNWu5rlH/a9bUUVW2uqicV/z9zuufwtPk
         RRtm0kwMN4zQFRpPPMfJgz0QO9ayW4BZd3P6gRbWBRnsSFNbOwzdrjjXpY1UpSe6qoq2
         aC2gi5W1JX7U+6T9tzKdSVkEM9rqmOCJFhuqaNjVtbWjR12hJw1ULZaTCsEYTK5RyIeI
         GT2SsPxd/0HEC92UvgaRoKzS8TcJ4b3Fqo++OmYSZmY0u/iAnYpubDSAav+NWULnV0SP
         +Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163563; x=1717768363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifHHoOAJfuCZtjnswpV2fZk0gvyupvUNPvgcYygKpcQ=;
        b=PG62m+gjzsKuYzm0WNcD6t/hNXWRZv2ZFVG/tq93LIo5RWwn1+M2yvjWQHK9f0+qUO
         vA8z/S8QQE+aN0KVSxSKuVNjIB2zuQBq8UnY/b8NjBirIjtI22b+IZ9x14lnNAtDTOqA
         CB4YJHvQ9CbZynr5egDq6YR2VYs7pm9HZEEe+cWkriiWlhAgQ6umSnTZYlkYeMpnTh8B
         fhr/OEm2UOcljvPSPAABjxBxHPBaS418YItpeT2iMRECmBnW5NwB4Drdzj+DJPQw6+VF
         fHHW1fyHthivVm49uSDglBO2GJbG4TvPsFB3+5pXG4QMq8tmkQvf6+zvD8F63SC5VK/a
         dOsQ==
X-Gm-Message-State: AOJu0YwjRNIfRnwazXGCxCgQlaNdSerDoSy4B6vf4mJ3MDYGTwI4vgUl
	ClFPA4ZV5Ie3wYtX8dMNDYACGe50tTOiQ2AQW/p1S+CkFQv1ceP6FeJJ4/UMcdI=
X-Google-Smtp-Source: AGHT+IG6OcDaaKpgLQQXXWROr7G4bmEmk/pebfIMd87838Uu1cMe9qTFvZpP65S7U2/p4mJ8V0T8bg==
X-Received: by 2002:a05:600c:3d91:b0:421:967:7488 with SMTP id 5b1f17b1804b1-4212e0c499fmr13280115e9.41.1717163563277;
        Fri, 31 May 2024 06:52:43 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:19 +0200
Subject: [PATCH 01/16] dt-bindings: clock: qcom,sm8450-videocc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-1-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jj35C2gsmeAKqAGSxKwpsqLfwDT0T6WvwyZo1GypbPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYX/U9+dxgxWl6zpA8BmpOtGU9Vuo2Y8343C
 tsbOJwMD2WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWFwAKCRDBN2bmhouD
 1//gD/9DaxbglP7VG8nH6mLPXXse+ttiRMGhfAt5W6y4leqH/Mf77uZ0r5SrreSTMK04eF+7A1Y
 vnfcTvTOL//4vY03xcgfhvoKidWHx05qAbEar83KCj2J2vCDh1xvyyEksNOl8LJO9HrrJioLKIl
 xPp8iXOqe5sE0BCYOuJAXtA4h0yw+orv9LvrQGWYJu24+2TJHEXE+mwnPQRpgDVhE897nCeSBlX
 p6EYFhBFy7AO6zh4e9IEIvZSnue6lVCX8wX2WGgvfyptiIaYtcvfJiFeboNh1PE/FB6jeZF5z+9
 gRGlRNt0FizkJXgG9Rb1Y/3z5g/zeY2QkS2z0MNI5DQHqlXeDh9832RnY4tXfyksx34WAKmdpIP
 yxLnfpgv0fvN8Vlmi5OxmJFb1zyOdwG/xUty5aOczLEN31+oshly1Zzrp2kd6cWnl9rJkdtCzRt
 0Eas3yN02AjwZtFkXlLPe7u0gcpII4+D3J7j9SR/Wm1bn+N9oYwgkHK9VmJDicL26F5WuSOM77M
 kUC0L13qArdsu1+1MfEJqHd/fck6MHe1XzW0ZHd4ufxFnNwqqy50evJCqWUW7EHSehPP+9namab
 mia8uS9yhypSiH4UDNle/cyUKZQ/NE+QOQJ0iqAny+Qla//zksmBBjd+e+SNzOliDVFwd36579l
 /sYdCmp+jgYkjdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SM8450 Video clock controller
is also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml          | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index bad8f019a8d3..74034e3f79b7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -21,9 +21,6 @@ properties:
       - qcom,sm8450-videocc
       - qcom,sm8550-videocc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -39,26 +36,17 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - power-domains
   - required-opps
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


