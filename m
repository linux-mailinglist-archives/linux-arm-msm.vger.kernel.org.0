Return-Path: <linux-arm-msm+bounces-116212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R3VuHBtuR2qyYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D70556FFE6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OVG3xW2D;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9555830A120E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CD1371056;
	Fri,  3 Jul 2026 08:00:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98485371889
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:00:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065623; cv=none; b=gE27aaShWgCv9VnL8otb97U1fKa4Mkc716WAZJxE+jOsK2ql+SkpJarwXNiOkOSeuzEy+FEUdjOK1b3pT9fKBHg/75UlLs4xEvooTfJsVXeRZkck9EBQ7WHSCANN/rxvyuvwSc3UFBJsJU3xGuK8KM5Z6aePNACxQlUs9fb3aTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065623; c=relaxed/simple;
	bh=xujQ6tDNZ1nxaHLTf5mA0a97sQ+9NIUOoUvAIyLbYAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEHgfr+rARtIyopuGImsDrrLwCr9UZNHUYmYjg2SmGOKRY7OItG9ABmleg4HIs2Mqca4BVCR1YJpuznjY8quNoM6WpAJBldCDt5hWEix6SXDVlMZBrxxWl81zwjRngIS8SkaoFM6R+iK2aA8XZTR3oCcafJm8nk6/icgtel+RNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVG3xW2D; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-473dc4cf238so164079f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065621; x=1783670421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=OVG3xW2Dg8lOWarXoNyfAYTvLPrpGd71m6s/dDEBcdUfWP14DRAR6dBRtyDV/kvOYW
         0XK3Vns4JjNfRqbuC/fB1+fyPtCFNpdFViLa4bhGvF8Iv4jc0FMW0TCphhEWFN+DwQ5y
         odkvB+PTipL7jiO3nO+wzTMHOavjld5oHJO/CJ0K3EVUGtugVbPkniwn4DUjnKhucJGv
         /uz33LjdHnV0mf0fgrHZQZiKH+JuxYHiyEFEbOd+KoV9eMnJ7TzdeADBD3aS0IT2UAyu
         dvUsUj8rh0XNssU7IAR09FzUjUEqA2zblOLxNY11QrEpLmvZrF05ekFuJlQi8PNX11fP
         9NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065621; x=1783670421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJScOyDCQE/wEAQrfCzXHIwfqBOTOfCYrc2Hkbsw+uI=;
        b=r2u3intSppQtTD97qhydHwePx+t92nqKEls8/IaVmS2CmVG9SEU+QTUhIhao/PbxBp
         OXPYiiYqO+D5PGFtpb+qUAzTmPUIXYMlASUy+4OgFN+f86qfrAeVfykrL66bakXp86ou
         TJOpTbuzjcdlYfgN7TtoRUSJ01ZdR4IkrRpgv3J3vm/HOaaP/5bNQ6AsSgbou1ukIw9T
         YOZ7Z1XPStmesgi7x5YblZ6GstIHThS0yIWXzng2ldOzuEv7Cc9p3MErTdTS/Nd08J2t
         7ZTEgdi54uDO/yCUDOerb3pPLZzbBE420bu0rlfDra1k4RkZOxjbWNjFpPxE/3wdoQzv
         vwmA==
X-Gm-Message-State: AOJu0YwVFgVX2LNUnkfnz5jCM3aZg2HUzgLKS9GoiuoujEHxeTw04EWB
	cVYeWCAnNbw2zK84dLiWvInWaocnvoFvtvmlCLvjFKD++xphhWbzHDncb/J/CA==
X-Gm-Gg: AfdE7cl+tdJsKibSGIFlkyjWA2zRK0gqt+6HaJSKOxcVAsv3Eu1RsXzCFQHhsacl+FX
	OnDKgGu6UVJZcE0PIorOklrfnXX/Bn9c93VkCaaL1CTCSOpEMxXlzjeZU+4dLkQnIOsRtqVod5f
	cR2JbKMYfbUcXyRRrH2FrKNUQqefEmTpz8snu0LaobbJARJ3oOvK2LL3JN47zy1Dr4KDMDnafIr
	jZOiXjwozcJJaNvY8oABKQ76Qcgl/1YuIKLj7K7+MFXbF8vIwMR/qx7tF+bpvbrlNPO0oLRX3rl
	EZoEK99LnEDyIxUgV3PgjeqV8Zf2o8p0QpZ8xdJgHiYCZHW+DZSp2uCv0tw2UDp91H97lgyD+ko
	YsELvIcMapI4ZaseTx9QspmR6baNs4XkwDk+o9KdOwDLibGxRMysIRDbHsqcxl9YOvd5aIPm0Aj
	H9O6zHWiNFmY7vh1I2RQ==
X-Received: by 2002:a05:6000:29db:b0:475:f0c2:5b02 with SMTP id ffacd0b85a97d-4775b45b05emr10239148f8f.56.1783065618490;
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 03 Jul 2026 10:59:38 +0300
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document Samsung Galaxy
 A52/A72
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-sm7125-samsung-v1-1-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
In-Reply-To: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D70556FFE6B

Add compatibles for Samsung Galaxy A52 and A72.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 667607ae2c32..ec3d9be06dd9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1036,6 +1036,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0


