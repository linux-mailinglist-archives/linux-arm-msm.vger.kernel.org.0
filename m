Return-Path: <linux-arm-msm+bounces-119136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pb9OCKn4Vmo5DwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2775A325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:04:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ioVAyP0F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119136-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119136-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B0A930948FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BCA2D59E8;
	Wed, 15 Jul 2026 03:02:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403226159E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:01:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084520; cv=pass; b=J8+3SuDOap2JSyh7EuBoylSMc8twZtFOfzkHtX/Rq8IigRvV+AEsJvNGW/GbUgZbjXUgFT4okkc5KKYrymX4m93NleIGwyuc75IrrBfx90juKOswKHmPI+RUjABJ6kXcghKEHrKQbEmpDq+fMS11gBr9qMydk3F0QgpxxtRpvKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084520; c=relaxed/simple;
	bh=gztsi8R3KcnU2Y68ziTBqFgTiO1IhBQcSODvmhfJT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQONx5ndJuVFwmSNCxwCMSMKqQuz/TILKXt3gz94JMBDKmD7XQL+Kak1uFVYYQrDxNWbVLida0dGUGTDIqebrKPyqoHVXZHseN82GkU39u0y6qsJFuQiEkFWaFBf3VZt1ZlV5bsLz+S2BtHTiuoTR083RTJRDtIt1iIekZNEqhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioVAyP0F; arc=pass smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9107baa7so48836731fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 20:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084517; cv=none;
        d=google.com; s=arc-20260327;
        b=IhjM9R2vmvbzZUpXxCEl0xI8wGxTtuA5fNg3UYm81Vs9XW5QHyKU77PHeviZQJOD1B
         1fs1Po+pTXpfi9dx9v78uKz8QlXYZoRhhhQBLkTXsWIqZv7Z6ysZT61I8hH2bbuTFA8y
         yPjWlJMfOgg7u/LnKszwt7kUR8CvlPT++0H4rNEdnTyIZMzVafnlxfx/grnkMMiUxmEY
         Hp5vu3cQHJ2/7k0wEtIqGOb2zF1NfQx0PSrMV23j1CnN+GUiaWCTUMdrouTXDckkuEbO
         6KMLOSy2p9kBlkLSZiCpDxPPPTZp8swEX0xzYSs4yIzbTDT/y97dCp3Y5AcBx9i87omy
         mouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        fh=mjzv4v6OW7eoux4448IIDFTZwm1hm7Y2x3IoN5qK6lo=;
        b=FHKEDQeFPgM5Gs4LoFBoYKJ9XoIH5TU/N0w/Ok/1Tw9nZkMvgABboYXsxrjTu89sAp
         YTn4D074l30PixqAYmnG+/KvjjbBuqGcGf7YsuJoGU6YbxyhxSPHqxYw0vezD0PAX0U8
         TTivjJGMqoj+qg/M7gOHDlMLjKg2E4Kqny+DIX0A23I3YuqoupIMRJRmErzMxoyHbxDy
         5lGeeOVPU50GmhpX4qiYx59rNfsvpNrOZi4HLudqVAOl8XnEioNU0rOazqOoKEEhKfOo
         mYoPdlTol8vMPVjDGk+WtH6i+ZxJnjGwWCIwc34+cGu25uAMbHDMzNvZNnKCcbpZviYB
         N26g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784084517; x=1784689317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=ioVAyP0F9MUNE71P5kQ8il5qAayvaiadBfcgm5D1LMivu98tZwvhUTJpBSNn2hd1U7
         ChYfEZ5anj5XmVOqvVXjLNwmpSwX6I25ImvSxCvwhda7InJ0+owWsPvijsVHdZAJy1WX
         p/fYf2JRc80o8Ofcgf7IFUsAwSIU/auT8ASPZyEBLhOkRA3FJBUiRKDvWE8tL+Jfah9v
         /Qmtz9UHdKzRgCu5PUOy8vJK4SYMXOduihfY6QslzqG6MaGWbogUnhf1uLTg0oxf7pKi
         3PzhC1rqNJ4UVlWkkybyWLO64LjPL33M/QaI5mf9xuH++b4/Ba1ZfTQQh3AeRHzQubSR
         9DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084517; x=1784689317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=nQFL2lEWxnCsG1DKdV0zmITGl9FPCPVro2TSacmGbIMS7Rai/wlIWv1YeQr7LZXqx4
         Mhux0GugvYzqfaQT9tiWiJRICay4u3oDuRbTsWXAFYPr3UDVnt36d1ehJ1wLvmDMJbrO
         IBTVyQKbD1HkRzhvAyOyZeFoa23IzPXqUGois4PSOeITeMHCQnLGo0hIok7T/7vpynqt
         pc2FDmxxm8aVkS/HLrBZkwnhhymBAv6UzClfcUxpciFX5X2XJicH418mt1s58MFM64w6
         +xwWkR5Vg4auqnSQS3LrZrooxjaV9qdqklLmh+Ke9eap9xvRl+PXFAV+Iz25nT6C6Y+e
         x0Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrBKa8MOGGJQ4Gd7EfFHOQD4LLvDYYRooTPw0MAeBjdDwauyFOXrs0ff4qveTrT80Sapw3xFXKAUvEdHqsu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/KSXuUpiQ/pdMX0UCcUFJIf8qlvSBQN8hFhsZe04CkiIl6jPA
	msHneOlN0O3h46ByfAqyg1zuGPwb70lgDQXhix4IF1wmOjvPyb6JA8KZTH9dA9D1Gnrsud7myYE
	vfAoWmX+4+yhlWK5hf4OFyrjLpqKA8H0=
