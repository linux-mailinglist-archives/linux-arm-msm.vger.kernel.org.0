Return-Path: <linux-arm-msm+bounces-119101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mfRWEiS3Vmr4AQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:24:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB983759336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JqNBGjmN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59A0F3015226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 22:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A3442BC54;
	Tue, 14 Jul 2026 22:24:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBA3F7A88
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:24:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067873; cv=none; b=XFu/RUqL8QKQ7jhg2fo1eeE7rhpRYv4G9C2Dv/+QUoGzoFbwiIKxlFUl0BXAsXEzoRVE1zV0tywH9x27+luuCnrKb37LiK1ji8SXJlgCtqA0AXGSEDoglBsuQF5bH2g+u9XRWdol49HaXoUH3IVqNyvjuca2MR5dJA1ynOzBeBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067873; c=relaxed/simple;
	bh=CONX0Ytp8zUhCpKJ5m+J42e16vjLl6K+7tjQXEfrOSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hy9N4pZcuOGkdO/FpgVqHcKI75sXcFzYxT/sLyS+wuOj3j+MwMR1nHIyE99CpEfP8jfsHl2AdUFTkSi1D1f4X4gMCYMMn6ANpWMZrzax+Lkn0I1s9N9lmlAVgeb8cKGnxiBgEqyvEPMnfoaRqjpzp71g+qtLtRc23waibKrViBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqNBGjmN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBB31F00ADE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067871;
	bh=p3QI8/LvhRnpFsEEynpOys/8+VPey05yR5TfdpAmSdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JqNBGjmNb3Mlfg/0OuaS3kaD9bjY9KUD9GiwbWRX4gSYyGa/BuTvSxYeFtVbK8mDT
	 o+/DGBdGpghA61KjJ7zGqUpI/hiRNYyCZasCMa2/8y9FK6zkDUW5truEiKj9uvkHXX
	 rhB/s5AH5tbALPY7gYaR03+ToHaxJwt0kQ/YScHgDLIE1o/30sLQJmUrhhrLCWGK+N
	 3VA4xGBzLGqE6oFDIqkGQpRvVbChQdHb6ZB4CbyhMZfHq928aMbF5FaaHbL1fSNudC
	 NE/WG6cIGMqd4zmNJxJP7DR1X9+wYlTMHZMgZ/TE2wBHK3Cuc3dI2ANwebDirfDfUh
	 m3r1NbawbUDMg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso1961128a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpO6ctnkmjB/p23Tt0Qv0TaI0fQe/dm7TbXz39gl2QHvycr+ET4pjxQJXz1cYtfVFNz1VcmWp/XkghKqDZP@vger.kernel.org
X-Gm-Message-State: AOJu0YwpR96Uofs5t/vjvwg19HYR8sGIAv2NoaWad2FDogzQVNs+zQ9u
	M8Sa+l895vLu2zVqYcEgYdbx8Q6akOrIHAziV7m8kIaSi7VvylKn6pTP9E9YJYyO2zZbhc/P3w3
	O0j4iRcEEBDNv9DSPoQYUhfX31LJ6LA==
X-Received: by 2002:a17:907:6e86:b0:c12:55d3:f00e with SMTP id
 a640c23a62f3a-c161f4525bamr742525666b.60.1784067870501; Tue, 14 Jul 2026
 15:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <60dc7a9e-3ee8-4419-a53f-dd6c746f9276@kernel.org> <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
In-Reply-To: <e03d1626-0220-46a5-af0b-dc149beeed30@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:24:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFz_mgY2qtCu8CP8MwjPdkMrOv+ta3Nq2=kjcdzKS6Rw@mail.gmail.com>
X-Gm-Features: AUfX_myyv4DcjcnV9TSgTO0RulNfGu2cQrnvzH0QbHSl7cZE9ucD3mN6Im8yGOs
Message-ID: <CAL_JsqKFz_mgY2qtCu8CP8MwjPdkMrOv+ta3Nq2=kjcdzKS6Rw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra SoC
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-119101-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB983759336

On Tue, May 26, 2026 at 12:52=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:
>
> On 5/14/2026 9:21 PM, Krzysztof Kozlowski wrote:
> > On 01/05/2026 19:53, Komal Bajaj wrote:
> >> Document the SCM compatible for the Shikra SoC.
> >>
> >> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >> ---
> >>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
> >>   1 file changed, 3 insertions(+)
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Gentle ping =E2=80=94 patches have Reviewed-by.

In the future, send this with the .dts files that use them to make it
easy for Bjorn to apply. IOW, don't send .dts series that are going to
add DT warnings.

I don't need to be chasing down new QCom DT warnings. Figure this shit out.

Rob

