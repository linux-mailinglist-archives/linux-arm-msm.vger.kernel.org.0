Return-Path: <linux-arm-msm+bounces-77688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F1BE6A97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0414F7419D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 06:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9F63112B4;
	Fri, 17 Oct 2025 06:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gI4ptFeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1356F30F94B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681599; cv=none; b=qOgtzs6K5ed4wkRcbGUrN3OoG73T6ShNsS8khEZDiQjoZgvKW4cXsZsev8z88qcCraDXXjzQtHwvbweYAlxw5lIybgta/FkACIfAwqLKGbhYorSPajoOxTRYZtUBVg/lFnrBNNKCh6qQXYOmWxwzCnTr1GH2BpungZp48aYQHpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681599; c=relaxed/simple;
	bh=eF6t9Vq9NRea3XnH1BHglCTN0IeLN7yA62hWb+lXoeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaHgDhOCzJvcv2v/JACN+6QI5jhU9Vxa2IX69tKRnO6sQxs5uEq4Am9syv2q2gNk+k32sLW9k0Mw+O8A/KTdGQq38X6s8kSKSBJSWF/AYTsiuaL2h1U9mtUuqiaJXfNJi6LuwxA7T8cNcO69aKh2/9L+Nl3ykmipB0HM18ZEdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gI4ptFeP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711f156326so1250355e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760681595; x=1761286395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHSNJ2BDwx1sBbfCkuw18NdbM457O5a6eDYxm9b/Apw=;
        b=gI4ptFePjPd23cusxBMiooO9gPjaVXKeuVH16Sq9TrAYSb68PcoIxvuviViJjSARD/
         k+SHjLrGB17S00Zg4tuMgiNDgHHEjjz7ue1ZRQ2FGpD+yKVE4b7mgmemATWoGEdT8Fmc
         DUP1s85K/bsUFBIJNTpNjb9GNHnyg1/MP7qdMibT1hUzCI+VqE5cxpbXdlZcPVlSfTm2
         eEFOPgyzttZuLv3gN18aj2y8aQD2W/GPahATDDgV4yXUe+01hpVY5tPO4SPtvZiFdT0+
         bEdYNCX8lHsTm1ugX/cqKpyk8hoZPpLRPS7WN9YnAcrH7hSiuIkWGxi6SNkIxnDJQtj+
         Q7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760681595; x=1761286395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHSNJ2BDwx1sBbfCkuw18NdbM457O5a6eDYxm9b/Apw=;
        b=lkp90UpE51FdR9jDLNwIZnIUbMP+B9DvYeIytUKDkeBvwZ5iLWx08MvkxIgO6ztTIT
         smLmpJ6g6NPu3uCHwMq8mFyUZdwTgNVD8ifFn9C3APPRRuZtTq0dG4SwKDO9CA4qRxez
         3HkywK/52usiRwJzb4l45hdCzIK/ssgTV3ig1w+MBEno4A1IvMR7iqfgor7+WcU0shv3
         boFRdcw79og+De7wXg5LOtrwmHAsk4XdbiYxgzP52LyX7Bg2W/NIC0W5ecaOum13dcVR
         saKw9Y3etakj2n9Dk/AMhoA9/L5h4M6ygM5VyD90+6ygDYu0I1Jt5AT3WEtkKNqvRBnf
         szcg==
X-Gm-Message-State: AOJu0Yx/MeL7MatUa6CgYJe3GqwN5KLpzXVI74lRTegA7rG8EUMOKxTr
	lUvUKlxNoaFgoFYS1AQJOiO0Wgi2MNCOlxaeWmIpyUPbizSC42UovAYwWsisSf2E3H/YJ7/zJfq
	AuCT+
X-Gm-Gg: ASbGncu3iELh10hX0M5GMi7nUF7Q97iCePG4f/4AoPaEWlUuguQWG0/3eqfPVmVIUKK
	QqYsr31ppDLrj6yHAoJqH6nCWJ9yeSAU6xgSFJnKs6SRH92tWhTne5nyc8iYNlfLRKyxGesK6WV
	iBKoyic1IFhaRvsXq563WiE9Ik9jRV07V7nU2jADMjviGX+VR3/wTbIDjcmeARbP47PAQ2WTY8U
	I98LrbsAEwBHTR9QGmC3YVSHeVbHgHdEQJW+4O94szvmc13wqjJ9wY47PJEikjCFysDyxfFgT/Z
	7L+M5W5YPa34ZS/lJgPy14Pd9cVgKNsGjhYsIT/7HOM4NQlLZSryjFcBZfuM4p8UKgMLWp+ytnH
	e3yI1uc27C5x+D3i5fMJNXqrDJgram0ScQmL/M30VuObl+uxEdigxi3xfAiQKvUvJ80vphc2Fqi
	+LFYeDZg+Y+jRYmJEJ
X-Google-Smtp-Source: AGHT+IFi56b/X0lBjC6eoQ5DueToZROug6pRk4AZnyscKkreLGme/V1PG6KxmiRrNewDQ22JeqVkQg==
X-Received: by 2002:a05:600c:34d0:b0:471:1717:409 with SMTP id 5b1f17b1804b1-471179071b4mr16544585e9.23.1760681595439;
        Thu, 16 Oct 2025 23:13:15 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:6426:9b9b:6d3d:1da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114429679sm61624745e9.8.2025.10.16.23.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srini@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for audio blocks
Date: Fri, 17 Oct 2025 07:13:14 +0100
Message-ID: <20251017061314.644783-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If/when pm4125 audio codec will be added to a device tree file, then dtbs
check will emit messages that pmic audio-codec@f000 doesn't match any
of the regexes: '^pinctrl-[0-9]+$'.

Add the compatibles for two possible audio codecs so the devicetree for
such audio blocks of PMIC can be validated properly while also
removing reference to qcom,pm8916-wcd-analog-codec schema file.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

v5: implemented Krzysztof's suggestion, completely rewrote commit messasge

Previous version:
https://lore.kernel.org/linux-arm-msm/20250915-pm4125_audio_codec_v1-v4-2-b247b64eec52@linaro.org/

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..2a7a92371b55 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,11 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    properties:
+      compatible:
+        enum:
+          - qcom,pm4125-codec
+          - qcom,pm8916-wcd-analog-codec
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.47.3


