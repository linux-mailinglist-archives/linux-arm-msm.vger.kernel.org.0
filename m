Return-Path: <linux-arm-msm+bounces-97846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL9wF6qnt2k2UAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:48:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B495C2953EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435DD300B9F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AD77263B;
	Mon, 16 Mar 2026 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="N2PI9mya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802AE5CDF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643687; cv=none; b=JSq3BHRsJl5mWr6JnOjZDyNoCUeHHKFSvQ6NjjQ43ZfZK23TbONVyxYmD1kLIUQ2FX16qie55298CKZTLXKuNIGyqNgwULgyKJNpcyTrrdhLIca88toXVRuY3ZUOJ7hP/2wk5KEjYTWbZpVMyWBYWo95UVoSJYE9nS++Bdqt8PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643687; c=relaxed/simple;
	bh=DvcWku+iWuEBTEQLmL0mPUKhyzSKNUO8/1ZTbR7l0Bw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z82YcWNZOXfhSkxNVFQSe0hapLZ0VA6rVGqm+/dSOPXV2moNXTkaq29keunhI5EAuKmxUlnDVjydxWuhRjt30pBkFBzD13eL0aWH2pYwqsrxTo7v2Sq/JDV/p3GArNx6JvBzn/Ltc+I7chQ2EAwtAATQsYmMd2Z6pKCgXrqJy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=N2PI9mya; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773643677; x=1773902877;
	bh=8ICJw08UJIz0AP6P0cn3L4DZUL5fjtlF4dxKFsE46as=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N2PI9myakKW6GEoOdz3lHidvmY9XMdFsqujfxRNBFbMJ6/EYfKdE4JyJIW7+raV/O
	 LZc5sgNX62j17yMz4qkLuePZQn3CRHbtSlpU7yBHMdOhSb9U769EkoDlPDGBLzqtOR
	 dnMBD9idzRqwneC4l3SHO1B/uwLJW04KTSihi6J2c9Lsi1ZlPdweyAg05I+K3LBaat
	 9NRd6G5HMqJ8U6ycat/5BoEF/6c1x2WqL9jp4v5N2yHTfmP9QsdUyBeTS96GXLmnb4
	 NwgbBBMnYi0I2b2zNC+9F6lGs4hheVnX5rxNzaRLqWykOd0J0AiBySWpUoDnuO6P4l
	 8IDtDAlc4Na4w==
Date: Mon, 16 Mar 2026 06:47:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <2Iorhp1aLx-JWsIeTVctlNqbF5BWAbE7_0Ki5GL2nNNp0XViFuNBRJV60_KF0Zh8I8AamFvv7hFWZXajcVrqLlLFnfOI_csagePlYvLYAZo=@protonmail.com>
In-Reply-To: <2d0afdab-78b7-4e60-b132-98cfcbbbb5af@kernel.org>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com> <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org> <7Ft_cDw10-3MmNTrKncMut5g08sodd9CL7r7AGXAtPPqZpXtHEgmqm05WhEpYMZzFEs4B0KWz-LU27Z0_YDnc44nXhdUrUt5X2dWK7D6pYM=@protonmail.com> <db04882b-7f30-464c-91a6-578302aef4ff@kernel.org> <Nz_hTfDbWqQk8-FcCknxZKO8dIhCAGueG89SRe2LkTG1VK4KjoH-UZH6bsOvqEySwNRjJtsEUL7vxxIXOWyyzLOtM9YLZaCuhPfxNz0mVyk=@protonmail.com> <4cfc7b40-f172-4eae-8f19-4a3eb858075e@kernel.org> <q2whOVhy_Cqm5m8toyiZ0PQQThv6LLoo8a5ialb_td0o5yM1FRLIMRZh2FKRiwSuwPfmfibU6Z6_jz6kJFJGlFfu3V-ELMteHVDM7zpnSBI=@protonmail.com> <2d0afdab-78b7-4e60-b132-98cfcbbbb5af@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: d6ec91e3516ec63a908e0b35f46289badd97cb96
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
	TAGGED_FROM(0.00)[bounces-97846-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:mid]
X-Rspamd-Queue-Id: B495C2953EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 13th, 2026 at 09:32, Krzysztof Kozlowski <krzk@kernel.org>=
 wrote:

