Return-Path: <linux-arm-msm+bounces-96092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPwKF5MErmlq+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:21:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B867B232A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B513040460
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6683035AC09;
	Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+XmiQj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434453563C6
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012044; cv=none; b=L8uCFEY4ji4DaiMEF1jrOLz0Q0AV6COwfpxtJOHF914j1zY7Sgi0b/JQ/0pxuNRT9nM9tx93eJuEX68rxWcdkLYkCSzBqMivDj4E7ik3ygLKE+aymAxpl7WTop8kXK0VDMrJxJMTMhOd3UsKyXIP5QIa6wRvPquLLP7G2poWMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012044; c=relaxed/simple;
	bh=tkXNNyhuUcisfjOD9LDo6nQcYG7Q7JLlx58CMzSrFYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKUzvX4Eazun8JQfAMX9XeY9lzVjxJkL7GrItn/TomOWFPu6DXx/GL9l7OfPdVyMWVRmDmxe0C9qJ0vHgshNf9hSd5vxfP9SgrF6LUK89nzC3QPevyZpPezp5OBjI2jwpguyGYVBMLjQgPCaj7tXfolz+qdtxMJZS0yAgoLuYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+XmiQj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18C0C2BCB1
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773012043;
	bh=tkXNNyhuUcisfjOD9LDo6nQcYG7Q7JLlx58CMzSrFYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m+XmiQj6edXjUVLc47BRamk/T9v5UYlAhJOO0jS2S1KyuSOVEjsPLpTMYGDiJz4bK
	 +mmu5sDc09iltSZuZYsXL98tzYILxRQuplR1juawL4KjFhquEMV5NbViDIsDUX+CG2
	 kX9vIu71IKo/1A9f4xGMOT77FCpk6KUTZ8O79LvQvZGjPKC++uerIKM6s7cGRheEl4
	 S3W6f5cHr4BVgslP/3QByJVSGYX0Cosf8BgwYM+Q4S6QXJzoTYO2XRUI1hiMEulugA
	 yLXoklsnPJ97ihVtFwCB3JQ7ArdeqTwbmcNuh2Md1innfkuMHbwvPIbNEUDwwU8SDn
	 px0QoPQycIFPw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79801df3e42so141292277b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwfPzmdFs3SzQnvdGjwE+xH4imx8askqP8Mq7ndRQ69KsR49PXbm+jf14dS8vGx82X2rgYl2uZccJCHAO+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLSIsdqczrYVhKfPKVVrF98gbuRdXFYE2qiL/+ZPAte5tAoq6
	SQz0SZ4FUNyGCLXhZcwYBpcYiuvssgw4WwtdwvEkaQS99/I+0Waj/JxNAClCkyeHcPCcLSH+ui4
	waoEW2Wb95N5uUEN4WeFgPSiW6hZ9ncM=
X-Received: by 2002:a05:690c:dd5:b0:794:c283:5fb8 with SMTP id
 00721157ae682-798d1eebf82mr109540947b3.25.1773012043250; Sun, 08 Mar 2026
 16:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com> <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:20:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
X-Gm-Features: AaiRm51X6o73CYP4cBk8SLAEUC5--fTx6OgmFz_CKYLt2xdlJPzNDoXUUO8RZ3E
Message-ID: <CAD++jLkAQreycoUd=kjwn7xdL+Lksiuq06u4tQrVMfAUEbTRiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B867B232A79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Rudraksha,

thanks for your patch!

On Sat, Mar 7, 2026 at 1:58=E2=80=AFAM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

>    ent-gpios:
>      maxItems: 1
>      description: A connection to the 'ENT' (enable torch) pin.
> +      Optional for single-GPIO flash ICs where enf-gpios is used for
> +      both flash and torch modes.

Fair enough, that can be done.

> +  unlock-gpios:
> +    maxItems: 1
> +    description: Optional GPIO to unlock the flash LED circuit. Some
> +      boards use a PMIC MPP pin that must be driven high before the
> +      flash IC will respond to the enable GPIOs.

But this IC has no pin named "unlock". This is something else.

Given the way it works it looks like a regulator enable signal.

If you don't have any better idea about what this is, I would
suggest adding

vin-supply

to the RT8615 bindings instead and then use a GPIO regulator
in your device tree to provide the voltage to it from that GPIO.

Yours,
Linus Walleij

