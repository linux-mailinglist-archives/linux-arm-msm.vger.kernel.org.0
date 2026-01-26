Return-Path: <linux-arm-msm+bounces-90605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK5qBx+od2lrjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:45:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E21B8B9CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A6E3024100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60A434D3A5;
	Mon, 26 Jan 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EcUJtwIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D034D391;
	Mon, 26 Jan 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449500; cv=none; b=LXj41qcuvlvRZSH/P12G0kulb4EYrIo/DApS8xctTz2XluOf1kmmYTnhZ7AkMGymnWCt/XHafNWhDqhWYkZb08+554dQu5Co6+XkUESFug5r3dhcD28RYDNDUzrDVgsxi0I7ELHHL3I1+6szUPuYc+RYeibB7P4z5anezBCCJEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449500; c=relaxed/simple;
	bh=PEqYRvVN14GX0vOGPVhiyUMqxaF6YhgQfvJNl7p3p40=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=BAgZw4iNHhgdJgguJ1icZWEe0Uz+0lUKDurja+a5HlfHi7yIqvgDXUoqOmBLCU9cFPvg2L0cjT7rpPgXYYnBv7fALUKMtvSG007Zra8NXofo7IAirjnt6nd6OwbOm6JlYEXyv9cdUN3JTcUi/hfk0COdd3aptdMW6ZIqv+b8arM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EcUJtwIv; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769449495;
	bh=ViZnPApGmUm2J4gBM2q37ZW/xc0HmDYJ2pAdJ6BXznM=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=EcUJtwIvikdAG2aaXvnIrEnVxjxp6sqj+eN+ReWnmhAZcoZTykDAYnBGn45TjgV9j
	 6IydmTmfZcw7aIGKkxgoTwMd/FiRl51Qw8mUSbmfRj6dgT0++ll3wq8V+YBs81C+BN
	 XVtyFbTgY9a2qQn8fxHgi1EnWme/xadUYtn7+BUU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174455eucas1p1f219202580a1033d3e881adc4f37f206~OWPDiMXHA2201722017eucas1p1L;
	Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260126174453eusmtip1343282648a6e7de9c928b52e4daf95d0~OWPBrT1zi0390203902eusmtip1Q;
	Mon, 26 Jan 2026 17:44:53 +0000 (GMT)
Message-ID: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Date: Mon, 26 Jan 2026 18:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
	Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
In-Reply-To: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
	<CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-90605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,samsung.com:mid,samsung.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E21B8B9CD
X-Rspamd-Action: no action

On 26.01.2026 18:42, Marek Szyprowski wrote:
> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>> Implement the clear_infoframe callback, disabling corresponding
>> InfoFrame type.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> This patch landed recently in linux-next as commit 3a4ceb89a972 
> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> it causes the following regression on Qualcomm RB5 board:
>
Please ignore my report, it looks that automated bisecting got a bit 
confused.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


