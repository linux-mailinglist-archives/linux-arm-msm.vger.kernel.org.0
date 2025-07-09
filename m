Return-Path: <linux-arm-msm+bounces-64221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F0AFE81E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37183B56CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD9A2DA76E;
	Wed,  9 Jul 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R0+awoIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636E2D9484
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061612; cv=none; b=SbzGPXdVm1ThUA3jqjlLqCLykKK5Zg//Q2Yu1yLyv4KSDUS6m5I0FMvzEX2/9wiqmoodea20CqKRCHPH4NwRD5o6zYSbRhEjCMEkELZf+/ZZThcYHCOLDhp6+Qo2BsSzieJOufqOg0A/QwUKiWmKYICoAHv54sPDpBiLV/bhrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061612; c=relaxed/simple;
	bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuyuU2++mte+5wtFRPr9ru/NReocTZRCAr9rxVffUf6ULj1TlXW5Jm83WHg4f9BQ+29H0k2K/CNDt2SfjsnEZSDmKy520/gF5CbNyzZoSNNGclThxPyFC0fZcfXAMiIYw44TszHUKocJsdFhXW111Ts9Dnhfenu825s6/vY83L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R0+awoIw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1066036866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061608; x=1752666408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=R0+awoIwfU1tt252Xbern30X2JitnNWYSShuLC2f7O/1OVJ8ZqKGm3y0sDeTZ1/XL2
         GzOQtkaY28GFj8bki5xKF287f6rq2V+1JDVuUq4b+cMxiCHjsqdOWDi0XYsEJuVfGp+9
         KGKHWLRkNzxuUmW1OExQ6Qd6H5PcFVe8XBWNgerjS6Xq44Ikf0XSLc0FYOh5hR3nEoCt
         MAVRBGGXQvcf5IHobXhGI3Cn6lB47ba/hfMKlQCE+E0FoOsJOm5nSNR24dtNfVa1f5MA
         7VODwydLLR/lh5v8rbKy2XtdQ4Pp9S6gU4ZZsTMU4LfzMDjXkArXVUi54Nypzm1LYTxb
         U+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061608; x=1752666408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=svRPf0ZsH7KXDvqtmUvvxQvs6d7PaJvxjwz/vzmudq22BMJsSrbMt5NQOiocu0aNUK
         DYWFhcbh3rNaq6avXEEBpTP6BeiDaKlS6nS31yZ/XoMf9GipItrtFph1y+oeAPONuv3E
         LhwcoAo/jmKNW0FX9y9/vWUxXTTjTJbGCD4LcpAmUJukXAIQN2fz5TXt/pbPhKLTUFtz
         7+wOJ8SrN/at6rg9Utmdv39mQoI3OeMDTRJhX1n6w0taZJDVD9Aijsv+8a1L7fmVkZD9
         xEfqqzndaE5n6cx9zBFqmi8T8xf5TrQEZy+UkpQ0DRkxBcvl0KpNN9YEaOxlk+qOmlIn
         0pdg==
X-Forwarded-Encrypted: i=1; AJvYcCWUiuD0XWYiVFOXnxo7qSiGclE/8Rc2VPvf+iUexClqNETsidGpNu7XTEAjMwisu+FVxpnT2F6M3gVncCqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+/Vy95CUI0uz3GnvKsOgKJd+cQaNeeHqRwWgXPC+TDj+lg4b
	59BrBTzG4S8yAnKz1sggCMRHnsXy8xjPLFw1ipuotipDl38PQfsPkktbj58tKm7woS4=
X-Gm-Gg: ASbGncvc+B85j74lW6yts2wL9n25/6cGGZyEwtkFBQQA6RhWxYD8jcHyW0T0yXgIMix
	DYf8ebFFFzKnVZmAhAW4lwOoHvBeS7q1s6GQD1nSz5ush4cAtvqve8OiLorTJ1tNU3zj10d1yqH
	EEP8Jdjphxq4Fi0lhb1g4ott2jpkKKJqcv3Fz8s6tuk0Fg9c0q09/DMRdkg7zgG/ckkVUd1aGXx
	6HOHalB9C73rbbx3qJ7OGiHiGoe+odxO5clnRcfar3jIyl2JS0mY41aTPpInJoPgtN4tvQSoHRF
	9u3OWa9Aja5nZGYD55UciVw0JpMKUYnqWhhADdfSUeTjpPeLMw1tSBq4x5rKbtkj2vl+x4cER8O
	aNCsaQSR5LCKcqXrcIgLq77z7N1CqRy9J
X-Google-Smtp-Source: AGHT+IEA2gAxDmVGoVvlu0rJ9OiSZz8Anqd/n4DMxrx//OnDKCpXUaD5KAn6BsoH8yK4ZuVKq4o9pg==
X-Received: by 2002:a17:907:3e94:b0:ae0:d94c:f5bc with SMTP id a640c23a62f3a-ae6cf5e23a8mr235455766b.27.1752061607628;
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:34 +0200
Subject: [PATCH v2 3/5] dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-3-09777dab0a95@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=1214;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
 b=qtldo2h/MAR7NtTwbnEcZm5YVQMx864QsG2TLcCQpDOVijGGylryftoMwPZtuNmShCkL8P8rp
 VTVRcfBekK6DJ1VgmBr+DE0GRt5F4LllSgl44oQMkd3+bMKUvI2au/0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PM7550 PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..04957fefff0bb72d5dc6d29bfa4d87ffd37ab8d7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,pm6450-gpio
           - qcom,pm7250b-gpio
           - qcom,pm7325-gpio
+          - qcom,pm7550-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
           - qcom,pm8018-gpio
@@ -261,6 +262,7 @@ allOf:
               - qcom,pm660l-gpio
               - qcom,pm6150l-gpio
               - qcom,pm7250b-gpio
+              - qcom,pm7550-gpio
               - qcom,pm8038-gpio
               - qcom,pm8150b-gpio
               - qcom,pm8150l-gpio

-- 
2.50.0


