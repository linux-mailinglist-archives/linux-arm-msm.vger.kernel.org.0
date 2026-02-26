Return-Path: <linux-arm-msm+bounces-94271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDSzCEIcoGmzfgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:11:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B91A4111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7C9B3038FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FA03A63E1;
	Thu, 26 Feb 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPu8Of5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4F3A4F3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100509; cv=none; b=C1Y2o27X0773Aok5Rg7/5csc+RBflmACSgiSUhxcJEdJw5h4M7C0kJfl8UF3S98VXRz2eB4IRd0k38mxAjQwqVsTvW7YBdVvxhcUjpOw7BbIWUMq8SaWixsZ8vCZtZBU28OKxB0oyFpfQZ40e2fMwjtMdJEDFfd7R2+wfjNFP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100509; c=relaxed/simple;
	bh=5BydSFyv63pr6fLSHNLqeB8iNMXd77Csp2c4cg18zbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fq/LEtUxNDKVWbT35ybdqfJZW75jaPIrFp4PC8v0/pr+ofXSKSrPgVALkjwaVFNHUO5NEOopZcvdccFzBP/XMvTcDs30wmICdz6qpBxUZAa3o5kyOfhjzhGvWIjbmMgfjt/sr3Mk+y4MmA2XlFGwno9RSasgsAxSpi3RLfgbnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPu8Of5e; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso17214755e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772100505; x=1772705305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlBAnP3xiYRcvgAvPoJGYcuSE9c0eE9Ha62LiFhWaSw=;
        b=nPu8Of5eB/etogKwjs9UeCWUqoQ45oguUwHX0PX7YSE4mZA4X8quA+IRmUvmIU5im4
         +oS1W/NjW/hmY/7nsh/g+AxaprhhMAlBgaS6ei/S2LByH2dzXeErZE0sFzC09ibog2kI
         kcEyxAw6DjytvJNP8ifXzoGU+N/3KNSN6rlEhwH6rsgtGlI1EWiobuD8q7ultaw3O0cK
         x+fdYHXfqMcuQYjRBZ602Nlul7S/aF2HYrZHr16XPMFuz67YGPO1ypuZ87KFBBdiGy0W
         VM9AHjDXKI83nAR83/7XCNxgLdEHqRu9i7MIjX3thHX0q2G2jWY8ruDF3ZBfFGDWufDL
         b+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100505; x=1772705305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlBAnP3xiYRcvgAvPoJGYcuSE9c0eE9Ha62LiFhWaSw=;
        b=K4wxCUC3fWrRoNUda4ROVuuPDRmxaPdKHDS8j7RosNhJoCoEBb6R017TJbz7BLSFYw
         1KoadAcGdsY+sdlt85eKCXuIRITfjxR/W/jeldREEAKugdErxhfvuhGoEs2YvqR5pWza
         vFUP0pJKRdxESCOdmg8mc+wiXrLELG7SXuxUMEQwiWwFIVa2kwEO2g0yueJMtd40E1kZ
         TG+W9IvnTdV7QL/7P25FzJBO0nWucheai0NeBZmUdoQK6AhGkjfAAPk1y9C8rHyTbRf0
         BSdzye3PYAYZP7Us89B/ee/stm4kx6NV9sfOq1l1zJzjq6xLQ/O58HbDCtH9mg9AAYGA
         q71w==
X-Gm-Message-State: AOJu0YwmOniF6EnYhzM2rmQZ6L/vuujvugSUppvwZjFjeMgYwZKEkiEJ
	L6gkzCD9Alx5e1/4bL9mW4H7m3TjVh2LqvdqyDYrgGvVNR3AIsfs0NAaEmCx/9i4snE=
X-Gm-Gg: ATEYQzyDr7LD6TLP4FvOSQATxFrIGw1LhXX6SpIKLkI7w+A8HCMTlAiSZriRX/wmNF9
	NPK2iBuR3704ifozGUard/S5Ydym2VRwUFcTgqJQU+d8f11/15JdhEl2Bda3E7ug3WDXG6BYjLS
	VxD2umGVehzMJoldhRd65NgleIG3UWDQg2vdGY5T5DktezzEZqZjym0Y9Zd20wjvshSpypb3eNl
	N6aM4MLwmoJs2t+8GxOO/mBtgp167uI775aEh4++aNesu5zivyHN8n3fLT1Zxpa8GhU+soA2Kdf
	uoXcFqtD9TPb3RXqzfVfcxEVE8NFghbtSKseFT2IxqFY1wgPFd9kTPgfLeNf6Q8mpiKGTjD+8bE
	GFcIpF3awTFCtxOA07p+oE2pmCrwJo1lDYjVl+MlIMANB72JSiN0texGcbiRbqlbx1L2qcjnU2b
	g/OpxpanmtP29IG5cen+sxfKkIFc86aPLuXO9hLChlgzyDY6OVO03npNb9kjGrzAtI
X-Received: by 2002:a05:600c:8b71:b0:483:7ea3:3de3 with SMTP id 5b1f17b1804b1-483c33c3606mr39636555e9.2.1772100504681;
        Thu, 26 Feb 2026 02:08:24 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm38233635e9.3.2026.02.26.02.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 02:08:24 -0800 (PST)
Message-ID: <7174a290-6aad-4e0b-a626-ac560037a702@linaro.org>
Date: Thu, 26 Feb 2026 10:08:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
 <033dcec7-edf0-4c3b-a6ce-14a61d0a0b24@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <033dcec7-edf0-4c3b-a6ce-14a61d0a0b24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D80B91A4111
X-Rspamd-Action: no action

On 26/02/2026 09:59, Krzysztof Kozlowski wrote:
> One single node or split CSI PHY,
> because you cannot take the first option but then six months later send
> complete revamp of the ABI.
> 
> So please decide and answer, e.g. by taking this patch, that you
> understand above and THIS will be your fixed ABI.

Please split it up. There are good hardware reasons to do that.

---
bod

