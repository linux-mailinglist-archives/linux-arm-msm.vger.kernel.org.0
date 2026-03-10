Return-Path: <linux-arm-msm+bounces-96715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D+wBlA6sGmDhQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:35:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE49253AD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA04C314C214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A87430B502;
	Tue, 10 Mar 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HEqQPFjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC292FC01B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155459; cv=none; b=DhfzipGwt2zZ4TdmH/RqCU1XynZlBBMe5h//vKi6PEdF0vaXj8M8pf/74sw2Q4nCsLzf2UtloxZxenB9v9mDEb5aTQSPphovnfB6i7YShfia5t/TBL+5mrnq1tku7G5xlN4/uzPkHo23atXo8wSx8YpY3GjADTBi7e1lQ698DLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155459; c=relaxed/simple;
	bh=8BVSAQEnYcnagoXkJ97Ah+B2S6w79ajlwTTzjMvnuXs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9L5/ZleiNPZj5ghM6CEF8e4zrfztmNkjmn2CwpyIF+vFPa9EegXy6kN7ryXxL84YuEAgOCic5GF7gzZQuX5LmaDm+Z7GiVAWfCdWjrK1TaTnkxQRIvO43NPE52F590uUIoSo1EASg8/eiMAgWMBzdQRXGVvXgWSC24ME0Xppns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HEqQPFjl; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773155455; x=1773414655;
	bh=4jJ5giqF573VAfd2TN29qmRHYBrBtONXn9Oyt5fWhlw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HEqQPFjl3cqKBYXUiSIbUDlxZX/tja0T5ZjJvWDH3I10gihrW3IumwB4598C1BwtN
	 l34LD+xIjnlQLego3MEdu+jdyUMkm/37pM7BNJzaqpOEo1Ojh/Fu9JXkRxW6ckNtmc
	 NmCH5I8efKbcd0khfHkWouqbCyBoUjMUCYHXg2L1JPBsDF0YNxafwjdt5vDTCI1Xkg
	 MRRR/3d6fDA5bjjUkoekp0WQq+gWFJ01qXBt4znyF9OnBOxStfayPu62b+eArHsi2m
	 uLTXA3Hv+We05SIOjBgn5qNjvGb2AgbpzZKYrbrcwkxUIZ1QDUDCX531obtJwmEup7
	 QMId7palF8XMQ==
Date: Tue, 10 Mar 2026 15:10:50 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <L6ofIX7HhqB51HZm7djWZk4K4Bl6g7_AUnOIzqwJZXLyIQtjsJa3kU7WW8343wSFvBkxY2gwu02zeUQTGiGL89D1Z5yzZD2891aBgPhx0T8=@pm.me>
In-Reply-To: <4df4b8f2-ecc9-447b-8a69-237c2a5841a0@oss.qualcomm.com>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me> <4df4b8f2-ecc9-447b-8a69-237c2a5841a0@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c5a6c8cd0710cc290ee8acbdf8997106a88a9956
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6FE49253AD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96715-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tuesday, March 10th, 2026 at 7:31 AM, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:

> On 3/8/26 9:40 PM, Alexander Koskovich wrote:
> > +&uart12 {
> > +=09/*
> > +=09 * Debug UART routed through a mux with an enable line on
> > +=09 * GPIO 170. The active state is unknown, so data may not
> > +=09 * pass through.
>=20
> Hm? Is that software-triggered, or is there some sort of a debug connecto=
r?

On second look, it actually looks like there's 2 nets coming out of the mux=
 into the USB charger (bottom port). So could probably craft a debug cable =
to test this.

Yeah I was assuming that 170 is what triggers UART to actually work on this=
 board, and that bootloader would enable/disable based on a fastboot comman=
d or something.

>=20
> Konrad
>=20
> 

