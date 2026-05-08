Return-Path: <linux-arm-msm+bounces-106628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIWrAZK1/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 965274F4B9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7609E301C808
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD4737BE80;
	Fri,  8 May 2026 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKX3v2cy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FB388E69
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234765; cv=none; b=Ebhd7DVJ1g49hnUPecBGMIkbV6VOmZr3a8MnFQ++dxDV5RXtBCTIrWV5AQVErrF3G9Ymi+9+0XLzzGGuOEXMcpfxr4S/8EaHu7WLMjKIXwv1oBEmCSnqS+fJu2/eee785SLv63qH86qy/mFWpnO6MmThdR1ePbEUV36PQ/1BiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234765; c=relaxed/simple;
	bh=7HtEkn1G6Gt+KqI9Inj3vguOrvstZekSSZzl3+vPWJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIV/YTh7f/l/N9ym1FF3bP2PgLi137f+/Xqv7F/2CBkk3xGN/s0ztekSQf1+/oTJkfKgW7FUaXNsiLBl5Diz6Ue78Bxj2Kiy9dCUdI3pDPoEEr/cmu1jB4XOSW9kED3g34WRUYGsc3IMqY16UZFyw1Qe73RqVGcDrGYOOPy25+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKX3v2cy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso2580411a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778234760; x=1778839560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=mKX3v2cyUXfWRT5X5osfq2WBcZQATjRgkcPJfkaRqDd7Jxcxcvu1eCHXYuOtLrSzuP
         /uHIAOZEuZdDEsumX7xFK0exxOEh9BeBB/dz1iK3LI2xYClnX6PvHLyOsbZwX6SAgow6
         zTUdzKHj/QI0eqswypAEnd5kEc+IwWBMVxj1E93c4VxjHCD0lvYxFjlXD2KxF21azkCJ
         /+iMtseDkn5OLBKA9kgLSnv1shtQ6u2ho0P179u0jFl21E14BOk6PqgHQKISKlO4whXF
         Z5irl0CBpfpwN7HLPZwUqYSNO4a1o4m58hrOQ4QMU5oo8EagJUoYQWzbAFNmtJICFqAv
         h3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234760; x=1778839560;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hxarCXBu2q9FLo6gBfwZV7234oitg8nQDrnEw0Apq8=;
        b=FFgToD0CYfJLG1utRueIb/amn8ZYSTFSd8nFVKVLVY7H0VCBxpdUOspSXVIkcyzxb9
         f53E+IpxsyohQ1CF3ZsvjEUTtWpkzmhT5Xv6G3mNholmtZA/JskgQwoQvPSMe9Np6DeY
         F3Qm85XQ72e1UQObFl3iKBJDsCuhDznmnURnOkAJarFkuIZhDkFbRYjEwozBWJs0kXt0
         6fVO7RZyW8eLNPiHLjL1SPP+waGagdpOTMMmPwNpygnXu+GYrXVqL+iyXtrKsckzS05h
         joV5Ld1c4SduyWi0b0YE7SL+zbWZvhAk4nBxuHWeZt6FqpkfrRv7cOGrSBvbtiMI8oRY
         v5Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8CHxXveHIAj1YUVsOoWTt21R4o1mKrlNi0N1TDpTL4UV0KBH11eqydLb4blzWWHk/SbULShpZXd7feSSOY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/LNhQeK3qXDrgPyg97IV5EkzxkAk6Obu1C5zy2QKlIwShCCy
	K4qpRbA3bAjiDBkxMLCHIwDYjoWySutUOHAOLl5X0A8jiUfKRsFNzFiaQOifqYFbAL0=
X-Gm-Gg: Acq92OGPzSiUAMZyC7POEERD2N89Yj5NDEO/awpmJTFTC/2Mn9WOHBX76Vv5FlFbJz6
	Yk5yq/Vq9GxPM+K+Fe3hz5JOb+Al0lJ+ii7uA9QLANZn2fqYnFhV9cKi4cHMhCVx9A4Z4f5In97
	Rqjjj7zoDs3Y2yB1sBElTPKvXSwrFMy7borYvE9LQYShLhywG8fZgKaYxcD7wmcQCgtIXgzc5sa
	OqSSwLqMan0WjxshifnBw7iGDHUw4k4gTXIaOc+E9aCYVB+B5y/55QjIgBX/Cjh4XHOPuj+ND7M
	tr8bJKZ6XqLmPeh1pHBUKV5euooAHJeYjV6tINu+KPZ8AsFl+B0F4arIG61SdRPiH9ZzOnjosMY
	7QIglO4XCBqlrwHckM3qY+t0qfaUr1W6JaJVHBSWq0xcaFDDgqqjV88Oy2UjumUhKYhITli58uQ
	p/H2wHCZP6Gq1M5myXmYFcAbfrIi0bw+6b7P8=
X-Received: by 2002:a05:6402:5287:b0:674:b1b1:d039 with SMTP id 4fb4d7f45d1cf-67ef0787b80mr978564a12.11.1778234760387;
        Fri, 08 May 2026 03:06:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3bb2asm477788a12.6.2026.05.08.03.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:05:59 -0700 (PDT)
Message-ID: <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
Date: Fri, 8 May 2026 11:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 965274F4B9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-106628-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 07/05/2026 23:49, Loic Poulain wrote:
> +/**
> + * struct camss_isp_job_ops - per-job operation callbacks
> + *
> + * @ready:  Optional; return %true if the job can be submitted to hardware.
> + *          Called outside the scheduler spinlock.  May be NULL (always ready).
> + * @run:    Start the hardware for this job.  Called from workqueue context.
> + *          @ctx_changed is %true when this job differs from the previously
> + *          run job (i.e. first run ever, or a different context took over).
> + * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
> + *          Called from process context during camss_isp_sched_cancel().
> + *          May be NULL.
> + */
> +struct camss_isp_job_ops {
> +	bool	(*ready)(void *priv);
> +	void	(*run)(void *priv, bool ctx_changed);
> +	void	(*abort)(void *priv);
> +};

I'll reiterate, I don't think this is needed and is overkill.

v4l2_m2m_ops already has device_run(), job_abort() and job_ready().

:g/ISP_SCHED_PAUSED/s//v4l2_m2m->suspend()/resume()/g

This seems like codebomb of a parallel implementation, which can be 
largely covered by existing v4l2 stuff and if not then should be 
justified in v4l2 as a new design paradigm.

---
bod

