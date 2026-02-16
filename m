Return-Path: <linux-arm-msm+bounces-92911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMn+D9TpkmlSzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E789142251
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCCE8300C00A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9886428851C;
	Mon, 16 Feb 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zhan.science header.i=@zhan.science header.b="trbBbA1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF626FD93
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771235546; cv=none; b=JY362TvXuyhEY/pknbd6RjdT8/dACkatB3EiZRpLEsklLIt5OfVd6smVa2Yx49/EKY8DFCJuewcw1zwRzj0klVQqcoXK3JY460lm6bZJ92tBIXrjiJ4qoFYzw0512Eh23FIddP42tpkB1V9yBs40xhcR0h/zV4WU+0fNEFVNpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771235546; c=relaxed/simple;
	bh=G6nbphfXwsoEBrzIbMUIpeHtI7a7eUUnMp1Tn4BQvvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=NsuwLwnzTcfM9EdHv1A0JEHju1mjDmbg2w7SV1BmiBZ/Ae1WLgv1ZMgPU3fZzS6L/JBsMg6fv8XbcAuEnkJlbg+ZsZ4Ihb3TkSEVO08rCT85akR9+oauaOjn6YMhzGv+I04DXfbJzUD6UttCat6UHwKTx1rm1nJXCUl+e4qL53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zhan.science; spf=pass smtp.mailfrom=zhan.science; dkim=pass (2048-bit key) header.d=zhan.science header.i=@zhan.science header.b=trbBbA1Z; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zhan.science
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhan.science
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhan.science;
	s=key1; t=1771235533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUTuchl87bbjf0z6lqoJU4OxzcdpLm8oToWJMNMm/EQ=;
	b=trbBbA1ZK7USsGShnG+154Ny8pqqf4dJpNNMMVDLIkrgrsK+QM5DRsNbkj1qPNMl8AaS4c
	JHfN/8o+XGzTgt9t457Xm84bArZJ9zATm8htzJ3BZPUOI7ICgqNaZuLhhv0iHtCsTh6KRL
	MiBEkHNG+ILALQT+TFykXLqVGxTpqAxXs1pfwBK3ias1mAgavx1HQsS4cBbUdHngThFCSs
	ULt/ENYZ5wMzb0lxWOcmfZwqzpO/Ms+G0KxeW/X1Duh+V9ANcbJaPMdqIEu+HSxbMCiOGq
	q4+AjB8Xu/ID6iIVqqk5XUBLf7idqf4tZ6YwI198dkIAfy/2zad5DBKMM76WPQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 09:51:57 +0000
Message-Id: <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yifei Zhan" <yifei@zhan.science>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Richard Acayan"
 <mailingradian@gmail.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Sam Ravnborg" <sam@ravnborg.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-4-mailingradian@gmail.com>
 <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
In-Reply-To: <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[zhan.science,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zhan.science:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[zhan.science:+];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yifei@zhan.science,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zhan.science:mid,zhan.science:dkim,zhan.science:email]
X-Rspamd-Queue-Id: 9E789142251
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 6:07 PM UTC, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 09:32:57PM -0500, Richard Acayan wrote:
>> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
>> the aid of linux-mdss-dsi-panel-driver-generator.
>>=20
>> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-ge=
nerator
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++++++++++++
>>  3 files changed, 304 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

<--cut-->

>>=20
>> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually r=
eturns
>> +// correct values. If not, remove this function.
>
> Any chance of checking it?


I tested this with my Pixel3A XL with tianma panel, it worked correctly.
/sys/class/backlight/.../actual_brightness returns same value
as /sys/class/backlight/.../brightness and I'm able to change brightness
level.
                                                                           =
                                                                           =
                                                              =20
Tested-by: Yifei Zhan <yifei@zhan.science> =20
>

