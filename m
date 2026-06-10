Return-Path: <linux-arm-msm+bounces-112371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AFIzLkwrKWqiRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD16667BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=MN7OfKMT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112371-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112371-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ACF3316C811
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAFB3B14B6;
	Wed, 10 Jun 2026 08:57:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268843AB287
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081872; cv=none; b=Q+MYU5gsj5nVrP/chl0dC4ogGNZuWN2IKDT9vMEdcbqvY2dyVtej56NoDu297mMWYg1ZhHbqBfHv0KMOkK2rGUpleJ/+UuWdptQ/2BqHz4qP3goJk7lMQboAaYkQYi4Mc8+DmXAgrI64RYCqFmK2QW6GuorJ5yu9H8O4gYg/CV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081872; c=relaxed/simple;
	bh=1npweHVp9OmRheT/zegFkBMOxoCfQB0An9chDs3xjhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rt3y/FNJKQydAoO+3MH31d+dpM/AWnXc/u9Z6THXc/nJdsDeKs4zQyc1BXBGwMuq3y6phBrqCsv97EgnC5ayruZPGb6dy4QiSqtVrU14nMU+NnBO/2Lr9ToK7BID/Fd2bj2gNZVaMlVllS+eyMfoXCuutQajFD7DilR9/8k9msk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=MN7OfKMT; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490a76757e5so42481635e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081870; x=1781686670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGZDkKeFxbNnSDuxlFvYzVfY/JIiXBnOSQb+89u/BgQ=;
        b=MN7OfKMT6EWNpkpQJ2Gnr5fEFEWYcJRcGH1u2VHpwgDu5uObpNytSqoIS+oy4cBL64
         3/TP2h42QejgJeM0xAOCoeynNFqiEAbFsJtdH5+jj6fcpZr+rMtOboa2xNwo7Hv+9O+6
         e4iyI1JhhgwUYIDKksFBcRrVDJL4djN7w0YeGpGJLMsUBKLJ2ZQa0ISAM6UIc2fEL0WF
         gtLou6LihF76hPrkzB+sRbWnZl+wMx9wpB5t3EdGkrUzsBMTwXIZ7TLMIzSbJF496/p5
         lrGKnp2uByzuiuHg1qQUbTVZGxx3VucXZh48lTSC7VaCDd1s9yj0sKcnfj13OMao/4jS
         VkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081870; x=1781686670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGZDkKeFxbNnSDuxlFvYzVfY/JIiXBnOSQb+89u/BgQ=;
        b=LjsfEj89+a0GaMcg0NwmR5Zi/8bBg6f4DK2STux5aCL0VdzIaOmhqIFguYLS4XuFaR
         cKacEePFu4Bede7/PDwEZ0VyfU/WwNuNAz25Zqy7Kp/LxiK5JhOxSymcvkZJBm2iT+Jo
         4talM3F7esYJ71BgL7m2QftEzsJJQyN2qtqTt3HXufpfabGfAr80bf9uefgdFV0FMiHT
         UoAx1/f8SGjvTUK8p5BSj+taRyTjkJIxPN0UQh1/DKc+KDdXle2uMeS6bLP33sxB9S2e
         IzwzfFa3iKQCvjpFoc5Sd8ksNAbx2EGI+YIFbDIdVab08AytcB7z0w+6VzOxYVtJzJei
         FDTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iqeSFMVfq+WOPaRWlpW9gp0KowGQrWmLaQxK8HNtI3XLPfmIQs7qrWQ7aoVjAjigrv9MlXTcvbSxVx6Ti@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCH6Y0oBNwye7LAMK0mLrYT0eM2KaC+JKnW0yYYtorDmBl3vZ
	yGj6IcjA77acToNo0i+z0m+VARV8XppExY3JdSJqol+IzJH6pd6YPmil1okOLCDSE6k=
X-Gm-Gg: Acq92OGrcP5twL7VFUR6Zkh0CHIWTQPQ9TSFLIweZvg88utulPiCwCoUNPyIumDK92y
	AtE237bD898lGVeb3N2URMIGiyANbyYvVK5Ao8f5pYKAP5Vsl0ljl922aiDyR7Ji8L/IiruRR/j
	xzkN87XUWuIqiYHJM/OdnMrwEaRG7Fd2VI+/qxzFFDBgcBEy+K2p0d2HcLzpmZcSyelXX0vyvn+
	I4y7tjdgfatXkmVhPiQTUdd4oA1CjAlfy/46Cqws7QnWuKULepkkDtk5ODspB0CoF0ZcC6JMMA3
	vpfhrlq0ou3PMn5gUGe7S/f85BAlQU7M1U0gj4YIg0UIK7P7/uYwulI6tIw8aAIDgLNV4V12Qie
	YwmuWWzn4wfUUaQt+S3m4dyECuT3c8hPWifLkzn/3KU0iMNRmRRRDj/b1JWBYLkRSUSBpwWpqEP
	s+vSIr4RFAEYqnDRiccJmhkONbSm8xcDhvjD3SpBiHCpBqLM0qwC/6e1kea0DdVihI5bC/iN9tD
	NnFmdpAADzPClYH6YJfCGqftsDCBRv53Q==
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490c25b1277mr455620115e9.12.1781081869366;
        Wed, 10 Jun 2026 01:57:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:49 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Wed, 10 Jun 2026 09:57:45 +0100
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-1-358e71d606bc@imd-tec.com>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:william.bright@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,imd-tec.com:dkim,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BD16667BA1

Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..1484442fa0d9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -783,6 +783,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0


