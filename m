Return-Path: <linux-arm-msm+bounces-117340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xo+1F5QLTWqLuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:22:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7771C880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:22:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ncZwAu75;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A651231E503B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 14:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAA0331222;
	Tue,  7 Jul 2026 14:02:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66231717E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:02:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432960; cv=none; b=Fu/f1IY/4LwOsOqrAfCgBcjGiaXg1sm/oa5YHkC7YXqBLic+5nma/R4/lvNj5cc6v6APxN+nHO5sM4j2VG4/qJYxkLs3NV2EQAGRpLyi8SbVotZl6/TQkC0kn2LxC2AiHzPlXkMjrbEQ0ocSVlIlcD8zzTNkiR0mI8NzF9FWYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432960; c=relaxed/simple;
	bh=T7XOeMmDi5PEuS29Icsd6gEKz1v4I9eNID1RE8K+gjc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9Xd0EaCiR84YLPzX/ryLgnxx4XOxV7Sxwtc0qtVhT3xqKEHA6CCFvddyYuvcgdOKoJb1FqOPuTq9MghPhXkasckX9/6OnqxOOpixqBBF1U5GYiK3SY0fHcXSS1EATwsVdhp0mxmfZc/3Lzpgr0bReSV5mOwdMKn9dIasMM6P50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncZwAu75; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7CF1F00ADB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432958;
	bh=3G29P2M20+AzJKzYQgpzohO583/nH/Yg8BUiARXkN/c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ncZwAu75yHlsPWm+aquFCt4VPef4k5QUBnLMPBsv3b+eaHl+ePR8yhewHYi0qBbP8
	 J+81xoTGGAzZLpnRAStRdZqAvPknqoV02XF5854WdH/UGseOJjNWi35EaeA2eu+3yL
	 QWDeaR9bJt6E2b2UmI/a2pn7DM2elLmq0PSEpciAH60jQOjKJoOiDm4wMEInWKWHWL
	 XBMarxYcEcqPZHQCQZMAEqV33+r27vdIQKQweLwVl5uNplF4UoMaoo/4ongABKgJz/
	 Um1am1/MALxX7qlCBoPs8UadtvJ1hwH7PGY40PFG8M2FbDnkOT+CZPgBJAQPanYGM1
	 +xIPyCYc7DD9w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b38d3c929so35061861fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAtGqY1XbgH99J2bw+RAk4EPIShUxYwczN2jRERqMUfesxEWnxnQmXx/DzWvY0vkK3aBWv8VoJw/pnWTDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XAs7ONV1cy5y9YW7sTJywJoIm4/qnZbG51NuAuqDOprXeAKm
	pDfKfqCpp0idvyyOXcPltZvnovzQh3qiQM4YQoLFxA73MrO/SB5B2x90CFgNFiQ92V79hG2jEhU
	bMBrNr4f3R5oA/fN+g0qID3LnJmQdL2Xp/jrwuSOFag==
X-Received: by 2002:a05:651c:f:b0:39b:bc9:90ac with SMTP id
 38308e7fff4ca-39c60035948mr8638371fa.30.1783432957101; Tue, 07 Jul 2026
 07:02:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 07:02:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 07:02:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b4myznfs5kkochdhzm2ypcfiolk2l2a7nvjbhkkcqueumkyvpe@nyvvhhcslk7e>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
 <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r>
 <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
 <ynhos7h4x3kbqbio2gkigoo5rqbwogrzihkylxv5pqjtqpqmnq@rlyjaiopx74a>
 <l4qycbmz2zaroe5rreuop4dx7ugfcx37hfaketvn43trdpaept@jyx65agqznq4>
 <CAFEp6-0AA-hTy=3KaRNEJ+kF0otGLTGTujvWJqhT2dHDj94E4w@mail.gmail.com> <b4myznfs5kkochdhzm2ypcfiolk2l2a7nvjbhkkcqueumkyvpe@nyvvhhcslk7e>
