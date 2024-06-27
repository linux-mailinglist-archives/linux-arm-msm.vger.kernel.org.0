Return-Path: <linux-arm-msm+bounces-24485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE191A984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9CA51F2504E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41D7198843;
	Thu, 27 Jun 2024 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZTLIT+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A0F197A61
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499488; cv=none; b=XpqhudDE49hNBd//PO/VxIr872AzHYu3Iw7I3Wv0Cw76oRzGi2X5pzy8TQXizySbxUYgOXOKJrawSxkzW1LDLj/YvvkGTui3FVj11rgCMyHTdheuK7YdO3ZHsOK0ayM+b/R25mBXgEMsU0xhQPRO2yTVP1tsX1n/QT9ccTyIN2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499488; c=relaxed/simple;
	bh=im24zS9c8NElT+N/gENu7NEwrDfO/2oaS1esQxJvmIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLtt02Pz42aAA407PCXwv8F7P0o87ognOxnJApoh2W1J8hQjlhwEwB6XFrCz+dgBQXXQ1jc9nhl8DwJd260eEBPFRuwBtIAsM5ZSQjq6zWGtiuvCPqg0wnFrO9UyuvH/WK1PRTbiuC9mPVsBX7oEqdjkvubVhhThdOCRKuBxcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZTLIT+q; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso6237337e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499485; x=1720104285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fv7G4wggBcVvOCA5q2uk0HwTlQqcu/RAhSIH1THEBs=;
        b=ZZTLIT+quCB4DBPh4NlTp0gmI15mMd7fXSR9NpashUDPWz3vZwk8qRDC2z8QL5xym0
         2WiVtESoGuM+0slfR7uPjYu3vwY8EuABbvs0Jg85cZHQu8K0HB1DEq2+JIvbvPNUni8y
         2uOdZ2JZM/M0AnQHmqgfyDd/6xcbRi7uWzSKnNsWsHHfFpyRpRu+mD00Fz0pww8T1ES/
         EqlflQMZwpwqE0AoexZfZpLSi2YtY0CG/DjoUfdYkLL91/l9J4JC1BuTSX6eWR1j+RVz
         3N34w4m3ziPKZZLj42CPBGL7j6Yz7ZiYnmBSxU/UjZsY4VwGCT8DCJGJEehcOYfmgnt2
         jE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499485; x=1720104285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fv7G4wggBcVvOCA5q2uk0HwTlQqcu/RAhSIH1THEBs=;
        b=ZhAGTPyD1AAWG0Cm5BTNzcXbyAe5iBqZ4ny6ElkhkbHRThLa8KvkSMpK/ouWPQaj/6
         CgVF/Vl/IhR9HpTchI5RiegX8OZz1QgeyHpJe9KZi9i07T2nzrMxBqPrPjxiIsDVOIf5
         Kt2lqTQ5eiclHPpE2FGKBisiwBfOyQUit/dMC7t/ny9AHcXMwS0Ty2yFfw/ag7XaW35N
         A9JcPvZ2QCWgG9r2shRbgPrECVVtuVPYM7p3D3gFITncP1/Dqln17PdaUYmO/YJmCoLI
         TzleHqsbiNqqFJuv7OtNAQeNS4ydXBP53eQyqNQ7s01EzEmT9WtXcq1io3mHphj+3fWA
         1Umw==
X-Gm-Message-State: AOJu0YwXlO6RtpC5dzpidjAfLhe+DsIeDhVTmb8FmK9OVAq5pr5Iv1/a
	ApeRzSN1fXGPlwwZwbpkDgNjyynL9VkxTPs/7IZ4ZNg69GKQGP+duXkiKFZSLWc=
X-Google-Smtp-Source: AGHT+IEbLn33fk1NZx+p9Ng/LEPBTTHcSVtjsRY8RIe4VyoU34O7xYRjTaOVTRSNTon7MnYbskEVdw==
X-Received: by 2002:a05:6512:2254:b0:52c:df55:e11a with SMTP id 2adb3069b0e04-52ce18325f3mr13317733e87.9.1719499485122;
        Thu, 27 Jun 2024 07:44:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Date: Thu, 27 Jun 2024 15:44:38 +0100
Subject: [PATCH v2 1/6] ASoC: dt-bindings: wsa883x: Document port mapping
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-1-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=q2lXJvgATkQ9232ugFsaVN0aY0h1slxdwjETCG0KBuY=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYexE0bCsXqMCoJMK2qX+Svh51N1PDv/q+a
 oMQdJLI6uWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 Nz0nCACuIuRa5RKmZhysyKUIBtuAriVtIlqHhca5rq1Wr1TgcuGQt2d3t2Dpc6p65k9z952Qrsc
 PF0LonPY3dvyUdhdFAfBB3oYPGdcwkjwq+Az48KLVhIrpmWmvU6FrbF06ynqu+JAI9Ymy5POxJ5
 t9zEc8dEvJFqxt3K3a3NVsD1BsLKJcN6GA+Ox7LVtqDtr5AQMhBK95yqNQ9argu/vJnbYp4kyKp
 hJ2dEmDEQtcIu5SF5qia2lLudFGqZZVqyrQ/iPy0EdsgPpTHkoY7FTXSUoj7xAuUHYYFoTkz9DA
 c7ALvhsGe1nVX9sbecWWyamkZblYNyi7uhv1q1MbEgCYTW7B
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

From: Manikantan R <quic_manrav@quicinc.com>

Document port mapping property for wsa883x. Port mapping is required
to be able map correct master ports for VI feedback.

All the device ports are not mapped in same order as master ports, so
there is a need for having static port mapping for WSA codecs.

Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 8e462cdf0018..14d312f9c345 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -32,6 +32,14 @@ properties:
   vdd-supply:
     description: VDD Supply for the Codec
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
   '#thermal-sensor-cells':
     const: 0
 

-- 
2.25.1


