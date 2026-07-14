Return-Path: <linux-arm-msm+bounces-118987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3YQJK/HzVWozwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:31:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88D7526C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=DDc2iS6Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AA50301CA7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A433FB7EB;
	Tue, 14 Jul 2026 08:26:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329A3FAE10
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:26:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017614; cv=none; b=KY/vT39UDUDrYkbOnAiTtKRYmcgkiUpqpTLgSCJCcTPxhZx7zLDSv3tA+tC/jXj+lG+b/8cLN0gdqbWuOUmcitNAGLbXpMlrE9Q7h5KmtxysmopuijM5q0T0xk8NE/Ck1f212v5cd+objxWhR38d7o+EJAguU9lRSTLIFuYlH2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017614; c=relaxed/simple;
	bh=Pc4VB1+Ef6bvrAi1wEOfOEDmY36YwvKLAzSlaQGE4RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLeMeLBVMXr4xt163PHV1lJviaxUvjprgVi8VvyArN7E/pgo38ObRIZ5aPixtj6ykPrDa0clsNgTnd8qORa162I4Qum5rtFU2J1lC9DqwDiQBZQUNYK+qC+44/O8RqOSnI28ajYkNUtDiTiBtjUsR0M+yrxOO6rsy+nk1hAJfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDc2iS6Z; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so5697799a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784017608; x=1784622408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2cBb0PIK05nLQLX8d8JBI3hyZwFcNaF0BlltgJKRbuY=;
        b=DDc2iS6ZaDSjQz0XA8xSbLZRrsQoRr0n43jeDbgg4jzkify8WnZkE+XEwGt5CdFtM7
         WjOrvyYJcrU2rsXTX0/VpYXiOWfI/Heez9q7P4qhKeiCdQC+RAR4X2PDOq90tAYET1ZL
         yHiQVJE6ddgeYHm7ZoainVwLUD4i1f9JiOHlDmR/ErO0mH6gNd2r//x6W+Hd0nB9GZQt
         O0xjnViYK9zm3dE5KNk9z2AfgoSeg9g4N2PqzSJJvsn82Yw0BSe8B6tNZ575B4QW3Vzc
         sw2uYMFrsEF12t/i5X1g49lHsy+sp0Beu//hWjFgXLf1Q+b0+K10q0QGRayg/5kj78xu
         vwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017608; x=1784622408;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cBb0PIK05nLQLX8d8JBI3hyZwFcNaF0BlltgJKRbuY=;
        b=oHM9y0hnXKn4A6V5TA06owqv/BgmLtd+NLCZ9dd/pFnQjvAaegnsL17AcoH+eTrWTS
         HgO6mTVsWXc1QKLPoxU3iKEZJNwJk1L+X6b1uHaokqbJotwot1ACJw8WbM13ySZf0/lH
         fdRy8n6gQAJB59DC4h2egBJwYPuqA0ZsdvMU7mKB7Ni7Lco0emwMl0velMa4eaNccK0q
         pd0cSwetyp1e7tGgYlDL75RDzlC24EPm7Az7PI2vT3Fz8QXUm+h8SIRvJtFlNWs1m/Ke
         N1c6bUFPCWNKKH1U38UaN5mIDUBNxPgIQiLtbuAJt6q+PjtjfqOwFxegiiFTbkmHp6CJ
         ZqPw==
X-Forwarded-Encrypted: i=1; AHgh+RogfA011U4bLH8vstdM4bqvBy+wuMfXTkcWEoSqDTP/FfLQSl6prS62fga0l4uAKiFAt2bnYdqAzczkDBGJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8g/H/5YlALMqH5NmLwl4MJEaaBy/aFFNI+cDhZddmMJ37AVs+
	xqEA7xc0kd0CeAgZ5XfNvoF4y20wUx1a3wUpWttsWhTIcD3jnoCjBV3sPnqaO0ds+Jw=
X-Gm-Gg: AfdE7ck8wLK+P9ieIVvVA5eUOuUB+UvzomGNj8o5ndXhvgllE1Mz954U8tGIGqtBo4Z
	PXudhXPtMGoGYJj0V0oP/b3q8uLxAaHsjTsgeHGcCXx9Q14jFGqGgZiu+J9X80JYaTXsC7+V3gT
	IoHNpQyoUBNukBb4BMZ9MEcOfAOrN4XBUy7uNSBfNAf2EWHwrqhF4ECa/cUQ8rq6Uqx118FH+HK
	kaLDln1CJu8cGiXUnitB1KzszOPXfwEuHdRN3++/quaw5idCoeJEB9QO+yc+jnWDsXp1HGo93Ar
	ERDjhzhDz9Fll/0mDkHp+PoalO5OrZQnDdwawaDlill9yHr6rFqQgAitZBzHztb4Z+3sO8+Ny1r
	ZZIOyDo9Ft5Ctf1iwRTIgDmTYGhJDdrPz0tJ0wYlhvPH//LH38QkjySHrKdGeC1q9MtwTfVJmmT
	fUlVKkoBDKa+owBvq4vE/THa1fQl/c42ywrbCT
X-Received: by 2002:a05:6402:3513:b0:698:b899:d1 with SMTP id 4fb4d7f45d1cf-69cd6c0cc84mr541837a12.0.1784017607422;
        Tue, 14 Jul 2026 01:26:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.117.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a298asm972902a12.13.2026.07.14.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:26:46 -0700 (PDT)
Message-ID: <3c8c0777-99e3-4dd1-b235-f3d32643efca@linaro.org>
Date: Tue, 14 Jul 2026 09:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
References: <O53N7pugg1-s76jrwoKAhbBDXR8MpaQcpeBZ-yXGvX_N496X72YHCZC4tzar29CKo0MGFft9Ctcq-p5za2l7cg==@protonmail.internalid>
 <20260713182500.GB22956@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260713182500.GB22956@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gremlin@altlinux.org,m:bryan.odonoghue@linaro.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118987-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B88D7526C6

On 13/07/2026 19:25, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>   	unsigned long flags;
>   	int ret;
> 
> 
> 
> --
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

