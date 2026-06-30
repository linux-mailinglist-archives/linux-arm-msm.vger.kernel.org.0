Return-Path: <linux-arm-msm+bounces-115349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lOfIOliPQ2qobwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F3C6E254F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:41:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DFZ0+Pbn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F813079A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7413A5E96;
	Tue, 30 Jun 2026 09:32:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C73A5435
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:32:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811964; cv=pass; b=UCzTy0xG2sMej2aJRnaQBaZEawzD4p4HF8O9IEGqw20S416u/jTrPJ1Ca0IyfUEi3luFLSIFW0bqi/rAq9d4g6ILlIWkPtzYTTZ6Tb8gwrGt8zqt/flLn7tvOik/DiohClmkkjLN5uXaZAPwgcsfNaqQi1QC4tgZ6OMyXzn60K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811964; c=relaxed/simple;
	bh=NDjkwfI8U9JUA3ny3XAbHQd6laguvZjtJXKELmljb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ7z38LYwXrICeiD1Hq2V/icO+tq/ZyAyKwfYZGCAEgvxiL+EoKTU46jGYyws8IBmpWVeg+o7Ld8D+uIGnfWDaz9xaKVthdJ9LQiEqPyPxhXqE80RcW621rw6eoj9yJfNqLHa6qhZ4XgaSGci3UaACmEFlTA8QKML1/6L3T9C+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFZ0+Pbn; arc=pass smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so36634915e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782811961; cv=none;
        d=google.com; s=arc-20260327;
        b=JgGxxCPxp9dNxBCsOObiCFO2ZfRVNjwqpd3KXeCmsbg+kindP9aGXTpGXIOO02wYP3
         /YGcnV0eGuiEu/UyUOp6/A5CUsW/S2S4/ZWM2D+wEU//ZbtDHFLsqsjpw7ZnZtr4SB7h
         ll0Z68jiUXrZi3/AyKNEf0fbJpYPChgFVh5RIHBNsKUuvSDWehRR+c080nzlaMOKDaHs
         W3Vqp22g1cPXPMVEDqG8aExOgH5OCQnU9UgPliijvDCVDi9p4G0H51FCUvZGw+PR89da
         y8Ds7ORa0iFgCePFQjm7oFKwHqEfQYNDz1FRI1opdbsvSmrHOADG+MEz6l+3eSbMV6IH
         VP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        fh=5+vNZ/D0RaFkmw7n9X6ShkyGMyotJ9ooVRA9sSH5ci0=;
        b=kIL9+TLtrub85jU9P+ke5qzDjoL/C+XIlpyDA+vUsUhSha7lIG8nAApsa8IImYG1/E
         +bBHwl7mMLvnBKSCuu0S6QlWoI6Wg+yJrBvGAL70x0TXhVhQ8XjonlHRPkSJSZLMdahV
         qTtjKqQII18Lk114cx8y5+JEgW65tSZg6dVcmXVmuKjAbe2aWeOr8JOQpgXd3D8IE4Sv
         gILZBFeko4pG//J05hbzx7OgTT5uNCGgkNmOePCjbdZPpj/OTKwMH55op6CyMU9I4PxS
         LSR22SABZVWvZJyBvmDiQpJ8b0eqIFDZhUzUyP7PFcVy8S32hTWP4Y0wMb32qB96Cw2L
         el/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782811961; x=1783416761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        b=DFZ0+PbnwwY1t84P+ppJtGltmBvpP304Mhb684NiUbixxMoehdYp5W/Sz1OeMO29Za
         jzvMIBZwNTPUJsMN3s4Uc7E2PIFg4YugAAxxa4/WAxSxT0Uce75qG9C3V093p2b7xYX+
         AKSitEUg94RjRW3bWN9z/C92iDgaGmjPG9ziE5B8onrgY4ZPsWkONZj6EEdrUiBtrMe+
         P7dFre4iBA8AtDBdTCH8lCsCkkYPhJsO+8daO731V7//FNS0Tvp4ID4sy4RAsguHM2We
         XEx7orJTki1aB+WNv2VV/cntNwhzda/4UDM0mBwWaUIialPqtdVvGDyV8zD/uWA6n092
         eeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811961; x=1783416761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NNNQ178ENgLjQuyBEnkfUDg4xhb41skAqKUJEt7HN2M=;
        b=CTa11MgUgyaQAtmkC0vmA8Owb5+ClBRAAsY/nqRssWdbE8u2xNKN55+wWLc4QHk26F
         EUcuowUjUgKAsQ9fR5R1gNIawOORFO1x6kqs3in0yTWDl9Ttl7beQYFW17EQMGDzwCJm
         I6eE08dFMc7obsESvQLlulauL04TTmJE362kVtS63FKWkv2E3sgaPn7QMAY2d17DVpia
         /ovJV8cMzxhS60rbF9LQjmRJQH1x77VxLWG8VY6xiH60tU3wx5SSRKC5sESSI4KPb136
         PxEzVBUpEEYH8WRvqCU6/SpzdkAgYImgcIzYAxqbvdHobCmWB2ZtrlME/vYLgla578Dy
         wuZA==
