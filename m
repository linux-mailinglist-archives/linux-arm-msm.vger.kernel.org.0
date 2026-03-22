Return-Path: <linux-arm-msm+bounces-99044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAlSLXHDv2kW8QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 11:24:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152052E8D5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 11:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB396301017D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 10:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A7A32860B;
	Sun, 22 Mar 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QHSS8PLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF601684A4;
	Sun, 22 Mar 2026 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774175087; cv=none; b=DzwO1eZAt0mmDgT0V/yo8frGX3umawmQubz1UuWpkVX82PONxxlpAvIN6EBH9i8MMCKPlYbP7ySZhs0tQmiEn8jBd7JC8nI68L+nVScLEHJHK15lJtdwGpdMgTFJAERwFnnpHtSIqGbDYTkPA3VwhUsC1jHbU4P28tNJuRjqxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774175087; c=relaxed/simple;
	bh=zCqt8zQ2JlSFoGfiAhO4ZqcAnw7CL8AtGU6/DSg1qFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SU4955GfENg93qp1WWtvxw9XlwFHDls5pl62rPlf2kzbPoCNUBj+p89ipc+ioZXDHNQs46/JdEO9H5dDeVLVMA82u3/4o2yzjIP2xlm0rVpZBh5x15jUjtefrHhCizSsBWaMfZZ675ZRnO87V+n5iYiw/K7lWcm9U2Y9jM3qPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QHSS8PLY; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774175082; x=1774434282;
	bh=zCqt8zQ2JlSFoGfiAhO4ZqcAnw7CL8AtGU6/DSg1qFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QHSS8PLY5KTo39Rb2etKO1l6TkdOwV0xt0GWFrHR+5z5kDavJ3s+h+QzZWV+RiNCo
	 rTVaoUynvYhPn1UwpGODnksFj8SktnLWMg6G2iN1f8ATFqQsTLuqUYn02HnMc2hHC7
	 6TOZWx3lOYT1m56kURmCQRuRB3zR9yok+mRaw+vywdi6tOb22Q59yPyFd1NtcpXhjU
	 teSYBiL2ZxaukyTm7ddcEgw8JW5iyQwzHJoUP0e8ApEAmSL5nb1Nehl5deEzhaNKMc
	 4VVUWN2Pui2A/skqe75RdVRY0BSqnafaWF/FeYNcvowqwU7WTlKBHODo3DW18r6f0s
	 Dm1gcG7q7I8SA==
Date: Sun, 22 Mar 2026 10:24:38 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <aQ3JDyWgwx7y9ixQxFcbTNxtoPnCOJ654qHtz9cgA6MmS5jP_nfj4z-27L5W6qxzCDIbYNqDRPYsv4sj-L3ATzc4IDV_-pREpsJoZaf8Edo=@pm.me>
In-Reply-To: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me> <20260321-asteroids-v1-3-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 17060ce766d772cbc821cc2f2e785fa5b0a56b10
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
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99044-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 152052E8D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Saturday, March 21st, 2026 at 1:00 PM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> +=09chosen {
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <2>;
> +=09=09ranges;
> +
> +=09=09framebuffer0: framebuffer@e3940000 {
> +=09=09=09compatible =3D "simple-framebuffer";
> +=09=09=09reg =3D <0x0 0xe3940000 0x0 (2392 * 1080 * 4)>;
> +=09=09=09width =3D <1080>;
> +=09=09=09height =3D <2392>;
> +=09=09=09stride =3D <(1080 * 4)>;
> +=09=09=09format =3D "a8r8g8b8";
> +=09=09=09panel =3D <&panel>;
> +=09=09=09interconnects =3D <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> +=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +=09=09=09clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
> +
> +=09=09=09/* Dummy panel for simple-framebuffer dimension info */
> +=09=09=09panel: dummy-panel {
> +=09=09=09=09compatible =3D "boe,bf068mwm-td0";
> +=09=09=09=09height-mm =3D <157>;
> +=09=09=09=09width-mm =3D <71>;
> +=09=09=09};
> +=09=09};

Forgot to add stdout-path =3D "serial0:115200n8" here, will add in v2.

> +=09};

