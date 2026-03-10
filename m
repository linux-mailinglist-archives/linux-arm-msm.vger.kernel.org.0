Return-Path: <linux-arm-msm+bounces-96467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMPXA3GRr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:35:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98085244D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72CFD30CAD5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DB63BA236;
	Tue, 10 Mar 2026 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BZk9VvKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E63B961B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113573; cv=none; b=WANZnsa2UqYp8e2CO2vhoRiYs+1O2u+rGvpa/5ZMkBFRYaKWLHFVJcTdAc9nWcVRr1DCAkybDvReTKPdKK3bVqH9kwm8GKuIA9pkHbZ+UpB5dzLAHGcNDCrKIY1ZyRlttP/6o9FJhDlyo9arpYk1BjUCSenJNhq/8XjtEi1tuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113573; c=relaxed/simple;
	bh=eTkIAxMqdE1RkuJcviqyvpE1TuLFyT61yjg/1kefPJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDGkD5HOa0fNIfhoMHRmZjKaUZuEV5ARd/0KHzn2+LT7LejRu0eYwS3fXfrusSZ0YT7Cc1sy//UsOV+PuqmGJXzLmOrR1a3XE1P8ib3Uv4TgN0hot4DV+9HE0aBbB/OYXOFsS59LxjXIxQIGY+h9/tdUTxPLgCMwaiadINqR1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BZk9VvKj; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773113569; x=1773372769;
	bh=WMYzQNFXbnMb3a2oeIbnlbRNheRABO+vVNZQ0HC53cw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BZk9VvKj4pQtMb0wpC1Z9V/8sLD4onb2AyI0n9kAlTgXoolipa4ooSKciwyGB/C4R
	 +MBYBxVq9J3YBzwTmOg6oLY1YFt0uC4/xbJetX0O4Iv3hRuRFA04Dt/6gpizERGaga
	 GO3WdVDT7xJoYqJ6ABrUZfmvilghfKhNXuYJALE1P2fq0M6OYKOokRcKNeuAbX3rTx
	 N4iDJi8mFpAzdgL8YldS6FqDLPU6K0ZKBPabLB7+Ekg2VlHH3KmKPjwspa64+OkwVl
	 dJjeK1f9beo8mny/TRflxWyfNiZ4kNzVrWXtOjPLXURcGLR2AQFuMWxoSsFQ0wc2ur
	 uvSZXqJ4Q1VMA==
Date: Tue, 10 Mar 2026 03:32:45 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <Aq0_A41FhB8fJb9dTuRuZRKqmFlPjEaBk9DwgvNk4bo4qyzhKOb10g6FORBRqZuPcYGkZC6YC4_Hx5GdwDmPPkYBHMzo9mqcCT3_JSi_Z0Y=@pm.me>
In-Reply-To: <eykyxrdiaqf3z3nthwa22tvxz442ynhvhsjhajs5jfnwuko2yp@f75t6vfhfjrp>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me> <pu56z7dorbujx57yzfclcncrj4zwgtv3gshntnlpxcpbunxsiz@2rckwcyjgetg> <TTd9O1RN8B4tl9ogFkEYOLpb0iuA2NkOP_3RVkPfnEPntd7f33LU8zzKfy1ICXQ1M-TmDVht5GxiNsMDCu8O2odbZUBcU4lEzg-wyq22ZxM=@pm.me> <eykyxrdiaqf3z3nthwa22tvxz442ynhvhsjhajs5jfnwuko2yp@f75t6vfhfjrp>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e6ad6c9d24e93c94cc0e36dd8a1269b1ab168dd8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 98085244D8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96467-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Monday, March 9th, 2026 at 11:24 PM, Dmitry Baryshkov <dmitry.baryshkov@=
oss.qualcomm.com> wrote:

> > https://lore.kernel.org/ath11k/PqqPCfIvgme9VLMd4Q91JxMhlc4JOTjuWhwXupf3=
_0cZXUvRy0wijwNfy7lAY6fiIXHXU_buPPbpDM_Uvht3G26146R4szD7Hvp57m7Totw=3D@pm.m=
e
>=20
> I don't know if that breaks the scripts used by Jeff or not. Your
> attachment seems to be lacking the commas.  It is named
> "bus=3Dpciqmi-chip-id=3D0qmi-board-id=3D23variant=3DASUS_ROG_Phone_3.bin"=
,
> while it should be "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D23,variant=
=3DASUS_ROG_Phone_3.bin".

Hmmmm that's odd... I checked my sent folder and the attachment does have t=
he
commas in the preview window, not sure what happened there. More Protonmail
tomfoolery?

Maybe I should resend that through gmail or something.

>=20
> --
> With best wishes
> Dmitry
>=20
>=20

Thanks,
Alex

