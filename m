Return-Path: <linux-arm-msm+bounces-98764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OJKNEH/u2mzqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:50:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F62CC34B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 142FF300F194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ECD2BEFE5;
	Thu, 19 Mar 2026 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="gmq0jwAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256734402B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928254; cv=pass; b=eO5bRB5BBpC9jExFEcszjL4/04TmLZmQFQE3wewf1bpfzeIGJtWPRV2m8zv+90l1VwqeBUJoeOpJfQb2MQNyQn4dl6X/QCcse7kOV9/0FcKml8MeOAJyVjGFo7QBpGOgaqp40dG0p+55A21PwvGwHepIvUfNEbEEBSDvMO4IJxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928254; c=relaxed/simple;
	bh=wNe3zTjWXKubLpElCH4k7FK3v+Z2gPor4/nONBZYQbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzWQizm8DhtyCXjLZjEKDTz83BhuKZ/tmq6SS9N4dhZE2RbPWcYdRF8Lw+44hF6v8QekLnZBUj8bCMLAgzBAWDVrXpXuITwX9bHIUtYXnDd1rF2n2SamTmD8Nww7l7pFLyM8SbKlFc/5cvS4/isQYXA2kO73XMEU19Kzbet5frE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=gmq0jwAt; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C91163FE29
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1773928250;
	bh=L/j+PNZ0FI8K56+I6MmSwOePj2ibMpgOJ+algsLEe2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gmq0jwAt/mcKk1TTVsJ31xwI3GStLHOX6XKM1NhCw3fbXD7RUCY7ktp7anEym3YHS
	 afH0F3SIziUJaMFfA9N/7LByM8W3L4es0f0ft6HAIQMZEOikTrTEiE/TKruaCrItwL
	 bKQFTv+HhJCKQdjKhbAuXzTj880E6drtgHTXPVlPsFUgYEd2hprJkufXqoSPaqU20K
	 wQiz/kAhMoaO0AaGAWcwSe7q1AEOg2Z7FQCJsEazf0EZvptc51HhAnO4d9y7NBP38Y
	 3U6SEQD9B0Ww7x10DtW5HXUsqhC/Gnh22ZqR67/LdVcE+41c3XTItwUpgjfZJnAPZq
	 FEK1oj3YW0qsTVl4ozNLQgiTJl22L84nETSzSODi1xrkUgUCp/nEIl4U+Jxzh5dQTv
	 vcZJSzUL7RJes8xDaHnauwYrM11sR3zxv+ieCyseXw93nhmJBi2zdP4LJUgWpFkbiv
	 XDF/zuGWzBmr3h3U3JJJUjohiCL1sofw7Ea7ei/BarKUVSaNZAhtaya0y9Hdyb6bG4
	 Pr1XhaAnfhaC/vIGbxhgKeAI7AjJwBbDuJx2zzWvtmOW0d+Zag3PJ2D0zuH64bo9wu
	 0aPjTg5l3JXPTBI0xWiCfTUqGPjRSh4VAVN8RKWz4fauV6GAB0wuM3nIQBVQ863qkI
	 fS5R7g6cE5IbqWl+FXfRlkzs=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b97fb810dddso93330466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773928250; cv=none;
        d=google.com; s=arc-20240605;
        b=USghZud1IValPGVasOW0piIC+vFhoac+nTC4z6YIhTYfpJSgZ88FIk8QYL4towTWkH
         Dxl0Bfsg7V9wNbDOT2u4XNIlWGpHN73dDdlZ1Y+g/0pdzT5syJB90UYyUfMQqTQCfyrg
         gOfN0zy2ZVjOO1pIvuZcpI3tiixyG5WpF5KM7uYpA+e44zGgzNq248Nj61N1Dr2551xx
         6DALJG7C/VU59h9hnDsTC8xTxsRYW/eu+43/1+1Hv4kZEjg8GW7sYRzp/zQ5NSo2GPOn
         Fl3cbHPVgZNmr5JeGV5BAHI7HFmmwnCwUJDViDcyKBUBfxSfqMg3zm7EPgFo6Y29im1M
         A+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=L/j+PNZ0FI8K56+I6MmSwOePj2ibMpgOJ+algsLEe2o=;
        fh=fYs8xgSS6aocvDeGNgIgIE2UsWpYa40JYA1mICjNcdI=;
        b=P341DXmXsCm16AZC7o4qHgSR/4N51WZFeo62TW98JTqxpESp40tkln3VYGu2eV1IB0
         Pve7YksXYdl6/D9XHlRmw4L3vs8Vb5C6MbCLLeOqlilRRxILBtA/XaUcehkDOjNcTy4t
         YtDGPSzGopQ+izskqXPPechkxqzD8Dfon2U2puVKxaWdwF0b2rjnkyLCUoVceZBwt6R2
         /qMc3m/YJz4BS12kD6abSJwdo45FKOQqR4wunAeEJPjqR92+QadQO45B/fHhkyMT0OOQ
         vaMepbxHeZHtRYC0XjVheeuUlVTQXs1V2HvobxGyRMcUJez/4J3niBjtPxjpyuIecS1s
         o/UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928250; x=1774533050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/j+PNZ0FI8K56+I6MmSwOePj2ibMpgOJ+algsLEe2o=;
        b=CkE0mjvU+gLGh61y12szeFaWWNDlJAHDOBTvJZT93m33WAGAbXzXt1G0KXejYwbbdW
         nmpLERl5Gik2tXBoS83LF5dTt1DsHhqNGm6Yh8FC/Tk22blGdfyLPaiME9ovY/wuby0v
         C6P+zf6Rn2T5Ip7AHEsUq652lhy5epj6A1kPxIohgiUNIO+4QAsYi+X/WApMfq/vhuTQ
         QYYw9oHANDFiC4JiolmCRwj0LiFfjmJL0ri0Oq6TyQ60834v8rBomu87+/GHoFW4KIkW
         z0Phw43tC2IM9XcU759LoAVHhhRR4fIr1xwZ/5Ud72JNHLzd0pzUg2YvfgRmhuSV8f+w
         /How==
