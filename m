Return-Path: <linux-arm-msm+bounces-111034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Io5CKIJXIGoj1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:34:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E344639C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:34:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o95pM6xt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A19C315FC03
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1F23E5585;
	Wed,  3 Jun 2026 15:49:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490B63E51E8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501752; cv=none; b=ErcZ0Jifri+3Qa4CXohWhOY2NZhgrOzHOCPpYLR5L8ReVTtxKmWGUMOcSxC0rMSQdrJxU2FjeuPWgCY+fg6CJxNFNuhmV75Z/sCxAIb8H1hMKqR/s+cporKtZKpQAbAbI84yRwBgZJgNN1WGx0fftsrgxgWZM2/7ZiHw6wMngWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501752; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4SoGgNm6zfilURJvOBaSYrr1EW4LlLQT4LtyQ4rCX2r1rUutvy9NeEQ5TRG0i41FLpBG9P6AeDp5xoJcNyP8hrrx9SY1SqshDwM9u96mz7UxT48Gp+sr6TtG+xGsQh1WFqZgIU64FOEZq13n5exglPzf+F1pSubOpCArDzAV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o95pM6xt; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-460166910e6so1904082f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501750; x=1781106550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=o95pM6xtY6vPEo24o9E6GJmBYR3iaf1uIW1wbwi8XilBsQbtrrvFDNB46JoVzydlo6
         b7vdSzUbR/IiE7xQwAzpIsGjP0nRtlMz9SgY/T1aGsR+FD71QxoBCvNKmKCu+qkUctep
         1oSeHwX6HAeQ6/yVhn8RC5HjgMuffPuJ7kUS0fBZwvaQJirIv1PMpOZWIfL/IHFKn5qy
         Cd3cVHI7wTalWdlnCXudseuxREY1UGfRnAaEzODNdDO1OMCiszqCV13HdazApuyqtlFs
         d2ctreF0SmJxT8cQQ1J2pNphk3m5uS0/fu6Xn6ZTTePfepVq15i5X0i6NoNkQOk5OeDX
         zHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501750; x=1781106550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=PM0qqL7V52VltTswGImna930Q/U+tBvNqJgUuA2VUllOzzJtl7vHCSbuDRNIabqx2/
         LROXI8JcWCTCK1/VzUUqDC1k1NdbzA8KkStJyCWeuufakheUiZ9XTahiJhRYFsIjoAnG
         7iTA5oRlAQ/3tRldzEupJWJpN+W4uo6Zp3YqGexpH42pS6w7E1SpowvMB1WdwEWqSMzy
         D7d1oKgt+n0XppxcHAYW2CoUJkb4EFfyswxDbofMjG4L+myVBuPWbCin+68L1/sRtu/R
         ViYZmCsEvFIg82RUYR0q0vr6XPaP8P5+Vf7CTJ1BLCVEaJJQAB5fWS3ikJBXPmsxceJh
         Mg2w==
X-Gm-Message-State: AOJu0Yx3lwdp11fhkjQ7o8jay3qjVrlgZqJzDGBgqnAW15egfu5kwscb
	3h+tjIlUEdDPRslwCzPDrU9fgDWMeTfN2/R4u6a2TpdVQ4vrAH6alQh5
X-Gm-Gg: Acq92OFbqFSEWCOKfSo66rJ0qCX4YSOOVUPEWhR0W/2fRZ4vaCPOlb0Tn01RL2FSnsH
	Wle0SuLkp7vjPiF/xmr4PHtCjPwM39QEHesUAYJs1QL1oHSxJ/QDGyRuuBTgtmJQWHrCBSkj4ZZ
	WBqUx+SADBm25LYW6baxUGnEAhcUFHfe3frWFUPt0Fsa+l6HjJK8YFLGhuBm54RAx3v3Eiojqzt
	4seD9ta4Z7xzhy85RcjMlfvfC5qAlNVBS+tR/SWbCyicdB5Bb23D2z0hSrbun20GBlYmHsp2RDz
	4z6a1kTsxLjlzB5va8m9aN38QhFcJuy1xnjWNEMfaZesyuRnw3vPJ6SP9ex/4RHep+ntfOIHMdT
	EnzLFJKDx5BEZpW0+FAyqX11e/FHkqyiTo75NhLTkuucFADLKffTBzrIzKO4WkItqx3q7TVLvwv
	qDIoX9wW0AFopOVaJka5jwb3KFZv6+miVpgTTK6Q==
X-Received: by 2002:a05:600c:528b:b0:490:b297:89b with SMTP id 5b1f17b1804b1-490b5ed6482mr79101105e9.21.1780501749614;
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 03 Jun 2026 18:48:21 +0300
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-yukon-eagle-v2-1-f86b440583f5@gmail.com>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
In-Reply-To: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E344639C4B

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0


