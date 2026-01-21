Return-Path: <linux-arm-msm+bounces-90056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNinBbYWcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:11:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2C5B139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC632B42A8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4039648BD36;
	Wed, 21 Jan 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZ+vLtlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37748AE31
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013637; cv=none; b=b3dKP+eeEgWXFfUCmHztN6pa2mlEW64HMUzAkiMU9zkWrdrFwAFME/QKtOeziToGum2DcZXFfTnnG9x9+apElgdiY1QA+yhqKc3DI+uX2ZpCJSap4aSrmK7c/PrmNl4I2iW6nXVn9oCu7ni8umiA9YOq/q1QBEXuYrzr0l8Wd08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013637; c=relaxed/simple;
	bh=cJ+fpKUN2CJHaLJYtnMXTQDEo8RTawpmcuU2CAoDmOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5/A9MzA4oRfph0q5Xz9PdSep6ldTZ6NoFqo9YRVeo2oInRkQnc/1UfESKG2Hvq6zOYg+NcNb1VrBSy1mlJhyxCfbhf2ZH+PDpZY0f8zdjKUWFMHhrKZJyxGHNYg7InG0IMwmAe2a1ynewuipKJLNzzvVrJABKfTTssEzZ3zS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZ+vLtlv; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so127025e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769013632; x=1769618432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVNYngE8GhcUThodYsah6BFUD0+NgqeUoL4mISd0lrM=;
        b=NZ+vLtlvamDJm81loV6cT04Nmm3y+PsjTrBku4L952vE3aIHPGHP2W0USmRHk47eQr
         zGI3fhxNLIPT13FGE6mokIVd7WnX6NSNBde3JVWy3FKLcfoBn4BALRiscAr1Bk6oHBff
         1zgCnsmgztu+Ya3tP4+0WEPxbBG2QIaAifUTqLDWdtttLMfjWkPzoawDF0PpAR6IYBb/
         ARVSNUEDSRD6kzd6chV0ZoiLJBps9lGREQp1nWPIDNKBmNZa9KsS0Fero91h7XNTuRxb
         t5lU2TBqRXUZpqa2GIJlweT3Mldhq5BJVwQ3whnh7scVTDa89tIQ1NXV4SUSNDwISPeD
         /D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013632; x=1769618432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVNYngE8GhcUThodYsah6BFUD0+NgqeUoL4mISd0lrM=;
        b=wpKR0RFGSpWDh6KVbiDiSZaM4GhiqKIDui3IgKceTRuJi9fJ8Mu2jSoQ9yvtTEXZAE
         5/ER9wdlxcAD9+qd5/1N/rfa37hcCESbOhDfvB6bKaDCnrqaQepiiVb/7VwKAQyxsBD3
         HzLDVB6sUm+Kz8xSGuy1/5lk9x/YASkw4F+iSZrbcI1zzFv/jxaO3E5ftsUHK4i2JjUI
         O56aNKRESA7ES6/JO7+4Db0m4g341T/i0tOT8nkH7Sdyp0JPMzQQEuMmW9ssfrd77fcj
         Gqwr0AdjceLEHHnI4a6k4gyTsj0nlnHjAsEVoIF0lbKpLyAp3k6mVyHYNna06UAEkgqK
         /b6w==
X-Forwarded-Encrypted: i=1; AJvYcCUaXAdQBrbBRUfPTidnXS27VqN17nCh+espI9AaJx148mRWrBeptX5WuuwAzXYqH5xTelfb3aC9ZqEl2Ts8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+IpvU33RlTPOghn1bz0dQ0/QmRsirMlmmxdvB8+aEdylsS3Zd
	RxggWh3WsC8TYOmhuLwODnXew2fm7jJEcyjaIXzpVZhAwnE2QQHGGhgPXID7QYlwhuaN3QQ7eme
	29BME1w/Aww==
