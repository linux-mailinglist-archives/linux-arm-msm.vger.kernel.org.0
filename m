Return-Path: <linux-arm-msm+bounces-103054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIeHEpnm3WnDkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF863F658A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60E6E301FA45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFFB2DA762;
	Tue, 14 Apr 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OJBuMBRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEC2BD11
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150166; cv=none; b=ROzswtnHDKHlECx7rFbvYUmTghJDTPmaFTw3w78IDKQ4CVgSCqq3BezAinJRhFboadj3QQ4CF3owpg/Y6g1j5I47/vyqPuca6pRp1+qHsWK7YmQ9VogJ9TDdCTh6ek+fRgyiKmfgY2cfNW/keFF3O+f4oH/PDaKWLgZHeamuuf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150166; c=relaxed/simple;
	bh=GSwJySJHo0hT7GXeWrDOalz8cnz5bMLyfqqv3BHlXRA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=ewaJYcdJZUseZbabLTRPOPhqyBgLy9cqaB4xr3hqGi6JCLDDYErA3WyoVxtg7T8xf/x3zp6Gu2tfDuWFWGdCeMLGi5YyFchh2OqcEBMlqB11757ZW1qAhXDkq0cStNvCraLchTKJ4Sv/iSSzxJJCw+lHsKIB9geyQIB71FU08ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OJBuMBRn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D47BC5B1BB;
	Tue, 14 Apr 2026 07:03:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EA1C5FFBB;
	Tue, 14 Apr 2026 07:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE66810450D08;
	Tue, 14 Apr 2026 09:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776150160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GSwJySJHo0hT7GXeWrDOalz8cnz5bMLyfqqv3BHlXRA=;
	b=OJBuMBRnZ+1k0pvNy34xrHqO2sDtPpDWaR5tU5nqeGGgWSkYmHpD2OCmU8elLppdM+FZfO
	w0DduviNhyxdv6HA5bPmhN6QWm7zZhJe9bpszUAgTALiVlrDx7Z/J1cBi/t/Ry5rdFzOqu
	R9JonwE28Dtat/FKH00kCLyUE0whYkGlR+uKNLDuDgfj/Rdw8vBC2f0BPneCgtCaLa/GIJ
	jH1rCkKR5yfbF2aexL9UkLhqJVKUEXAtibTr52l0hPNZ6RGKDm20chWzXLhfzHC4ky6OIq
	KWfO9iSdVGivMNMZCB0IM5Bz+oH6rKh94YLpmIIoLEF+6QQz3VK4UTlBsapH1A==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 09:02:27 +0200
Message-Id: <DHSOOH7FU7Y4.1R63I92H08W86@bootlin.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/10] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
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
X-Mailer: aerc 0.20.1
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com> <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com> <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
In-Reply-To: <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
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
	TAGGED_FROM(0.00)[bounces-103054-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 9FF863F658A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Dmitry, Maxime,

On Mon Apr 13, 2026 at 8:04 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:42PM +0200, Luca Ceresoli wrote:
>> Up to now drm_of_find_panel_or_bridge() can be called with a bridge poin=
ter
>> only, a panel pointer only, or both a bridge and a panel pointers. The
>> logic to handle all the three cases is somewhat complex to read however.
>>
>> Now all bridge-only callers have been converted to
>> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
>> refcounting. So forbid new bridge-only users by mandating a non-NULL pan=
el
>> pointer in the docs and in the sanity checks along with a warning.
>
> Are there remaining users which still use either the bridge or the
> panel? Would it be possible / better to drop the two-arg version?

Yes. I counted ~20 panel+bridge and 4 panel-only callers with this series
applied, and on top of those there are devm_drm_of_get_bridge() and
drmm_of_get_bridge() which to me are the real issue because they make it
impossible to correctly handle bridge lifetime.

We discussed this with both you and Maxime a while back. AFAIK Maxime has a
plan to make every panel automatically instantiate a panel_bridge. I think
that's the only reasonable approach to get rid of
drm_of_find_panel_or_bridge() + *_of_get_bridge() and make bridge lifetime
easier and safe.

@Maxime, do you have updates on that idea?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

