Return-Path: <linux-arm-msm+bounces-103052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDgENZ/j3WnDkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:50:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9883F6411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E6730784B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E389525DB1C;
	Tue, 14 Apr 2026 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f+/FdJ3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021F30E0FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149109; cv=none; b=gLV24fhwu6wfa0y93aT9GUFxNN/G1/JNu3OZG3DaI8HE0qpRsB8seLZjl4TBCFQ96GEupIdOXxWMZU/KwL6p+OZutltlsjHj03NPz9k9h5MlhUfwMsrquCrG8WiodPsSLNA3AnV1xeKXI3klN/5IbN+hDzPmoB9IjyuegIUofnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149109; c=relaxed/simple;
	bh=6qInlkwnyS6fNhWVhfDVcEDSa2xpB71k7Qjspi3WNFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RIwYAPpnes1u+mQM8jA4Aq0GW3v1MJDVCVgKqBohdT7mphnZVMUrKCvdCB5pfgRiLDhfVYwMzTx9Ttrk/VcnHLQCi0uqNMPUeBJDl+NsynNYGmDc/h1SlABZgacQzOFCW/p4QS7e0aJAUWYEj88Ob4rCw5IQnF+rrbl6jsmFmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f+/FdJ3g; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C84901A329A;
	Tue, 14 Apr 2026 06:45:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 898E15FFBB;
	Tue, 14 Apr 2026 06:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 745AD10450B1D;
	Tue, 14 Apr 2026 08:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776149100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vj+EQ05FPKBTp1OV46fO5Oedc52PA+zs2hyhcrWvq4Y=;
	b=f+/FdJ3gFgZicxmZg+3TKsSO2HjLdvbBRDofdKToAwxC33qBRQ8P/OdBuele8fRfK4UKQl
	oPu7bXBT3oYRrsNRnKLHjc2lXCMhrD7vseb+uh3e3JcLdfl4qE2Xo/XaNcgiLOHQJ+7Fdl
	PpSRU3G8FBDAsHB50K9vRe3YC0ujuVMYP+5Jb11M33LXw2l/RQBGw/4FFnsbXrbW0723RW
	3+Xo5cxuTUThO8Lh9gqqILwQnGxkCHNX/rsWMcbo1SENnBzQon0lO11SMv0jGNUOuRF5gi
	iZdcqnP0mxCLizVi57yo8M+WvjPhNrEofWGsMNJwur3uxKctJE62SaR9CHo8fQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 08:44:47 +0200
Message-Id: <DHSOAYIAQWWN.2WEM50YWAZZSB@bootlin.com>
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Tian Tao" <tiantao6@hisilicon.com>, "Xinwei Kong"
 <kong.kongxinwei@hisilicon.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Yongqin Liu" <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com> <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com> <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk> <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com> <omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq>
