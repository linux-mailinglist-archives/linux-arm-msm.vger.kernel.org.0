Return-Path: <linux-arm-msm+bounces-89677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9FD3AA03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 354EE30A0BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF82364E9C;
	Mon, 19 Jan 2026 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MptvULVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139823659E1;
	Mon, 19 Jan 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828237; cv=none; b=qbd56uTLPAZTCkKr6eD6eYBb/QcvOYUIHfufcYhE3ImccmnGl5Iz+3ZDpeD8HzaHzfYxOgR19+sfJL2/mhcBXScOx2n33DYbj74PZmZ63bK4GQ5wJ7gruF+yMPv1pFeQ1gJi7cf8N3T8Zu1/WSm0EQ2ii7SLDNd3fDc1w1IkS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828237; c=relaxed/simple;
	bh=aUXeE8chL4wN6frCncEOZhkvGcfHvgnI/l4mL6mm1mU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=scTB52cNp4VAYUhBq5YMC7qGB4VqtuJYndnrfMIsdZFQgqR/TGue/0fEKlnASg2XUn0G+Ruo9WP8poBPNqmb8ib6oYCXi07yhYC3GQJLmNSyWB5VFbXbBmRZsoCl3NTkvteRjmegAAsQ3HOulPwyZc5EzPhg9h2gIl3BdEpJHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MptvULVR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768828236; x=1800364236;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aUXeE8chL4wN6frCncEOZhkvGcfHvgnI/l4mL6mm1mU=;
  b=MptvULVRH4PnG4Ri69lhDSoljS6ZpQE+q8RehI8qvCq/8wzNij+9SL3y
   VCdeeczxb/GA/fYyoJi4z76AuY35M5XsrC5zp/xGTyGKQ8wj1DNgIV4EY
   kxk8iEyM0BDtwIle7AMpdeA8E32NH8pl/SBKUPQcDGQ9RwxtvhpFsPk/4
   p0ACGHxZ5ljFSKgsy33EEE/6LLlyjZtBhbHpZOWa5iYcwbDF+18+cDHQo
   hGehFxFS6vuOJs7Ol8pzg3OKHjLHQrxwwqyAaa+ULRl6oul6wrCG/7odn
   QXoHmM7M5FHK/ch5sJ7fPSSgCe6QKy2omPAIN7NR75EzsutZkMw1/h3jr
   g==;
X-CSE-ConnectionGUID: JmbCpMsxRHuxHzuVA2LvHw==
X-CSE-MsgGUID: oAlkLxRXTHWMO2tgjWMhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="92707764"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="92707764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:10:35 -0800
X-CSE-ConnectionGUID: rMJSlhZAQa+O5hVQha3jIw==
X-CSE-MsgGUID: e/WXSfj9TQWN8Yd2qyFdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206123498"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:10:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jessica Zhang
 <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Neil Armstrong
 <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Sean Paul
 <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
In-Reply-To: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
 <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
Date: Mon, 19 Jan 2026 15:10:21 +0200
Message-ID: <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 19 Jan 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
>> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
>> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
>> > unsupported doesn't result in a commit error. Also check that HDR and
>> > Audio InfoFrames are not triggered if corresponding features are not
>> > enabled.
>> > 
>> > 
>> > [ ... ]
>> 
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Thanks for all the discussions and the reviews!

Your commit ca59e33f5a1f ("drm/atomic: add max_size check to
drm_property_replace_blob_from_id()") added a new parameter and this
commit 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
still uses the old number of parameters, breaking the build.

When applying patches, please make sure to build the code before
pushing.


Thanks,
Jani.


-- 
Jani Nikula, Intel

