Return-Path: <linux-arm-msm+bounces-73791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECEB5A00B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 20:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161CB1C05876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75910279DC9;
	Tue, 16 Sep 2025 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFXckyTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0EA32D5BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758045867; cv=none; b=s/R1tMkWixuEUsHLQw2ueEEu+XrzfPoUviOOGsSxp+acWTVO5nzNm9wH/KcMBtJknve6Yf2OT+lsiKgS9F7MKEMVQrIKXTJ/U4araUN5tPOvE8xqCwM5hUVCBlSLY1dWAyNq7D6u/9a+ycCI6SXDSYHodqSQVBg0DfobFwrgqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758045867; c=relaxed/simple;
	bh=PzcSQ8s7GfmxH7lt4N94QWfy7MnO8OSH0HGrI/uXssY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N4WPlxau/+yXwHRS0jveFbhRCXlY134g5/Et9l+R5tLgFfAazaDqLGBA1X6ZpT9m3uOIw/4h4yrO9xJz4E2LZGiYHJ/xrJ33otKQyjdwNXROSDKOm9n4uc3/Ddlx2K75knnK/N1M1p6GoRgx1kqEJqUhzXyLEV04Hh5bHmW4hg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFXckyTF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7742adc1f25so4012848b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758045865; x=1758650665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlMD9Q0JVitdbzhKoBVG9BxngG7xfjv+ACgNnBWgBr8=;
        b=jFXckyTF2Joss6ICkOWP/E4pJDdtXhIA/G2BlkW5sPdHs2K/wVYIUM8GiaE/YM/fX8
         YavV4Mw/Pa6HFFACKsgSyQQpKkDdy+XOpzsEtic8TPyDzH/TzGRAcyWp9g5HMnMaGMYn
         IVMjJ07k6L1kzaBgY5YoUXqR6O3OfvcMb1CYLp1rWcMioDFlfbkOKMyZ2oKV4kZ+EVW9
         IsJpYCszn98zDsQPacpdeK519NFOoxHq5kVr0PpENic3iMIpkPvrxe4IkcmVC821Br/8
         5s0ttX5k2ctUNeSKESMvoSNY+1FzkLIOgbsm71CWRpgwPBFwoMhkSqivAkuQ8cCUuwbN
         RF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758045865; x=1758650665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlMD9Q0JVitdbzhKoBVG9BxngG7xfjv+ACgNnBWgBr8=;
        b=Dmf2fTfWe0KRiZ+m4QJyRVWADadt4m6L+VETOjez5Qb3pSgfM09DgUlooe6s3heomy
         t9ST4vXVn/GDfzge4QXndiq37yUj3F3aoRtysf0KrkN6Jwk4pVqWXhG8CXazoYNDCEZ1
         JTQR5euFIuP6og8Fqp/+Ypx2A0eh6bKbdr7vv1KM4NJvFwtdvkJnMiJfO7CIKDCu3ddP
         3IHApa/qMcLO0GW+ouSsh1Ocahvs8LEe/U9cyQmDWo/pcwTHboDVoP9ANNMh686vqbqW
         4q8UHt+a1ERQbQy44CCRB2zwrFtwb7wcGcKekUIhHYywoLtnoA75QeTFWVF+rpovtKJL
         Y6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fo+xW+xnUXuF/AHbpuqJsVG/GwQzIgE20zWJTPfr5m2DDGRi8ZF/R2LTKkxCcfeLVORfqsU/ED2VxZ/7@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnzRVcWxDDaaL0ytvJLUbjP72i2nFPKfW5q2TfP7utnJGupFc
	5ougoleddvLl4+2DE9kxqwK10CzBSwtTgKA3sXSHi+2XN9HXulnQV/fx
X-Gm-Gg: ASbGncsDzsnzYAjt4eR/iLsrML1Rl5V2ZR97uI4gX6WH9QnZnxnNZzyOMjikVZ8W2pn
	EHN4q894Owwl52PP4PcJCh0bUl8Zr2KLXzQIRgmsuyGmBykggx9llw8E2hI/FDyzlxk2GFQitfo
	6mdkyzs4xG6kl5jeQX7RumtaYXN2tX6h9TQYokBTMmUU8jX74LoJ5BWeMUwqTdhZIHtF0yL9dVM
	Y936dKqD5rAfuKe6kUYSVWbIK1i+TE5OifDCMkLFhEMc8nvFYrH1bV9wTBRHhceCWYeEJCtlkZa
	SJrP/VpvLe91TSCs8ORgWRcHjgMZVxoEZita13HQGH3r/b1YxeTG5ZwKRCQ7HPbIBa38t9/EOrO
	pIDZa3uZad8wclt1xBs6IqC9HLoVbmA==
X-Google-Smtp-Source: AGHT+IE64vEQGGYu0FHbritPemhJAwVBgkK+MK3Escq6TQXLMCHhie2Kq66Y/kds7nMxdc8J5lT6NA==
X-Received: by 2002:a05:6a21:99a8:b0:243:d052:9833 with SMTP id adf61e73a8af0-2602aa809d1mr21763638637.25.1758045865256;
        Tue, 16 Sep 2025 11:04:25 -0700 (PDT)
Received: from archlinux ([152.245.61.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760944a9a9sm16329819b3a.78.2025.09.16.11.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 11:04:23 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom: sort sm8450 boards
Date: Tue, 16 Sep 2025 18:04:08 +0000
Message-ID: <20250916180409.157115-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bindings had samsung,r0q before sony,pdx*, which is out of
alphabetical order, solve this issue by moving samsung,r0q before
the pdx boards.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4f254922069e..640fae56f6ac 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1097,9 +1097,9 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - samsung,r0q
               - sony,pdx223
               - sony,pdx224
-              - samsung,r0q
           - const: qcom,sm8450
 
       - items:
-- 
2.51.0


