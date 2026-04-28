Return-Path: <linux-arm-msm+bounces-105006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAcqIxa88GmFXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D2486563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F035301EDA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DCE3F54CE;
	Tue, 28 Apr 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MaQ93KGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F231FDA61;
	Tue, 28 Apr 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384075; cv=none; b=VPzf+ScLIOXGp0iHnGmjrK+QzTeO/9DiX0wMZB1mi0PHPlDhSwUEMP7YiG7bqCc9d5NurFB1kN6MQKkZku0qXSVsgef/dqrbSR3In/dsHRsXFWuhGZfyNWZ9bSeSLi2DFi+uyV03Rb6+nDNRELXTqtn7+eEvMI+io2sqBgHbmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384075; c=relaxed/simple;
	bh=OeJCRKNITJXUXpnUeSXEqc/lLoySdj2P6GUYnAAEL+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=W9atPEGNZIiOhw1VDpoDAq0WVwQ/rfQUhTkDXA1DkpsnAGGiGM2IaM2Ol8lNAXGofmOr0tP0UUKuPzth7NPZz3b71d/yQQs49ANm8hwnglBfnHc0euu3gSq5S7VPtQnMB1YOIceFOon4E1UAFUj52gLOcQhlXGqbQwRJnHpu3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MaQ93KGS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 936F14E42B56;
	Tue, 28 Apr 2026 13:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 625B2601D0;
	Tue, 28 Apr 2026 13:47:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACB6C10728C08;
	Tue, 28 Apr 2026 15:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777384070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hH5f9pRWZjIKa7upLj6O1FMpKJtS+Zt3OkL4sYouao=;
	b=MaQ93KGSH+Hk8abA6MbWHlda1aC2uqGX/4nTQBQA//FFqhT5t6lxHiZAYhudeVv24bAcD5
	+G529G8DcjVQCvZ6Re1R8BX0iwjTpBm/zn6H4ufwwZu9XJZWY0o9lZJBOYADSOOX2eMsNg
	O35B1w4pJ1d2XnuAlOPaVvL7Ur0NlIhodLk8jTJOzrDDLV4OH5CeU3InEdnDiS8kQ0S98H
	0FCfEbRGWyo/1C5x3+YL2T4Z+YsB9IcvDrtlnIgcKhUhqsmOxqvTD+NWyf5q8B76mXUEN5
	5oNzad17rT+3SHX03p3YtPB5IYEtUY88RnIRW9qAggvL74Ih7I506P8YyCBR1w==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:47:41 +0200
Message-Id: <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
Subject: Re: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
To: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "John Stultz" <jstultz@google.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com> <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com> <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com> <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com> <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 521D2486563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105006-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.990];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,bootlin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hello,

On Tue Apr 28, 2026 at 3:31 PM CEST, Biju Das wrote:
>> >> > @@ -1251,10 +1251,9 @@ static int adv7511_probe(struct i2c_client
>> >> > *i2c)
>> >> >
>> >> >  	memset(&link_config, 0, sizeof(link_config));
>> >> >
>> >> > -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
>> >> > -					  &adv7511->next_bridge);
>> >> > -	if (ret && ret !=3D -ENODEV)
>> >> > -		return ret;
>> >> > +	adv7511->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev=
->of_node, 1, -1);
>> >> > +	if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511->bridg=
e.next_bridge) !=3D -ENODEV)
>> >> > +		return PTR_ERR(adv7511->bridge.next_bridge);
>> >>
>> >> Does it crash, if the error is  -EPROBE_DEFER?
>> >
>> > I see a crash with patch [1], which is fixed by avoiding the direct as=
signment.
>>
>> Ah, dammit! Good catch, thanks for the quick testing and follow-up!
>>
>> Indeed this driver assumes next_bridge is either NULL or a valid pointer=
, but due to the 'if(IS_ERR()
>> && some_other_condition)' now it can also be -ENODEV (not -EPROBE_DEFER,=
 but that's irrelevant).
>>
>> This affects the msm and zynqmp_dp patches equally.
>>
>> I'm sending a v3 soon with these fixed. I'm just not sure which approach=
 to use to fix (same for all
>> the 3 patches). Alternatives are:
>>
>>  1. -ENODEV is accepted, set next_bridge to NULL when it happens:
>>
>>       -       if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511=
->bridge.next_bridge) !=3D -
>> ENODEV)
>>       -               return PTR_ERR(adv7511->bridge.next_bridge);
>>       +       if (IS_ERR(adv7511->bridge.next_bridge)) {
>>       +               if (PTR_ERR(adv7511->bridge.next_bridge) =3D=3D -E=
NODEV)
>>       +                       adv7511->bridge.next_bridge =3D NULL;
>>       +               else
>>       +                       return PTR_ERR(adv7511->bridge.next_bridge=
);
>
> The point is you cannot return PTR_ERR as it will lead to crash, if it is
> direct assignment.

It would definitely crash when the next_bridge is dereferenced (which
happens in adv7511_bridge_attach()) but I don't see how it can crash
here. Here it _can_ be assigned -ENODEV, but it would be immediately be
cleared to NULL, or to enother error, but we'd immediately return. And in
case of return, when next_bridge is cleared by __drm_bridge_free ->
drm_bridge_put, the error value would be ignored thanks to patch 1.

>
>    if (IS_ERR(adv7511->bridge.next_bridge)) {
> 	int err =3D PTR_ERR(adv7511->bridge.next_bridge);
> 	adv7511->bridge.next_bridge =3D NULL;
> 	return err;
>   }

Is this if() condition wrong? The driver needs to accept the -ENODEV return
value, the next_bridge is conditional in the curent driver code.

>
> Cheers,
> Biju
>
>>  2. let nexxt_bridge hold -ENODEV but ignore it when it is used (only in
>>     the attach op, for all 3 drivers):
>>
>>       -       if (adv->bridge.next_bridge) {
>>       +       if (!IS_ERR_OR_NULL(adv->bridge.next_bridge)) {
>>
>> While the latter approach involves less code, it might let errors sneak =
in in case new usages of
>> next_bridge are added with just a NULL check.
>>
>> Opinions about the two?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

