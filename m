Return-Path: <linux-arm-msm+bounces-96816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNwfLrHWsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:42:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0BF25B128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 149A53069DCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56168339856;
	Wed, 11 Mar 2026 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FxJC8V8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAE2620E5;
	Wed, 11 Mar 2026 02:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196865; cv=none; b=RxRHziuNCCDnA3XX/+0vdeFH2tHefmQ0wLykyb03MQMWjAZzSO+pQ/LQ4kQsdeLPWkkjXrkMqO7n4bROnuheCIWPAaI931/IXYzntaxfuYVwz0KFcaa1XQTN3YQWY2A8Iyj7caoMo7qUabLmD/EizNcGgwZong1u7Ap+uUlDpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196865; c=relaxed/simple;
	bh=acMo2OA54pjj35TGrWyghgroOE1JXv3sjoms6HH0UtA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GClI6FMH2WJDulqt7XPVzpcdiLuIax3VcwnEcboH4Tkrj/EzoDa2Z0k2m+OAxqQA/EjsnC2+ExV6tcTX5fsbKty7SxrbU8TKw2kwxBaTXUKU6CRnIU1iMrpYOAVTbd+kNUkn968QNGodkKtenidzwAY7fPSvkfSL/QkAxIiJXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FxJC8V8h; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773196860; x=1773456060;
	bh=acMo2OA54pjj35TGrWyghgroOE1JXv3sjoms6HH0UtA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FxJC8V8hWI3xcZ7q/OXmOqQ+VxVr7pN0NthqSKOCgg8X2WAK+RTW07sr5fCy0G8Eh
	 NtK/KgxZuRlNWLBBt6iT1oDFDFFrNpNdG0wFCWczbHizSIiJmHg/5n2bPcS6HqCpo2
	 PszQAf0Tng0rTKcENvTQREYhFPNOGryLDq97hejAtgPtrvEgpk4QyxESyITUB856Ow
	 jcSVuugY9WWNf5G+uT7fYVqwmmAh4d70YhY6U8UH3dgWQuIuI/mVl7Bwzriq391cez
	 ToIbpD/fqetfxO5LMaEZyFsRnWiHo+maVMguFTM7ranL1GMmRxN++Qvo2roO/sLoD+
	 AKWXB2IHb3t4w==
Date: Wed, 11 Mar 2026 02:40:57 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <UUm2j5FomDWKGaRRekRrUQPsOyj9vm8aMUeFToeZCvtSR4v7CWuNA0diFFUY_-OrK1ShlfBYhXn57Nvq2y5Rxxr5xOA0K__BENXntWbO5GQ=@pm.me>
In-Reply-To: <L6ofIX7HhqB51HZm7djWZk4K4Bl6g7_AUnOIzqwJZXLyIQtjsJa3kU7WW8343wSFvBkxY2gwu02zeUQTGiGL89D1Z5yzZD2891aBgPhx0T8=@pm.me>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me> <4df4b8f2-ecc9-447b-8a69-237c2a5841a0@oss.qualcomm.com> <L6ofIX7HhqB51HZm7djWZk4K4Bl6g7_AUnOIzqwJZXLyIQtjsJa3kU7WW8343wSFvBkxY2gwu02zeUQTGiGL89D1Z5yzZD2891aBgPhx0T8=@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6c58413ae8189e461303628c271e62235cd783aa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3A0BF25B128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96816-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

On Tuesday, March 10th, 2026 at 11:10 AM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> On Tuesday, March 10th, 2026 at 7:31 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:
>=20
> > On 3/8/26 9:40 PM, Alexander Koskovich wrote:
> > > +&uart12 {
> > > +=09/*
> > > +=09 * Debug UART routed through a mux with an enable line on
> > > +=09 * GPIO 170. The active state is unknown, so data may not
> > > +=09 * pass through.
> >
> > Hm? Is that software-triggered, or is there some sort of a debug connec=
tor?
>=20
> On second look, it actually looks like there's 2 nets coming out of the m=
ux into the USB charger (bottom port). So could probably craft a debug cabl=
e to test this.
>=20
> Yeah I was assuming that 170 is what triggers UART to actually work on th=
is board, and that bootloader would enable/disable based on a fastboot comm=
and or something.
>

Picked up a USB test board today, was able to validate that UART is
present on A11/B11 (TX) and A10/B10 (RX). It is also enabled by default
and the enable GPIO is active low. Added a pinctrl to v3 just to be
explicit about it.

Validated that UART works on this device, nice to have.

> >
> > Konrad
> >
> >

Thanks,
Alex

