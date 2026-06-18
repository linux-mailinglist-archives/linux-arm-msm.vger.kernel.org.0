Return-Path: <linux-arm-msm+bounces-113783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id agwsC5n6M2pTKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:03:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FB6A0C71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 16:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Zzf3yzOK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113783-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113783-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B0783055059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E41A3FB7EE;
	Thu, 18 Jun 2026 14:02:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22673C2781
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:02:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791324; cv=none; b=PuY4Z/MEfDJC8NUGuQzSw1/AY0RxS293WVoRuDOYVt44wYfgEPlBmTXfC/rED0vSLZc8QvLd5t1smcbbTX/Oq0HgI92r9WKOQLXvOf9Ehczk+8mUwuvS2Y9yJSk66c5M5s+paEcpIak+swNRJVRC989JBoA1Lcid0cjKHbma5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791324; c=relaxed/simple;
	bh=Z2SMe4UNKa4UxIm3IZIpXDdOMhQ1vAgVQ4kXwkookSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BDp2u+QBxonGUqeKVE6B0DyYR6WCDw5edSPmN27v1hJ8rCa+R7hCQ4mOS0vZXCnEzq2SmBNf/GSnQM0Yx+R+St5q9WDOnNRZ9WI3agvcED/cQimh/oUPsvYFQFMFFuVM/fkYSkOC+qMz+X/tMpxlu7BqPwAm4ZyNzu1PuGfU9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zzf3yzOK; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49222fb062bso8963715e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791321; x=1782396121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2QWH3SS1Zf5injWkkRJm4kCxe62QJri1fUeqGxCiOE=;
        b=Zzf3yzOK5/tckR16kNnRNCKSm+HzGsylcWojJOT3k60Pis+qho8zJcZBeK3yj3NZUU
         NMFoStLMkVbE2GuTLckdpyeNBAPoJ+kxE9fuE2GW3fSGjcyeWwYJT3opTWMPFRLXMTXU
         C0SwJCTOIapivCF+ajUnHVuIACJPkDGPTbdi1817w+a3IRaJD4bkOVaf1YCfU9kE7o5J
         OuWICX4bWA/iEXlRsDK7Ni7PZo/HbgYR1gIfDifus2i2Jw8L25fnRKzAb37T8+upU+H8
         eJb0GFnWI5UF4QQhSQFYMRW2Su5MVMFVWlSEINts1Tk8zQBpYk5D6E9PCoQK+jh2schp
         eiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791321; x=1782396121;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q2QWH3SS1Zf5injWkkRJm4kCxe62QJri1fUeqGxCiOE=;
        b=oKgcurjrcaV+2MKUumx56U9lpIVqHvq1KoxwlrYnw/wV8UTTzUxPxaT+gc6bW5V70i
         j50jHF9MK421WFDLLP6pSIv9H2hE6GPPUKRjCWpRGckb7WCx6HerZQlkoEfVy7bneDfV
         JavJot9uKA62T8tDXVFF3n5O04cKcgHmEJWrsW8ch5YzleMBHneiqoMZGgVnrQe1aAvg
         kwJjVbsolA43SvwBTMSo/e9fsHsg4PYHJjyn+xQLeXnJCWaPaNJeOBSZR2jKTJd9NpYa
         l99NaHB2qDfVhGWpj4eel08BZwUJ/079vbvu1Lbj1Io/9KPMoHfdzNfMoFSlQN5E4O9b
         KhAg==
X-Gm-Message-State: AOJu0YyH8JY2Nw24pSjAKpqssajx9UJQafroOFXL2J4usn3AYwfZMHtV
	xLp4IQO1F37ls+zmaCSifBZSAm9eI25aC7gjZ1CkGddwMHq1Opk+P0b+Mo4+CPjqoZg=
X-Gm-Gg: AfdE7clVqLGJwzGRDXMafj3VBx2JOi/XcXQtaJky5GakhbXlVQMV3O6t10Src7KPIZh
	UH0m3F0TymYtGiyUFJzS0H55dPPvPNVyx40klR93w7XLPTNdc9DUKWpf0n5cRgxEcyV2CU79Kp8
	TyC6DufwI76H1bWRTgxUh+rPi0cyLPgT1Ikpj5Ur78oZTJDtcKF7cc0vD6Ojf4Rd3GTsNvarsi7
	era5AyKD3edsHHhfaTNKXV7W4c/eTnmzN6GEIdmmYLOD4lkLbzQdYyvR0UnCm65RfLAp7LUYI9w
	V8GLSS0bI91m9hp873DEo8YI/ilsCxiknJdK5/1XGvbdHn4qfcN49zg3VyD/3tOPtti+APk4WNj
	ABpwlhxUZqSJD+ocAIqwCQXICdBvGIcuVpkQNLl6tbC83g301IIvz+v6meBma0rBQ0DzeZFDgGq
	xjd9gtvNho2UQencA52NKinZBf56zIyv9kzQ==
X-Received: by 2002:a05:600c:c491:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-492333bf72cmr148965315e9.11.1781791319742;
        Thu, 18 Jun 2026 07:01:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm27901309f8f.22.2026.06.18.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:01:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
Subject: Re: (subset) [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550
 Devices
Message-Id: <178179131851.245596.10889069443600186081.b4-ty@b4>
Date: Thu, 18 Jun 2026 16:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113783-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:webgeek1234@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wuxilin123@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:teguh@sobir.in,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A0FB6A0C71

Hi,

On Sun, 03 May 2026 16:48:42 -0500, Aaron Kling wrote:
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fc917a533da47a5d0fd2f3df9052ee6dc5e6adad

-- 
Neil


