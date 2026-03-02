Return-Path: <linux-arm-msm+bounces-94877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGSHDjFupWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:02:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C34101D7194
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF606300E58F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E068832AABD;
	Mon,  2 Mar 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWbYPDe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516735F5FD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449325; cv=none; b=P+BokzuQ4pIFqgZBCoHHvsMTX8r6v+DHpn94aEFWrsYroSEdlyo/Tfini7KPm07//B0EgM6eYGA3jLHMkO8f/oGPZiqbU+kfVdC8vuC1GIga4agOWVfzMVOT6Q7yflqV+Pgp5PH/QL/2vfuLwDkwmKVw3JOJFurb3e9lSv9Ibok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449325; c=relaxed/simple;
	bh=FPUUwSTSnHifTg1q09fFBxiGrVRvJtWxYMGk/Hf/oPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmBzPUXgEUVHURdw7DdKKXyOfPSVtQliyEFEfj8asiRhZDtxFScWKgILDzycW7PzUuWDqx3P0i3yOKzlSN8HehQGSVZz/gllfPwODh0OCS/xHmsVRWT5gBID13v+bzDJnTbYr8xy15m1vp0yDBN78Y3E1cA5xilzvk1BCuEJW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWbYPDe4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b7c2788dso459339f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449322; x=1773054122; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=MWbYPDe44zed2KsOUc14yPFYKO+jR1+crKAFR8UALOdYgwe6zoku1UeiELG5KFjJdT
         Z282fgcSIpF0sQSeERm28ejPpbskvZa398Yg2UiSpx2/RC7juHgpDGMjtvTa0Vc0FA9b
         46PvUbwynXZump/jv4UoWLj4K4kXg9K29BluNYLnh7un1liI3grXJDye6PxieBHBLBXl
         ipl2PYX8tQGayaIIpWFrwUqwqay4Rm7K5PsvOdjj9kEMVN+H2IYYMgLJirw5nIQfVKow
         +RsSDNN56oa+ozQd1RHvYBxRt7sUjPfLNeHxZUqmbGeeMXcbFGFqeigVwSnMxRxMEKa2
         Nb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449322; x=1773054122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=DbZkx1Iz8FFHb6hTJ36lWEu2BoQIU2XVmesfhlzpFFoH7B9CXLBuuh5AzYjhDGqRBd
         XwJTSiceFAZ+VGpOnTmTfyp+3ohPDPLizdZkustQ6SFbq6mYw43Ysj9lD1Ke6eF7deFN
         2ie+vhhapI2aQ/feJJOdzgujCLsE3LyOUX2T+Yk68A9hd6pnnyFs98hAUFfF+0pmK2YW
         q4MG0NPm04xynWbWNkTDLHmbVfiC8U+ZxMOQ6mq6Kvg01rB+/ILwu1Vo7sNeW0Vo2zrl
         ruOIoGT5dV+4lnD7vtRp+hHsaPSqmwIPYis+hVML/i9q5pNkmVE6HklWZVjoDqecZ8JL
         jmdA==
X-Forwarded-Encrypted: i=1; AJvYcCVq0MK+pN6PGSmYa4m53qo/O+GhgL2rFs7tx7VI5wcAb9tmBNUIR9IbH8qoZDvipTpDwkdgCcmCyZpcqo2K@vger.kernel.org
X-Gm-Message-State: AOJu0YxSil8z+ejYlnPm4WjHVySI2/7rDoC6A8sCwLlMHdVmo0pB57ne
	+/wRM0ojKZAwJeGlCicqdo1ZezqrwJ3NstNjdx+F88IVCkMHb5qJGN63
X-Gm-Gg: ATEYQzxhhsXLIbQK2DrB7kQbYm/mcUNm2tLOKKHLTE5vfOoRNxmo+dtHfZ0XAggamN0
	ajToudjufRXA/Njv3C2Q6/lq4oEi/gSzRFNg/u/aOuJCRtZsifo4ALluwkTTFv6a0oylFru4sTA
	fsaCTbCJ7Eaea9iWzsk/qTMqtn0kSJ44A6g+/iM/WevFA0lO4nG1VaR2VN1fkQ0y+X8t/PEa0rY
	Vrg4RGVyeI+LORMtEYehGz7RUW66ION3KnESL3pJsUFzRihNH9BXYsQKgbToRzqd+2rwZzNlxga
	izSAxBnS4oETwxu2cdivqjycv86TteHaIYtohfaFA5WVidOgJ5ncm7McKJjdoLdlJRGi2WCYyQD
	uQIrUBCB7j/QR3NOSiRu1lmQIWzJqs5pmTfepaG/AMaBNJCfRyp11RYkD0nMv1HRvUBg8Vnorj+
	Y8P/tZUYncu20Fs7ctY6Gbs7dUKras/oc=
X-Received: by 2002:a05:6000:2483:b0:439:ac53:a94d with SMTP id ffacd0b85a97d-439ac53aa50mr10380328f8f.29.1772449321007;
        Mon, 02 Mar 2026 03:02:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm26841661f8f.7.2026.03.02.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:02:00 -0800 (PST)
Message-ID: <de48f967a50b8f780dbadc562833ae6626be5268.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Danilo Krummrich <dakr@kernel.org>, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Mon, 02 Mar 2026 11:02:44 +0000
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
References: <20260302002729.19438-1-dakr@kernel.org>
	 <20260302002729.19438-3-dakr@kernel.org>
	 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94877-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[roeck-us.net,kernel.org,linuxfoundation.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C34101D7194
X-Rspamd-Action: no action

On Sun, 2026-03-01 at 16:51 -0800, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
> > Do not use driver_override as IRQ name, as it is not guaranteed to poin=
t
> > to a valid string; use dev_name() instead.
> >=20
> > Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > =C2=A0 drivers/hwmon/axi-fan-control.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-co=
ntrol.c
> > index b7bb325c3ad9..ec4bbb104449 100644
> > --- a/drivers/hwmon/axi-fan-control.c
> > +++ b/drivers/hwmon/axi-fan-control.c
> > @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_de=
vice *pdev)
> > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NU=
LL,
> > =C2=A0=C2=A0					axi_fan_control_irq_handler,
> > =C2=A0=C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -					pdev->driver_override, ctl);
> > +					dev_name(&pdev->dev), ctl);
>=20
> The devm_request_threaded_irq() API documentation says:
>=20
> @devname:=C2=A0=C2=A0=C2=A0 An ascii name for the claiming device, dev_na=
me(dev) if NULL
>=20
> So NULL should be sufficient.
>=20
> Nuno, was there a special reason to use driver_override ?
>=20
>=20

Not really. That driver was one of my first patches so most likely it was j=
ust some
copy pasting. NULL should be fine.

- Nuno S=C3=A1

