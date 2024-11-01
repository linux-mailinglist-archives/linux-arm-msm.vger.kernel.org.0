Return-Path: <linux-arm-msm+bounces-36639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D859B87EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D0DB22A5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D59514375D;
	Fri,  1 Nov 2024 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srlDLl08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F213AD22
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422179; cv=none; b=ZaFyWIT1wBVXkCyEnf90+7X+4GOsWqHMat+bXjhsVkdJt7zgHPatnKMiHqC/jQAfAlccHSnDSIDLwYbgAOFie51bd8CfZ6tdLj8KrnX7PhmsJ6yeNZaWNTBivWYUnY9OpeOBO5/tcGjRPpHyBQsiD4w8x4HvHOfIDIxuVnPxnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422179; c=relaxed/simple;
	bh=hqRZEUIGKV+Uo9Zqv3h83T52RbGU0wAlXf80I6pu39o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW2OofFNLLBgrjWCUM18PJ5o0NMqF90/Psga3sPEYoz8lzQkiVodGpn/1FVnvLOtKt7jflhcAswwTwEpfY4kWYomE1PtmKynDRZKf1wdNlmV0d4ikOoHu30oR0CsCuza2St6XAVygQuEf7y7HRumTgj5iLi7FD/Fm50Q2lA+4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srlDLl08; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53b34ed38easo1426513e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422169; x=1731026969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rw/+3t7ER8ysifIK3ic/vRoYOJ/OSf43gFUP2vajTv4=;
        b=srlDLl08MNlb5SmoC2i2F04gslQF7hKao9xGd6YMx1g3+IkPT8Q2SfW9V/HtH50wHk
         UUMPXnZZ+rCvxuHlwzZmv9/LGd9eH0jhqzO4AerRcKGtTtDiZBZca+vwE53KqTR1s8Tj
         dhe2ARLVjIZyaBhY/qNk8mbxl5ZxgMNI77v/WCiYRaGvVTjeTZ4I8JzwsTRXBywtNNv7
         4fEieaSKSFZ4s9RR/7C4T9BGP+uivYQFmnUEEIsytpzTqyxrx+JoLcjiaGTKbOdSgEE0
         ZA+k7srSKqERhN6DoxK6bvF7fweOCG1mBLo/Op+pwvFvqi0zFuJsKTTBJmCkq8vltoVX
         ywEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422169; x=1731026969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rw/+3t7ER8ysifIK3ic/vRoYOJ/OSf43gFUP2vajTv4=;
        b=ujuztN523ThZmER07CNp6yp7SSF4xJglnpdzXFoRpc1n7N3YTFgf8Moj9ex5tZcQZa
         noxnYkOXVYjE0Jd1NotQxd8+WEHfgA+4jQsGnq7wHk6Fqdx3LpYj7hDV0wfks6LrLnly
         jO9KmfaXAfObY0t/EIBQXaGj5NHpc9NhkgYeR+wSyBfNAvBpAhWvVCKAUS7Fir/w0Zem
         PSWe7bBA1XPfqA7ZPAJqeyeZ5hH3NtUm5o2zpm7jcKieckYNdH10RkxvbyRKRhFpzEQI
         hPcIWnfSRDsKS75gxG4w0vhilNCFSIWZV7tSPBYkSUVK4H0w3/95uQ5RPgQzvL96uroJ
         ouWw==
X-Forwarded-Encrypted: i=1; AJvYcCVdpHh+ATC2cDeG3NUC6lGqrwwLLLUeSZ8k/qtCw52OuIJf3CM6s9c594nqwFs6HALMIOm3ss/pTuv/2ChT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7BY2GEXkUEZhY7ezS/mOrscr+ZqenCNsourpxn6aGxv9687Wv
	Ch/h0Gb4z9iLe2sIfCvV+5C7AqTDEcT0SQ9ELOFeQk2/o8hAT9oRPZz3U2rEhIs=
X-Google-Smtp-Source: AGHT+IEt6dAE7GdyxmAaMfdY4fxd74AMuZu7+Q+555b/IKau7E+F9IounL8EFF9yvpG+KTUAShsLew==
X-Received: by 2002:a05:6512:3b27:b0:535:6992:f2c3 with SMTP id 2adb3069b0e04-53b3491ac5emr11164283e87.41.1730422169560;
        Thu, 31 Oct 2024 17:49:29 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc958c0sm374510e87.28.2024.10.31.17.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:49:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:49:22 +0200
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: simplify SoC-matching
 patterns
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-sar2130p-dt-v3-1-61597eaf0c37@linaro.org>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
In-Reply-To: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hqRZEUIGKV+Uo9Zqv3h83T52RbGU0wAlXf80I6pu39o=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJCWTuAcON8BST5o3k30HUiPQ7d/QdEBmJRGwP
 Y1/5/ZpiBqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyQlkwAKCRAU23LtvoBl
 uEPpD/9czDWkyVFnZBSBGN0mkQNkoZJfIasBacFZwRAjNSIvgRNQZ07kJBEzQQ14+heWMKX7uzI
 q0DlA2DVZ18NBh8JgQygW2aXdHHIsem4dU5lEGQ+TivtycP08OsEtuBoDe+j50kd57l1agciYap
 8U/YpwNHP40XRr/LEnS/1TdaUrgu1lfjtx4yKW5gc7BOGi60uCxvkz5ebtIXk1TyGjHd3pZ5zKw
 LJzXvqVb4cYNOKX4MobnYKOU1QbqJ0qF9PS00pSY5ELnjwaxqsK5anKvbwZwl6Piduw9KySb7vE
 hnw644fSqp5mGNWmJx3Tlhbo2sXDpaMrf0kvq1NHPQ2MwfC92tv2g+6Z/vFkv4fmcZuY52f16/7
 XQP7gHGthAS34O6YE542sM7IF6tgd1ArytflWB66Fh3wE0MFd2TgMXoUVa4Lu7W3dNPNwwss+EL
 nJQU5S1OLUFQK+nVBDKCuKAt9R20hDbx27zAp+hmp3WQnnnafPazWrWMGDt/6xeaWONUt34XCKl
 Y9HW922f/OUbveI+g7oEfe2z1EaYIGb9F9S9XSaNZh+jYPzqbLW5p6H2AEhr1+Iq86A55EqmtPn
 OimkBkHxl9vpE4iEooOWvyYecl6tYRQhdX2yCSbESnUfWH934EDB1ljV7FhnShc4OBDPPAVKDt1
 DMX28EX6c8lXpNg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The patterns for individual SoC families grew up to be pretty complex,
containing lots of special cases and optional suffixes. Split them per
the suffix to make it easier to extend SoC patterns.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d0751a572af39eecbbd2f8323a6c3c94b3fdeeac..c67dcda4c8169dd72e9b5d5ca4926991a730f67c 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -31,8 +31,10 @@ properties:
   compatible:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
-      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+-.*$"
+      - pattern: "^qcom,msm8[0-9]+pro-.*$"
+      - pattern: "^qcom,sa[0-9]+p-.*$"
+      - pattern: "^qcom,sc[0-9]+(x|xp)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.39.5