X-Forwarded-Encrypted: i=1; AJvYcCVD+hGmHUYe+eIs7XrWNTv4F5vjhHxswV/VRFHvUDYtiQKp6jExVPh9eVKX95U1qbf+NROMJ9S4x/GBTsO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66/shccsZ6cqERaZxeXSX2QRpNnpMHaUMdErknDz/XbIns6cX
	NmlXIfWSWwJNnGQrXcgXs8SnJx6uE1ZbiFAaERpdnwttO/dr8KcHrjKeBnh/a5Am1wHGU3sfcyL
	w7usoc+b8CNASSIqXoJ7SOg6C6ljuVZBTuNqsVGR1GjixKrNVgRYHQuWGcxSe7vdAUb3otObk32
	jazJxIk1NKZyB7X+b9UqhaI00bmTJq2BFaoFOWe3cHAkNKG89Zmw+nWAAondSIdxqhy+Ua8SABf
	A==
X-Gm-Gg: ATEYQzywevc0JZoW4ccsSjEGIZtr/y4bpVaQglGxTZP917o2TGrCk1mTUnx4AaAG/8u
	4TTLbKzPbeJ13tLN/oDLe3nb4jpMYOhkEcRgRbDltPSpyppDOxHY8dvQ9r8hKPf1pqfBfE50uyE
	nm7xkm2ApFoGfZLF88/ahn6VpmE3LtCVGKWs3GbfQ6XaZu1amneICNk45dhxfaOVqAWDWMXILGr
	Ds1VzoUVfXD6dHJE9j/CAt/Rk0iuXHBpEuVOCk=
