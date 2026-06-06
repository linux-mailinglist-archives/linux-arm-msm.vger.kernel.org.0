Return-Path: <linux-arm-msm+bounces-111520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHfaLy8mJGqq3gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:52:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383064DADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ni4UwVJB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F85301179D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 13:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8BD38239F;
	Sat,  6 Jun 2026 13:52:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5B2264D6
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 13:52:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780753964; cv=pass; b=OiM6lbr3QBjN3Qu0O6gPAWWmwp7Uivauo9uunjCMrd6nJRFFe/kj+fTMCgoBaS87ZWURYeOVlRQ/bexct7DZ/J5pK7oRj+YjE4p08HPeNx+saCwiJmmk0NiJvHGCG5lWt/Ls6FTiDZaMCiDI8pMyTtr5+fII+yTomiPt/OSb/WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780753964; c=relaxed/simple;
	bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX21MTohYpPD6YizGyrwqg89rpP8Y4uwHRqe9lKb8bl2gp1HdWXuZxwlrOCOdz8p4SAEA0ukkUd7SFfQiKRnz4qp9jz3CcO0p7qD6z8JSTPPdFz0Wzuq036U2EQmY/N+pskn1OlS7stHKwsAeXlb3WHUb9WwL4FCsXQv6DnBS5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni4UwVJB; arc=pass smtp.client-ip=209.85.217.43
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6ca94e539f9so1733002137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 06:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780753962; cv=none;
        d=google.com; s=arc-20240605;
        b=GILao0cA7Zrv/u3FLhpoW3QnMEGohS+67934sA14eOau/Geyn+isCh2NuzvVnO4kCu
         jN5910UXaVk4wa6K92aTZYZD7D/X5y3P/Z2lxczn2G6a5WAJgb/MvcM5QkjIufPh/yOA
         Hg28Zu10QkXIFq4/uqeDVZ2bRTuKQ/5kQIk7C87C7H40rNq5VRZ0t+mBfDmetBPYnB0R
         UafZ/oSl2GsbNG59UpH+l/Jyc5V6g0juZAWbWKXsRqxlZegiwdVUWGRvX+Oc/L/EXqCT
         SebcKe+dvBMe+Hr1PD7mN47lhLV/e4S6CpiCaCbBUD7miVNM9eS28XKuvPbRcLVUCMHj
         tWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        fh=/fu0hgtC9bVV76eoCd7QLWsS0YhS54QCwLkz4r8xpKM=;
        b=FbaMbWVq3fVAgvw0YWjP74tYlE3hdg6qkW0hevZmXNe7b3Yl5dLJa4vTurp9kxY78W
         50R+5OCoxuFsTtMqzKenqUI7adGK+alVGMhE8TgP6CiuQMmOXXrAP4KtHoDtfZZb7dTR
         rAJRyBRiXhHaeEx2sIsEJ8+XommLz58w18Vurvz3gDwiweBP3PN4VZOdR05Rd/yFmVw6
         /S9H6HKcKq2WvHxcMyV8rYo1Xvd2jQGKQv3nIo4XHeju3PMi9Zbe7S5Kk/zCoS3iFFSC
         e86ueCSuL5fbqS1Jsbtw6ETY38Aqpmg3FsTlCrv6UjuxccJ9Z7bkVYKHOScpU9IhTAeS
         1NmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780753962; x=1781358762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        b=Ni4UwVJBbP1YVfw4ZNAnFqSKQkpJRbqGBydf05LCk8wi1PzbqZat80vU48JQI0GX1H
         zYnfzRaWL2+j8gS+O++K4vmFYoFU1LEh+zXbFzHHWVqkknkGd4U6OfS6h2uxd019GQK0
         LR6OqB+WdHFmCHlGUPz5LT1rPObN9AyTfuxOPxocRQ3jmB4qpfMWrEfofa9nYLITf//+
         jzl9peJtdwhykkWYoZCId3WoUtsKhZv2B0NFVZH5Qcb6UWxb4l31VEUQRwEZbAMtgs7S
         tTAqZ5ralzR0yChIIbHkN5iOhT5gwdn5KZnS6I8SVawgGunS3EfqXYk5Mae5I/PO4JXI
         zKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780753962; x=1781358762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        b=BQuN6qBRPA8ZUi09Zgi9MAkBO07wnvRvBak2BQs3IuXkN6nMyMYN2GO27CZI1qYHx1
         Q37gnI4IRuirTRz9mAcP6gBQryeAz++lFhdP2MKlhmNZ0quN3iSBWabEJNZBOEl1yofu
         u/L1yrye0HxvumMNeYoeS8qgpMm4WmTfEevqlusqppqln47Iu5bKfn/VMdq2Y2jqRk5F
         Jyc/grJWojnVliyTLHCkXvc45HhINOGRCfqkyLP1TpK3ZGEgA8UEPnmZjlgYvEIZoZkd
         FjMJF7XRKKSMASHHiZUDn0agwn4OhIoIAmF1dzogivzZDOW/flVcEqKXy/eMWagI38wc
         HA+A==
