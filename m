Return-Path: <linux-arm-msm+bounces-115876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id awqnLl0xRmoKLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B36F559C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ZqGS7k8T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E2D130254FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F15247DD45;
	Thu,  2 Jul 2026 09:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156F47CC9E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984715; cv=none; b=NTnXR7q8ztsnRDpYjuXlhgCW8hUvjQBMYlbNKt6ZCRA+JB6PGVWjRUQs3SqRo+Hvm4NDwkM//aphL3p+tGGedacyfz0VLXyZ7AVpEfmuZuDSNgZnUdgQV02Zl3T30ZxeE8/qtlCruGM7ZqHhluUAl0S6cBUw3MIEAUmdIsfT1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984715; c=relaxed/simple;
	bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbLFhlMSfbXPqEUF2MZ/g5AYg+bolroA1C2rZ/VOSi5z8i9TS+cFMwDKTIwGV2lIfbR7iomDTHUGMofiQXLHOfnh74ph55r5/8E+8ET1KuPIsdfOHy5KUWoSvkYQyufjsxDnwkmUbbRLazX2rFRBUkUJWzy+l9vqedqE/l5NYsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqGS7k8T; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so907860f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984712; x=1783589512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=ZqGS7k8TUJ4zj0ubR5D4n9EiN41zmLUCRcEjxVdsnv0tZtAPTovzDGWbWHyEHjwqpa
         T8VyhestgY7tC7bIaKN7CH9InPmFImkBoI2cMmcMFserBvkwNdkiZPAFuhPddG9u/SB+
         NsjZX3Nq/lJ1CYCsCEB8ShME1jZES3kMMgcIxFXCBMEosSHxu5gaebTHi1pU3HN5Md8s
         4kDZGfA6uEHzVLkvfAPR7/1hb/fWT2yzykqoHC+9OLtw7go/2CCZXglgMN0UQAs/0XFx
         R8W+iS9Lu18KZ4OR35rG9Ouj45j3vYD/J9I6agbpngxv9d/qsxL2MoppFt7J2RKBuUZc
         L1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984712; x=1783589512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1gW7j0SuB6Rv3l6CspMnROCm1TKFmGQKuG0yfZANzA=;
        b=p/HOzq67giyqfL+SCjFEJfHQKd8wgRYuForFUrJ4plxXk6lCFEIbkGJbfBBBYlkSpR
         KYs+hqkQ89ZFQQkgosuxvfTltuEMRRMUNHgIS78e93AQPVSKvN97x2P6xN86ogD9I/I+
         BYHn2LslXOEuEkjajl720lBydxyVp3nq3ZRzc0W++blhfSWM/jVR5UjT2hMYco72HAF2
         niFKVKcrYID9u2UQBFJON9uP3C0BnvzIHkxxp+aUUEFG3a8ztSovosyburJXnh/DWu6C
         7d7d94/SkQtXFgQA/HmpGGWM3J19AquR9cYjVOfojA+IkmeIVSo5q+RF725G9guNoOYe
         VQug==
X-Forwarded-Encrypted: i=1; AHgh+RoUdkqZYyWxbSZ0KuWU484C8JIdp6w3cgiJ0tqjaAPunMPZNAbkFGgsM1q03PyqI3MHlDVqypsQO6WFC/D+@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+BmRvzsQm399QUjjFpUQWLUUabzaVT9YNb0jZUESfgBxaOiz
	behCtdMJqSaxugPge78rDpldalNSF60BR1w4AQWKh4MeNsDOThidMQUILxi58KOBl4E=
X-Gm-Gg: AfdE7cmDxhkIpQWowwtfNNwBc2snQReOLnLqsVj9lEQ4+cTmSu2QgPGumL7CVAMKzk+
	AAL8HbZnlWrkGM7vNDzNPZkFeDM6/0SlnPtSQuRn4ywzpr5J7aMpjgMu8lRPGSlcrq1/sBkMpui
	CwDGZrMHBOHevYw1ERgfUhQKwGECIgNqYBawAZ75ak3RSX6ActU1W38FqiYvxZESE4ZfP3wPuuo
	9vgYNYa6yoQkCNg85dr8llpyCMzceT2huVW7lRrM9wrWC8qlKk2oEbfO9CtwdQ4kBVdV1mlWghH
	5gty1SU6M+5L8eU/eC+nO3RJxUD5o1RTp5Sb3sis/y8IwBmnnFJwhLJNQh9j37YlYn0NaDg9oHb
	id0Q3LEIyyHu2iSiOR6HNF8ldngbRJIGpMwVlMQHSWoBaLYtyAEeL4WPce6ae2dW1WzqsTDDM3L
	IKKmdND6waW/Rf4z6yq8/cG8z99RqrJhOgnQ==
X-Received: by 2002:a05:6000:709:b0:478:77c1:787c with SMTP id ffacd0b85a97d-47877c17ae9mr2019954f8f.56.1782984711543;
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:46 +0200
Subject: [PATCH v2 2/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket
 S2 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-2-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MSVW9VOTFMkQQHJazQKwe07MucB9bPXJgtH7h5ABgm4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjACezRvsknWsM09U/yvYorrMqp0JqWPBXtnXx+2
 676kkYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0cM2D/
 9TbbYYcNW/X+u703M7JQJBMzXYex9vzQQG7wzxMq4PyWDALJBB1ua3Dl+LkwxWta2ISbCowgBn2b84
 WKoH69+/zgb03NI9Xo/LNHQa+EmWrQYbCTsw6/8ZR13voMkrWN+bU/mcCEFG9gBErMIYMMBgH95Hd4
 5Bg5tC84KRHI5uLcTPG3j1W/fDkd2q+7qPRMFsMgUJm4hPcmvJRiQDUH9/AFc0wbQDtOfDs/RTV2VE
 1fN2xgHWXkhLP5v8OI5srcWPUYPFld4+Ve6ELIfHbLg+3NzldfcvvmsYs4X9dbuEfhtptrAM1/8Y5A
 uP/mskG1JueNulRh19b0bBhefmBlJOM+GXenJDaRVPWm/lwJTpVzpwQQxl8fIBCfxpQq8zpZr75KuX
 uKSnpLvtNVrrxxsXaAuLQ+b4IsYPH50rSeZW2QqZUKJ9wNlJYYL9ywAJ7H3fE9NxjJ4G9bd8z88p+i
 mrqYPGD+OYi9rT+X1NakjlJ2nth5hNQvzc1opXY8j3aybFGaaBLBoilPq0pBMGIB4/guRrCL8ieuDJ
 kdKiEP4fRJ1Eaa4ftyvIRlarK/+SuTiDpWDpEKxDG/wbawSOEtxa6KYppdiEjguK7mhjPX+HAOQxGU
 iGzzY9131B2vrbDnBWXonTn/nqoIwAvxehsCZ2ldP3Yitx0eHAW1UfS2T/tg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B9B36F559C

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..1fc458276ab3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1


