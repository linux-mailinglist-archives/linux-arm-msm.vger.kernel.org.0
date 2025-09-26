Return-Path: <linux-arm-msm+bounces-75253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE13BA2A19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76BF3622122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C80E287267;
	Fri, 26 Sep 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="ZrVLu0kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC328688F;
	Fri, 26 Sep 2025 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870563; cv=none; b=aqftxI7HslzXv/l8eV4LrsExpQ70HHAPvDT5oKC1k2ixwRacxUrykQXZRjhkQ+FgQBJZYs0JlsGb4B//znfMYQu0OI/zW1AerpyEaz9tccCucY1loS21CfqKQeoZyZ2dWkiRwEDIiHQ0JxQqc7PTlpd32qP6ZTY1nGlpLbFNrhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870563; c=relaxed/simple;
	bh=GKjlsxqTbxpyt3VuCV/objdV70KuxpUpntpWDXhpIhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpzS6POzw1xdmlKcNV1UcqgtyOpXdZp6vB6E38tUH/0IxqrJeFiEI3ZYg7T9m1NsGICqZEkMmzQpD2ekhGL1aaskj6owg+UwJiNrqJl9TnBa//bWIw0XA//PRtpWdbzbleCD82E+xhD+k07lfqCDb58WRmhpIrLErVcuoYmyxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=ZrVLu0kn; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758870548; x=1759129748;
	bh=b+4eBFLXfgLqWLJemhO/UCi3kOey2BMAl5UTN1g2g4w=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZrVLu0knHt/ECXEdQfR8OH4Gfi/MW4SpE5YqIBE881io2e37S1tgK39gZRl8KtARQ
	 CMiYN6KlqimY/K+/4qGE43tGUziYI1Jv4rLZePUMGSb5P4UuFfELrkwQPaBbTUK3eX
	 lulOVnIsKvi3nBx83HH7fSphPmEeXpAD/w+8tRPpWdpabm42XTW1LMK71BOvOLfc6F
	 UwLzu781ShBZeIqdUdmusirsablc8G6ZOv4OZUxfkWuDzyiE+iiIy+5N2TbA4m15Qk
	 yq5M1mPes5lhYg6fn3rna/bBL7BUxEQWkZuVQjTT23cGBQowYQERESDE+VvTTdjuI3
	 heXyrZHETQq8g==
X-Pm-Submission-Id: 4cY1sY5ggpz1DDKp
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 26 Sep 2025 09:08:52 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
 UX3407QA LCD/OLED variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-zenbook-improvements-v2-1-c0b512ab6b57@vinarskis.com>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
In-Reply-To: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=GKjlsxqTbxpyt3VuCV/objdV70KuxpUpntpWDXhpIhg=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXbHh3/OHee5fpJuvbbFfTRzo/VfYsMEhWT2xdrVtqP
 v2Hu+OfjlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjARBjtGhtc3pSxaH6/K3FdU
 8NN4jf8P13cm0/o8Fv7wZ346wcjUsZDhvzf/9SZ554fTf+92XPzfoVWJXVzg/IpVmy8esX7p9ta
 9hBEA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

X1/X1 Plus variant of the said device comes in either FHD+ OLED or FHD+
LCD panel, and shares the same model number UX3407QA. It appears LCD
panel's brightness adjustment is PWM backlight controlled, so a
dedicated device-tree is required. Introduce dedicated compatibles with
fallback to 'asus,zenbook-a14-ux3407qa' as they are otherwise the same.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9fcc4d12f4e3baa001099b6e154af7..abdc39c025aae0ca5cdf77c58ab0e3cbe47c5108 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1083,7 +1083,13 @@ properties:
 
       - items:
           - enum:
-              - asus,zenbook-a14-ux3407qa
+              - asus,zenbook-a14-ux3407qa-lcd
+              - asus,zenbook-a14-ux3407qa-oled
+          - const: asus,zenbook-a14-ux3407qa
+          - const: qcom,x1p42100
+
+      - items:
+          - enum:
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd

-- 
2.51.0


