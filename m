Return-Path: <linux-arm-msm+bounces-43789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE309FFBA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 17:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F5E162BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 16:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19461553A7;
	Thu,  2 Jan 2025 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXPsb/iD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325A145B0C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jan 2025 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835654; cv=none; b=FaONw5j1y4GXpYlwhyU60r1lQAm+vRSHLM/KcyT/pqE4sczZFpTbXD3QhJqcgsId/uOVu1qAfo9RxSSAWQZGieHxD5ud1ZhYRWDeUjUPoViwgWB5i5WEwrEGw/TLMxDPcljwR3wXUoDZ42y/ml28dvZClim2F+NbVxRBSyNItVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835654; c=relaxed/simple;
	bh=Zvz8R0sKXW+v8S3Bhes44t7kDwn4HoqHd22h8a2tqs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjipUyk8CdNPkOotKpGHVpLjEDZV+AWpMzrRIKqhDIuXI+01fYZNjD5iP/Jkajc5EkKZgZPZ3CeWA2xNn3etvZCHTPHtfwe6tUgLXJVtMaYXS6X4AMvrt8xe6uOOjegRk/LsP0Yo93Hp2RPhW7BXd3fpKVSRg5NnHVW7TYCQCac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXPsb/iD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de9f789cso8633065f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835650; x=1736440450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRM8PRQcYeaW9hfyEb3e4N6uuVKnpIRL7yayrrVI6Qw=;
        b=GXPsb/iDDUeQ7ANXvfwKg9CPm8tP0GHZ2l68ywOt3WrkndYVJn2kny7xg5EU3F2d5S
         tyy6nTYUbntdopshf17JrCXkGLdvp2vzuF7Z2bGqeYxfdIIyWReENTltKqMexlnW4NN1
         dmgviT5PubyHn7uLfGsuAsdkMO6sJUeMUg2yjcu4+HsrZxBO4KFL8vVbyEJLQGqEUljX
         0+v6towTZlXCLjb+8BK02bGsFNEPu2m83ymeGlAHpf5R8izWDWifw+v4FcVVBwBdrMlX
         zJ/sWVeaUP/J6XKkq/GDATPKTacDhiCXHiGaaYWrvdzLDxDNDSDvM72Y9MjlVk6WEMCN
         pvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835650; x=1736440450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRM8PRQcYeaW9hfyEb3e4N6uuVKnpIRL7yayrrVI6Qw=;
        b=LHYoKdp5ssesoSr5yIXVP3o6gJFpjHOD1Ka6q2L+4WakCHiEPxveH/qkObWK2dV6pH
         PeeYj9mzQVAbeGNZtc3xDYEGLNwUOsSXlFdjm3k/Rto+yn2IWHTKwgZql0tzgDFoiMR8
         RQ0KRF0Kkx0Hcr4LNizsGambZntyUVlY3Ag1Jl85pSPGHVA//wcvaV6Cs7lN5VWpFD5O
         Es287fI1e/kTB3qbwkbh5GtBNxRPEjzdqO9vEA92YpUPToRFT59H0Dedear5uqaY95hO
         yfDL4L59YoKmPjL3Jt36QqUcFlkIhPdrmnjv4wTcgaHef3DAijZe1DoWKEp/q0Oa1G+a
         2Kog==
X-Forwarded-Encrypted: i=1; AJvYcCVIPWUCHBPS6XZ7uU20ZstW/oPLkn712g5Ojo9nfBRaqoL2/E1ypGARW8jGC9jn9EmKJntDBtqWEgB6jEa1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwvb86hq3RtBCpDIQRWCQN08EkELQyZqD4LFdi706sX2D6lgZx
	4dGhsnc8iW+AA86Z6w8zyUY9eEsgbcR70BLz24XGOkQmAVZFmeRKfk1HcpuBHQ+ta0WPwHOntK1
	g
X-Gm-Gg: ASbGncvhu+hhrq9C1kZ6QTadA7BONoksrWLkDxdsdli64Y++EqGlO5bcE/7dPSeOQD7
	s2vt4z1jpuCxqUpvHlZOz67xOfI64H7HSRiV8wPGOCHshwvyvVTLsk/NTtSsMSVFMw5oct1CAne
	8wPxLpb7WihRgFslyyGF1jitbvMTvzltIichbwHVnEIEuYh10YBOS+qp8sRA8Jk0lJSz1rOScyI
	rp2VcW+eOGpPVbO/Qt0C3AqiP0kGtdsMw6wnBZP9KZH3aKIMqbzxxAnzsE/6a65ZQ==
X-Google-Smtp-Source: AGHT+IGZKYxx/OlYnS6ngsg5g+Cup4DnewIH5nbGpaqK7uKGJpkBI9NyYRPPLk8irCMYMufLgwLxmg==
X-Received: by 2002:a05:6000:1a8e:b0:386:407c:40b9 with SMTP id ffacd0b85a97d-38a221fe0ddmr36101367f8f.28.1735835649785;
        Thu, 02 Jan 2025 08:34:09 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 02 Jan 2025 16:32:06 +0000
Subject: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-1-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add the x1e80100 CCI device string compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index ef26ba6eda28e95875853fe5043fe11deb5af088..73144473b9b24e574bfc6bd7d8908f2f3895e087 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
@@ -224,6 +225,7 @@ allOf:
             enum:
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
     then:
       properties:
         clocks:

-- 
2.45.2


