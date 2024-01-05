Return-Path: <linux-arm-msm+bounces-6503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460C825173
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 11:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68CD61C22C96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8947824B2A;
	Fri,  5 Jan 2024 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUXUZvNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731382510C;
	Fri,  5 Jan 2024 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704449166; x=1735985166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jhXQ7p50nP1PTuXTz7afcg2shFt2E2ZgLk+f2nyafso=;
  b=LUXUZvNG3Py4TDhA2fAgqmHJeNE9M0EbveKC3LH71jmSjU+edy78sLyA
   GVzU9IODYnGUWq7iCplFasWW4gcRwQU0LUtdLFuQbcxxHNZvEbge28NDi
   Kv2S7XBEntKhu3W0sqWIyChmf6uw8bWuPRME9SRhzsFW8Ry8wH4+1GeUy
   txpxWAdY74dWUTbfTVUCbbnWHZX7yDscotu5E++76kqll+ulthgRzLjdA
   z5U0hwsHd6ibcWF75+EKgBcOq0/58ibUUgyjwA2q30VzSilNKvwbLHvJX
   eLIFsMoaOp+SDdc0eqstFEjC+I1haChPJi/zYsCewmcMjZTJGmEpVO76I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4245580"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4245580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 02:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846536093"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="846536093"
Received: from ftrahe-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.36.116])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 02:05:59 -0800
Date: Fri, 5 Jan 2024 11:05:55 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-sound@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <ZZfUg6CTnpFPrDhu@ashyti-mobl2.lan>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <20240104201632.1100753-3-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>

Hi Jani,

On Thu, Jan 04, 2024 at 10:16:32PM +0200, Jani Nikula wrote:
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.
> 
> There are some files that get drm/drm_edid.h by proxy; include it where
> needed.
> 
> v2-v4: Fix build (kernel test robot <lkp@intel.com>)
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

