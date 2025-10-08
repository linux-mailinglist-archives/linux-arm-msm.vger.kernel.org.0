Return-Path: <linux-arm-msm+bounces-76485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C8BC6604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878A43BD91F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48822C17A0;
	Wed,  8 Oct 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyG4K0GJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1772C0F8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949820; cv=none; b=cczDp4EliVQ8rpoWU1lp6VUsC7HlwYpvfoYDJdPKq5OYMoRtj20/nefWHtYDhvA608K4ZcpsAP9vUkHskO4/e4R9oidi8xshRWRWyFySpk8+RgWqqH4HzMIwTPldWo4+h9U/Q6wn6InAJzN5SUODfDvBnmePIpmH9KuhQIi6ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949820; c=relaxed/simple;
	bh=f+9F2VgDwpt+eIZsiqDos0F36iTHtkLjFiXyBcqS6uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9CQiMGKvyCmHAFPRmbeyGawnKz5KBkOgx5QbPaboxwwGNrERt3Z77iUNUkx0D+2I6D3VgFZJzwXIg+GiAK3PPAor3TxcofZgudd8e+Zj1HH3njkvLrbr0fijo6Qq+P12Xpg2NV6Yx5Uqu2DMweC3BmnY0Quoyme0R2g2wdvBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyG4K0GJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4060b4b1200so241188f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949816; x=1760554616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP5ag3QpkMJrEI5cmmcvESLNbS46ev4g4xZc39EVqhA=;
        b=UyG4K0GJCmgWVLlEE3HkE7t7g0GDNfpshKXAL3Y9ok0wVrSxo4KXu0Kq3K//C4CfE0
         +KPWqg8qIsKfHHzC2R8RxWhT5NYG78yx+0TyycfYMGvP876VzYKC2CQ3w6clZhondeiM
         gTa4XscBhHyDWySuFzlDVaaGkqPteclMZPFeccOVKhvh4Nkg6/xCPAIUgxMTIzOTxnms
         vdCPffaA7XB23cBLMw32RHL2K8WELs+48wZyKG29j5dN63Oin/eXlTky3ja+kC9Nmn9A
         jJzy798Ook1rFkNgdXHtAoubo0kOZztTJvc62qEgu68+l2kjcHzAh8A+xoGmfnYyvrQs
         Um+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949816; x=1760554616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RP5ag3QpkMJrEI5cmmcvESLNbS46ev4g4xZc39EVqhA=;
        b=Es0m1ZrDSkRGHpRx7oR17pMb+QPJaIOIO0O+W9/VT8xL9NcEMGmM/cLceysD31XQPn
         tOVGaET5q9K4E5iHGB1tIDDROTqZQ7VmBevdDDugj6YKNQImvcBgnOtnvOkxJZBVyAr5
         6V8RlkkojcSt4zMPVg0lEvm78lKNl4vhNenHFpnrSgn0/pWGDnbfREILlXlxca+pRxjX
         nJCP2EhXAzCIc6BDW/CeX8ay2qQdp9zyvuWdYwayF861ZMBcKjC3rdEPKCn1C1e0kaMj
         fi/AjVlsuhd97wRqJcgnV8AXMRz1rPmx2QUIH/GHL+sTN3GRga6bR1kZ3lEVYQxoUb2h
         TAxw==
X-Forwarded-Encrypted: i=1; AJvYcCWuAeAoSODzUyxMkOXLmRVL+gEMYI/F3WG4EZDt+a8yptTqos4jQ1xulGwXROMeG7CAtDhCzaD5wZAEku1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KN/wnY0PYLPw9m4NPTKMHlogJ5yqOFiwpnUC/ySoVy5C9h+3
	PHdYOr/ca1z3TdnVbN02QlZOdRfJLBdxhca7LJZAWrNN1AWR52z/f8UjaUwImI94zwKncFDiZZW
	a1C/Z