X-Received: by 2002:a17:906:1d01:b0:b97:6a2a:405b with SMTP id a640c23a62f3a-b97f498e062mr420853666b.37.1773928250238;
        Thu, 19 Mar 2026 06:50:50 -0700 (PDT)
X-Received: by 2002:a17:906:1d01:b0:b97:6a2a:405b with SMTP id
 a640c23a62f3a-b97f498e062mr420848366b.37.1773928249601; Thu, 19 Mar 2026
 06:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
 <20260313164542.GA1405513@bhelgaas> <en5a7jrgpbn4bsmw5qwprugb2qmjkqw2x5eey6jxxu63634duz@b43rhcsqkj3o>
 <abdviJbrluDn2Vrx@baldur> <kqpgjzcxnazjohiop27exget6qrv37wn3csmixt5nmc6d5dkbg@n7qjo6flaabn>
 <abtgaXSv-zRysJqO@baldur> <4byysnjodmlphwcevw5gb2asxbwwwlf526mtpwpkfi6crjxoqb@vyuktezfu2wu>
In-Reply-To: <4byysnjodmlphwcevw5gb2asxbwwwlf526mtpwpkfi6crjxoqb@vyuktezfu2wu>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Thu, 19 Mar 2026 14:50:37 +0100
X-Gm-Features: AaiRm53OOBmjYF3wt3fYYuOja2T2t90m9EZO7Pd32ZcMTQGM6FDTvHdOzk-54EU
Message-ID: <CAARv3RSag8n0=ut9KGm0yALRPVTiyQ+bBBbT+3Vf1sNOCBLbGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98764-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.922];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 496F62CC34B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Resending because the previous mail ended up being HTML (sorry)

On Thu, Mar 19, 2026 at 6:39=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Mar 18, 2026 at 09:42:56PM -0500, Bjorn Andersson wrote:
> > On Mon, Mar 16, 2026 at 08:50:12AM +0530, Manivannan Sadhasivam wrote:
> > > On Sun, Mar 15, 2026 at 09:53:33PM -0500, Bjorn Andersson wrote:
> > > > On Sat, Mar 14, 2026 at 07:50:50PM +0530, Manivannan Sadhasivam wro=
te:
> > > > > On Fri, Mar 13, 2026 at 11:45:42AM -0500, Bjorn Helgaas wrote:
> > > > > > On Fri, Mar 13, 2026 at 05:46:18PM +0800, Ziyue Zhang wrote:
> > > > > > > Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERS=
T, and Wake
> > > > > > > GPIOs to PCIe port nodes and add port Nodes for all PCIe port=
s") did not
> > > > > > > convert all Hamoa=E2=80=91based platforms to the new method o=
f defining PERST and
> > > > > > > Wake GPIOs in the PCIe root port nodes.
> > > > > > >
> > > > > > > Without the change PCIe probe will fail. The probe failure ha=
ppens because
> > > > > > > the PHY stays in the controller node while the PERST/Wake GPI=
Os were moved
> > > > > > > to the port nodes.
> > > > > > >
> > > > > > > This fixes probe failures seen on the following platforms:
> > > > > > >  - x1-hp-omnibook-x14
> > > > > > >  - x1-microsoft-denali
> > > > > > >  - x1e80100-lenovo-yoga-slim7x
> > > > > > >  - x1e80100-medion-sprchrgd-14-s1
> > > > > > >  - x1p42100-lenovo-thinkbook-16
> > > > > > >  - x1-asus-zenbook-a14
> > > > > > >  - x1-crd
> > > > > > >  - x1-dell-thena
> > > > > > >
> > > > > > > Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERS=
T, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports"=
)
> > > > > >
> > > > > > Are you saying that DTs in the field broke because of some kern=
el
> > > > > > change?  That's not supposed to happen.  Even though PHY, PERST=
, and
> > > > > > Wake GPIOs should be described in Root Port nodes instead of th=
e Root
> > > > > > Complex node in *future* DTs, the kernel is still supposed to a=
ccept
> > > > > > the old style with them described in the Root Complex node.
> > > > > >
> > > > >
> > > > > This is not related to the driver change. The driver correctly pa=
rses all Root
> > > > > Port properties either in the Root Complex node (old binding) or =
Root Port node
> > > > > (new binding). But commit 960609b22be5, left converting mentioned=
 board DTS to
