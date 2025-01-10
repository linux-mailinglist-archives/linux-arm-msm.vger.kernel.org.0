Return-Path: <linux-arm-msm+bounces-44747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF0A094F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5F23169676
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E51E2116EE;
	Fri, 10 Jan 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkgiJ9pX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A4211473
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522488; cv=none; b=nJ0H6wVFji7CpdqnVD8V4uaMJepQ5USaT736GfMFETBXV9rBYQb0f/DF1bIqhlOOO7sxzBlfcsE1faQ8/6WSsAeF3YJeJqtGF0pDrjwQeh+ZJCiq/nHazyoaDT6ss4t7tm3tyjtTTd0dWlWTOytBiXtc+H7i8rLDPzv4+ZZhqFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522488; c=relaxed/simple;
	bh=6x20OZAZDWy1n/Lp2uA0gIfP0RiekaAArUBAmfzhPLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvuKZMz7EcYuFTYM5MJZmiaTjrfh0BZ9k44uFcNgPtRiIjTaTFFLE5Su9j/80CzjLkbtsCktrjHHeoBU+83FS+0HisS7q19dhkDZhc3oHxm6uLtIdjNQr60eoarIP/GVbJxz+5k4ccIXblPK6Y12rfi198xiwvfe9PfhAfMyX+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkgiJ9pX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso16185505e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736522485; x=1737127285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNw6RrrxFnjGJEmC5pc5dm4MEVwts4bariXribJ8s0c=;
        b=jkgiJ9pXSbhTML+UQj21Q5PcQwlZUjoOsz5jEv4yy7n5lfcKIaOlJ5YYjGifOq8Oe1
         71Ql8NwjGPBbwM7n3FdznIufRuT/JH/pRCTiwUz7rMuDn5BpAUc18vkusVnaj7FEUJly
         p9aZUHVTFPom025htQHvbSfSLNj+MAGaATEGTeLnpPHEpwE12yLMjSreZi4s86qfOsqk
         9S8sabPc6F9bXAYvaTH9yXwxEjKEmb5J0zcuGpVcpBNyj6WTC5amntug9Pu78k83nIIf
         3WeQFyxJ+898JC25RDurOA3+JQv0t57W130TvjFb/x31ucr/c33LRMHlp4PIiUmSGKER
         PUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522485; x=1737127285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNw6RrrxFnjGJEmC5pc5dm4MEVwts4bariXribJ8s0c=;
        b=FIbCfN23p5Ys3AS1iYabl5F2+sG0QNX7HfKSZJuktbhyS9muCcLRtaS666IE0a1tX+
         uhs9+VII/UybaFYWwQ/6n7aX6Xj4em9Nla4QYN0YsTZFItS571M84NYpByUy/b+YbulC
         CJy7y1HGp2iNuYJpksWRD/KwLOndA/ji8TBExnTJ0RYZdh7pykKIl5LFuQ+6ViuO2ZPE
         ylCwRFHl9GLCjdTe96jcwJqsOD9SrNw4GO9UrB5Bo0/JNS5sPfgWN6Kumc5fqtmmii/H
         FZv9TqtuFMqfSvqJd7Ik1j0/TDdCjdr+DWUKO+26cdE8cGTFpjPRIKAV45p/PkySKHYZ
         lPEw==
X-Gm-Message-State: AOJu0YzGQXuEkF+R2WiquyzsHEwwU9lrpypZsIQI01PoszDKH4BAcEvi
	yP2Ka+q888seb3pN6W7djab+U+l9UTx8Wiqi+H1tsOEFVtVLolWpna5YdAvKAIA=
