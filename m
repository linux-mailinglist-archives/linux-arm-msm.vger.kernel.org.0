Return-Path: <linux-arm-msm+bounces-97360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFvOARjLs2n2awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92527FAAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24B0F30763C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A3A369982;
	Fri, 13 Mar 2026 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="oLAPx9XY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2A381AF0;
	Fri, 13 Mar 2026 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390427; cv=none; b=uoGM2DmZ+ZxaJ4JxWlRbbDj1oLqZEO/tqwlo4W+ZpYSERIBXsjmHhuxQGCw2PZScApKMyUo/eNUhkCd+8aDnN4c3xbjRu1dTwZi7AncNhf/WOOg0xzgEFkgYwOdHrQ5b0JmJSf93Q6POdjxJJ8NKPbzgFv43iwL8JXVbTvIYoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390427; c=relaxed/simple;
	bh=lGmhNWf8lc0y0hLbewJyY24fjQgHxjpUa/7pIk4Cs4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiAeogtsB2Ii190GJOHyav3RNdkeluPR3iKfDK1bYGHcfqqdi6zF63hVwQaNU7fjpnaEZDXN4x4ENRIsNYB05xyBS+tx9gvef+t9Q+e8x+k2Au0rBDxeY0Fg5FSMGDbZRLO6dSwIqn52HJTuOVH8u/KstsQwyQi5B3b8O8A702Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=oLAPx9XY; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773390414; x=1773649614;
	bh=WI62muTFleHgNKaWmy90pI2nh+IKGaTr9yd4IcPV+bo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oLAPx9XYrxiEKOMzH8C3oagGE0WBkrnAQ/e/apXDT6vQejsPYOMCBrqqvMpH2R/G+
	 Yjtevy5d9Wf26HnQyLPgRTpGNd/gxDQeoNoVtfon1zf+Bs0FqsR9c6Jgf0I3D7/vBn
	 lFl48ODMFwtnI9QUC8ItQYNkoewCMm4qPxtl1mDER1ZDGY/9VWmofwxvrsX6xjYZwd
	 4Hi98Jo3UVBgvlUz8W2X71tm16jShlqdIUQQqCWQjh/bqPYV74mKvJfEvupV1a7JNu
	 tKRMTFW8WElcFGQ8oMhxo7R9zBglrSpiDnlwyPRcY0hiU8asjoJZF/s8Dp5RCRysJx
	 1Mwv8MtkA9PPg==
Date: Fri, 13 Mar 2026 08:26:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <q2whOVhy_Cqm5m8toyiZ0PQQThv6LLoo8a5ialb_td0o5yM1FRLIMRZh2FKRiwSuwPfmfibU6Z6_jz6kJFJGlFfu3V-ELMteHVDM7zpnSBI=@protonmail.com>
In-Reply-To: <4cfc7b40-f172-4eae-8f19-4a3eb858075e@kernel.org>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com> <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org> <7Ft_cDw10-3MmNTrKncMut5g08sodd9CL7r7AGXAtPPqZpXtHEgmqm05WhEpYMZzFEs4B0KWz-LU27Z0_YDnc44nXhdUrUt5X2dWK7D6pYM=@protonmail.com> <db04882b-7f30-464c-91a6-578302aef4ff@kernel.org> <Nz_hTfDbWqQk8-FcCknxZKO8dIhCAGueG89SRe2LkTG1VK4KjoH-UZH6bsOvqEySwNRjJtsEUL7vxxIXOWyyzLOtM9YLZaCuhPfxNz0mVyk=@protonmail.com> <4cfc7b40-f172-4eae-8f19-4a3eb858075e@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 4d3460b21805d978d72b01eb8bebe614b65b1a77
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97360-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:dkim,protonmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A92527FAAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tuesday, March 10th, 2026 at 21:06, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> On 10/03/2026 18:48, cristian_ci wrote:
> > On Monday, March 9th, 2026 at 16:08, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> >> On 09/03/2026 15:52, cristian_ci wrote:
> >>> On Sunday, March 8th, 2026 at 17:13, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>>
> >>>>> +  vsp-supply:
> >>>>> +    description: positive voltage supply for analog circuits
> >>>>
> >>>> Both are odd. Datasheet says vci, vddi, vddam and optional avdd, ave=
e.
> >>>>
> >>>> There is no VSN and VSP. Otherwise please point the page in datashee=
t or
> >>>> some schematics.
> >>>>
> >>>> Best regards,
> >>>> Krzysztof
> >>>>
> >>>
> >>> I'm not sure about that. Writing panel dt-bindings has been based pre=
tty mostly on vendor devicetree - which also describes somehow the panel an=
d makes that working with the final product released to the market - so I'v=
e to necessarily consider that.
> >>> Then, I could agree that vendor devicetree might be not compliant wit=
h upstream rules and could possibly make mistakes with describing the hardw=
are, so I'd like to find a way to describe that in a more proper way, accor=
ding to upstream rules.
> >>>
> >>> That said, vendor devicetree describes lists four power supplies for =
 DSI: 'vdd', 'vddio', 'lab' and 'ibb' (which have the following property na=
mes, respectively, in qcom,mdss_dsi_ctrl node: 'vdd-supply', 'vddio-supply'=
, 'lab-supply' and 'ibb-supply'.
> >>> Two of these are related to ds/controller (apparently, 'vddio' should=
 match VDDI power supply in NT35532 datasheet.
> >>>
> >>> The remaining two supplies are related to panel ('lab' and 'ibb'). Th=
ese ones are two 'external ' regulators ('external' from NT35532 perspectiv=
e), which provide power supply to display, located in the qcom PMIC (in thi=
s case, that should be PMI8950). WRT to power supply names described in the=
 bindings ('vsp-supply' and 'vsn-supply') are the same as 'lab-supply' and =
'ibb-supply', just named differently in the vendor devicetrees.
> >>>
> >>> Usage of 'vsp'/'vsn' naming for power supply properties is grounded o=
n they commonly being used at upstream (different panel bindings make use o=
f these properties), on one side, and also described on schematics of devic=
es with the same hardware configuration (LCD_VSN and LCD_VSP), on the other=
.
> >>>
> >>> In the meantime, I've found out schematics for 'xiaomi-mido' (another=
 MSM8953 device) - a variant of this device is shipped with a panel also us=
ing NT35532 IC (just like my device) - and LCD_VSN/LCD_VSP are clearly show=
n there too.
> >>>
> >>> I couldn't find much more information about the display on my device =
and the only resources available about that are those listed above, as of t=
oday. In light of my reply, I ask if it is still necessary to describe, in =
the bindings, power supply properties properties not used currently in the =
board DTS file.
> >>
> >> Please wrap your answers so this will be possible to parse.
> >>
> >> You write bindings matching the hardware and for the hardware, not for
> >> the downstream code. You cannot add supplies which do not exist
> >> regardless what some vendor wrote somewhere
> >
> > Vendor has also described the hardware by storing information (by inclu=
ding info
> > about panel too) directly inside the device itself (/sys/firmware/fdt).
>=20
> Vendor does not care about rules of DT thus puts there completely fake
> information just to make their drivers working
> .

I'm not sure what that statement is based on in the specific case of
the panel I'm actually testing. A set of clues (some of which were also men=
tioned
in my first reply some days ago) point out that rimob's panel is really sup=
plied by
two regulators part of PMIC [1]. Not only for this reason, I do not have
enough solid reasons, after all, to consider vendor data about the panel mo=
unted in
this device (rimob) as not decently reliable, so I cannot ignore them, at l=
east.

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/regulator/qcom-labibb-regulator.yaml

