Return-Path: <linux-arm-msm+bounces-102983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eASPJoso3WmVaQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:31:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E83903F182A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BF89301BA4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D273336881;
	Mon, 13 Apr 2026 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FAthUWkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8F33372A;
	Mon, 13 Apr 2026 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100054; cv=none; b=Fe+wrh86UVYWkjLRvmSoTCC+IkJdUsnoilX8dhW5f+tSaAxsPCKwiK89UUXnqM2riP0IfuN3OpsHOdxf2EIsas9bjjNPuXkX5gYWyzkBA6Ztt9HtGFl/4Ti4hFkIMvMnrJcNUa96PhW1ibZonvrb5mOE5szvKV1u0M9PU7I2Xm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100054; c=relaxed/simple;
	bh=rlb5S3mMaK2+1Ay5EqCwqsExOH6fH2bLpQMJiOHyyCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Z/wjfoaYPm9jrcarw3PUikIacsjetKpVJ12PNCWMgud8CGgKvB0M4zNMmdOGoy0AnparBrpbttZ6H9qFz3s/F+bYUzAUwQHXQxyn1Xb+Bg3cPa2B9WnjQKjajJSeECV/Ag7z0r9aZMFLJCmNMf+rH0pxjkfzkXP9wKqovd8oKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FAthUWkY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9DA9C5B1AB;
	Mon, 13 Apr 2026 17:08:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E42B45FFB9;
	Mon, 13 Apr 2026 17:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D876A10450150;
	Mon, 13 Apr 2026 19:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776100046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7WhJV/dSWPhYZ6I8oCEn+1gY0fZt2y2fO4rItoVzHSg=;
	b=FAthUWkYP3onPAjkaVdhEkowM64WlLaovRGOEKVVYVlDIIxl1jy0QIhBPcrZAkGVX1XGB3
	68NsMnuFgEKyarOAkggZ9Q/mVJFT/0grRcj2UEIlJqw+b4/maFxBlEqOGBmsN83WXQx3sQ
	O/Wj97KDGpbnaLFBUBNUXU4Z/ewKqcYE2iDllMv0neZ3/YBd/UjuCgceNNDBbpTfsDg00b
	fvk52HkNhzPYI/ns2RoNU7jsja2/gO+/7butSZ244ROXKIeKkn3pFd++cEYgNsyFOD7XIr
	8VClfbu9wRVqChpcY6pZrGScJsYc8QIwKnocm2Im6J+MFhNg6YskhjYaGYjsCg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 19:07:14 +0200
Message-Id: <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
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
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com> <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com> <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
In-Reply-To: <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E83903F182A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry, Maxime,

thanks Dmitry for the quick feedback!

On Mon Apr 13, 2026 at 4:58 PM CEST, Dmitry Baryshkov wrote:

>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct devi=
ce_node *np)
>>  	return bridge;
>>  }
>>  EXPORT_SYMBOL(of_drm_find_bridge);
>> +
>> +/**
>> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a por=
t/endpoint
>> + * @np: device tree node containing output ports
>> + * @port: port in the device tree node, or -1 for the first port found
>> + * @endpoint: endpoint in the device tree node, or -1 for the first end=
point found
>> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
>> + *
>> + * Given a DT node's port and endpoint number, find the connected node =
and
>> + * return the associated drm_bridge device.
>> + *
>> + * The refcount of the returned bridge is incremented. Use drm_bridge_p=
ut()
>> + * when done with it.
>> + *
>> + * Returns zero (and sets *bridge to a valid bridge pointer) if success=
ful,
>> + * or one of the standard error codes (and the value in *bridge is
>> + * unspecified) if it fails.
>
> Can we return drm_bridge or error cookie instead?

(while replying I realized there is a design flaw in my implementation, but
see below)

I initially thought I'd do it, but I don't like returning an error cookie
for functions getting a bridge pointer. The main reason is that with bridge
refcounting the __free() cleanup actions are handy in a lot of places, so w=
e
are introdugin a lot of code like:

  struct drm_bridge *foo __free(drm_bridge_put) =3D some_func(...);

Where some_func can be one of of_drm_find_bridge(),
drm_bridge_get_next_bridge(), drm_bridge_chain_get_{first,last}_bridge()
etc.

Such code is very handy exactly because these functions return either a
valid pointer or NULL, and thus the cleanup actions always does the right
thing. If an error cookie were returned, the caller would have to be very
careful in inhibiting the cleanup action by clearing the pointer before
returning. This originate for example this discussion: [0]

[0] https://lore.kernel.org/lkml/4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootl=
in.com/

So I think never having a negative error value in the bridge pointer is
useful to prevent bugs slipping in drivers. For this we should take one of
these two opposite approaches:

 1. don't return a bridge pointer which can be an ERR_PTR; return an int
    with the error code and take a **drm_bridge and:
      - on success, set the valid pointer in *bridge
      - on failure, set *bridge =3D NULL (*)
 2. like the above-mentioned functions (of_drm_find_bridge(),
    drm_bridge_get_next_bridge() etc) return a drm_bridge pointer which is
    either a valid pointer or NULL

(*) I didn't do it in this patch, that's a design flaw, I'll fix in case
    approach 1 is taken

Clearly option 2 is the simplest to use, but it loses information about
which error happened.

What do you think about these options?

>> + */
>> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
>> +				  int port, int endpoint,
>> +				  struct drm_bridge **bridge)
>
> Nit: can it be drm_of_get_bridge_by_endpoint?

Argh, this convention is changing periodically it seems! :-)

I previous discussions I was asked to do either drm_of_ [1] of of_drm_ [2],
but since the latter was the last one requested I sticked on it.

@Maxime, Dmitry, I'm OK with either, just let me know if I need to change.

[1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/
    -> search "called drm_of_find_bridge"
[2] https://lore.kernel.org/all/DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com/
    -> search "What about"

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