Date: Tue, 7 Jul 2026 07:02:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf6q5s6UgSRCOeHq=9CKeO_91k59T8Yr3kZ8N7OifyBRw@mail.gmail.com>
X-Gm-Features: AVVi8CdomZKaOaY4QiMrsZCCt-GUEYJD7tlypMd4eAMjuWUCA-oEYhkx6wXXzs8
Message-ID: <CAMRc=Mf6q5s6UgSRCOeHq=9CKeO_91k59T8Yr3kZ8N7OifyBRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117340-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EA7771C880

On Tue, 7 Jul 2026 14:56:14 +0200, Manivannan Sadhasivam <mani@kernel.org> =
said:
> On Tue, Jul 07, 2026 at 11:14:10AM +0200, Loic Poulain wrote:
>> On Mon, Jul 6, 2026 at 8:44=E2=80=AFAM Manivannan Sadhasivam <mani@kerne=
l.org> wrote:
>> >
>> > On Sat, Jul 04, 2026 at 03:11:13AM +0300, Dmitry Baryshkov wrote:
>> > > On Thu, Jul 02, 2026 at 05:08:56PM +0200, Manivannan Sadhasivam wrot=
e:
>> > > > On Thu, Jul 02, 2026 at 05:34:31PM +0300, Dmitry Baryshkov wrote:
>> > > > > On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam =
wrote:
>> > > > > > On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wro=
te:
>> > > > > > > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote=
:
>> > > > > > > > For QCA2066 (and other QCA chips) on M.2 connectors, the U=
ART enable
>> > > > > > > > is controlled by the W_DISABLE2# signal managed by the pci=
e-m2 power
>> > > > > > > > sequencer rather than a dedicated BT enable GPIO.
>> > > > > > > >
>> > > > > > > > When the serdev controller has an OF graph (indicating it =
is connected
>> > > > > > > > to an M.2 connector), acquire the 'uart' pwrseq target fro=
m the
>> > > > > > > > connector's power sequencer and use it to control BT power=
 instead of