X-Forwarded-Encrypted: i=1; AFNElJ89+DoG77PWDcdyPm7bLRocUNxeZ6twLETDG2PZLV08gUlWl4qUszjFXzvfq8yap81D2kxJZFadcoqA5ICq@vger.kernel.org
X-Gm-Message-State: AOJu0YwgO8depWVg3r7BfduvYvpymOybCa1+jJzcNfArrJiDdBGihwyj
	kSmxQePEHnvGW1jhqXwuJMcuDPPDKzJFqYkCa0IcnC0IqTEIMMJcXaEyg7DoJlFJmgRPELEB0IC
	2n/HLMWqLQ3U4L562s+6I0c9YO1mKrGQ=
X-Gm-Gg: AfdE7ckHL/Xna9zKmNwApUYl5ODIn2mGHFvsgpZq2BZucb6bxnRg1UQUsRvp8+k66Mb
	VlQpXZnjDy4OzoXjzwQBM0JMOIuIOsAmS8Pp1dld/MOYJlHjFtrjVmXNDj2Z3ZANqSBEvJQeHAw
	cpMfTBJF/Ids4qV5ZAYqImRLrll0TbP2Y1BJiFqYkxqGqSx0QR/4m+JcpFdNPA6Ets9jVlcw7YU
	zyq5Ddq7ZlXyV8Cc04ZWFEjP9VIaCVuYwUJAs7ui2JQXW6FsyiHkoqT/ofuoa3mrObb+5s96UTT
	C5h22kBk0nXooyZTLNSSL8kS+eiH
X-Received: by 2002:a05:600c:698e:b0:493:b34a:a25f with SMTP id
 5b1f17b1804b1-493b82acdf4mr39230555e9.22.1782811961270; Tue, 30 Jun 2026
 02:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com> <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
In-Reply-To: <f9c24109-f480-440d-8658-84033fdcf9c0@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 17:31:10 +0800
X-Gm-Features: AVVi8CdiuKcrDOYkggRWbIOH-hiWJPwJclw8ylr2q98ysBV-hJ7fxiI45KXKhb8
Message-ID: <CAH2e8h6emYrHPHYJbBaOiExNDjQnbbDKxE0NdiUKKZVovR9JGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-115349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75F3C6E254F

On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> > DSI panel driver have been added for a while, so add the DT node to
> > enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
> > describes the wrong, no impact after manual disabling these wrong
> > supplies.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
>
> [...]
>
>
> > @@ -616,6 +663,9 @@ touchscreen@4f {
> >               hid-descr-addr =3D <0x1>;
> >               interrupts-extended =3D <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
> >
> > +             /* TODO: set post-reset-deassert-delay-ms */
> > +             panel =3D <&panel>;
>
> So.. are you going to add it?
>

Yes, this is a TDDI, so the timing(ts after display) is required,
panel_follower will handle this.

Best wishes,
Pengyu

> Konrad