X-Forwarded-Encrypted: i=1; AFNElJ9zLbTB702domy310SgsuMs8FQb9dnKhTHbWDXwehD1xQQsm4FxGdkYHnhRk+rnfjTJ+jiFMUu+fF6u1wwy@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgZ0ZZzwL790fixVLXG5aiGl1qSK/bcIum6GSCayGFyR6EHUN
	bXY7r7ByuCxsPtrXO1q+kVdYjyxMNML5MxPdb51UDUqH6ZQpF7eRxJ2gt9S1b2NeMcq2IpN2szl
	o+u9uMXVU6CwTD1ifkN5gTnKpMLI1CPE=
X-Gm-Gg: Acq92OFoFED5lqqYZoZ5u6nRxGZYXONJbNRIlZjag5mS9v/PuyNPBRJbwzyqzQG4h1B
	2pJyIeAwrcpzrQVKwyWOqxY94/I6Gtport7rFseXcWVSriS01m3jKfk5Fg4pWqHfiZxjJ+2eUCi
	EySuWrzyFQmrVkto6D61wcfUyaaPNJi+e9S03AB5QoCQ6lWYBwu7A29OmyzSRNQTGFCf6zwIgMl
	T4ZG+BubW0/KF+6+d82JssXhbKg62HuEb3G3dBmO+ePZ9VagsIbD2i5F9KAUKgWu/Ij4QDaCVYd
	mBwFTrD1tldbUy1VacLLN7oxJIk5sc+kZ8kk/73PXbINf9VhmQ==
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id
 ada2fe7eead31-6fef1098102mr4590673137.13.1780753962030; Sat, 06 Jun 2026
 06:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4> <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4> <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4> <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
In-Reply-To: <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 6 Jun 2026 21:51:26 +0800
X-Gm-Features: AVVi8Cdt4JdBlUpf2MpnLITXCI-yOov0kLlRKmMeUF7C4TVsX9iBtGHi-7qPpE4
Message-ID: <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3383064DADD

On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu Luo=E5=
=86=99=E9=81=93=EF=BC=9A
> > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > >
> > > > The magnetic keyboard (USB HID) can't be connected somehow,
> > > > others
> > > > are
> > > > fine, such as the spi touchscreen (not upstream yet), which
> > > > utilizes
> > > > DMA definitely. My config is here https://pastebin.com/SdjuyJYk
> > >
> > > Is this a defconfig?
> > >
> >
> > Yes.
> >
> > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
> > > exhibiting the problem (because there should be "public" GPI DMA
> > > consumers to trigger the stuck/reset).
> > >
> >
> > Is this still necessary? I checked the fedora discussion and your GPI
> > DMA fix. And GPI DMA is only for the QUP-supported peripherals as the
> > binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
>
> The devicetree without this fix seems to be still incorrect, because
> with the device tree fix even if the GPI DMA driver misbehaves the
> system won't be stuck (although it will iterate all GPI channels and
> then fail to function at all).
>

Back to the start. You said some GPI interfaces aren't available to
HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick test,
and spi6 consumed it, no stuck or reset. Could you give me a
unavailable channel?

Best wishes,
Pengyu