> > > > > the new binding, leaving those affected platforms in a half baked=
 state i.e.,
> > > > > some properties in RC node and some in Root Port node. Driver can=
not parse such
> > > > > combinations, so it fails correctly so.
> > > > >
> > > >
> > > > Are you saying that above listed machines has broken PCIe support i=
n
> > > > v7.0-rc?
> > > >
> > >
> > > I haven't verified it, but I'm pretty sure PCIe is broken on these pl=
atforms.
> > >
> >
> > In line with Bjorn's request, we shouldn't have to guess.
> >
> > > > It seems this is a (partial) revert of 960609b22be5, is this actual=
ly
> > > > fixing that change, or is it only applicable once some other change=
s are
> > > > applied?
> > > >
> > >
> > > This change is fixing the issue in the respective board DTS and is a =
standalone
> > > fix on top of v7.0-rc1.
> > >
> >
> > So 960609b22be5 was broken when I merged it?
> >
>
> Broken on the machines mentioned in the commit message, not for all Hamoa
> platforms.
>
> > The commit message says that the commit was incomplete, in that it
> > didn't fully convert from the old to the new style, so it sounds like
> > the offending commit was incomplete - but I believe the offending commi=
t
> > was a workaround for the new solution not being in place and this commi=
t
> > mostly reverts the changes in the offending commit.
> >
>
> So 960609b22be5 was supposed to move all the platforms from old PCIe bind=
ing to
> new for greater good, but it apparently decided to do so only for a subse=
t of
> the platforms for some reason which  don't know. But the problem arises d=
ue to
> 960609b22be5 changing the hamoa.dtsi to the new binding which also warran=
ts the
> platform DTS to also be changed to the new binding. If we only have eithe=
r dtsi
> or dts converted and not both to the new binding, the driver will get con=
fused
> and fail. And this is what exactly happended for below machines:
>
>  - x1-hp-omnibook-x14
>  - x1-microsoft-denali
>  - x1e80100-lenovo-yoga-slim7x
>  - x1e80100-medion-sprchrgd-14-s1
>  - x1p42100-lenovo-thinkbook-16
>  - x1-asus-zenbook-a14
>  - x1-crd
>  - x1-dell-thena

I can confirm the breakage for (some of) the listed devices on Ubuntu.
We are experimenting with 7.0-rcs ahead of our 26.04 release.

I'll try to collect some test feedback for the fix.
I'd certainly appreciate this being included as an rc fix since
currently half of
the x1 laptop devices are broken.

>
> > In other words, it's not clear to me, from the commit message, why this
> > change is a -rc fix. Perhaps the author of the offending commit tricked
> > me to merge that one, and that's what's being fixed?
> >
>
> I wouldn't say that the author has tricked, but he was unaware of the fac=
t that
> changing SoC dtsi warrants change in all platforms, not a subset. I wante=
d to
> catch these kind of issues with DT binding validation, so I sent out a se=
ries
> earlier [1], but it got stuck. I'll push it forward.
>
> [1] https://lore.kernel.org/linux-pci/20251106-pci-binding-v2-0-bebe9345f=
c4b@oss.qualcomm.com
>
> > Also, is the lack of Tested-by telling us that nobody has tested any of
> > the v7.0-rc on the 8 listed Hamoa devices?
> >
>
> Exactly. Otherwise, they would've seen the failure so obviously.
>
> >
> >
> > If it's actually needed, can we please have the commit message improved
> > so that we can merge it into -rc?
> >
>
> Sure. I'll work with Ziyue to reword it properly.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>

