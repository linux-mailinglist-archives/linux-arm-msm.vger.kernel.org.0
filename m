Return-Path: <linux-arm-msm+bounces-23537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B23911E63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2B71F234E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04FF16E89F;
	Fri, 21 Jun 2024 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyois1DX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174416D4C3;
	Fri, 21 Jun 2024 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957680; cv=none; b=o3LVQKaOrqObZUmyIFh4Ijkcte8E1LPfbBPNFgKGxf9lu6Iw39Rt/Un9iPaM6bTpvb9X4FH8QNuH9kCiAd+ORmMgzE/Gu8wyCS9NNvsC7Fhjex29eRmRy6+nGizrvUqs0iv63Tc+DJ8E0cC2keAdAKmumfny8aBMCQt2GV4L4ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957680; c=relaxed/simple;
	bh=POLKPgb2ibF2bcxOwu0QuvrBlFOOaUpz7AkF1IGkqmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Knftqef/eoFwiyE06AAPOMOBymxADEvRjU/x/MNBPkZfckiu5D5jyVancDjPkVRjbGZGNwRu0vZIn9JmeXn2wu3EGZke4NsgxriWxl6vIXgi883gjuPFatYKZNSVcHv/gCnSoiZm/KGbmI3KFioDj0xvLF1+34oRU9cAnyE4nJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyois1DX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c819f6146so2133439e87.1;
        Fri, 21 Jun 2024 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957677; x=1719562477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UVA7OA4NKaaldsZtLrfYLn5A6RGbo0jYJk+0JeFk3M=;
        b=Zyois1DXo09HDzkbkPMQLQKeifrcqcZt1KjOOzr0rJy0Elp/5lMNM7q+BvrylYB+Q1
         G4NccjukO+8WOBL3rXlowc0VPBHpxYlTPGvBLPJIsZZ0W+48P+hRcz9110Eb9w3YFaAr
         LU2A7mE5LtW5v//xriVWEUIiuOZ75WkEon5pIUD789pWrVMm9JpR8JYzVazCNKNu2JDZ
         5/4F4GO4U1cKaHkJGDx01W5qVHqjjflAKV9/7PO3vCGsi7+fTw3iOXzKzuZbcpJHYAGt
         RbclVSfNkTCBugA+j0+EXKG7MiYNPkGwEDMWE4gnsQFUWxYmg/NYT9HK64M7f7NcDNde
         CTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957677; x=1719562477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UVA7OA4NKaaldsZtLrfYLn5A6RGbo0jYJk+0JeFk3M=;
        b=M3e8fIBbsuKuXhUhIzBW9OcZA7C7a/qecyfD44RRpMQllLD8MJPpIQ97SIZ1MlXxAx
         x73b3k7pJKL3TA0uqJ2qjM3SSlhCzOC6mSADvLKLp0HxhJiUYMER4fbkBmg9bWjX9mRU
         yaQX6XgK5NDeJn8j9HSDRQ36Uv7mHnk9mP4Ea85TRzOLaordb2LGp/tT9LJBawJxIyKZ
         rFGVDP71Hj94AefJ2ljAez42L1iRvFa8veluGoSHyA8Eu6sczktNWAvB3Zs4u2dDXXyu
         TPH4LILUyBEbgQUpnRWBo5WuCx7TjAMXHpHvUcvvE1BY29rkme5OdcudJFaZomvA7ckV
         TLhA==
X-Forwarded-Encrypted: i=1; AJvYcCVpo3ebl6RYalJmAUhhGt/TutGEsJ8jxh3qQ59cVe+DelNEZ63Z7eAqiQFqLQBuB4tujAWf/G8CeeleVTUPm8vlYiwkI3nFpf7ls8/K1aUAjlrCXwBI3pRVdT0BwSpA4MpmTMGYN9Hn5axiIOSlvXri0PdWOX6ZKq6g9TcgT+uP1abwrUvJ
X-Gm-Message-State: AOJu0Yy5CZ1pnG8cO9HfP37IrN1T51jvMCZETF1Z4FuQ+u292kjLmKEF
	A07616r1MaIeTK0rCcQdX08QxTRe698pIqPMxS8Dj/v4Lqc5Qy8HF7HzcFnI1T4=
X-Google-Smtp-Source: AGHT+IFFz1NpfUPWfrMU9JYbwUtaUseJW25McwsgJmS5Rw0bYmX3jF8s5qB4wIscOXUckTPqG/1kgA==
X-Received: by 2002:a05:6512:39d1:b0:52c:8a3a:fe2c with SMTP id 2adb3069b0e04-52ccaa91d4dmr5718055e87.45.1718957676299;
        Fri, 21 Jun 2024 01:14:36 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd643e419sm125548e87.243.2024.06.21.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:14:35 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 11:14:47 +0300
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v1-2-bcf96876980e@gmail.com>
References: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
In-Reply-To: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=POLKPgb2ibF2bcxOwu0QuvrBlFOOaUpz7AkF1IGkqmI=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdTaMWaV5oTU6YfSlhQWKEJQ9Q8uQmMZSaQjHS
 7wdFWXEgGmJAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnU2jAAKCRAOCbsK84IN
 WhZcD/9eaAWPtYBp+CQmh+AtNUrZIij5+pVhhdpfHPAC5XMJJLWRLJKm401UEE5KktS9G8phb4r
 lk5hQnTwLpHQ3y8d5BQx04rdjN3rTvR+quuBU97l5vOlaIhsBuyo2Kim47dVoEc02SK4CtnulvD
 +Zv/TuMqVKBSdMabadTAhnWmM7v98WfL40U9fyiThYtncC/pgI1rtBVy/WPEfTggy+Bj8AIWiu9
 eB5oI+YOOQ23up9ed0T3i67YIRKkbwft42XHjwhcGUNpUX4vvVcLgJmDQWIBgC68n8e6rDg5VVO
 chXplXd/Va96aKqpBwsOB0BNuPTbf3B4XIprajZvqkuRp/oh2YV0uY7xhkLeRBlT+mGh5g5D3Jv
 nfjNBTKSHq8bNqK87UW82nIFDL346qvr7StGWFvGjSeOoe1d21a9KryKQxV1Qs1/j1vc1wycFn1
 +AfNOZdjkWJWHJ8ZTj/+LFivqESo/L8wXmeGULXnz1LMNIC9Oicw1pqCfVCmiODKMjUH3p+gijS
 w/kfuujGuXzi+E53bOYiEYVLoH/UUpM9zTTPrttKhNqZcXVwleRNC9d5ARYom+zRgqxmpHU9FcR
 Dn+FBb4HPFI+HWxe27s5OAyRaeZ6hqTcOx6x14uNoSuRhcQphmxY2k67HYGDfqez79UPILW3lQ9
 6WB6yZx5/Ggpb+g==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

Add the compatible for this device.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae885414b181..e53f061fc1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -184,6 +184,7 @@ properties:
               - fairphone,fp2
               - oneplus,bacon
               - samsung,klte
+              - sony,xperia-aries
               - sony,xperia-castor
               - sony,xperia-leo
           - const: qcom,msm8974pro

-- 
2.43.2