X-Gm-Gg: AfdE7ckJbgSxhbtPp6u42/1mlytrPviZSWT4stEP6YA9bnfIMQzLjp9XaexQgyViifm
	Qnmvngbyaw7Ro3LImDyPRIR9mNjMj69YipcK6s7D+TxaoMHP8YXae+JNF0+qxGNdG4E49p204wQ
	+prgmBDBLwrT6jAta4mYqQSaL6vgUs9U/eZQqROgCyBct3CnUc+FE8ZJG7nXxkisECPdkz9RNmW
	dUoEkLWpN3mc5RFSbPUB25BKIzOt8hDguZkgcuIrJaEF7Yod4taU6DqChf7wpxGImjHGQJMrf8z
	WK/9J1Jiy+FUpLsWzLrXsLycBqLN7DYJ0ZPI5Wx70lntZ64RZHcMkA==
X-Received: by 2002:a2e:a902:0:b0:39c:9aa0:799f with SMTP id
 38308e7fff4ca-39db6d92796mr2546101fa.33.1784084516752; Tue, 14 Jul 2026
 20:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
 <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
In-Reply-To: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Tue, 14 Jul 2026 22:01:44 -0500
X-Gm-Features: AUfX_mzpMEopUQE7TosDVBxiXPh_gfwtw_3Imj28x21OlNZglehtbqTvg-XngPU
Message-ID: <CADi83T6uU+L5+SxnZsHN8ejUZ1JfQxv01q92wF_y6MbVsOu=wg@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119136-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lkml.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BD2775A325

On Tue, Jul 14, 2026 at 9:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gma=
il.com> wrote:
> >
> > Hi Rob
> >
> >
> > On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> >> >
> >> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> >> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_=
wcss
> >> > > driver. This firmware is usually used to run ath11k firmware and e=
nable
> >> > > wifi with chips such as QCN5024.
> >> > >
> >> > > When submitting v1, I learned that the firmware can also be loaded=
 by
> >> > > the trustzone firmware. Since TZ is not shipped with the kernel, i=
t
> >> > > makes sense to have the option of a native init sequence, as not a=
ll
> >> > > devices come with the latest TZ firmware.
> >> > >
> >> > > [...]
> >> >
> >> > Applied, thanks!
> >> >
> >> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struc=
t
> >> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> >> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT =
schema
> >> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> >> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
> >> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
> >>
> >> Why is a 6 month old patchset with reported errors being applied?
> >> Anyways, linux-next is now broken. Please fix.
> >
> >
> > I must have missed the error reports. Can you please point me in the ri=
ght direction? I'll get on this ASAP.
>
> "make dt_binding_check" on linux-next.

I see the issue:

      DTC [C] Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcs=
s-pil.example.dtb
    Lexical error:
Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.=
dts:49.28-51
Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
    ...

This is easily fixed by applying PATCH 3/9 of this series ("dt-bindings:
clock: gcc-ipq9574: add wcss remoteproc clocks") [1]. It defines the clocks
used in the yaml example, which resolves the issues. `make dt_binding_check=
`
is clean afterwards.

Would you like me to resubmit this patch for linux-next?

Alex

[1] lkml.org/lkml/2026/1/8/2278


> Rob

