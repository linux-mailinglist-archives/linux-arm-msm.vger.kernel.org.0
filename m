Return-Path: <linux-arm-msm+bounces-105759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEGOKoe2+Gn1zAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:08:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C004C06E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803F43002107
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 15:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187C03DF015;
	Mon,  4 May 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XkIKiM0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0833DF009;
	Mon,  4 May 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907030; cv=none; b=B1kDm1ystX92Dv0jlm9l5ImrZggr/DWzT88OE9yX/ys7SD9KOZeAabze/x6tWRoDqBGmAQho/0F34P0HVjsAjC+vLY6gCC98fUSYarm5Bdle0tRRtvotryGYa6EHJkxhhsoL4P20bcRJxTE+CwlaEA9M/jJEQ9JPE8Oggn62E0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907030; c=relaxed/simple;
	bh=xUVTNK9V9VBZk+F6OvH1sU2Qc63Gu0lATZ4zgEeWGXQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YK7vn1WmUucRXRQteLZo00AYGuyTCtFkosPoagkSpzQLN7GhwxnZjD49Aw3YBx6J8jO4jbBPHPrelkP2KaBGAhV8+31mDYH/7ByUnS7/GITXE+6aJpJRllZqHfzR4ODogXx3Vz6teeGSxLTeIabqgfLhTB+ZILybx265pE4y3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XkIKiM0a; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5406C5EF23;
	Mon,  4 May 2026 15:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 490865FD5F;
	Mon,  4 May 2026 15:03:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E428E11AD030A;
	Mon,  4 May 2026 17:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777907024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2UgC8WCIU3g3zHl7eHsXA9bSH7zl0jYSgtkDdHvTGK4=;
	b=XkIKiM0aiss5klmOs9rA4cy7qNODpkMXkOD6DEJTfXTUPx3dV8Kk7o77Qs4bVgp1OgUu9X
	WT2B/fTXaV0AT/4e1o5QS7JICDJ7KT87zdrVDfUDzm7PE0UtdaQvbzwQNSl/ReZRAiXtYp
	qzBEtJeWMGMEM3pgNG925NDcvtAfuXqy0ueg/0bfiWwU9z9kJHWZZcs4eBnpDyLyEidgV/
	fob3dCiVjpaSUy/s156XUWMyxekxnvAIc8u/VMtHJhq3dwOu8yZU8OWnE2Mf6/iBRB6Q3+
	1e6iOkVWoIbkDrLC3OXrqRxzK+VOCoG/72PRThDii1kNsZUUXebgh+RQIA4dWg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 17:03:34 +0200
Message-Id: <DI9ZFQUNMSBU.214AU8467OK76@bootlin.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: add
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
 <linux-arm-kernel@lists.infradead.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com> <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-2-b578c3daaf10@bootlin.com> <20260504145536.GA1455860@killaraus.ideasonboard.com>
In-Reply-To: <20260504145536.GA1455860@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: E9C004C06E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,ideasonboard.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,bootlin.com:mid,bootlin.com:email,bootlin.com:dkim,bootlin.com:url,qualcomm.com:email]

Hi Laurent,

On Mon May 4, 2026 at 4:55 PM CEST, Laurent Pinchart wrote:
> On Mon, May 04, 2026 at 12:45:05PM +0200, Luca Ceresoli wrote:
>> drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
>> into the @panel or the @bridge arguments, thus making a very partial usa=
ge
>> of this rather complex function.
>>
>> Besides, the bridge returned in @bridge is not refcounted, thus making t=
his
>> API unsafe when DRM bridge hotplug will be introduced.
>>
>> Solve both issues for the cases of calls to drm_of_find_panel_or_bridge(=
)
>> with a NULL @panel pointer by adding a new function that only looks for
>> bridges (and is thus much simpler) and increments the refcount of the
>> returned bridge.
>>
>> The new function is identical to drm_of_find_panel_or_bridge() except it=
:
>>
>>  - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead=
 of
>>    of_drm_find_bridge() internally to return a refcounted bridge
>>  - is simpler to use: just takes no @panel parameter, returns the pointe=
r
>>    in the return value instead of a double pointer argument
>>  - has a simpler implementation: it is equal to
>>    drm_of_find_panel_or_bridge() after removing the code that becomes de=
ad
>>    when @panel =3D=3D NULL
>>
>> Also add this function to drm_bridge.c and not drm_of.c because it retur=
ns
>> bridges only.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>> Changes in v4:
>> - update function declaration in non-OF case
>>
>> Changes in v2:
>> - return the bridge in the return value, not a double pointer
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 41 +++++++++++++++++++++++++++++++++++++=
++++
>>  include/drm/drm_bridge.h     |  7 +++++++
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 6fb71de6d22a..01f9e0426648 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1582,6 +1582,47 @@ struct drm_bridge *of_drm_find_bridge(struct devi=
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
>> + *
>> + * Given a DT node's port and endpoint number, find the connected node =
and
>> + * return the associated drm_bridge device.
>> + *
>> + * The refcount of the returned bridge is incremented. Use drm_bridge_p=
ut()
>> + * when done with it.
>> + *
>> + * Returns a pointer to the connected drm_bridge, or a negative error o=
n failure
>> + */
>> +struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_no=
de *np,
>> +						 int port, int endpoint)
>> +{
>> +	struct drm_bridge *bridge;
>> +
>> +	/*
>> +	 * of_graph_get_remote_node() produces a noisy error message if port
>> +	 * node isn't found and the absence of the port is a legit case here,
>> +	 * so at first we silently check whether graph presents in the
>
> s/graph presents/graph is present/

Oh, wow. I copied this comment from elsewhere, meaning the same typo is
there too. I'm taking a note to fix those too.

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

