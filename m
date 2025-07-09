Return-Path: <linux-arm-msm+bounces-64212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF89AFE78F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7591C807B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A4D2949F5;
	Wed,  9 Jul 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xWkSgUJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7FB2D3EDC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060162; cv=none; b=NH2oYvXWcAIJc7zaNrAmUEWczkqvZ2CAGonHbJ059kf4zPRMzNHRq5z6qHMCR7ZyYepsCQI2njGUMYuiJ/JMdBxzEAsrzyaUzYpnkphOftogOjZW2ZIuQY8BI+rinSsi72v3ntQdP1I+kozuAwRrO5tLgCMgaNUpUkJn0IoIUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060162; c=relaxed/simple;
	bh=oD801OyJYm0TzoKKOZTj3O1DfOFU3aBIRy6M+xYUl7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMgiDRCBRORxLSYRT63g+V2kslf8EpBfdfz8MiC9avrMPrQVCJtrSGXLwuL/Ia55wgYkJ6p9ZkaO3yyyOHjCjLtSsP0p3/YynDBqXa4psG6cKvaA1Ant9CgW2LL77+Okccst7TYmySnuIYzekxIGs20tmfLSXNvRGR26QUoSJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xWkSgUJa; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10638934a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060159; x=1752664959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74lpKym3ozeJInIfjg7y7JEQW4/oh6esczwCLsGr5vE=;
        b=xWkSgUJaVQSQ+A3raRVZ4hH43avKwBsCN/4D+AXPM6/wD+Lli7TNX9TV11zfE3GS6g
         Gh/n5yiTRzoCetRBSZZ5dbN/X6GvYqGhCcEIIyr5YRc16EoipgXevqGmR9kps5yXv/TY
         lkXuogOxCi92120NhoP8k1Cg84kE2oc62Mc4zwIToEnHHH3+rf/l0HcCm9mu83/pqVFk
         R8YrrOhbgJM6wk/3up7GLLNWg5gqPW+iGtt7ynE7AatlsTqwxz6c5pATDDQFMC3BlMxe
         AEbdwmOjYhC5T8HdQMYb7XtROYp6DTSDjHRYjIRIXl2sdv1SM8HWqQo0Gw2tJGXWpoEe
         8zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060159; x=1752664959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74lpKym3ozeJInIfjg7y7JEQW4/oh6esczwCLsGr5vE=;
        b=YRzSBx5ufZOtHNfZrf+J0yFxStWDO41/hmm+ncdzO1xR5X58gHD57uxcmiBTsKExRa
         nxM2xlgL+GhnpezM5LwMWhETVaSqYfIRpP+nUZHbhH1IJpiroeqaCzVdr6ihjXl1PAVt
         mqrs7amXM/xLuQoKZIWscLFnYzoqw6onSgl9AJ4xPSnIVuoyQNDYpE4W3n+yUkJSKZNY
         qKFt4TY5Ko/fyZ+cYcusRadf3MfsJ24VIANQSTGn+K3KjaC6PZaxZTczrb1pZqgt9zW/
         NdR9uvrTW9B2GO7bMRtU5f+zLSE3o3SmWyqrC5lvcdCk/IL9iTTVW+aF2ymHMEgprM85
         OYcg==
X-Forwarded-Encrypted: i=1; AJvYcCUsso1+Piz6ftAMoe8A58TjbXU6HvjJH0aOYzMAu3G3iWjeCDbJ9GE1fMZ456nC4vcab1SLEzCHTuoyKrCW@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoTRjXoFJt5FWU9IdpISNnFbsHPFHqs1T9u/KBkK/U5GOz+hU
	71z0+Qc+i5f+GP2KB0o2LWG+DkOcHs++dFcAS66nELwtsbNJR3ISC9DzYlUtzmMCY1g=
X-Gm-Gg: ASbGncuJYz53bYW6p1C+DqRUS1CQvloP/v1Ae/oNELpaBky9zI9BkaeXhPFuf6MA0IV
	BXPNM4GEjdJBcCBFqVjlaVGV6L7YZ/g4SfFEERTQUXHrUbaSEPJHpLckZfkzJ7BFfc/90w6c08P
	lQ5Ev9juV51rT506hK1OpW4VqhwYVsSB2R2hnr9ad/1DKGZBMt1O+m0wJwInr8BIr8Zudp9RVRK
	mPut37EL0aLBWGXcwF7VM1LauUnA/FSk8T6OntTpSc1WPWplHSpsXTwx90jdzE5H3rI2tqRIbpS
	4KRmlJmM44fiT7+xBIfOlww2n+xRnEoqREkrbjWD4pSraZLTCbUIOnEi9istVjjkQyRysfRGlM+
	b0nD6BAnCALnc0gPDBaFtqB2sdOkB+3SH
X-Google-Smtp-Source: AGHT+IEHXA/q4RvVeUWMB5+8Kt/h33MOXaZwfUVmkNUbM229Z1xSuzwOvj8c85A5E6Ij5QjdLJ0Fbg==
X-Received: by 2002:a17:907:7f89:b0:ae3:d021:9b05 with SMTP id a640c23a62f3a-ae6cf5bc281mr244392066b.15.1752060158698;
        Wed, 09 Jul 2025 04:22:38 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:27 +0200
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-2-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=1257;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oD801OyJYm0TzoKKOZTj3O1DfOFU3aBIRy6M+xYUl7A=;
 b=H1wCYnwuu6PbgxLICu1skMzgyr160vcgGQEQnAS9JBqNT/PD44IqoFohiR72TT430xhodRLOa
 TRcmz1vzPTYBqvsyySuOyNPt4w+d76ApVkGcQuBGYBcYQ3DirPi2/X+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PMIV0104 PMICs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..e8a1f524929a710a6a65ba3e716c697f24524496 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -64,6 +64,7 @@ properties:
           - qcom,pmi8994-gpio
           - qcom,pmi8998-gpio
           - qcom,pmih0108-gpio
+          - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
           - qcom,pmm8155au-gpio
@@ -228,6 +229,7 @@ allOf:
               - qcom,pmc8180-gpio
               - qcom,pmc8380-gpio
               - qcom,pmi8994-gpio
+              - qcom,pmiv0104-gpio
               - qcom,pmm8155au-gpio
     then:
       properties:

-- 
2.50.0


