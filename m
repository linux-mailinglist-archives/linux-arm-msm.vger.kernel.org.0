Return-Path: <linux-arm-msm+bounces-97038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMtPNmqosWn4EAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:37:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5092681A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343CE300D71C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D253DCD9F;
	Wed, 11 Mar 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VismdqBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BC2C326F;
	Wed, 11 Mar 2026 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250662; cv=none; b=otX6OalKQxaDtUUCiIIZZrRxjnuu4/nzsHEpmbcv+OcnQYK65K8R6Aet7S49Zy79V+TYNaSq6+2YkWwceP/klhwDybAwnI3HwgBzyKOALcnpY5ewImT9gMxMuCGpJPDMFQ1oHwOLMEHx2ORdThXtT1YtsIwGrGIRALJx+/feiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250662; c=relaxed/simple;
	bh=8F6BHmOQ0WQmBv0RT0iBXkR32/SkaWmicNlgLyuCruA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQZAY95vLWd+eFeVF9VY6kpvCk0kBAgHCU6xvvQwbmXakjlte0448XvZ8lS32YSuzDvo+XG7AoEsxLCXJXiaEDsN6IMnkQELxaFD9IuLYUtLJua7Oe6v1gQHqJhc2BLEYzz0md36kqCCX8pz2b6M7c2M1SF4LazMoI7GWObAoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VismdqBP; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773250656; x=1773509856;
	bh=XLguu/25DpLjHw3KFUyytX0/aU2oC0LZ4Zz8H5WpZFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VismdqBPGjVnbIdwtV0hbsqtgBRWDpww7uVUL+TjcPDgX+3qQtsU40GuyAMeKo8DA
	 BQhKOZRr8KIaxkupeq7pX71VaqRekG9oyewlXnvDMl0eCm/TYBeMvSx11XjwG5Q1Ee
	 63CyhSLQpOEPb0n2DPwtFpDMuw4alAVWkrKcdtAU8qWp55SsMmWi6ogQxaX1iyZs9w
	 XZ11fzBdZqVpJU4dudtZH+/OCq4gQNeLze9WWbpE0epmFnZnSh6bS+67IwG/h58PKX
	 ro1Mylh2fzJtftF4kmCwCF3B2WoEYnGHKT396uh87xAH7d3TCdK4StD+mQtKdwYIcB
	 lQkbHlGN573wQ==
Date: Wed, 11 Mar 2026 17:37:33 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] usb: typec: qcom: Add shared USBIN VBUS detection via GPIO
Message-ID: <v4m49h-DK1i8hRbJZVhc1GwDH7oBTRgeXg0hIE8chXTULQuFFfSibjXs19m5E4srNt4852h-x_YcxMoPaUjzPqmwYHI8-tRc2-X2DaIKI-A=@pm.me>
In-Reply-To: <920ae606-3d7d-4f61-9d11-bd970abc5177@linaro.org>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <920ae606-3d7d-4f61-9d11-bd970abc5177@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 112f3eacc9316f0a5a46928f4cc3fbbed543c283
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97038-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 3D5092681A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 11th, 2026 at 10:53 AM, Bryan O'Donoghue <bryan.odonogh=
ue@linaro.org> wrote:

> On 08/03/2026 23:20, Alexander Koskovich wrote:
> > The ASUS ROG Phone 3 has two USB-C ports whose VBUS lines are both
> > wired to the single USBIN input on the PM8150B PMIC. This means the
> > Type-C port controller cannot distinguish which port is providing
> > VBUS, causing one port to be unusable when the other has VBUS present
> > from a charger or PC.
>=20
> Hrmm..
>=20
> If you have a GPIO for VBUS detect then who is sourcing VBUS in host mode=
 ?
>=20
> There should be a GPIO to switch it on aswell ? And in this case both
> ports will become "hot" at the same time.

For the side port this is the PM8150B's internal OTG regulator which is gat=
ed
onto the connector with an external load switch controlled by GPIO 11
(downstream calls this POGO_OTG_EN).

For the bottom port there's an independent boost converter which is gated b=
y
GPIO 71 (downstream calls this BTM_OTG_EN), and doesn't have anything to do
with the PM8150B OTG output.

For the ROG 3 I've modeled these in DTS as vreg_pm8150b_vbus & vreg_rt1715_=
vbus,
so they're the vbus-supply for each TCPM.

>=20
> How does VBUS work in host mode here ?

When a USB device is plugged into one port CC detection sees the phone as
source, and the OTG GPIO for the port is asserted to enable 5V.

The VBUS detect GPIO won't read as active for this since OTG power takes a
different path than the OVP ICs (2x BQ25968).

>=20

Also here's a link to the downstream driver for reference: https://github.c=
om/LineageOS/android_kernel_asus_sm8250/blob/lineage-19.1/drivers/power/sup=
ply/qcom/smb5-lib.c

> ---
> bod
>=20
> 

