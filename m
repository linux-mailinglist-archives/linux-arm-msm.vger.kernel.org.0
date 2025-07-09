Return-Path: <linux-arm-msm+bounces-64219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167DAFE81A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF1B97B16D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835992D97A6;
	Wed,  9 Jul 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ob4PIReo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873282D663A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061610; cv=none; b=WXrUG74kea7Xl/jdIdlHJZN9GDGzmQL/GgR4H9ikTtuu1BDke4afiqQ7ENfqKnUlqcNvWy5BUHfUD30/BtZBtfPGyBMUlJTDvKIJoI3RL15HPOHqXHcQE6PEaQNanRdeDLwaqPQpv1zG+tf58p7Uyfj6ipxD8Th2ellWy3zoZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061610; c=relaxed/simple;
	bh=g50h0b21o9jDK79Pni6TRJUIQF1PpFN5TZVZVqE7T6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEi9YyRlsd0EALjAM/MPFhTmVcXW2HjgfdIDXIKXA4pqnIqgG/R67S/ZLi5jNiVwKnJ/StTjKVjtXejQZ5uT0SopVEiaKdRL54AVHebDugRf19CNobvlFDZr6TUr++ydgWWnYOluguVZnkasimon6NK2lmJCYIdWaOpWjR9qZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ob4PIReo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1066029866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061606; x=1752666406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfzIi1YuPj7vEDdWX0E+BtY/lnIkWXKOrOjK3rEMMzE=;
        b=ob4PIReobgG/pdtLop0zVpxlVA2PYJ9P9eMXRjHIQYUaF3Qi09sFBeqZMpJEL8t5tU
         iWQLg7h+/uDgx4Nc0kBOPf41al8aNhXqqCrVpX34UwLUElU86QxdLrYNGYiL26JWvbDF
         7dQtzM/tcyD6mvoJfflILeSgwPH2RQz1LyISs0luFddVM3WKh8JPRK7ObEB2HipTVHZa
         prJpy57j+36OoDLtl7FjTeVzuCo5ajbqhxy1D0hXAmxzLUt0ZG6Mpa8qgW59ztvUivlF
         WUIqC/5eBoniiYLfeQ7l+9juuhk7G1aJQ3ZdWxNsRU3LGciJJbK+g/t9rjI80MmS827x
         LFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061606; x=1752666406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfzIi1YuPj7vEDdWX0E+BtY/lnIkWXKOrOjK3rEMMzE=;
        b=ME1kc6zZWG6lsBfQOVzoc7jB/RLlCOjroSOtMrx1Teb1KbRKZAJjVxqP/cT2ZLaIt+
         Q03QcEC9F/r0qySEY3c01exfRKVTcrmoQE2MsNms59aVpfI6tVaOHAHCy7LMvOdlH9mm
         EmjNOxZnJJYUDDKaOeNk6mA3cAguFei1c+YIuoQ15/P7IZik+GiDK1faW/Gm7ikhei/Y
         uzBdMf1W0ofVJm+bNrFKm3wWjn8Cu10M87tLEZnQa2rTTRgJ/Xm2LegmSDW3UnQR6x1r
         VGPrtjXDh6n6uSnv/ujE1iBZpCUEInUZZtah10QQYR52GA8A7Kl/qAC4p4BFoKdCXa1b
         Gm1g==
X-Forwarded-Encrypted: i=1; AJvYcCUOyem0fvoWgLPgw27pZC28Zo8yVV4OiOX0Vs+0ZlJaWLEtn5YImnyaqsoBZA8dNhM6O8zejpVZimQdZb1F@vger.kernel.org
X-Gm-Message-State: AOJu0YziJnnvdJ1YBuJmK7qujJJK7dWxpqTtcBKRRL17nKp9AbwMcwr7
	6yTmtxsk1IhGsOv0hOvzNlLxxStjrCAnQovBCWPhfHfDMc08qyGnuSyyKf4loJw5r73uhlATrtM
	XlRxK
X-Gm-Gg: ASbGnctgL7pFK5Y22J+sdY8TInInFOZtRNsQhzIUj49Qg7nnl5Uy+N7fzt3Cz7lmlhZ
	K32WokJhLAR8ZcoSRZIy53rgiAJztrj1jUOvuFMrYZ/JZSqmqmUPqd2CmtgxUFj+44YsVt7Yiv/
	LLAxL3lKeiT5HsI9dYqVSR7BRPPuzDKN8M3kwYQe4ilamkutN96CsjmD210tkxYc0TN/XvxdlS2
	MytTLtk2SNUCrPHq9n+rnojsYMhkNm9q/qyAZGxZHr57TZAbVRvDYF4PVkdI2JCOaNKfgInTrSb
	9ESB0P2mdOKNYNaS5mN3v1e6wWz6Xx8yASpoovsL0HuCwXzImK4wPFinRrsHRH4u2E4F+bUWqXX
	waIurGqqoAECe2cAVYssstQZxLGikg432
X-Google-Smtp-Source: AGHT+IEKz0ezpWx63F7Bc9s8vjVt0t3vOlKUT+8PNrFet/P8kfDzpR48FWdx1BFlSEC/UY4y2HwISQ==
X-Received: by 2002:a17:907:d28:b0:ad5:78ca:2126 with SMTP id a640c23a62f3a-ae6cfba40a1mr220756166b.59.1752061605839;
        Wed, 09 Jul 2025 04:46:45 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:32 +0200
Subject: [PATCH v2 1/5] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-1-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=897;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g50h0b21o9jDK79Pni6TRJUIQF1PpFN5TZVZVqE7T6I=;
 b=yYYcBGUYoAJgY9qfpIoIRedVzxCinLcscXS9kcX5OTx4vF27NwVMwNcavqROL8jBlObpt3Sv9
 PBbf1cP2EUvBF2wdpp/RhcK4BUtUajso9ei2nCw/JbzwrSW/6xkQy94
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PM7550 Torch and Flash LED controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57ea6dbba9ce71280bc3cb9f74db83f..05250aefd38575f00dfc73263f7e4eaef38ab565 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,pm6150l-flash-led
           - qcom,pm660l-flash-led
+          - qcom,pm7550-flash-led
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led

-- 
2.50.0


