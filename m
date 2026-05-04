Return-Path: <linux-arm-msm+bounces-105755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNhLOVWq+GnHxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:16:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A90D54BEF9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C65A930237D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 14:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2823D75D7;
	Mon,  4 May 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AFI5Mvlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF9377575;
	Mon,  4 May 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904029; cv=none; b=XFhGS/B0cDBUR+FoKMRVG8EAn3K+UnOYWO/ktnxIpCBewJ2bCNEF4PO09GTJPsrg9UuEZaEpYox+d5kLcIDopX9psEcvKFSCs/KBsCjhgE7RdoJ3CjKY+LAOXEsSavdWnSRFxJpK8rHVZEEbiNPO9Z54z5sU5liB0PsV4N3rxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904029; c=relaxed/simple;
	bh=XsNmFR8dV4OacjfIioHdUGNm4L3AowKlSDqo2yTRzw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jfvoSYq6qIzzta5UPoR74Wdqa4v+0X5Jj32yx4Jel6tAM1GOe5937dfJZiWJCqk1TPaXQz7zqDKax4EAb8ZuuREugKbCypvjGq6icqJQAdO6cTNPieQZPnuvY/82Zap8YefnwEgrWcWPJ2+LT04jc/ANfGWs6Jf0059iw27QxVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AFI5Mvlr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 94D59C5D72D;
	Mon,  4 May 2026 14:14:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21DC25FD5F;
	Mon,  4 May 2026 14:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCCB711AD27FB;
	Mon,  4 May 2026 16:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777904023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XsNmFR8dV4OacjfIioHdUGNm4L3AowKlSDqo2yTRzw8=;
	b=AFI5Mvlro/TMbUmDqfw6uuasM2l3dZYYZR9gYoQkon/fLCo3EvKUyNNFBC/QEdh3UsgPE0
	/7gYVYkc5TduLQZWOs7RLRZ8VBl/TUyIcFZNHzxezTrcn2J+YwTOpSLRnb/wM0M3ZcLrA9
	Lm2FueyC8nmzxUe1s1qWG5sbz1DvWaN/1LQ7cnLW6F7HbhXvVu6z9wO+ubYbEuQbNtRSvN
	LlAwzXp9TH/yhof4kNc4NJV2lcb8NApSHflSLMIdoi7+ItBAfw3SgF93mrkGrU99tsASNf
	dediVg4WLdgI85RyfhTmH6WWXJoKbLBbhcyb2krC+3W2W/beCnk+piqeWLU5YQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 16:13:32 +0200
Message-Id: <DI9YDFTUBA4R.3NBES5EAMOD03@bootlin.com>
Subject: Re: [PATCH v4 01/11] drm/bridge: drm_bridge_get/put(): ignore
 ERR_PTR
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
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com> <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com> <20260504135300.GE1344263@killaraus.ideasonboard.com>
In-Reply-To: <20260504135300.GE1344263@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: A90D54BEF9D
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
	TAGGED_FROM(0.00)[bounces-105755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,ideasonboard.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Laurent,

On Mon May 4, 2026 at 3:53 PM CEST, Laurent Pinchart wrote:
> On Mon, May 04, 2026 at 12:45:04PM +0200, Luca Ceresoli wrote:
>> Most functions returning a struct drm_bridge pointer currently return a
>> valid pointer or NULL, but this restricts their ability to return an err=
or
>> code describing the error kind.
>>
>> In preparation to have new APIs that can return a struct drm_bridge poin=
ter
>> holding an ERR_PTR (and for those which already do) make drm_bridge_get(=
)
>> and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
>> pointers.
>
> The change in drm_bridge_put() looks good to me. I'm less sure about
> drm_bridge_get(), is there a valid use case to call get() on a bridge
> that is not valid ? Doesn't it indicate a clear error in the caller ?

Good point. Indeed I don't have a valid use case in mind.

I guess I can drop the drm_bridge_get() and send v5. Should there be a
valid use case it will emerge at some point and this can be rediscussed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

