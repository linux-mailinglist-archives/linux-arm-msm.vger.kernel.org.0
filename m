Return-Path: <linux-arm-msm+bounces-119100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DX1sC8e1VmqwAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:18:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 701137592A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iczIVJ4N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1CA93036391
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 22:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978A6377A97;
	Tue, 14 Jul 2026 22:18:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7132E729
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:18:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067522; cv=none; b=q/cmEI/Q4xAheh+1WdxABecBDXFm7Xs3jLHmUyg+8kQb0iA+iqQh52/bwFlLU1OPW91paZvZYwN11ZdbGwhHHvQjTvGuQ6CMCT64CtoWZzuilLXwdpeRY6J9V/LyaNu8hMd/T1R+uo7azPfJxrajecN9drd09IP6SHuAvTGOa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067522; c=relaxed/simple;
	bh=zE4/VqVuqJcmLrVH3FOoILkeVZE5/aWlHlMGboDOFA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcpJFzxOSqVl0AwKA1lKrXMY59NaRaZOK+Ki2R5clVGNURfM+IcBM81Mepskh+wYFQ1mGEG7xe89vSb2qUq7AQcjsNFRm/Pl8tMkS5yyfmBptUB/DlX1s+BfNdiNhT6zfVZYzPFLKphr7TIM703ERCd8Ygl/5zjPuy9PYNdTu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iczIVJ4N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392C41F00A3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067521;
	bh=eIZxXxv+tXPpBDgH9el62yWObQ2/JLuBH/QJ8Rckin4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iczIVJ4NgscbrqaFczNkEXAZ72kR6NInSaVwtT+g0fM/45cx9W+8Ce9CSaq8gNz+Z
	 iFe+tnz3DsA2xCPnoMNmfluvogNNWdpNeq9Wj1XxOUKtDwjXn9hPJ32ufIhKggAkAH
	 I+cReVFKKUMWLil0JJKv941gU5ibiF0KoXVGjeVhpZaBvel7cxPES7WxoJlpjkajMe
	 sSbQq0HeP7rD9hc5G4RFb051LYVR3ne5OXQZtjXpvdVcANFm07a0stlWGI+5YkMIfG
	 mwndiKRFpIoEI+nAA6KasM+yNdmyriKU7jmA75zM4vQJ8uI4MDrM+ZEfZCBsgwMkPK
	 RV/5f+jm7kY9A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1671ec8692so79347866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:18:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMpuljLfy90vb3SRxe7NvGZRpMhUv6xro5zBk8ZzqmlXGYXyCx1EfCf1gALz3L1LUYGHS1FSxntc84BsbJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nptd1OB8kbHg/ShgW2KBfjLHHSj6qhOyU0ncVJ4fBRk65xpK
	if73HQkikmDoKKqWIz1WhR5KMJCpmReouX1b3e6B6NqaRdjjeXsmJObFZlUlgyfVhQHrz2He7OM
	mR5glpOCQNfC9GmT0+xC+Si813Wbrzg==
X-Received: by 2002:a17:907:d80a:b0:c12:96af:acf7 with SMTP id
 a640c23a62f3a-c1679307be0mr35724366b.43.1784067519854; Tue, 14 Jul 2026
 15:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
 <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
In-Reply-To: <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:18:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>
X-Gm-Features: AUfX_mxZ5H3Dmc9Ije2tAB7DSx5dWyfLqdISdj5COsPt5qCVJ_8IyPPkRM0tWRs
Message-ID: <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119100-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 701137592A7

On Thu, Jul 9, 2026 at 2:32=E2=80=AFPM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Wed, 08 Jul 2026 15:29:23 +0300, Abel Vesa wrote:
> > Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> > with the corresponding OPP tables.
> >
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
>       commit: 4e967cad02bce8983c4e826cd13ef0e730692832

Either wait for the binding to be applied or apply the binding with
this if it is a binding only change with no driver changes so that we
can have fewer intermittent warnings. It didn't help that it was not a
series.

I'm applying the binding.

Rob

