Return-Path: <linux-arm-msm+bounces-105010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFNkJYTC8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27936486D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D565325CAEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD69E426EBF;
	Tue, 28 Apr 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1b2DowR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5DF3FFAC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384422; cv=none; b=lmvS2DWEUzUwokZvNPPXkPlajiBINGTx171jSNYE4UpWZyhUQdCVTocMl7U37FI4H0ShxNpCqSQd7XjJtKugFd96bDb3C1B9uJmKI4x8ovCxO2Ua0UGUNRF2MGpQuZWxeb2CPUwcrW1yeq7TzcJQAmG1AiR4t4qX+ku5WXyac+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384422; c=relaxed/simple;
	bh=P1TtYXgpOugxsrsi4TZ8sU0ijVvGzlNUg4vJzN9+UrU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Gg96BOe9bs7NkmpYQgPBJE9iaz7LTFzivzdNV60y0Pt6aHZgytG6W6kdLTkP/YsUTA5vJ9EgbYQJkYn5z4j+gTw1Ih7dtqTjhbkGooASI7r/AIlUX6o2Lik/KqtaESGZBIzdUfXhqIZYtNcXdLGnDc+i6q29/MZH1BEwqprZVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1b2DowR6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60D3EC5EF0B;
	Tue, 28 Apr 2026 13:54:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A090F601D0;
	Tue, 28 Apr 2026 13:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C28410728C3C;
	Tue, 28 Apr 2026 15:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777384416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mi11yIAKIeUtq1BstSRzJLBfPBpY7CpkArje5as7Flw=;
	b=1b2DowR6+l483OumXJsOi9RuRKuwGfgpP6qQ9aP93gJb5bkBB1iEofOoFTFpEBHvtAg1aC
	F52wa8jZJxXmACT+s6pZgeAvRJ3ASqE/KD7AyBIjIJKJncz0iR2cmdWCPHeW/68USn6Tu6
	iyEwwGmUJOHPiVWnygRdTuir3lf1vlWx0nqNbrv2gZtGZNu7A7tw4fj5HQo/8sVFRhXiFR
	0pzr9osvlwr7UXb5yPlWgWdIBvcNbZVrO96eayX7rpZGKYHCyZJeo1rXvCEvIFnkmV+bzo
	o4aGLUXTsuXGJIh395YwzezFbNnKhSwdfTwTjpt8VohTmRU5TFN0NRH3y39nwQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:53:27 +0200
Message-Id: <DI4U6SPMW5GG.34DH11UKWPUEX@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "John Stultz" <jstultz@google.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
To: "Gyeyoung Baek" <gye976@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com> <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
In-Reply-To: <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 27936486D4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105010-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.977];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,bootlin.com:dkim,bootlin.com:mid]

On Tue Apr 28, 2026 at 3:18 PM CEST, Gyeyoung Baek wrote:
>>
>> @@ -1058,7 +1057,11 @@ static int lt9611_parse_dt(struct device *dev,
>>
>>         lt9611->ac_mode =3D of_property_read_bool(dev->of_node, "lt,ac-m=
ode");
>>
>> -       return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &l=
t9611->next_bridge);
>> +       lt9611->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev=
->of_node, 2, -1);
>> +       if (IS_ERR(lt9611->bridge.next_bridge))
>> +               return PTR_ERR(lt9611->bridge.next_bridge);
>> +
>> +       return 0;
>>  }
>
> Hello Luca,
> Could you take a look at this alternative?
> ------
> struct drm_bridge *next_bridge =3D
>     of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
>
> if (IS_ERR(next_bridge))
>     return PTR_ERR(next_bridge);
>
> lt9611->bridge.next_bridge =3D next_bridge;
> return 0;
> ------
>
>  I think it reads a bit cleaner and avoids holding the ERR_PTR in the str=
uct.

Yes, but more verbose.

Based on this and the patch 8 fallback reported by Biju, I started
wondering whether the v1 version of this function, while being a bit ugly,
was leading to cleaner code... An example: [0].

Dmitry, your opinion?

[0] https://lore.kernel.org/all/20260413-drm-bridge-alloc-getput-panel_or_b=
ridge-v1-6-acd01cd79a1f@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

