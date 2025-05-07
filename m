Return-Path: <linux-arm-msm+bounces-57114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152AAAD9B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29B94C4B61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBEA22688B;
	Wed,  7 May 2025 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YnV3zjdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76491223DDE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604929; cv=none; b=sI7ZyPddi7d1FFF1Gd1L1oif9LXkCBR5snCakYG9db/idmo9CCmhaSyQzcPu+Lq9id57oe+ttcJhJi99amUJB/JxPkqaD4UQ8+1pwmJBe+mFNMRNg5TMLXr7hAHyX2PFfP8cRFCgerxSX+5WnSdUroukGXnBtWj0u+etaoNPPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604929; c=relaxed/simple;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3J2Vjevr3ld0bwvzUzctqy8l5NOsxngdpvnWzFddcEFryZLC+gwLLWymzSW9ZsyKDFq4JuxwcdvhnwnXhZ9lI84pQWsCLI8ym52jDTp0nub/2yetsabBc3SXP3uz3W6BNlodKzQ2LqnX3HbQ/lOGUvNvYwDbUpr4wyR38RWxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YnV3zjdf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac7bd86f637so129416166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604925; x=1747209725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=YnV3zjdfl85huB5rFrTm7ILrhcQVcGxJqJVQJwCQl6ZGbIl8PxVn/ZghhjUZfXpoB8
         o7THwPVwhuwbQoyp3tnHbTfIiubh79ibODjk8+R9J6aqB0HX0wrAmlFfdFZhYuwrHwYS
         6oiFAhF2qGd9FVdNBAs9QoYKXQbzxIQ4OLTIur5YPpxwK6rvctw/7W56A9gcAe+EEd14
         1bYqJko43S/UJTVhLXw8XSD8lW8VuIr/NnaL0C71olo6w560hsrHHQVfy/meDifhw5V5
         A2G8Zf+fWSjoXEaAGYLj2aorwyBqfg+HuXtvnq6RWzsV0gaQqKpA9i6RCUH2FnNBhcjF
         1jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604925; x=1747209725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=AUAoKtsOsetl718M5jBkFq9RHTHHeC0HMbrPxiAyoxoXkBBu6vIY8hV7PmaPVp/VZt
         bFnC4jO1yeXbgToWqzsDmsfJi6YZ8YXoU8KheUmKYQaR8tFVjpkZuOrGC8hSCc4BE3GP
         35VqlqVMsLMmcooRIKl2v7LwyExoqvYbMiG2rIAxGWwNfy6QoOss6SBhGf59jB8zxqcQ
         FOb9HjwKSbhf8BqLmxydM+8j+S/e3E5sn/mbgmIUFVv3jY20hlUP/OdQ7jyVHXPZ07WR
         sb35XEUn8iKW0hIxt6+/4ZqWZyF/dsQwGB1c9Xp0xQQXTH30tIDJurOqnOf2BJh0oPGa
         5jaw==
X-Forwarded-Encrypted: i=1; AJvYcCWISdpdWg47gze+aB+CIlH02VhVuwAo8P5lX0526rvQXOUyUlCNCyJNp1C4Er2DtfxZtCHKARXHFSnYVp68@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXFXVbIhio6j8f1f8eQ+1yzeGyHSVrHudIGFBYXtoV6UDJAQj
	71QGsFwoH8EeSqyEjJm3LQYsJivrYTL/gPYjHsKM1/jO1jQAEujZ48ZD6KCNIP0=
X-Gm-Gg: ASbGncs9zV3SKsk53WSIQsFgyFnoNpJtpW5j0lqi/yBst0jjWO0DHoEn3lsVTkfV7xA
	aV14F7IelHYts08iTs4L/jN7vsaj7fcS7BNLSgH4TtsfGJRmnMj/+xXA0hlO+0i962GP8iM2Ji6
	SHL3zS42TEb5jB9hpIj1eRy2kPt5szVv2DtsE1kBOTpTaq7MDHRps1TDYyE0pMwqAYMQn2W/C0C
	4wHLXYSNdH1p9GbVkHubtPsY2jIcO4boQFNWzgXbhSy6yiB7ZRAxRwuOSjeopFqPeQpWHDY5hnk
	yeLj4Nv8fo4f9y/tj7JQmiBI8dBfswVC9i1SornICGKG3NepK6Rb/2ANtYJeiM1rKr5SxgY280M
	IldBk9MnnUuWWSg==
X-Google-Smtp-Source: AGHT+IHM5j4LY8EC3by1L+VBxZrB2eMd8q7F5KhX7WQLdSlljTQckz7uR7Y8+kHuY5+YyPBVE5qv7A==
X-Received: by 2002:a17:907:8dc3:b0:ad1:d0e7:a698 with SMTP id a640c23a62f3a-ad1eaefad5cmr195699266b.2.1746604925541;
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:37 +0200
Subject: [PATCH v4 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0


