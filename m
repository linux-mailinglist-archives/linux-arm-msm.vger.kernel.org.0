Return-Path: <linux-arm-msm+bounces-84144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C315BC9DB56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E773A1AEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAC526F478;
	Wed,  3 Dec 2025 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ep4sxuCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1B270557
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734751; cv=none; b=CuboS/9QGcQPXp8i9RxxJJsbQbGp7+L/ar5CKmgvXjEhTHZ5uOV6eKiLagYiRgi0FvdXiRkZqtBlGD2kA25V1t0gpLNTqCKrkS0l1C4ygtdZRBq4mdxatWZN7xB6Gn6Qqo7Mut4ydSDp5HRQA0ucbiZJf29xT56JHC+WSj9sfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734751; c=relaxed/simple;
	bh=gvtwHs4Q7fU/wiAJURNCh6CDq7gJNYic82R6eHIBi04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gheYIR7Wo7ZWamLk6PBXBcJ69KRqoi6JGdjeHUd70qT+KozrvE+g4pyKwzo7MeQeOednzrc4F5pW9jsLIWpGOdrgZPBN8g2Fdx92iU9sxlcX0SXk+PEQ9cpKXFfc/k9ClxjIfn1BAqBXOCsQ2p8OboiWQkxTMGEZl1HNtfY5u6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ep4sxuCR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b960d8aeaso6699091fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734747; x=1765339547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKaSXUlOHEVXLh8PWLzYg6B4PKRW9ER6uIpZfDhfghc=;
        b=Ep4sxuCRFPixA0H5HQtPMofx5wvHrcQuA8ORQM0IeyP4X7zpSxN9iRijXspw5/Ohe4
         hWYQsBo1y8ufJZxrUNnpen3QnfPB+f6T1C7HoSm7xp8Zp6c5tIUd5JOfWJ3iY7CGCfTV
         O95XRuZirBX47ABoGhCqZ7d4QmFWmjFfWLt2aP/YRmJF6enKtt7yTHZfIqcrXW9JLuuL
         AkLGonCddf3rlfW67aJWW4B7PlptVIg0VxssmgGUNNfin5HkY0ShSFCKwZ5wnIHPRGM9
         fHFkbmAEdGRicNzFNbLbRqTxA7qA2/C9X2WvVZ714KcWtfAfCivLc40c1h2NaSCAbxdu
         Z+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734747; x=1765339547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKaSXUlOHEVXLh8PWLzYg6B4PKRW9ER6uIpZfDhfghc=;
        b=AvJCFi3SpTXYuMIWOt0kAf0LjozrYIIJEOkT4dO1PEwMMaSohBqnvm6oliMQ5QSU27
         i//OZ0cOhds9F3QEDC1iT4ra9VBp94ggNm0A7IPwTcL/kRjyyURy/T/yhjEJU9Dn7nvP
         KNCt9YGiakWQJ8ngqyhHHB2p3JZQYDTQAzV6XPkqWeA5To7u3gUVNV2TZ39fsG++QHct
         /FSVpArTppjV38Fn3FXnNnmwOqxq+QaJ6iU3A6qIFBPLhQivf2gtauzbZJWhl1OVHUXx
         ynSEpV4BfFOWJ3OceXxyo958aBFKY4q047GljZqsZJqDNUI9ZnmlSdW4ErDC3KyK37oa
         3B4w==
X-Forwarded-Encrypted: i=1; AJvYcCUOxQ8QvkljK1ke4oHkmNAFTNZJgaBNzfmjLUO9ku7f4J7Ndkqs/YV9IF9XzeRgBjWH8eTo1L7F604FoXkM@vger.kernel.org
X-Gm-Message-State: AOJu0YygRviNg0qMCQ4fhyZ23QAyFQ1bmvfVElHwi/091l/8ZQfQjjhe
	6Gp8h4At5TlezLCytn9MfgIVRn6rqMqirtzlOfbDmen7mtd7B4pNVkzliP0faTimL+g=
X-Gm-Gg: ASbGncuKfX0iC/xhnmEDEf7unF4wT6BAEi7u2WE15k1DMlizmkEyA0mQ1Ba5MoPoEGb
	7NwY+cLwm165AkcrCKcbDzD5xyjSDw9oof5IiHADCuV68MRAzLjfNc3ufR9mUrOcgLXMHQ7mpUN
	JaiP0fxIePWgunjbZx+UnSM0LWngaa861aNZSW+BD6Nz4gyTr056c/k4TpBcxUatV534X9H7YOx
	cKr+oFkMKll9ZV32LlQJRI6yDh5ue0ye8X3B5yRuO+REa5c6wzmdzxzLNeSKn/Hbzb7INfCNJhg
	jTAm/j7eUTgN1toyQ68/9oJWn/IasILYHPr/UH2OSUKJ1YIvDgYoE4UFVcdHGQfgLFWV54yFvE0
	pOBO5+E8GR8ycW4/CKFFHjWtv2r1c8SG+PJ7Mm1ctu8TbxOrzWEkLlPmabPEpyExJuS9+20oV/2
	Oj8AN1DVuL5HG/6HX5yAvzjXq3QWebmOaCVjYT45ZxPehAzI51e+O5Ag==
X-Google-Smtp-Source: AGHT+IE4OvSpZ+Tva5pQFBj3pilLC4ouzHQzIR8T5QtVzszOagKJJMJX26C6mDLYxcAiw2WT2m3wWg==
X-Received: by 2002:a05:651c:325a:b0:37a:3c8c:ee14 with SMTP id 38308e7fff4ca-37e66bcae67mr315281fa.2.1764734746855;
        Tue, 02 Dec 2025 20:05:46 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:45 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
Date: Wed,  3 Dec 2025 06:05:34 +0200
Message-ID: <20251203040538.71119-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5K3M5 image sensor supports only 4-lane MIPI CSI-2 interface,
which makes the sensor data-lanes property redundant, and it can be
safely removed from the board dts file. Noteworthy that the property
value is incorrect, because conventionally lanes enumeration of image
sensors starts from index 1.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 77a7e45660b6..48af6d114161 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -755,7 +755,6 @@ sensor@10 {
 		port {
 			cam_tele: endpoint {
 				link-frequencies = /bits/ 64 <602500000>;
-				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&csiphy3_ep>;
 			};
 		};
-- 
2.49.0