>> > > > > > > > the bt-enable GPIO.
>> > > > > > > >
>> > > > > > > > Also allocate bt_power unconditionally for all SOC types s=
ince the
>> > > > > > >
>> > > > > > > Can we just fold it into the main struct?
>> > > > > > >
>> > > > > > > > pwrseq path is independent of the SOC type switch.
>> > > > > > > >
>> > > > > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com=
>
>> > > > > > > > ---
>> > > > > > > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++=
---------------------
>> > > > > > > >  1 file changed, 43 insertions(+), 38 deletions(-)
>> > > > > > > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(stru=
ct qca_power *qca,
>> > > > > > > >     return 0;
>> > > > > > > >  }
>> > > > > > > >
>> > > > > > > > +/*
>> > > > > > > > + * Acquire the M.2 connector power sequencer.
>> > > > > > > > + *
>> > > > > > > > + * An OF graph link on the serdev controller is only pres=
ent when the BT
>> > > > > > > > + * device is attached through an M.2 Key E connector. In =
that case the UART
>> > > > > > > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power se=
quencer instead of a
>> > > > > > > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq ta=
rget from it.
>> > > > > > > > + *
>> > > > > > > > + * Returns 0 if no M.2 connector is present (nothing to d=
o), a negative errno
>> > > > > > > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq po=
pulated.
>> > > > > > > > + */
>> > > > > > > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qc=
adev, bool *bt_en_available)
>> > > > > > > > +{
>> > > > > > > > +   struct serdev_device *serdev =3D qcadev->serdev_hu.ser=
dev;
>> > > > > > > > +   struct device *dev;
>> > > > > > > > +
>> > > > > > > > +   if (!of_graph_is_present(dev_of_node(&serdev->ctrl->de=
v)))
>> > > > > > > > +           return 0;
>> > > > > > > > +
>> > > > > > > > +   qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&serdev->=
ctrl->dev, "uart");
>> > > > > > > > +   if (IS_ERR(qcadev->bt_power->pwrseq))
>> > > > > > > > +           return PTR_ERR(qcadev->bt_power->pwrseq);
>> > > > > > > > +
>> > > > > > > > +   dev =3D pwrseq_to_device(qcadev->bt_power->pwrseq);
>> > > > > > > > +   *bt_en_available =3D device_property_present(dev, "w-d=
isable2-gpios");
>> > > > > > >
>> > > > > > > I think here you are looking into the exact details of the o=
ther of the
>> > > > > > > graph. There might be other devices on that side, while the =
code now
>> > > > > > > assumes M.2. Or, consider having an M.2 controller which han=
dles
>> > > > > > > W_DISABLE2# internally rather than through the GPIO.
>> > > > > > >
>> > > > > >
>> > > > > > This code only deals with M.2 connector in specific, so I'm no=
t sure why we need
>> > > > > > to worry about *other* kind of devices. Let's worry about them=
 when they show up
>> > > > > > (with graph interface ofc).
>> > > > >
>> > > > > I don't think we want to go through the drivers using M.2 connec=
tors in
>> > > > > such a case. In the end, the contract should be that there is a =
power
>> > > > > sequencer on the other side of the graph, but the specifics of t=
he
>> > > > > connector should be abstracted out. Do you know, if in the x86 w=
orld the
>> > > > > W_DISABLE2# is a GPIO or is controleed by the hub.
>> > > > >
>> > > >
>> > > > I tried to abstract out, but Bartosz didn't want pwrctrl APIs to d=
o that level
>> > > > of abstraction as pwrctrl APIs should be generic and should not be=
 bind to a
>> > > > specific connector and exposing its internals.
>> > > >
>> > > > That's why we ended up having pwrctrl core exposing the 'struct de=
v' using
>> > > > pwrseq_to_device() and letting the consumer extracting whatever in=
formation it
>> > > > needs.
>> > >
>> > > Do we have other ways to control M.2? For example on the x86 systems=
,
>> > > are those signals controlled via GPIOs (or GPIO-like registers) or a=
re
>> > > they controlled separately by something like M.2 controller? Or do y=
ou
>> > > have an idea about other non-x86 systems?
>> > >
>> >
>> > Thre is no OS-visible M.2 power control in ACPI systems. ACPI defines =
PRx
>> > objects to control power to the PCI devices based on the D-state and t=
he OS just
>> > evaluates the _ON/_OFF methods of the respective objects.
>> >
>> > So this API is not going to be useful on non-DT systems where the BT_E=
N GPIO
>> > handling is abstracted away. And also on platforms where BT_EN is not =
controlled
>> > by GPIOs. But I haven't seen DT platforms handling BT_EN (or W_DISABLE=
2#)
>> > signal in a non-GPIO way.
>> >
>> > I too prefer an API to query whether the connector supports BT_EN or n=
ot, but
>> > I'm not sure how to come up with a generic pwrseq API which also satis=
fies the
>> > requirement. If you have any suggestions, please let me know!
>> >
>> > FWIW, I tried adding pwrseq_is_fixed() API [1] earlier, which was turn=
ed down by
>> > Bartosz.
>>
>> So, I'll submit a new version incorporating Dmitry's request to fold
>> bt_power into the main structure.
>> However, what should we do about the powerseq point? Should we keep it a=
s it is?
>>
>
> @Bartosz: Thoughts?
>

As discussed in private with Dmitry: I think we should go with a new interf=
ace:

  bool pwrseq_always_on(struct pwrseq_desc *pwrseq);

with the following semantics: if it returns true, the user can call
pwrseq_power_on() but a subsequent pwrseq_power_off() will fail with -ENOTS=
UPP.
That should give the bluetooth driver the knowledge it needs without breaki=
ng
the logical API boundaries while also being more precise than pwrseq_is_fix=
ed().

Does it make sense?

Bartosz