> On 13/03/2026 09:26, cristian_ci wrote:
> >
> > On Tuesday, March 10th, 2026 at 21:06, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >
> >> On 10/03/2026 18:48, cristian_ci wrote:
> >>> On Monday, March 9th, 2026 at 16:08, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>>
> >>>> On 09/03/2026 15:52, cristian_ci wrote:
> >>>>> On Sunday, March 8th, 2026 at 17:13, Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>>
> >>>>>>> +  vsp-supply:
> >>>>>>> +    description: positive voltage supply for analog circuits
> >>>>>>
> >>>>>> Both are odd. Datasheet says vci, vddi, vddam and optional avdd, a=
vee.
> >>>>>>
> >>>>>> There is no VSN and VSP. Otherwise please point the page in datash=
eet or
> >>>>>> some schematics.
> >>>>>>
> >>>>>> Best regards,
> >>>>>> Krzysztof
> >>>>>>
> >>>>>
> >>>>> I'm not sure about that. Writing panel dt-bindings has been based p=
retty mostly on vendor devicetree - which also describes somehow the panel =
and makes that working with the final product released to the market - so I=
've to necessarily consider that.
> >>>>> Then, I could agree that vendor devicetree might be not compliant w=
ith upstream rules and could possibly make mistakes with describing the har=
dware, so I'd like to find a way to describe that in a more proper way, acc=
ording to upstream rules.
> >>>>>
> >>>>> That said, vendor devicetree describes lists four power supplies fo=
r  DSI: 'vdd', 'vddio', 'lab' and 'ibb' (which have the following property =
names, respectively, in qcom,mdss_dsi_ctrl node: 'vdd-supply', 'vddio-suppl=
y', 'lab-supply' and 'ibb-supply'.
> >>>>> Two of these are related to ds/controller (apparently, 'vddio' shou=
ld match VDDI power supply in NT35532 datasheet.
> >>>>>
> >>>>> The remaining two supplies are related to panel ('lab' and 'ibb'). =
These ones are two 'external ' regulators ('external' from NT35532 perspect=
ive), which provide power supply to display, located in the qcom PMIC (in t=
his case, that should be PMI8950). WRT to power supply names described in t=
he bindings ('vsp-supply' and 'vsn-supply') are the same as 'lab-supply' an=
d 'ibb-supply', just named differently in the vendor devicetrees.
> >>>>>
> >>>>> Usage of 'vsp'/'vsn' naming for power supply properties is grounded=
 on they commonly being used at upstream (different panel bindings make use=
 of these properties), on one side, and also described on schematics of dev=
ices with the same hardware configuration (LCD_VSN and LCD_VSP), on the oth=
er.
> >>>>>
> >>>>> In the meantime, I've found out schematics for 'xiaomi-mido' (anoth=
er MSM8953 device) - a variant of this device is shipped with a panel also =
using NT35532 IC (just like my device) - and LCD_VSN/LCD_VSP are clearly sh=
own there too.
> >>>>>
> >>>>> I couldn't find much more information about the display on my devic=
e and the only resources available about that are those listed above, as of=
 today. In light of my reply, I ask if it is still necessary to describe, i=
n the bindings, power supply properties properties not used currently in th=
e board DTS file.
> >>>>
> >>>> Please wrap your answers so this will be possible to parse.
> >>>>
> >>>> You write bindings matching the hardware and for the hardware, not f=
or
> >>>> the downstream code. You cannot add supplies which do not exist
> >>>> regardless what some vendor wrote somewhere
> >>>
> >>> Vendor has also described the hardware by storing information (by inc=
luding info
> >>> about panel too) directly inside the device itself (/sys/firmware/fdt=
).
> >>
> >> Vendor does not care about rules of DT thus puts there completely fake
> >> information just to make their drivers working
> >> .
> >
> > I'm not sure what that statement is based on in the specific case of
>=20
> It's based on years of looking at vendor code.
>=20
> > the panel I'm actually testing. A set of clues (some of which were also=
 mentioned
> > in my first reply some days ago) point out that rimob's panel is really=
 supplied by
> > two regulators part of PMIC [1]. Not only for this reason, I do not hav=
e
> > enough solid reasons, after all, to consider vendor data about the pane=
l mounted in
> > this device (rimob) as not decently reliable, so I cannot ignore them, =
at least.
>=20
> And I did not disagree that you need regulators and that vendor
> correctly wired two of them.
>=20
> The comments are about naming!
>=20
> I discussed of using argument of incomplete or not fully correct vendor
> code when the true hardware description is available. If the vendor
> calls them in vendor DTS "yellow-pony-supply" you are going to use that
> argument to write bindings? And then argue that "not sure what that
> statement is based on"?
>=20
> It's obvious - vendor code is crap. There are no VSN and VSP inputs. We
> already confirmed that.
>=20
> You claim that vendor called like that thus you can use them as well is
> simply not correct approach.

Ok but I don't know if I can submit a v2 series including my new bindings=
=20
changes (along with changes for other patches too) or I've to stick with=20
v1 here, by showing my proposed fix for power supply properties, in order=
=20
to address review concerns about bindings, first.
=20
> Best regards,
> Krzysztof
> 

