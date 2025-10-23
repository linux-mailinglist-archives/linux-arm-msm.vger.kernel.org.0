Return-Path: <linux-arm-msm+bounces-78564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B813C00C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07B31505F0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454EC25785E;
	Thu, 23 Oct 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4fktc6SY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDDF2FFDEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219169; cv=none; b=VuKMClfZ4UEsDvYf15SCwsSAPBMidp9svWvt+UZ4UDdRowcGXu7b6zDyLmaUiUzRbFgfpNP7xO/G1f8MqGgCOtWjtB6OYWty35hOgHiRUxl+H+jCXK1X6JH2mKqzbmUPIFTd7pVYozYClMqDlmIQ/MNpTotQlJTz0f0viNaImQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219169; c=relaxed/simple;
	bh=3vO33C4prgEUuBZnqq5YTa/P4+mnJCFLtkGeOswFDlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaRyyNF0SAg0wx8OGVNSCwriB5nJ6HEzh760Nm6lqBvHfd68G7m7sYezRMIL4svG3GEvUrERZHtZ170GZxen816rtjTovQf1rMcw/FXhKAl+ZJoEiUJMUQ3MDhSXyGQ9i56msQustBVvu2jwkWzG6rXatYTP4EwetufJWgJqLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4fktc6SY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso1214553a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219165; x=1761823965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qX6cAic9M14UMmPECgjQFR7mMda0Cr1cGqbVwyyhOK8=;
        b=4fktc6SYNOhO1951KVSv9Yyv1Slytq70Km0JZtnk8as3vXR7bV/VQB3ReVus+CrePe
         MnthU/NN58Qqpp4kMaoj5ViobTcFfo6YGo3g3Fq+3B2RIayduvJX1Ik6cn1pBS+p5Vnh
         ahOpaQa7VlQF8xsgCyUaUBWUqwy7ZziA29HP02vBr+Er+YjrYG/nOB/BbN4jBvpKjQX3
         mU2uoInOz9Q5fkQGH2V3rQ1UO6Ts49esCIHEJ9Fw8C2JV1BElU3kxE6KCGIaoHTJ3T0t
         TX/vEhqKJWQLLSzKigQgxqB+Ing0cQsqZ2t4Pd1XbgNxdHTBCLwz06ZA3tGJRksN1SKl
         xnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219165; x=1761823965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX6cAic9M14UMmPECgjQFR7mMda0Cr1cGqbVwyyhOK8=;
        b=H/xdjIPRGOStPQcmuPNOlVf0MLBFU4txr9QGvilUR+L/TJVogdnw0S0RoykmU6cflT
         JmHcE0OwwP+06fcstIYlewKYYBUj4lVv3epIdzsNylzQXheJ0gYv+e1sRmPp6N7NQdbF
         uy1WyUg6Wu/+o/qVLR39pH/KLH0FGVY4wNB/CbrQlGkOyCXyV04E6zQ2PbRGzztsMh/R
         2GrBOHZ8EQCVsAdIqiFsIQPl85m9OeV6t+wdI6iJe7O3dxiJnSk39BToW4zbr4wcrF0e
         Pc8tlCGuxr9tDnsRm7FxUVv0xdCLL49QAoAyu/k6ML3mZq4S9oTgXdIvL/fPJcOCUYMq
         qFyw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Kjgz3tksJ1MYUNi5L4PG7shfygyGWoptbAXP5r8T+1aWLSvwJQieHbJQJpugY9L7/u37q1k/uoCQKQx3@vger.kernel.org
X-Gm-Message-State: AOJu0YzGLSxfTKlp+LM6MS3mj90DoElNEVObtX1cF1PDm43ccWXI6fx9
	SwB3LjpS9Smbl3kZbmeRf5dvU5GxjO9X/WHPajjvuYQdYDZRzCCtJKMAtLVQvhlJRs0=
X-Gm-Gg: ASbGnctat7CL8ICUCcUAfvyuUnf/DO8Pag6kRH1Io69zV7/XIk3uSdKZzndqIev4TYW
	MymVhi1qvgPnbs1EFyi8WzG1onDdEiCEl492VnW94YWsND9w2zR5HE7fsDWU4IE/GTxCINia/f4
	DBnL7lIqYbafOqHQJ18ggpv/yjrddP7VKW8mWfCMacK2zUIvcvkUXCLK+rWoQzrHjK8zzJSGWQD
	NpYTEHDKqP2XcMjWZWQ2+P+NUP4ZPIipzUuANHrS7D807b2UwWb0aCQf7Dch5xM1cxB4SoUb4Sc
	RnfRxzKFFfEmQtHBS8cFCoyOEtWlD+bzjmZajcPwC0tqmHIFn8Rd+XaVSx/goRhHC+f9eSjCO71
	04HgQSuR6guJAR7wzZmbfSxVBKQkoRDagDNEqkFj0wzqG71DuPIo66zG1TJsstD4Jyk0W8FPJqC
	oUGou3Rw8v4wscUxRW8k4amqU+coJ6/NGouqK8DQY/kGV4Mw==
X-Google-Smtp-Source: AGHT+IFeMmUZAb8+BZ7S/5mq8JGmfL733kMk+/2+3OfwZ4fzPVXJfBgAIEpqIhkY0LDxauZHEkWl1Q==
X-Received: by 2002:a17:907:d1d:b0:b3a:ecc1:7774 with SMTP id a640c23a62f3a-b64742414a1mr3091546566b.53.1761219165148;
        Thu, 23 Oct 2025 04:32:45 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:26 +0200
Subject: [PATCH v3 2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=796;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3vO33C4prgEUuBZnqq5YTa/P4+mnJCFLtkGeOswFDlk=;
 b=76fW4spLjf7RNyBrxeu194Jp/rr6uFxjDGE6H0VOOQxTM9LtGH9CG6F+pNst1snLtJ/a4iDDO
 IO3Be+jDDWXAFlx4KWtCm/znytapYUj60QEsAtNN3r1MEo2cnVwYPiX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PM7550 PMIC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..d0c54ed6df38 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,pm7250b
           - qcom,pm7550ba
           - qcom,pm7325
+          - qcom,pm7550
           - qcom,pm8004
           - qcom,pm8005
           - qcom,pm8009

-- 
2.51.1