X-Gm-Gg: ASbGncsHrfov6O/eOYwKkNZRedMUhazrC5x0f/6Yignv3R/Krsk6G1Tl2yrqWuSrqV1
	QraZ4MikZBsVr+k1m7jg2jstESwwkrsjx3G3yG64I0iGyKW/TnIqTyhcjA4n8UTjQ8eBnIXQRYU
	gWE1LFWP2SoegUAN9LvkM0aoaQ/MpDug8Js96euqGCLbQ3ROZc78gpXhJV3Ad2eJtsSsOVVOT51
	+0JuMD+b/7S1QP+41c9f6q2FFy+qL4j+zOsCopMadZoQ3yRhadZHglJpgheNPOWIYldwI0X4HS5
	9Rq5ezBqUxbR9rnQSnnubiGlouFPZoBOd9TyJ76JaGvmwqd+4linO0VUopl28Or4pR2tghDhAtH
	TRjrLoAPIsl09YhwtrwfNmB71v8t7CRaBjQUvE2/auLoNW+YnbJVhPx2snpfSKxKgvp9fcbH4K8
	W8wNRowg==
X-Google-Smtp-Source: AGHT+IHWb96t9jX27gWJcDQD4MNIhLEngNzoE/msC+TkOtH0mdcANE6Zxrpt9MlR78ciVFNKsFAmYg==
X-Received: by 2002:a05:6000:40df:b0:425:6865:43fe with SMTP id ffacd0b85a97d-4266e7cdc9amr2754132f8f.2.1759949815845;
        Wed, 08 Oct 2025 11:56:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Oct 2025 20:56:49 +0200
Subject: [PATCH RFC v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f+9F2VgDwpt+eIZsiqDos0F36iTHtkLjFiXyBcqS6uM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rPz4GLKtV0DtesmpGxsXgECs16ymYSjumw4wgsc
 vfThG5eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz8wAKCRB33NvayMhJ0ZLzD/
 0bRSvXEyLLXfAwLKWsNpmQsAaFhX8F8NRrnjNaxk8622UJm71//YRKdU0Es1FP09I/0kVPcR6jTv81
 nl8BMIcekWeK5SZAWy0AiANgSiYD0qTpW2C7DEx3wG3Fy1g/eTxwF6a1WRcLRl5rU6jhU90tO3+Ubq
 7LHfVwhwjxLYE/H6RsWk3ugmnUOFpnJl4gQ4qalESXD6uinXy3N52kz5afoJ3XN2sl6eKLWcns9w8w
 ny/8L5QssVB49i4asPTZryswNe2d3brx3tl8gIdEk3TYvwz95sjPBPVBktwYqsRRHj4DF6qS9cgd/w
 76j1lgdHXesQvgAu/4N62Al/n5DyxAcYNZmmBmr/aG7/3XZG1tZDIXMTJKO/QEUYZs6nuorSjZ7SHE
 POdS2lKxmK/MdoK6ki8libopFPRB/Inbp7KxeZZfwrem9edlCEi32Ql5AXivRvcWscTVPRj3oYVvhg
 qVJrgsB0nRAmM/xTGlgwr6jD/DayS6KKHiHIrryxcKp799jcKnjuY/ZuwWrqLOXAhAY1TS1uevrp3M
 W+nLyKasqR5+NflkS06dMGpf7ewhKdKIGO0eQJPM/qZrLOGt5Fd5w+3WIpxpu8Qzaf0+6Fngj1ZKg6
 xyMGgQg8MyMwWSyo0hQB+GW/Ux0hLX5/V4bWJEFo8bBfNzL0q3P5lckgXslQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to describe the block and master clock of each I2S bus, add
the first 5 I2S busses clock entries.

The names (primary, secondary, tertiarty, quaternary, quinary, senary)
uses the LPASS clock naming which were used for a long time on Qualcomm
LPASS firmware interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -64,6 +64,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  clocks:
+    minItems: 2
+    maxItems: 12
+
+  clock-names:
+    minItems: 2
+    items:
+      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
+      - const: primary-mi2s
+      - const: primary-mclk
+      - const: secondary-mi2s
+      - const: secondary-mclk
+      - const: tertiary-mi2s
+      - const: tertiary-mclk
+      - const: quaternary-mi2s
+      - const: quaternary-mclk
+      - const: quinary-mi2s
+      - const: quinary-mclk
+      - const: senary-mi2s
+      - const: senary-mclk
+
 patternProperties:
   ".*-dai-link$":
     description:

-- 
2.34.1


