Return-Path: <linux-arm-msm+bounces-80495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E6C3858C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 00:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02FD24E0564
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 23:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ACE2F290B;
	Wed,  5 Nov 2025 23:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Trv6uxal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46729BD80
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 23:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385061; cv=none; b=NbbnH3FKxdlAYrmKxJxAtOwsFvobhHI7kQB4PTRS3srxDUhqEAiL6WxQsulSv5ufBf1cs1yCsmlYEhJ/AVRWQCina+TQkQxGzjOoBhTelPOtknFQDfNMxONb+Oy2GO5TB7YeL2Ea7SwOOUFaaNogtH9HPWXj11c0HUncO117qc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385061; c=relaxed/simple;
	bh=zyRVwPSkoGAoqs3pxOp2q/75KJ2YSka0F2V1fIlbWkk=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=I3jDtqKYzf33ac3isFkpGEelCZAtkTWy/CBSLRiF6k2AnaUBqIEgDv2wvANyirJoAeYXQ21mV29p7Ts9kDRj5hG0GVjPFWDAP9OuG8F6bwhQxBkq4Yg/NyiKjz/JsJuYe1xggdYWXzN9fLp3obpOCgTyVY8mYGLV7QPCcim3csY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Trv6uxal; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762385050; x=1762644250;
	bh=zyRVwPSkoGAoqs3pxOp2q/75KJ2YSka0F2V1fIlbWkk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Trv6uxaloVAnZGECubLV2kY4I2qCdCsTSdWrus+mtO3KWLrgThRZAt9ZFZXgPKAkI
	 KIJjGND3U9md9n95kt76WD9Lsasn4JPiYRyzpF+gP0IIb01CTsJYsf7zdFxc+DFxu2
	 KVT/AUzeyOUDEnRUcmclbjsnEOAJI1hCvHm/sbaaR4k0TcBgTFX3+I4u6b5QwdEUC3
	 xF6vJl+RxSkyIcvll9K5+xg9DIeqSSSZH6Q08qx7kYPXTXPC+OL42+niwmnSLrKLYy
	 Hqy4Sjz0eZ/5C4Y0PSgU7QM87CUSiBAUxgWASlwlIHKQd5xa2GD0pgxVUVAZmNR+XN
	 OydAAJ1wEsGHQ==
Date: Wed, 05 Nov 2025 23:24:05 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: philmb3487 <philmb3487@proton.me>
Subject: SM8635 Porting Effort - PCI-E Card Doesn't Show Up
Message-ID: <xAsYX3yZX3laVVaqB8tdxUoTWM3jFlYudJ7j62r-6redf_OJgS_eY2mEypJ0Ma8B26RKeCqQU2G7pYTKapYx0M0rPAEvdpA2oyOs4XA8tcE=@proton.me>
Feedback-ID: 109714282:user:proton
X-Pm-Message-ID: cc9ce592abf3a4b3dc03bc728a8040cedcffad4e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Good day everyone,

I have been for the past couple of months trying to bring up Linux on the S=
M8635, with mixed results. It is gueling work, very complex.
This is the first time I use a mailing list, please don't yell at me too ba=
dly if I did something wrong.

I have a wiki that explains those results and what I have done, it will be =
easier than typing everything here.

http://muyuwiki.ca

The reason I am writing today, besides presenting my project (and also Alex=
andr Zubtsov <internal.hellhound@mainlining.org>=C2=A0is helping with this)=
, is that I can't get anything related to the wifi card working.

The wifi card is something like WCN7850 (although the DTS specifies a WCN67=
50 for the bluetooth chip, I'm not sure which one it is in reality), it sit=
s on the PCI-Express bus, but unfortunately there is a complex sequence to =
bring up the device on that pci-express bus.
I've tried so many things, poking the GPIO, using the power sequencer drive=
r (pwrseq-qcom-wcn) and the driver for pci sequencing (pci-pwrctrl-pwrseq) =
which aparently calls back into wcn sequencer. But nothing wants to work :-=
(. I'm pulling my hair out.
Take a look at my device tree, could you tell me what's wrong? I know there=
's a million things that are wrong, but let's focus on the pcie node.

https://gitlab.com/philmb3487/muyu6.17-dt#

Thanks-Philippe


