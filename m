Return-Path: <linux-arm-msm+bounces-115395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kynoKguyQ2pGfQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:09:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493566E401A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:09:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AZCGQJV7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115395-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115395-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 027513234389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4941406285;
	Tue, 30 Jun 2026 11:44:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B683CD8B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819845; cv=none; b=VDhoL8+m9Ps2wV7yWvntLkEGNhDEfEUm+5IVw13BbLYpqhQon+jMWwKlIUzeEOcUvncCw4t+W1HEWgSUeNoWCsMxK48sFSgUtkOIQzOxxb+RUPnh5BNbrt9D6qAeV6rjm4QWwVBNugNRZ5yXVSkJyxl3qGWuiqcLyiAH39Let/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819845; c=relaxed/simple;
	bh=W8yXFKvwNj8QS3dUv6tZrcTUl/bEEEJbwmy1a18FlVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob5bzYMZDjlNBc1PmHFn2VI6rso7A9v00Tc3ksLD6gtUV9eH2ULb7MKEMepQ5qOYXsD9OS5izZNJntLsGIb9DfK99xCMGAhGkF2NrsVOAIlhUjsmNSwa/u4Kjp9AHmO1yXkvsTeozWhMZvdWBc+gt4YdnhzDaBDJDAv1CSxWZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZCGQJV7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05951F00ACA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819843;
	bh=W8yXFKvwNj8QS3dUv6tZrcTUl/bEEEJbwmy1a18FlVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AZCGQJV7UOkLrNWP3hWTN74vYBGgXhr074t1TTnjnM5u88GE9O8vW54ZKt+VlQQUo
	 HCcdzTZUjX8OafFknJd846s2Auxzxg3a/Pnd2RUnAFIUxtPVWTrF861irfANwK5G2/
	 fkic5ynaNHuaxSdNsKwHM17SESOtOgEAwL1e3VuQ/AWk0zeKNq8N3YIck1RbKGQUPi
	 8XTJEERmf9zTFs6fcrz0hwwMeKxE6xxaFxN94M+IOXnUhetnNjDWbn3dwpHrwiH3GW
	 vAD9fyT9BfgMLnGyXQN33G1zA6SzXql3MLHdl/govOIlDOHiaZXLRQwxl+d2w2t43R
	 sdq7iD+UGsM4g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb89359a3so1940973e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAEME5COkM+TPbIJtvtYlh/Te9qLuoPFGYlGWtMMHyAFBBhAposoZKD1ZmehIZ5LMgEpu+KfcieeLDdMXO@vger.kernel.org
X-Gm-Message-State: AOJu0YzIERVHRvvwpvm7DutmOT9gCw0mIRQh7XInLmQgNAX+U8waA1FN
	yMIn9tTC68Y2CCCIevD7sQlFjsE9Klwi/oNsalQ7rQPC+tdAERJeqe5r1ZPI+Gfx6HwcpsdGq8J
	4XxboPv8YXYDDfvD1zrsNCTIPWoa6iWA=
X-Received: by 2002:ac2:4f0e:0:b0:5ae:ba7a:1789 with SMTP id
 2adb3069b0e04-5aebdb7d889mr791136e87.13.1782819842431; Tue, 30 Jun 2026
 04:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:43:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLkURjnQa44bWAy0E5EG0t8f7kAvQsG2S_Jviwv8LGaL_w@mail.gmail.com>
X-Gm-Features: AVVi8CcYfeqj6YwfcYV_eKNotXa_k8YSs5lPlnaztoOTJAVOIQtv8kQy35rHWaU
Message-ID: <CAD++jLkURjnQa44bWAy0E5EG0t8f7kAvQsG2S_Jviwv8LGaL_w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115395-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 493566E401A

On Tue, Jun 16, 2026 at 12:55=E2=80=AFPM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bi=
t.

LGTM and Konrad has ACKed it, Bartosz will queue this patch if he's
also happy with it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