In-Reply-To: <omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq>
X-Last-TLS-Session-Version: TLSv1.3
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
	TAGGED_FROM(0.00)[bounces-103052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D9883F6411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Mon Apr 13, 2026 at 7:56 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 07:07:14PM +0200, Luca Ceresoli wrote:
>> Hi Dmitry, Maxime,
>>
>> thanks Dmitry for the quick feedback!
>>
>> On Mon Apr 13, 2026 at 4:58 PM CEST, Dmitry Baryshkov wrote:
>>
>> >> --- a/drivers/gpu/drm/drm_bridge.c
>> >> +++ b/drivers/gpu/drm/drm_bridge.c
>> >> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct d=
evice_node *np)
>> >>  	return bridge;
>> >>  }
>> >>  EXPORT_SYMBOL(of_drm_find_bridge);
>> >> +
>> >> +/**
>> >> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a =
port/endpoint
>> >> + * @np: device tree node containing output ports
>> >> + * @port: port in the device tree node, or -1 for the first port fou=
nd
>> >> + * @endpoint: endpoint in the device tree node, or -1 for the first =
endpoint found
>> >> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
>> >> + *
>> >> + * Given a DT node's port and endpoint number, find the connected no=
de and
>> >> + * return the associated drm_bridge device.
>> >> + *
>> >> + * The refcount of the returned bridge is incremented. Use drm_bridg=
e_put()
>> >> + * when done with it.
>> >> + *
>> >> + * Returns zero (and sets *bridge to a valid bridge pointer) if succ=
essful,
>> >> + * or one of the standard error codes (and the value in *bridge is
>> >> + * unspecified) if it fails.
>> >
>> > Can we return drm_bridge or error cookie instead?
>>
>> (while replying I realized there is a design flaw in my implementation, =
but
>> see below)
>>
>> I initially thought I'd do it, but I don't like returning an error cooki=
e
>> for functions getting a bridge pointer. The main reason is that with bri=
dge
>> refcounting the __free() cleanup actions are handy in a lot of places, s=
o we
>> are introdugin a lot of code like:
>>
>>   struct drm_bridge *foo __free(drm_bridge_put) =3D some_func(...);
>>
>> Where some_func can be one of of_drm_find_bridge(),
>> drm_bridge_get_next_bridge(), drm_bridge_chain_get_{first,last}_bridge()
>> etc.
>
> This is fine even with the functions returning a cookie: the free
> function can explicitly check and return early if IS_ERR() pointer is
> passed to it.
>
>>
>> Such code is very handy exactly because these functions return either a
>> valid pointer or NULL, and thus the cleanup actions always does the righ=
t
>> thing. If an error cookie were returned, the caller would have to be ver=
y
>> careful in inhibiting the cleanup action by clearing the pointer before
>> returning. This originate for example this discussion: [0]
>>
>> [0] https://lore.kernel.org/lkml/4cd29943-a8d0-4706-b0c5-01d6b33863e4@bo=
otlin.com/
>>
>> So I think never having a negative error value in the bridge pointer is
>> useful to prevent bugs slipping in drivers. For this we should take one =
of
>> these two opposite approaches:
>>
>>  1. don't return a bridge pointer which can be an ERR_PTR; return an int
>>     with the error code and take a **drm_bridge and:
>>       - on success, set the valid pointer in *bridge
>>       - on failure, set *bridge =3D NULL (*)
>>  2. like the above-mentioned functions (of_drm_find_bridge(),
>>     drm_bridge_get_next_bridge() etc) return a drm_bridge pointer which =
is
>>     either a valid pointer or NULL
>
> 3. Return pointer or cookie, ignore cookie in the release function.

Ah, that's a good idea indeed!

It had been proposed recently by Laurent too, but in that case I didn't
take the suggestion because it was referring to a panel API which IIUC is
meant to be reworked anyway [0]. I must have archived the idea too much and
didn't think about using it now! :)

So yes, being of_drm_get_bridge_by_endpoint() a new API that is meant to
stay, I think it's worth doing.

Sadly, I guess that means I have to drop all the R-by you already gave to
various patches in the series.

[0] https://lore.kernel.org/all/DH624WYWKT14.5TSCJXZPVN0T@bootlin.com/

>> >> + */
>> >> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
>> >> +				  int port, int endpoint,
>> >> +				  struct drm_bridge **bridge)
>> >
>> > Nit: can it be drm_of_get_bridge_by_endpoint?
>>
>> Argh, this convention is changing periodically it seems! :-)
>>
>> I previous discussions I was asked to do either drm_of_ [1] of of_drm_ [=
2],
>> but since the latter was the last one requested I sticked on it.
>>
>> @Maxime, Dmitry, I'm OK with either, just let me know if I need to chang=
e.
>
> I missed Maxime's response, sorry. I'm fine with the suggested
> convention of using the first argument.

OK, no problem. Based on current discussion, in v2 the new API will be:

/**
 * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/en=
dpoint
 * @np: device tree node containing output ports
 * @port: port in the device tree node, or -1 for the first port found
 * @endpoint: endpoint in the device tree node, or -1 for the first endpoin=
t found
 *
 * Given a DT node's port and endpoint number, find the connected node and
 * return the associated drm_bridge device.
 *
 * The refcount of the returned bridge is incremented. Use drm_bridge_put()
 * when done with it.
 *
 * Returns a pointer to the connected drm_bridge, or a negative error on fa=
ilure
 */
struct drm_bridge *int of_drm_get_bridge_by_endpoint(const struct device_no=
de *np,
                                                     int port, int endpoint=
);

It would be nice to agree on the API before v2, to avoid the need to rework
many patches and drop any review tags multiple times.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