X-Gm-Gg: AZuq6aJlFlKy3/Zfxc0lDR/PZLqfzEV7YVqtuNeKtw4rodB/T+6g8207Pi5ubZpsvkM
	r1auwU+fdsMs3HoLa3hWgevprHBeyBlgujeTty65hfDORXl6gmPGQOj7UTZ+uGs3Q9GML95BDop
	KPVm/p+KoYf7x67fvuoV5Gq53+WF6Wfw2e89qD99hWbARNDcLl7phwxTder9PsaIhVvMf6PuWnf
	TBg/9vKp8GydY/QvvmUM8tZAi68cXn3Zv8lYir9FK039eEsTr2Sfg+UNAlaMqb4KGPha1mF+U0j
	9v3Ry1lOj8BOgfOrd0CTgM+PcoAi/oAY7z9nmgE3QDddXxH5J0Uk+3qG04mrlk9QhgNFXWwf6ej
	A/frcOXwFwpeAgN8L35+N72Go740yj2Cv4sOj+4au06OfzIFB84GGJBo5ex2QPeqe4lZAU8curU
	Kjx9zjQP4rYvwdlBD6lCvX9iLKWHxhotE=
X-Received: by 2002:a05:600c:4e14:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-480470a6bb1mr487625e9.16.1769013632032;
        Wed, 21 Jan 2026 08:40:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:40:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jan 2026 17:40:26 +0100
Subject: [PATCH 1/3] dt-binding: vendor-prefixes: document the Ayeneo brand
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-1-bb3f95f1c085@linaro.org>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cJ+fpKUN2CJHaLJYtnMXTQDEo8RTawpmcuU2CAoDmOA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF82obrGjAidxJJHhz2jzclHKgnV7RqPHaMXRKs
 wghZOmaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBfAAKCRB33NvayMhJ0UYtEA
 CuoW6Xpnu8TCP5r8IvEk2Ul4i2nMSYjbAtOpsTuv7Bvju45OvWmtzE+BH+PvMXtH2DWTKhnPw2Y4Hp
 z4KhyqJDQ7ClKNWUGgtRyQoOEqn3QCVyJz0g2UfrcYaq6pbZDe8jyiGbzKpM3Z4+yYkIn9Z/onkzDJ
 yBfFGBGwCyLFgPYTrembcKHOty1mGj+aZS40yCEIzaV/rX6Bx5qLyAS6kC7vvbP0HmeaPJUsQDiOqW
 cmufILuWJC3ef391sWp/FLcXQE60Vvz9IyQYc29Ma1t0xRo76jP8Eo43iyTeJdX008kRnLyZn/QH9I
 Ify90WDhOVFFKHOqrdi4TZQSTsD/Ob/Of5P6I9wLE+e51foghEYt8P8wNLMLai6Zmll5gJHPgrcA2z
 N35Q5kVuUL6dnIer0A1atj/Q97GT06+hO5ZISPCOUCwGbjeBYmwMO2AqKqIgvODKXPUqpMtbIe4jsD
 q4ZZ5erYiVt5sd8hOdCYdDSE6TVS508SUSt3Ua8EBtZ88ZJPi4V+nTrR59X8dbUFMEXFDJseNmtUB8
 pBV762lF8xnepjFBKj++7F5SLUXePRJpqY0u4Jfl/h3+IkcpV7qGbisSG+CUaMykgSlRsL99O1H/rg
 /h7wTtjbM/qabCU9vpNW9V36fgbKk49f9KtDOvZvBxgY+w/Wy0iZwMnI+3OQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-90056-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ayaneo.com:url]
X-Rspamd-Queue-Id: 90E2C5B139
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..1f83979e0d09 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -216,6 +216,8 @@ patternProperties:
   "^axiado,.*":
     description: Axiado Corporation
   "^axis,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
+  "^ayaneo,.*":
     description: Axis Communications AB
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd

-- 
2.34.1


