Return-Path: <linux-arm-msm+bounces-90685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIPeGYmKeGn5qwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:51:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BED9215B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86E24300531E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00573335060;
	Tue, 27 Jan 2026 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdF6twqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF79331A4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507194; cv=none; b=Ho2B8ddz39fBoBx1AVya7bVfzk8zFBFDS6mFLGntRL3Ar0rUkqh6n03crXD8Ev7EzT89aTuWcftda5yGVj9qsvK/o6Q0WLmOZMrN89ojbmv5rF3FM7EFf0RVHS9qw+Eb72eiVL/5o04gAzsqX3o+wg94uDqV5jHCPoWgqT9ALgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507194; c=relaxed/simple;
	bh=YPMDHsY+E6S4+d5WZNaKOI3mTSmYZ6YpeACZkXXn1JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5KFNUvMlx3l7qncSoj5595DLF/BsEAzRapfMxqOmBzxRKMeyf2o2rTeOfn4SGbBDFiUXfKBn8Jqr2xSMWDrGpzAGgW6OmDdj0FAV417IyvekMO2SYTFRSNXkCCmhrQvo3fiHPrZzOlljEijW2KpUGNUN5rdI0VYLPOSoOPfxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xdF6twqU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso28755155e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507192; x=1770111992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Mc7eqUFte7LjoMH5xLL/Urc/Se4sUH6oBK2wJaZR1U=;
        b=xdF6twqUB9CpqJUtwDWBCglNJfwZG03xk398bmbQCMI94eeAlqJpqyzXz/Uz7T7Kr9
         dqZvtRfMh5XnhYzmKp3sYMb+HpYQzsqx6r0ZVGLfvo4WS9W+6j5fwpd9BMmMN+zwWHxu
         sU8JHAqMcrIrhReSY9ZEuEJO4OCxzF2LlBINxDvZb3hBjm1/pnq6rgQlFd3aCM1F5kMG
         FEDZJVfVdoXCLPmqTleYKx06m2EmzspnubmDqvbRbGaAivXSkwP5/+75zaTaf70sd6Dz
         JjogK8fI1xpatdf/+rN8kKjlQaLvj/IkpmtUS9501LhU2LSWaORYUHe82XZ+xz0msEGu
         yjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507192; x=1770111992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Mc7eqUFte7LjoMH5xLL/Urc/Se4sUH6oBK2wJaZR1U=;
        b=kPnOJpZuWsw5MW4f6QXBwkOLqV4YKp17CyHSY5nbrslKGI18jO8mWxUTBurevsMssd
         BkNBxZlfV514jvjc0ucUjnDzQQ2xVfx7s9OYbTQHEuSFUT1febgNPehxCl/6pPia7Zmj
         xv6G41SuuXkky1xAGGS4briEDpK6qxHNuwuLA5HfUf40xGy91j6WpO/BluMpj1cbAgES
         ytHSRL3ujqfKmI+AZLYqmfenuLhFFK3ZpU/0c2tG5SRdosVW8+myJuloGG11xSqvr4Yh
         8PUkdtqfBaoIMa+fQ5YgXOcN6LKf0RIRt05VkKurjPiXAbaDTlL0ky4zRWxzKwSUV/1N
         +wLw==
X-Gm-Message-State: AOJu0YxDuCAur+DagmQIopREq4lrwUAvduLz5YG8tzwfBxLAt1DQh1N1
	TlAB8/XeCa+Rr04/3shbUP793q1S065/TfYnfIm7O1MQgPuyYb50Vjn0Q0TlRQda4H0=
X-Gm-Gg: AZuq6aLTYjA2HGlAmDIq/qTCsKf3zwx6gANXvCobW7aGEcJ/TCi7AJ7FIh9+YtPXNia
	grRXVJjBlNMQA3vkFUW2wTg46ejKGgyQtSsaA5Hj/U3lyqTttVd+XuGtRQO6OSZOyEX6+y+lEez
	Pw/zZd8NL4sv/RuquQ7lgaO3HVWKs239mvk5lICQZ4o/JFooXbHMhT+4hyC2jpJNoEMxJ+Qv/83
	TzwrabGXO8JQMjd1gbfRkJmFhP0EFkvnNOXtLjrZJauQXhsohsCPzBq68Kc7k2+KDFykIiEgQA2
	iD5mpxsRkJ7lWze2gpQnMJMEeMdiCoaGA1Fm4iS48GZqHcA/afzHNpKyShfboPA5dm4EOXfCaV4
	jdxe2buHySx5D5eWZI1j3s9UIhug/+lCUUNoAjSzdnVADQPe9GXgUnF7I+lUYpba76ympkEAVWS
	8GXJkK2ue/A/8FKJJL6Cd8i5Am9G2NCypg7wgfVLNTXxLiLODDTn0iOdSAR4RSh/U=
X-Received: by 2002:a05:600c:3b0c:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-48069c8ba67mr12483585e9.32.1769507191725;
        Tue, 27 Jan 2026 01:46:31 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c9cesm37648940f8f.41.2026.01.27.01.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:46:31 -0800 (PST)
Message-ID: <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org>
Date: Tue, 27 Jan 2026 09:46:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-4-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260126173444.10228-4-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90685-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 98BED9215B
X-Rspamd-Action: no action

On 26/01/2026 17:34, Saikiran wrote:
> On Qualcomm X1E80100 platforms, the OV02C10 sensor experiences brownouts
> if power-cycled too quickly (< 2.3s) due to slow passive discharge of
> regulator rails.
> 
> Implement Runtime PM Autosuspend with a delay of 1000ms. This keeps the
> regulators enabled for a short duration after the device is closed,
> preventing costly power-off/power-on cycles during rapid user
> interactions (e.g., browser permission checks).

But if you try to power the sensor 1.1 seconds later what happens ?

With this commit log this submission is a NAK, for example why do I want 
this change on an x86 machine ?

We need to root-cause the failure not paper over it.

---
bod

