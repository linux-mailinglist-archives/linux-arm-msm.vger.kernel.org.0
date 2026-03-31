Return-Path: <linux-arm-msm+bounces-101103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G11CtcKzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:56:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3436F83D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0FF30DC8D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBF0423A97;
	Tue, 31 Mar 2026 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="n2P8Z37O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728CA425CFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978131; cv=none; b=YOhyDLltBoP+0wbQ9o00zqNV0AFQdloYpiZizlirWccd8BvPvEzY7PuMvn3wntZoxnVIcv5xUC4BNpnfwFJ4dVFNI/gjPyQPYZWYPoWZOsxvyOCqNQfB7IjTkQCj3LdTbF6+VsSxeWJmpLLk18LIpMKiCM3VU8XN5P3eGqU0dHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978131; c=relaxed/simple;
	bh=YfUih1exLsJMD7xKSC0lhbxqEh6hoZVtHVWQM+4KANY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwEYpQ2L/pQxlLww7ebetXdjntisbDBJotn/vmcr6svlzaO6PbmEI06F+sFTfNbKFFX5N2B4Ld5WCjyiVugVpZPvqDIt1UURcJn5m9BRji83PsLyVMNJxG3zwvnCkbI6s6cchc3a2ZKRDxYTxvstyQJY2OtMAr1XxXGZ32yK6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=n2P8Z37O; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1774978119; x=1775237319;
	bh=RAJ/BmxoWBjj74xPSxI88dSbFSKg+ByLjVGNOvvJDw4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n2P8Z37OaUVkoIozMA2G105AjaF//ZxGxajTkh3aHHR7QOAq5AXtskHy/W7ESbaGI
	 a+2VvsnEuBbYjnVHG2zwzhNbjAz3rGmfIlgw5MJsaoAHhvopUlkRyNSQ2R+hDoGnJ2
	 EPHZ5g7XvB9tNzbfXy05Z20bfWEnJA7Iju85KXvqemBrNgnROCFJyQfd5WUkNbrxkJ
	 TjDvbEgc7txxS2uBuK3Tf9CAHo+9xFt/HsF2NyRtpCHZPjqObmuquY3pnS4kWCS9tT
	 4AdzE3oe48rG8jxO2KD6uJOlrcb0H/b2/0SJu/jSh1bD9jzs5cNKRzkmXjkSVZmaVr
	 Y8AF0/bX2IuwQ==
Date: Tue, 31 Mar 2026 17:28:34 +0000
To: Val Packett <val@packett.cool>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable onboard accelerometers
Message-ID: <99hP9Xe8ibJcx85xycqBaG3yUezfHcy8D6ezywja7IDv_eMMPfl4zourMSO82q643vxISbWBwo-L7iKesCSVGOq9uDO5I93GjLVacPjTSGU=@vinarskis.com>
In-Reply-To: <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com> <33c0a723-7748-4199-9623-7ed3eed8bfa0@packett.cool>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 32283a8f4b08d2670bffbcefeb60a742e2a4ecd6
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
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101103-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,vinarskis.com:dkim,vinarskis.com:mid]
X-Rspamd-Queue-Id: 7EC3436F83D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tuesday, March 31st, 2026 at 19:05, Val Packett <val@packett.cool> wrote=
:

> On 3/31/26 10:36 AM, Aleksandrs Vinarskis wrote:
> > Particular laptop comes with two sets of sensors:
> > 1. Motherboard: accelerometer
> > 2. Display/Camera module: accelerometer, ambient ligth (and more)
> >     sensor
> >
> > Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> > typically controlled by (A)DSP thus allowing for great power
> > efficiency. This however requires DSP libraries matching ADSP firmware,
> > sensors descriptions (must be extracted from Windows) and other
> > potentially closed-source libraries. Opensource tooling includes
> > `libssc` and `hexagonrpcd`, but they were not verified to be working.
> >
> > Until SSC support for X1E lands, bitbang both i2c busses to enable
> > accelerometer functionality. In the future if/when sensors on this
> > platform can be used from DSP directly, this commit can be reverted.
> >
> > [..]
>=20
> WDYM by "support lands"? It's a userspace setup thing, nothing new
> should be required in the kernel.

Hi Val,

In v1 discussion [1] it was mentioned that libssc was never tested on
X1E and is likely missing required libraries. I have briefly looked
into getting `hexagonrpcd` to run without much success (though I have=20
to admit, I only spend a few hours on it). It seems just having
`hexagonrpcd` and sensors .json files (extracted from Windows) is not
enough.

>=20
> It is amazing that this bitbanging works here, I don't think it was
> expected to ever work on anything newer than msm89x7 o.0

Been running it for a few weeks now without issues.

>=20
> But this is likely inefficient=E2=80=A6 and "stealing" GPIOs from ADSP li=
ke this
> sounds rather scary. And would definitely break SSC initialization for
> anyone wanting to bring up hexagonrpcd/iio-sensor-proxy.

Do you have any experience with `hexagonrpcd` on X1/X1E specifically?
Personally, I think it still better to go with always-working bit-bang
approach over correctly implemented but 'needs userspace customization
and firmware' approach, as in practice it means very few people will
get it to work. However, if its possible to get SSC to run X1/X1E it
would be a very good argument to drop this patch, up to maintainers'
discretion.

Speaking more broadly, while the accelerometer is not such a highly
needed feature, ALS is, as it can be used for automatic screen brightness,
keyboard backlight controls. I am planning to port ALS's driver to get
those features next, depending on sensor model other laptops would be
able to benefit from that as well, iff bit-banging approach is chosen.

Alex

[1] https://lore.kernel.org/all/20260228-dell-xps-9345-accel-v1-1-daf9e3b3b=
5ee@vinarskis.com/

>=20
> ~val
>=20
> 

