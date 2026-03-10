Return-Path: <linux-arm-msm+bounces-96745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPNaLPlZsGmMiQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:50:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC93255E56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6278D30541DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9DD3D170A;
	Tue, 10 Mar 2026 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZRK1wjIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8639DBF7;
	Tue, 10 Mar 2026 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164903; cv=none; b=cgmt0TYPtMyTlDiEXhMJJizeMt5pdk92tzz+f8jXkcSrtwMK0OxJuLraJAtr5tR6KUsofmjkY9cdu2x94zdFicmJ/7xi7QeztxO7X/UvxP4tE5gKVuSu+uxKhNsGQsuOjxwK45S3lwnzy5XXcjqclpkMP6nOqjRqSBwcZBa8VF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164903; c=relaxed/simple;
	bh=Rd82VMvssCgqufFd8/eaqmc54Ncv9DNjiJoXAlj0srE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nm6J5QgQxITP8qlErlMxlJZjeyHyRqwjOgSx7P7zMo3A7nN7qe6gNXeXXczTC6U6+EVWq4gHhdmyLRcXU7gogThRw10+wleA/b4CrJ3dAK0oaFSZ9LdSLe7TCl489URyC3y6zglXpya0UWK+yNhlNJJFqP/dQ71eVspADAVgJRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZRK1wjIl; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773164893; x=1773424093;
	bh=OkWCVZlxqftLu2aBpMJ8TERkvPlB5Fhg+4q1RHor8Us=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZRK1wjIlW2tdy2KhNvkVHOw2UmPWIcnGeKQL09/FwyMRm/LgqsW6AM55vQh6kg4oi
	 OR/x6ckDEVUWLARgsMMEkIRk3UkmoApC34a+g7jzyrJbHUuULSYA4TZXyXE1xRywh+
	 IcxwWAfTGqkK8n5/CfZwUam6vnF6xhr+wbioQGiQhEyvYdgcP+vrCd96Zgyu5YB8zw
	 bs5i3lhZNDr08Pduvg07ZNxeYpKBerzMKcq+Rq9xmJHXYVYrgoYuseBBE2lTLIeYc2
	 YYdl/j1VgsMLREmBspXkQhAWHtBzyumiD/g89OMqmPvJ+coLgblXJG2MzTZl8AxlML
	 LlbML5zAhb9QA==
Date: Tue, 10 Mar 2026 17:48:08 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <Nz_hTfDbWqQk8-FcCknxZKO8dIhCAGueG89SRe2LkTG1VK4KjoH-UZH6bsOvqEySwNRjJtsEUL7vxxIXOWyyzLOtM9YLZaCuhPfxNz0mVyk=@protonmail.com>
In-Reply-To: <db04882b-7f30-464c-91a6-578302aef4ff@kernel.org>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com> <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org> <7Ft_cDw10-3MmNTrKncMut5g08sodd9CL7r7AGXAtPPqZpXtHEgmqm05WhEpYMZzFEs4B0KWz-LU27Z0_YDnc44nXhdUrUt5X2dWK7D6pYM=@protonmail.com> <db04882b-7f30-464c-91a6-578302aef4ff@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: ab6af6b5969c34bbccb471ccdb9316c79e71b9a3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5FC93255E56
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96745-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:dkim,protonmail.com:mid]
X-Rspamd-Action: no action





Cristian

Sent with Proton Mail secure email.

On Monday, March 9th, 2026 at 16:08, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:

> On 09/03/2026 15:52, cristian_ci wrote:
> > On Sunday, March 8th, 2026 at 17:13, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> >>> +  vsp-supply:
> >>> +    description: positive voltage supply for analog circuits
> >>
> >> Both are odd. Datasheet says vci, vddi, vddam and optional avdd, avee.
> >>
> >> There is no VSN and VSP. Otherwise please point the page in datasheet =
or
> >> some schematics.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > I'm not sure about that. Writing panel dt-bindings has been based prett=
y mostly on vendor devicetree - which also describes somehow the panel and =
makes that working with the final product released to the market - so I've =
to necessarily consider that.
> > Then, I could agree that vendor devicetree might be not compliant with =
upstream rules and could possibly make mistakes with describing the hardwar=
e, so I'd like to find a way to describe that in a more proper way, accordi=
ng to upstream rules.
> >
> > That said, vendor devicetree describes lists four power supplies for  D=
SI: 'vdd', 'vddio', 'lab' and 'ibb' (which have the following property name=
s, respectively, in qcom,mdss_dsi_ctrl node: 'vdd-supply', 'vddio-supply', =
'lab-supply' and 'ibb-supply'.
> > Two of these are related to ds/controller (apparently, 'vddio' should m=
atch VDDI power supply in NT35532 datasheet.
> >
> > The remaining two supplies are related to panel ('lab' and 'ibb'). Thes=
e ones are two 'external ' regulators ('external' from NT35532 perspective)=
, which provide power supply to display, located in the qcom PMIC (in this =
case, that should be PMI8950). WRT to power supply names described in the b=
indings ('vsp-supply' and 'vsn-supply') are the same as 'lab-supply' and 'i=
bb-supply', just named differently in the vendor devicetrees.
> >
> > Usage of 'vsp'/'vsn' naming for power supply properties is grounded on =
they commonly being used at upstream (different panel bindings make use of =
these properties), on one side, and also described on schematics of devices=
 with the same hardware configuration (LCD_VSN and LCD_VSP), on the other.
> >
> > In the meantime, I've found out schematics for 'xiaomi-mido' (another M=
SM8953 device) - a variant of this device is shipped with a panel also usin=
g NT35532 IC (just like my device) - and LCD_VSN/LCD_VSP are clearly shown =
there too.
> >
> > I couldn't find much more information about the display on my device an=
d the only resources available about that are those listed above, as of tod=
ay. In light of my reply, I ask if it is still necessary to describe, in th=
e bindings, power supply properties properties not used currently in the bo=
ard DTS file.
>=20
> Please wrap your answers so this will be possible to parse.
>=20
> You write bindings matching the hardware and for the hardware, not for
> the downstream code. You cannot add supplies which do not exist
> regardless what some vendor wrote somewhere=20

Vendor has also described the hardware by storing information (by including=
 info=20
about panel too) directly inside the device itself (/sys/firmware/fdt).=20
Though vendor devicetree could possibly contain mistakes, I guess I've to t=
rust vendor=20
devicetree (also for the reasons explained in my last reply).

> and yes, you must describe
> all known supplies for this device, especially that datasheet is
> available publicly.

Based on what you said, the following questions have raised:

- have properties (mentioned by you) be defined=20
(apart 'vddi', which most likely is actually 'vddio-supply',=20
already defined within mdss_dsi0 node) outside of 'panel' node?
(and related to dsi/controller rather than panel, instead)

- have those properties (mentioned by you) set as 'optional'=20
in the bindings, rather than set as 'required'?
(since panel works without most of them defined in the=20
board DTS file)

> Best regards,
> Krzysztof
> 

