Return-Path: <linux-arm-msm+bounces-99631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHTJFUVzwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:19:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B130729C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92B8F3068175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFFA3E559A;
	Tue, 24 Mar 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VWsVMZwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755DB3264D6;
	Tue, 24 Mar 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351141; cv=none; b=BLPkYwMjNRB+hHsNQxGUZME6jqgqNmQcN7F9xbT9JIVTWymZ4hqIHOo5dag9BD6ptelfQWvt5YgMGvH7gPTxcQIvujnoZlFZ4rQeABs7dKGs/AB9PakRG0ab1lDIVh9gg9qXtwEsLfqGwbATqRbkHW+3dQ9jIzIn1+7SYnFdJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351141; c=relaxed/simple;
	bh=UKyanTaa3bAcO0AHokq+HZtb8o9J90V2szIDEcQ5uwM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rto6I0Y6GM8Yf8gFRGlXC3bYZc9YvS1Ow0yy4cNgZZVeov0VTl0yZFUjpVugPmFKGUlI8WTVByZk6H6cXcNlMCewOdl0er32Xlal5x+LKslVGY1QKs+OqraDfjNOP7sJ7TcnngCu2oOZvnHMCJ+pu9xeWGBvi9WE6nRRC64ia6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VWsVMZwC; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774351129; x=1774610329;
	bh=qVjkyw5ZHphaFrlSim6h5wgpJKPCtWdAfdOkUlHhv9E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VWsVMZwCr8orPqBG41pIABYqhyDVjQTu/hE9DKpKafooLdT+2p0xJwaPqqj12PXRk
	 9crMX3u/zcFvjFIzbAsnzY8j8fPVw1TqTspKgpnLchTCSDp6kNMm7WQV5jwMHspuQk
	 69CailYkjbTF+aUe6nzDLKwq/8wNDhz/CM1r8r0rsIuuctJ9UYIR+nzBGTj4zwVfXZ
	 QG8HQ6f5m6BpcjxCbzrHbv43yFdyU12aAjTj5n/kvlKxloUtMd2Tno83AxK/4bmbhh
	 PIeltpjOaYXErXphdt7HzXYtRGUqKo0nspb2xAPx8w1P4CBBoSyyz2tpmAkeW4wcAF
	 NQO1OotX16ttQ==
Date: Tue, 24 Mar 2026 11:18:43 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <7wYxWlqdcbL3ANB9n0g4t74x-dwE2yG4CmVw9TwGNmwARxbT5WsdG1fpuIDSA5ab750Gs8OUBwmVa_nZd065guKDJueytb1AmlQ05__IzmU=@protonmail.com>
In-Reply-To: <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com> <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com> <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 4b4a5d996315f0912517e9a2ba4b654fffffc846
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99631-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: F35B130729C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monday, March 23rd, 2026 at 11:52, Konrad Dybcio <konrad.dybcio@oss.qual=
comm.com> wrote:

> On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Add the description for the display panel found on this phone.
> > And with this done we can also enable the GPU and set the zap shader
> > firmware path.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
>=20
> [...]
>=20
> > +=09panel_default: panel-default-state {
> > +=09=09pins =3D "gpio61";
> > +=09=09function =3D "gpio";
> > +=09=09drive-strength =3D <8>;
> > +=09=09bias-disable;
> > +=09=09output-high;
>=20
> This says "by default, actively drive the pin not to reset the display
> panel". Is this actually necessary?

I've tried to remove panel pinctrl stuff from the panel and the device stil=
l boots/works exactly like before. So, have I to submit v4 without pinctrl =
at all for the panel?

> Konrad
> 