> > Though vendor devicetree could possibly contain mistakes, I guess I've =
to trust vendor
> > devicetree (also for the reasons explained in my last reply).
>=20
> These are not vendor's mistakes. This is deliberate WRONG information.
>=20
> Sorry, I am not going to keep discussing each property based what vendor
> wrote.
>=20
> Open datasheet which I said is public.

(Note: datasheet is indeed easily available but not publicly, since
it has been released under NDA agreement)

> >
> >> and yes, you must describe
> >> all known supplies for this device, especially that datasheet is
> >> available publicly.
> >
> > Based on what you said, the following questions have raised:
> >
> > - have properties (mentioned by you) be defined
> > (apart 'vddi', which most likely is actually 'vddio-supply',
> > already defined within mdss_dsi0 node) outside of 'panel' node?
>=20
> You are mixing devices. We do not talk about vddio supply in dsi node.
> We talk about THIS device, so open this device datasheet and read it.

I've further inspected the datasheet again (but I've also looked at
other novatek based panels dt-bindings and datasheets, in order to
better figure out what is the actual relationship between the
first and the second ones, more in detail). BTW, I've started doing
tests, by making changes to nt35532 dt-bindings: I've replaced
vsp/vsn supplies with avdd/avee (which are not optional,
they are required to make my display unit to work, actually) mentioned
in the datasheet (but both they rely actually on labibb
regulators - indeed, vendor dt names them 'lab-supply' and
'ibb-supply') and added vci, vddi and vddam too (but I've not included
'vddam' supply into 'required' properties, since my panel unit doesn't
make use of that, in order to work and I can't omit that in panel
node (just like 'backlight' property). Though I've added vddi-supply
to panel dt-bindings and DTS board file, at the same time I've also
left vddio-supply in dsi node (even if they rely on same l6 regulator).
With such dt-bindings and DTS board configuration, the panel still
initializes and just works like before, and I've not noticed a
different behaviour, compared to when I was using the previous
board DTS (the one with vsn/vsp supplies).

> > (and related to dsi/controller rather than panel, instead)
> >
> > - have those properties (mentioned by you) set as 'optional'
> > in the bindings, rather than set as 'required'?
>=20
> Why? How device can work without power? Datasheet mentioned which
> supplies can be optional, e.g. grounded or wired to the same source of
> supply.

Actually, the device was not working without power: required power
supplies had been defined in the previous dt-bindings
(vsn/vsp supplies). My idea, about the fact that panel was working,
is that my unit needs positive and analog input analog power, which
labibb regulators satisfy. That said, I'm not still convinced that the
new power supplies properties (wich I've also tested on actual
hardware), based on nt35532 datasheet, are enough to satisfy
upstream rules about dt-bindings. Should I show my current changes
to dt-bindings?

> > (since panel works without most of them defined in the
> > board DTS file)
>=20
>=20
> Best regards,
> Krzysztof
> 

