Return-Path: <linux-arm-msm+bounces-110860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lH5vNnhWH2r2kgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C78CB632601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:17:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=e8rHw67s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8823F3004430
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5C6356744;
	Tue,  2 Jun 2026 22:15:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604F336657B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:15:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438528; cv=none; b=tVYa0SQ+9oBiRH9aKWLskwPr+mcHbxGkvhFKlih1iMbsOPPq/sDNYe6oLHiS8YuC2+xP7xAodcEA/UmJuG9ZuiFFnumv5PjpA/fWcis0j4Ej1P0NC2OhwsqetdXJUcDv7g0vinBf+JtZj9bpv9PVxPK1ebwTzp6fqQLlmtG9dAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438528; c=relaxed/simple;
	bh=0l2ZoBsNnuodhMPRW4K78PbcurismS2rK+dwCagNV1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQPHm5uY5jIcppbjP4EsunclubUT6X4uaLWzeSOqZQmG/PPA3qPJz6JKQyEPhBGb9Jg7KTJGEIkL6HXml4ysfVL+PYtIpc352e2BWI7Af+NMPLDRXok7bLhCVUibBWsdMB+BVF1HPLqYJpP7twHaM3mX3XDw1Y9abOSSW9xBHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8rHw67s; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa65757ef4so401679e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438526; x=1781043326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=e8rHw67skHmOQ8kPoTe6+oocv4OUg/IB2nEMr+0fpK4i5Gb2Ty7tk+7gOoSVPyFYkj
         cz/rgfHDQo3o4q3rgEEfot2bUDKa/U5IhhwM60C5H2eqV32hKrWQOizcVhOhjldx6VFJ
         7Gy4PbKz6Q7O/j43kO62HDI6B7Dm9I/BhUsVtrgQs8+vW8MS+68ML1f+aJtRoQF9neUF
         zzQ86WLaAsy6UcFJiXMskcb3xNHNAzDElazx1IwJinN183bynJ6KCOrm/AZFplO8LuF5
         XlprvD1OHBrBF0IoOIm+TDoV/lCxVXfly3/xY8SPgMXRqMLKXSVRvtXy4sdy9o+7QAsW
         4e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438526; x=1781043326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgy25aO5siADmjOHA8m8ArvPv18ukgqv39s8uxTpK68=;
        b=n1iLgp7sUa9lDKCHDj3E5xmalMS+ZTv70aRb+8vcJz1QwkOtQBVPopppQDvsTXXg40
         TKTcF+/pDUdDi5LL8mMn4wqZnspCpng0lnqdWxthzggj1+jgIkr/nopM2m9grhfC6DzI
         KlNDJFC5BtNHPpfmnb1uvEwjk3u7r/337sLpEdAZS1+vzqWLL9OWYjlkzNQFuSEddCjH
         WOj1gsmtqV7OXQEvvEvRc81rNpZCi8A3wjJAOwe3K9I+dQUyA2M8qgsTzUPNua/JyNFc
         xBofHOwYWJFpF6+cGKbHCAZ4g8qLkfHL9sRvBeYP+BLAzfcSF5fiZBAZo3B+o/uoulYX
         eKHw==
X-Gm-Message-State: AOJu0YxpL2BQLhJ33oJgWgVr38scxz7RMaEAt+7WJ6I4MnshwZDW4jTb
	jkRojrXlhVPGbfg8McTMBWwnGWtoAGLoEjZ0E6Nqgx/EbCXCYlnukVtAozPTuaTSrnI=
X-Gm-Gg: Acq92OHZmfT4ExJ1GtoAr6vtqViDdyBSJCQggqQft2x3CTcWp3hlRdljwqALFWC8jJW
	cA3go0SZpm7Vef+JGwO9D9s5jpp6wCDYrR9KHudkpqirsvaH7+pVt1qE5+9XvY/BYpL8wihLouz
	6Tkkr/AF8WNxX21KYNqRKqYGMmZ8o/mF8l07sfU5YUKgSH0B6zPUE13JUlKuBlUoeqVG9N6/bqn
	X+rv+55LL9piePJulUhnaas57o9Cxh1eS39FerTNBQcsuZ13H20YL0+UCx8qSu8p61FNtpd0K6X
	/djgbjLupRTUxq6Qv6lm2U9nDFO/XJGsLfn5n77U7oG+SVUVCccYJUzqpY9HqNX1Ph02TvakVkv
	vPtgkdEGwJ6LDVuvEbPkG2mkh1N2qkgNhSgf9QqPLgDaPo8daL7GPuDXqdDIW/nS76y2IWg//EM
	AWZCFhJdmHf0L0ii9aW8pPYY3dT0IBMLtGTwJ1qD9XhPlTEipQVbgkylN1OHcaLyiVrid5kXWY9
	DGNe9PIT7v/1Syu
X-Received: by 2002:a05:6512:3c95:b0:5aa:7126:c62e with SMTP id 2adb3069b0e04-5aa7beaff61mr128839e87.2.1780438525691;
        Tue, 02 Jun 2026 15:15:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm217245e87.5.2026.06.02.15.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:15:22 -0700 (PDT)
Message-ID: <d9564f1e-0b5e-4c69-88c5-b57ab2e0b543@linaro.org>
Date: Wed, 3 Jun 2026 01:15:20 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-3-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110860-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hangxiang.ma@oss.qualcomm.com,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:todortoo@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C78CB632601

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

