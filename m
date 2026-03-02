Return-Path: <linux-arm-msm+bounces-94938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G4EHniQpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:28:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB41D9BDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C37E4307A092
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1BD379EF8;
	Mon,  2 Mar 2026 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="k5jvCoso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0338757C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457940; cv=none; b=kCuo1cl43rgP1h73Hxq3Xv/N2zrqLEfM9LP02ywxM5K2+MOmuLWL+TbbzQ/FJbea0AJdQylkzuRq1g3tURDqtlpPm8wrbLFIEhK78cABXEsZMFZfac6erHbbV9M27UITkzcnSj4siyxGXkgNBtI01M49g2D0bahx4ioTnEclUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457940; c=relaxed/simple;
	bh=oFNozveFi2idknYaSiP5+OHlF6LlNP3+RaMn21dNcoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHbLxU0OTBwoP5mNu4Y0bDAQOWlJAmACZCApQrDnxGtx1EGCh5LGXrzsL0p6WOc6mMsHSisxJ3xN4/D9I6ebMoJgmy+c3HFTRnsGN5q1iHA3S4LFmvOmh2XdkI1E2yrGeUh3oybyPUaKazXxDKafiI2OR0iPLzUPJ4IN0UUKz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=k5jvCoso; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1772457923; x=1772717123;
	bh=uKLOsl2w2qAXItXyhmfHza1Cs63pHBCISFnEiWfNPtY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k5jvCosocHdjNnY2D4z7rsdL9J7emNwsOeyeZT7Vf8EcO3blkNMy+zBrCnehH/mTe
	 GsWt0Xe7+9N2/bqJE++ozccmY+qinXb3qLn/Wy0PyZ5SdGgcRq6GwqdjghARD14gXP
	 UhrsQh4qA1fUe9nrnFIOyFnbgIsjTp4FGpcTURewftOuxsX1wrEQwZEFioZ7eNYlmR
	 Qt8jNlGz3PyW2Tgb0MlHH7iDK3lz2IaCY0fBVSNdKfd31Lk7QkRsDwNpQt05YQ9UBX
	 bZzbufLaRdJj1jfAJbKNnBERkpF55aajghQFW302oM/M9kLWDq7MIDS8koWVylj84y
	 FD+0IWo/ashXQ==
Date: Mon, 02 Mar 2026 13:25:19 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable onboard accelerometers
Message-ID: <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
In-Reply-To: <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com> <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 1ba9b50f275324e11109006c28c27603972655a0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94938-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:mid,vinarskis.com:dkim]
X-Rspamd-Queue-Id: D4AB41D9BDB
X-Rspamd-Action: no action


On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualc=
omm.com> wrote:

> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
> > Particular laptop comes with two sets of sensors:
> > 1. Motherboard: accelerometer
> > 2. Display/Camera module: accelerometer, ambient ligth (and more)
> >    sensor
> >
> > Define both i2c busses (bitbanged), sensors and respective rotation
> > matrices.
>
> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
> poking at the same bus as the DSP is, concurrently.

Indeed, Val already pointed out that there is hexagonrpcd to access
sensors behind Sensor Core from DSP. I found corresponding .json sensor
files in Windows for all x3 sensors, but could not make it work yet.

Without these additional things in userspace it does not cause any
conflicts: I've been using this for a week now, no i2c communication
issues and device orientation information is present.

The question is then if we want to keep this series which ignores DSP
capabilities with the advantage that it will work for everyone with
the new kernel vs doing it 'correct' way over DSP which requires
additional json (and binary blobs?) and userpsace configuration,
meaning that most users will never have these sensors?

Alex

P.S. rechecking my own series, it seems i2c node names I picked are
illegal, will fix in v2.

>
> Konrad
>

