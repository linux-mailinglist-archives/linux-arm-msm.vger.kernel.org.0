Return-Path: <linux-arm-msm+bounces-7384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72782F234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 17:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B435F285EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 16:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C871C69A;
	Tue, 16 Jan 2024 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpFhh3Ej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDE1C68D;
	Tue, 16 Jan 2024 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705421671; x=1736957671;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Laa0CQd0yJ+fDuLvFZPVswEPeD7Y0wSXSidO7YjTej4=;
  b=MpFhh3EjpF6CUWhUua/FlBXzmjWuo4PcmbmPRtf7J6rnXV+a5dSBqmRM
   jPR5y5Y1/C7k3M89QGdPJjG04Nmp5QcoSjmJpXzq+p8nKw88+bweV+/2Q
   5QTA++/yB1MVdT7sLPzaSMSEbewjLYhuvbuJAXXrTfneI0sm2I9NHO9LK
   XNA4xFIwbL5IzOltjokZjFZNe90CptlXwNsHNTwjIOZBGUDCjTgehHz3j
   5LGTw7ydLSNB2lnPxXWnNqSo2yuj/9rd4dpY2Uy3eSqREhNoNVlYpCFef
   6w3DvCnbc3Sl0lwS3jjsg6jsfjBaLgtocew4PTIjn5JqP6TDFwiLgOvru
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466284394"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="466284394"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787497846"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="787497846"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost) ([10.252.39.52])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:14:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Sarha, Jyri" <jyri.sarha@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "quic_abhinavk@quicinc.com"
 <quic_abhinavk@quicinc.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "mripard@kernel.org" <mripard@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
Subject: Re: [3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
In-Reply-To: <4eeb74d942acf24e468036e0732e5e32c6907f6f.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104201632.1100753-3-jani.nikula@intel.com>
 <4eeb74d942acf24e468036e0732e5e32c6907f6f.camel@intel.com>
Date: Tue, 16 Jan 2024 18:14:18 +0200
Message-ID: <87v87tqmqt.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 12 Jan 2024, "Sarha, Jyri" <jyri.sarha@intel.com> wrote:
> Reviewed-by: <jyri.sarha@linux.intel.com>
>
> Thanks,
> The including of drm_edid.h in hdmi-codec.h is a relic from my pre
> upstreaming version of hdmi-codec. I don't think it was ever needed
> in any upsteam version.

Thanks for the reviews and acks, pushed to drm-misc-next, even if I
didn't get an ack from Jaroslav or Takashi. Seems rather benign anyway.

BR,
Jani.


-- 
Jani Nikula, Intel

