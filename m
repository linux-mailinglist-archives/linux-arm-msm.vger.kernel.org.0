Return-Path: <linux-arm-msm+bounces-98954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI0INX9ovWnL9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:32:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C6E2DCB42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90CB83048EC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FEA3C7E1C;
	Fri, 20 Mar 2026 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpHpAdXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CC38F957
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020280; cv=none; b=ZUmRO6OhZMjXeDAwl2QP5QrqxnwsnBmSa4bhq2t4dbsMI+Czvfkd8ttY7yeQfktF1PpEzr5JSBEqooWRst5/0Yci/fCa29nfGzGoQgnmziKd64d+sgrVMBdk2H0wNDGJjCvIbWQnUl4W5h4+s15wGysWRL69MyHdRKNNwLjuoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020280; c=relaxed/simple;
	bh=1uUWbAfjhQKGsekiHalIN3wkJj3mxEEBjAHougA6NbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X79D6VQgr5utUiF0fgqUmW3aYsB7w2oP6kjZkuTy3cUbub76hnThaAcZwu5WWYyzTsWYJS1gv/g+0Tm6RQJZrohZwxz6nC025MslHVxckPTCzkcHKKbysQ5qaScnz9LaB3a+wFZ7yPwhxHVbGj8lyeTirh5NkpQAwegqofBH9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpHpAdXH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso5970385e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774020278; x=1774625078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=rpHpAdXH55b27GtYFM02oUpbQYUX469RBhm9tX8PCevng+6acrEtSge84WdQvJWbKr
         1BYHZiANoz+d78VO7fgy21jGLgjBmKUh/6ND486tR1t+aGfF4ksuOEGYw/1g3CNxXi2N
         GG7GeHAasVmHXOJZHWDdSMtL+yZnPT66dmFb4sgBKdrPaq5VqDqznoKUy/yAeKGsSb4L
         tf1c/xhgYGmR+BSu7qlesId9pkMhOqhpmaUowtEJlAu4qpZWYM6vr9wBfQim20hXY+yg
         zcAEMKO/m7BhBs0lXOcFuemNwI41xwXmLJ9g+L60zftWEImu0f5Ajfc2yIVsYl9tDxSj
         1y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020278; x=1774625078;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=qOAW9LiSA9dR85T4XkRoytoEvjY96wBoFw7DA+IWqOWm8/zk7yfxfbxuJKyLG3bNWw
         RKtQlgg+C2+Fzn/nYAJRqH++Jn7vHGEfSdPOC22pSi3CTz+YCpO1lJYO1XHmDxE/kS9M
         MWicFfdbKwZUyDCaTi/5o4YRpYxuayEaXBrk0bdSs+Ps97oIXYAf+2Ld3mWqG1/8jCV6
         gwgZZoMmhcxgNsiNBagWgvakd1ZgCBSSBLISRlopb0vpDB39rTR6ctQonD/7yqWBmVUi
         Q7AY5c6hCW4yGab01LGgU7j5VLTQH5IMSaW+GHsD9M7iTQkEgsxwdP0OYhycrR5LrrUj
         3NRA==
X-Forwarded-Encrypted: i=1; AJvYcCV8tiGBwoCwAUXyIp+f0Hug8y0E9+6JJoymoUUbvIM5WyhLY8pe2BDm+K6VfIs4KSwe7mmV4rgqiVqbMKN2@vger.kernel.org
X-Gm-Message-State: AOJu0YyszbqdQ6NYrZywwk1GaQOCttDwES5adXpxBkaUxj2jeGunQLLU
	nTnTQpCwAUS36+au1u6STtjxiLd2NXABCdrpOxrIyfEF4QGDi0nyxL5s1PWD8zWdGf4=
X-Gm-Gg: ATEYQzwZMpQ4OA0XAuVzf0dSsdqv8E0I9vqp0EKYatNPm69IOib4yAn+bqsL+nnrnIi
	5tgLBQFKPoZh9HXTgZtQLOFmctaiue4kMdOUJbjvPUbS+KPqygKDmbvax8IL8f24XanF71KEaBp
	DKpz7g2AfAvDdeKv6npHG+xZ98BWa6MAWqUizFp88f/dky+700mn9Hxz0oWp/a9Yq6fT+rRjRf+
	zaueGudbMDFtgRG/6IbRdLI6ODTK+MPKAtjNJZs8w+lS8HQlBr+0R8iOXUV9370JOqPdhqAMno1
	S+piu4GQByogNB3cA7QTAH5YGfv0EcqV6fY08icij/oAPxUdqXY2BJu/ODxKVkDNphJxoCL5BO4
	HdI0zUMe1XmtYM7gK/UxCNFrgMnlvDV4T2U3zF+52tJcM8uXy+BMtS1+CJ+sZPPdyF1DE0LaXZD
	REO95rwF7MeNDGpD+AnJAu1nnQvCT2da5aN3hQrz4apdjR6Gc=
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr46366735e9.3.1774020277489;
        Fri, 20 Mar 2026 08:24:37 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1e6029sm33334055e9.9.2026.03.20.08.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:24:36 -0700 (PDT)
Message-ID: <e5e9cc38-9d8c-4a79-ab4f-8c5ed98f6eee@linaro.org>
Date: Fri, 20 Mar 2026 15:24:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: avoid format string warning
To: Arnd Bergmann <arnd@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260320151828.3456863-1-arnd@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260320151828.3456863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linaro.org,gmail.com,google.com,kernel.org,mailoo.org,oss.qualcomm.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 96C6E2DCB42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/03/2026 15:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 warns about csiphy_match_clock_name() taking a variable format
> string that is not checked against the 'int index' argument:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:566:44: error: diagnostic behavior may be improved by
>        adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name'
>        [-Werror,-Wmissing-format-attribute]
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        | __attribute__((format(printf, 2, 3)))
>    562 |                                     int index)
>    563 | {
>    564 |         char name[16]; /* csiphyXXX_timer\0 */
>    565 |
>    566 |         snprintf(name, sizeof(name), format, index);
>        |                                                   ^
> drivers/media/platform/qcom/camss/camss-csiphy.c:561:13: note: 'csiphy_match_clock_name' declared here
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        |             ^
> 
> Change the function to use a snprintf() style format string that allows this
> to be checked at the call site.
> 
> Fixes: 0727615fb975 ("media: qcom: camss: Functionally decompose CSIPHY clock lookups")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f414..78a1b568dbae 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -558,12 +558,16 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
>   	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
>   }
>   
> -static bool csiphy_match_clock_name(const char *clock_name, const char *format,
> -				    int index)
> +static bool __printf(2, 3)
> +csiphy_match_clock_name(const char *clock_name, const char *format, ...)
>   {
>   	char name[16]; /* csiphyXXX_timer\0 */
> +	va_list args;
> +
> +	va_start(args, format);
> +	vsnprintf(name, sizeof(name), format, args);
> +	va_end(args);
>   
> -	snprintf(name, sizeof(name), format, index);
>   	return !strcmp(clock_name, name);
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

