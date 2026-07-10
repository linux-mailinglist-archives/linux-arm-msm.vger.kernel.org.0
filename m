Return-Path: <linux-arm-msm+bounces-118271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gd37Ik7lUGpO8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4E73AC5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YQiWD8e7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118271-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118271-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4966303D54C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD62421EF4;
	Fri, 10 Jul 2026 12:20:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E748408626
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:20:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686041; cv=none; b=EYWuEV9ogWYJ3+jSOaskuIQpOWhkS2mMmanVplRI9k7TgRBnNGYKXqoj9rnET4bomcqAq8WSHm1TsIgBfgP5Ml+lNeNURXAT1owBj6BVyFeLYbOUl4C76j1ZGQ98fhgNyWsuAozJVAQMLeOkago0PP2BBBBJkV5B9ehMhqvN31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686041; c=relaxed/simple;
	bh=uQtlFmlEDrsnmnfiKvO/WS+vVaEjJppi7RQvR+UUIdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFXJWhF03xdshRnUxVUL/SK7JdsZfcOsI0JSj4FprxP/FrsnH7PEYE68XJZ+GYsN1lnH4ATPFcD8JbVTxZy5p10weMONUXG5OdETBlfpT9ZduEAN+Dcs02r+zJE12lBLyY4MFZAxUXDBwFDTdmYMqXJuPPc5WaKIUJIba1LGcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQiWD8e7; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso7310875e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783686039; x=1784290839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3zreGUqgwkkgdfOKXxPfkgWWWCEAQ09f5w1+bh6RDY=;
        b=YQiWD8e7bRBFjwAwYBI3n+zrgtlTDhnQXNSVe0D7toJbhg8muTHHx6Hdhmev7OO7KG
         AeAfeYpcgjrID5OxcmdqXcIyE3TrdNmegxZK0ThCS5PKfOal2N0PB+w4Fu6f3/jiNBZg
         baeUDMdsCFsGRS0tghpW9+sLSGirFPXdtkBrfNw6GjApqDNkE1wNpWxl4jKfjXCFpAQ+
         peHewx+uuxU6tNK3+D9sY/eNgMpuciOlFfbVQpE8YPaMxD79mJixU0D9k6UF9Nc0+1ra
         k0SgWKm1GqJbqbNp0IXVwVsk4sAThyGigQvFEMjKUXo9hHkmSPbCOOC9i/RcTPB+gICh
         f3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686039; x=1784290839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3zreGUqgwkkgdfOKXxPfkgWWWCEAQ09f5w1+bh6RDY=;
        b=T00GRYgx7ctSz6XyiVTB+fJV0ZtwPMTY0lX9dtyvTj0Lx2TTnU57W5kKhjTVjpDiOh
         Cm5IpfF/ZaouCSzlyTkw/xnn75Xv5hIIyCAceyYgUYoS5dkS9YqqBtWKlfwdVhOv9rpQ
         afRnanOzO/CzFDzNc237sVWTcSDlYA5SrYCXPoAGbeFzr5Vt41tUydXTUtIATr+RuswT
         kkV8XsNZuWTP4CQqCPzZa5f6yacQQxjqc0bOnox0Wtv2iEHkV7bnVNTBvTi4Cgl7wOGo
         QylsI4kfZjfiq9J52LwR/0lvalxMoxyO5UtBlkY6CtF5G5CKsa13jnj4NwzqhBwbv/fy
         Y02Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEZK5xixt0gZKor4d9Hj8oe4TRfrbzxX1fmNkonfcNu9IIAQZqhiyrr3SGPxHmpNlxB6+IytNh9Qy/FXcm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7Xvt7r0NtjzOv9R7VIQSVnQIxEopWeVb8IXWcSUZMz87oKSv
	lntLjhJx8dKqnr56jI21NHXRL822OFzDLxFHvbIR/TCvsxVoFLezXS5i
X-Gm-Gg: AfdE7cnH/EPoQhoLj5xplDbZZ8zNhHQ+fYmDiiGRWQJIJ8LO3gVdhDUMaw0LCFNbqaY
	RLjzSr3s5p52rhdbNDM5FH6dxKyOF7bfdVAxoiwIg0StseDFSWIn7aSjevwdV0OSwcqwyKPYAO4
	OTQdoYyx2aSLZvm9waaVW/dnVvYWH0iqGAxGI/xDKisbDrGv7cAGD2lvBPeQdgCWfbsQH/qxWdS
	fpRISpWMlNpxeldksWguCug8UF14/mF52tq3K4K1zlsnD6e84GQxqTuOs2pgZpENI7h7WrLekde
	o3g5JvuaTK9DVqLv4x9yQw0lkvw7AcyGpFUjLtBqizWm1fnq4o8yIAq2GklvRyRq/p5zFdUtUbd
	AiZmca4KcwsZ8Xut925xYhlxAbD7fLL+P9W8yMVTMxZrcgpouHj9AhInnNpqwZMsAf9GKu2HjYV
	yz4JztR2MZhzOT3XNxk8zyfNRRclRkOxvawNMZO37qqGSbb2fLS34yTtoNBxDo6U2OAtGBoCOlz
	jHbhXiH
X-Received: by 2002:a05:600c:34c1:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-493ee0fe824mr67889685e9.31.1783686038394;
        Fri, 10 Jul 2026 05:20:38 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm131002995e9.3.2026.07.10.05.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:20:37 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c74c20f7-b819-414b-b936-c85c165bb537@gmail.com>
Date: Fri, 10 Jul 2026 13:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-118271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39F4E73AC5C

Hi Jorijn,

On 7/6/26 20:22, Jorijn van der Graaf wrote:
> +config SND_SOC_WCD9378
> +	depends on SND_SOC_WCD9378_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +	select SND_SOC_WCD_COMMON

The preferred style for this is 'depends on SOUNDWIRE if SOUNDWIRE'
since 'depends on X if Y' was added recently. Also see the kconfig docs
on "Optional dependencies".

> +config SND_SOC_WCD9378_SDW
> +	tristate "WCD9378 Codec - SDW"
> +	select SND_SOC_WCD9378
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE

Another kconfig style nitpick: could you organize the attributes?
E.g. keep the selects together, and keep the dependencies together?

- Julian Braha

