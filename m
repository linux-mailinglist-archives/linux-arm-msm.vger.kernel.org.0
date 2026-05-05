Return-Path: <linux-arm-msm+bounces-105981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPA7JEb6+WmNFgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:10:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B144CF1D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BE1930CD006
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3C847F2D4;
	Tue,  5 May 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T6dtH4l3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B647DD78
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989951; cv=none; b=A38lBoAxd0UalS9nIcwmB8jmA7UoxtngqjhtKZVVyBci52AWOpRFmuNt+xiHH17Hk6K6extPDgY01658DdDl6xbwyR7/rxe207upxGRsYBPea2VMZKgpQgkRukWgw+qiuWU48fE9Fhi7sPM0TdfB/RLvGrZBtoNvNkE/JeI82x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989951; c=relaxed/simple;
	bh=SThgwMDVM7hb7YUZ3tVn0+AeugIocMDPKRaEPOuC5xo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=onuO4TJzh1vUbegK+wGr5gxmjApBltMY36/ZYQk5Qhum3KtfUCrSEx9325ac3yofEg9GSiA/ffmby85rHYFslTmactkzhr/x5nRbAHLhfbFrXO1kLz7MM30993aZO7zGRu19s+qGogJ8azpc0d0KMVGQ8Gx8KBWANaOM1nm9QHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T6dtH4l3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BF421A351C;
	Tue,  5 May 2026 14:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D186053C;
	Tue,  5 May 2026 14:05:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81E7D11AD01FF;
	Tue,  5 May 2026 16:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777989946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LiFhYTTWhPaYG7k6xQeGXacfbvfc085+WmffoobFaWY=;
	b=T6dtH4l3SQK8LakHyVwGl4F+Oc2UPGOw7DGU4SoB5JYhBmRNfbFaZbGwbMM8BVGf/cTSdJ
	TPs3f6k4Da6l+T2I7apfGrj8TAUNblc/HSE2nt4W2tCn5mZockxFpnIKvI+U/GhW4uflal
	p49Mwskl/NbrSvWh3ixnlOKcur52nwrXfjrso3lE6c7ZPjkR2GEJ/b50VGHZ0k0I5kHzz+
	NHCByjlmqwBVUGT4izIkL/1TYeGeEAEulBemXbys2xuEl4EnA9684gfH6Q5XI6W6dbqat2
	GawapjmBH1FYkduLf87eZDe5VdNf7gP607oQSn5RjGB7JB5GhNYnTdk2eamS+A==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 16:05:36 +0200
Message-Id: <DIASTWTYYQDQ.1R0JI8NB9I4KE@bootlin.com>
Subject: Re: [PATCH v4 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "John Stultz" <jstultz@google.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Michal Simek" <michal.simek@amd.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com> <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-10-b578c3daaf10@bootlin.com> <20260504152418.GC1455860@killaraus.ideasonboard.com>
In-Reply-To: <20260504152418.GC1455860@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: E0B144CF1D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,ideasonboard.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-105981-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,bootlin.com:dkim,bootlin.com:mid]

Hi Laurent,

On Mon May 4, 2026 at 5:24 PM CEST, Laurent Pinchart wrote:

[...]

>> @@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>>  	 * Acquire the next bridge in the chain. Ignore errors caused by port@=
5
>>  	 * not being connected for backward-compatibility with older DTs.
>>  	 */
>> -	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
>> -					  &dp->next_bridge);
>> -	if (ret < 0 && ret !=3D -ENODEV)
>> -		goto err_reset;
>> +	dp->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dp->dev->of_n=
ode, 5, 0);
>> +	if (IS_ERR(dp->bridge.next_bridge)) {
>> +		if (PTR_ERR(dp->bridge.next_bridge) =3D=3D -ENODEV) {
>> +			dp->bridge.next_bridge =3D NULL;
>> +		} else {
>> +			ret =3D PTR_ERR(dp->bridge.next_bridge);
>> +			goto err_reset;
>> +		}
>
> I would find
>
> 		if (PTR_ERR(dp->bridge.next_bridge) !=3D -ENODEV) {
> 			ret =3D PTR_ERR(dp->bridge.next_bridge);
> 			goto err_reset;
> 		}
>
> 		dp->bridge.next_bridge =3D NULL;
>
> easier to read. Up to you.

Makes sense, change queued up for v5.

Thanks for reviewing!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