X-Gm-Gg: ASbGncsn5l9Ou6too7ZAfewHkmTWAOM37goXzywFLdhLKbobJayKrfqCqAvRc7CepwR
	2bSvoI5J4/zSa7QySkLfuCdA+X+l7LPv5qbAQbyRfkw2nLjOsRYUQaOYgFNX+KJIctlblml5Hko
	pzZKaIdL4dDZN2U1sXT+YPR0aFEIJny1bk0hprNMGIcibbuDPKna2jfyuPZSGm+7XXIelF9WmOw
	MICJfWvayR3UtTW7sUQvjgRfGcyK3Bfv9ZT/eyRz+H//qs6gO9XfiIf8Pz6Eh1N4gHE/L2Qnvki
	wQ==
X-Google-Smtp-Source: AGHT+IEltLslQPijWojoVcbhrBHK4D3/fcWBLdJR5dEVFHmKOma7Zd4deVChaqPaAcRJa3xCwgR1fQ==
X-Received: by 2002:a05:600c:4314:b0:434:a802:e9b2 with SMTP id 5b1f17b1804b1-436eedef4damr33466485e9.4.1736522484928;
        Fri, 10 Jan 2025 07:21:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92794sm88714725e9.37.2025.01.10.07.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:21:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Jan 2025 16:21:18 +0100
Subject: [PATCH 1/4] dt-bindings: interconnect: OSM L3: Document sm8650 OSM
 L3 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-topic-sm8650-ddr-bw-scaling-v1-1-041d836b084c@linaro.org>
References: <20250110-topic-sm8650-ddr-bw-scaling-v1-0-041d836b084c@linaro.org>
In-Reply-To: <20250110-topic-sm8650-ddr-bw-scaling-v1-0-041d836b084c@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6x20OZAZDWy1n/Lp2uA0gIfP0RiekaAArUBAmfzhPLk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBngTrxlbDN8zf+COXdCpUdXQR2nXiX4+hMgzlbf6bJ
 yMSGzUKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4E68QAKCRB33NvayMhJ0bcnEA
 DAj2swcSJPRv8vfiExrlBZCOQsC3Aqebwfj7CDQbggLFualRA2eQLtwOnrXOQCmh4udUcLnIRlIpAM
 kRjp8fxmDRYcraN9LezmI6xM60Nt349J6JGBy3ArzGqu52G9liUhDcoa15K69h0zA2gn28igjxMnSL
 /fvhl4Dr9J2YL8R8LKgdNB++7E/v58oFPsRheE1XZfCQmixUju/z9mD2hRy1hJOu2Gqrclskd/c/Vt
 oXX2j06UunlUrPYa8HnKb0OmG88kSELaimYJtbwrhSunCNgAcbgxiqVDMxLnakknoGfedyJPKfdiiE
 H4wLc9U5bf/AvVKJvyXDy0kkecsERfLD2OPp2Brn0/QjOOnzOMsh7/zsGWgsC9qatOOPDvSkBuhHdU
 JVnfGmCqXpRMR3+Gr2blsUMOb8kY/4NWn4S4WPXZX7CbKtNN4O0972PLwdO3+YqkDrF8Sqt0auHz6o
 L0um3XVlMf1a1pV8om9Y7LNNd33fwArHI1pppo3c63CxG9TNtYkrx6M+qrdivoJsqDzsVeTojepJ1+
 CJOyIjXklxt2HqG6HUEdyekVPzw4/BnTRiDLQuAgppm5eLlr9XKfLbGJ4q832NRPu9zPLGclkwlzcM
 3baByQ3cyPaluwAoeOAF0eHVrIbkQRGpJM8cpPs7Q9Vy8J7J3mnOMG6Nzhxw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the OSM L3 found in the Qualcomm SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 21dae0b92819622fa56b0a46beaeb6f585cdec35..4ac0863205b3b30cdfcde6fe1bf5abc3b122a2f5 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sm6375-cpucp-l3
               - qcom,sm8250-epss-l3
               - qcom,sm8350-epss-l3
+              - qcom,sm8650-epss-l3
           - const: qcom,epss-l3
 
   reg:

-- 
2.34.1


