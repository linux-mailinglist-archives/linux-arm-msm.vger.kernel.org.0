Return-Path: <linux-arm-msm+bounces-106974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IzNHHwLAmrpnQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E335B512E71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BE793058144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A084342EEBE;
	Mon, 11 May 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNsFjIwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0242B729;
	Mon, 11 May 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516966; cv=none; b=bhnHp/PL+e9fJHhGCyLDeZ9M9GPFbi7gPXuEoFXQMEoJbjyy7x9UH0HeqAeUM3xmDTb+uHDrlKOIsjiwSK8QAmrQBdlrD4xBF7JzyoTkrtb5OnX14tBFeaxd7+XD9iFWYGVgrCLcIZ4bzGsbayDIX90jvh7cBmACfXrmRhUb4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516966; c=relaxed/simple;
	bh=mkjdBIIeGWyqlQ9WnXNdN0qoEWVovOks3fTMX6JixR0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwpvQs5/JKqa8hM1GvPDBUke6gETRcTfZc4xBRnkhUVrOfuyEUk6j+NuZn8Qk5f7Rq1ccQ1TqyZUcI95TrLw1Pi9oNp6/c3F0eHFqsSYBzdEvG8hPEyxb4PnrEJi9TCPHZmUA07pScaQfZXo8DC3AFogMuSFYT0/ySUA+/D0Kb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNsFjIwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41E1C2BCB0;
	Mon, 11 May 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516966;
	bh=mkjdBIIeGWyqlQ9WnXNdN0qoEWVovOks3fTMX6JixR0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SNsFjIwc8KbzRkX8z80vmW3WGBbFZJT1q3OqT+GBcPoKXw9emxOjDBKn+vXuuQ1sh
	 OIPaUc52DnRT4436ynnTJMVpZjv4LqHDRju9gQURsgtuNeIVJIPKWTYnO5UfOP6MQs
	 iuoNz3uosftXYag6Vlwb3+MwsGD2DkK4de/b+hxXhrY5XJsnWWFnABLRyNnqY0lYFJ
	 5UKr0coKhUiyaw8/U5sWqbSKKpSoV+lF1cqf14yyIwDZwEoePLmm7zUhUD+4B2EOEi
	 jDREJgxVEMZyKZ1qKGkLx1q9xchnBr7O1uyRjzWb1psHWRvQu+jVFXM/gxv/tgUR9i
	 8FztNSJvnAlSQ==
Date: Mon, 11 May 2026 17:29:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: qcom,pm8018-adc: add
 label property for ADC channels
Message-ID: <20260511172920.58f09e59@jic23-huawei>
In-Reply-To: <CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
	<20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
	<CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E335B512E71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106974-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email]
X-Rspamd-Action: no action

On Mon, 11 May 2026 11:28:18 +0200
Linus Walleij <linusw@kernel.org> wrote:

> On Sun, May 10, 2026 at 9:04=E2=80=AFAM Antony Kurniawan Soemardi
> <linux@smankusors.com> wrote:
>=20
> > Add a new optional label property for ADC channels to help users
> > identify each channel when reading values from the sysfs interface.
> >
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com> =20
>=20
> Makes sense to me, nice with some roadsigns in this djungle.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
I've applied this as well on basis it's very standard but
happy to have feedback from DT folk.

Thanks,

Jonathan

> Yours,
> Linus Walleij


