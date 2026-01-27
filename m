Return-Path: <linux-arm-msm+bounces-90680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCsINoCCeGmqqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:16:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48E9194C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7B23010163
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5D9332902;
	Tue, 27 Jan 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ARDcksx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157F3328E1;
	Tue, 27 Jan 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505100; cv=none; b=ZkFKd8cdHXfWcIPYDL5xrYT5Af2b8R612PNijiZmxo3wYmD2H3QoSQ5f5FrnMrZZwAGrOTNjPjHWW0scV7CBzfVwioEMvE3qZ1VQwI6DK6vrOXdlBE7RBE/JZSokmzr8mF2a7vyEXnbKkDEzhIuQMH6QgogVI1yPHFjxZ1gM2ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505100; c=relaxed/simple;
	bh=gM+1iC7DAP5QcS7AwwhoBt69LVeinsvEtmy7rzi4jv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=d0sPZdRe7bIB87Yi8WxrpSFZlfUR3sFCBSaB3chO60NrBffHm8J0DdExIKiljps1wL1TjYrhycwMn6taTm7RtqhTVe7Afwdhr2cZsuMtEN5LhWAsD02Xvo33CPX1pZZmhn5UbtvkHV7x+LGgonbeNfNHsQXE8QhDppR9DjPvkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ARDcksx7; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d;
	Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769505090;
	bh=o3uYq+bvJ8IHWH6k2uOihpa6CKY0ItOKPXbc7h/Pz2g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ARDcksx7il7K+UJhL3qOUbJrzsCnWlDnWMyBKycHeHqFCGmyemgus6UZuDTSdf+bf
	 sio+/WnMIcFH7Q4EvSeQJPsiIhXonBavFn5UetIdLJJLlTvKiDVGsd1YhwF3xweOeh
	 qSQI7psb+mdS7QYSc32Br4lqAOSfjZL27eQp/MjQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d~Oi4EUDQLX2294122941eucas1p1s;
	Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260127091128eusmtip12e05e437c03450178ad4e2539faa417e~Oi4CsG4iT0357803578eusmtip1P;
	Tue, 27 Jan 2026 09:11:28 +0000 (GMT)
Message-ID: <002704a5-9ccb-4abb-beaf-5a448c17ea39@samsung.com>
Date: Tue, 27 Jan 2026 10:11:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
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
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
	<CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
	<36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
	<jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[39];
	TAGGED_FROM(0.00)[bounces-90680-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2C48E9194C
X-Rspamd-Action: no action

On 26.01.2026 20:00, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
>> On 26.01.2026 18:42, Marek Szyprowski wrote:
>>> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>>>> Implement the clear_infoframe callback, disabling corresponding
>>>> InfoFrame type.
>>>>
>>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> This patch landed recently in linux-next as commit 3a4ceb89a972
>>> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that
>>> it causes the following regression on Qualcomm RB5 board:
>> Please ignore my report, it looks that automated bisecting got a bit
>> confused.
> See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t
>
> I'm going to push it to drm-misc-next-fixes.

Thanks for pointing that patch! It fixed my issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


