Return-Path: <linux-arm-msm+bounces-31362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9864971F42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 604531F2398D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AA7157A61;
	Mon,  9 Sep 2024 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DBiSk+Uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6D15748B;
	Mon,  9 Sep 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899476; cv=none; b=AVIKdAvvTMeu6MeB2dqdJgtGVaC9niC652cXMe71Aq5xoTrkHPmPBrK9cIOArWPXWqDlpVI8031aUflFp36Y3+pd6rxQzIz3Dy+i3WF2c6P0jbX2Pa5vHdYjwcx+VJZe4ZrM2nsUuPurf601NPMpnMDDc6XHqoCmA9g9BQSiNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899476; c=relaxed/simple;
	bh=GUDL2TE371GbyE5n1pNlV2wQ1gYkMczH7tLNOGHFQIc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caFOf9pO4bkFlNNrW5vAvTbFvyOYcA67R3/ceS+VSG4BxaqKdBeGRA2pL4WuCdAxUAShqgfQDZoQSUY1uGRE5ONBM3lhOj963pKtLd+Od00FeKES9uy2aHun4l5sJwmCARkmQXInpmmVnni0PTg0SgyPIKSmDMXMAjiTXPxHDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DBiSk+Uo; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489ApF4e013877;
	Mon, 9 Sep 2024 11:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6U6qZUIO+sUMJTVje+
	G598Zd4h5A4XVzroJm81aghfk=; b=DBiSk+UoAnEWIx1O2j/uIljsq0kfRknJiY
	lCG5jWwliVsZVqXpTpxnX6SCU+JmQ9oZrxENAeXdIrneKzhZ7obYRfTxYTW3magv
	BgKJkwDh1v2SZDjlOoA2ac4HkppLlzl+PhacmbG6M2/QltrKe+ZbsV9pH88lp1k4
	K4NU7RzzbQaQCqYntxP54HFLSrT4Lo382m6ZeRBLeiFB3dJNJM/YKnYhq1m05gfg
	N4XVlGeuHupRdGYavPiK9WUEWWIk1D0VIGmfEqAsAr6sG+XfMu7qb6YyvpMSTGxh
	AaPDauQTGaclAglzdrD5TpPusAiCGM7/wjtzxR7qklC/Fr+Lwl/w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hsxp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:30:51 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:30:49 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:30:49 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9CBB7820249;
	Mon,  9 Sep 2024 16:30:49 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:30:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "David
 Rhodes" <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
Message-ID: <Zt8iuGXyBC3NoYYN@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
X-Proofpoint-GUID: YPCWMWTx_zWDnZTmxJDrF_5U1tHpWoN7
X-Proofpoint-ORIG-GUID: YPCWMWTx_zWDnZTmxJDrF_5U1tHpWoN7
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 05, 2024 at 04:12:52PM +0200, Jerome Brunet wrote:
> This adds a sample rate definition for 12kHz, 24kHz and 128kHz.
> 
> Admittedly, just a few drivers are currently using these sample
> rates but there is enough of a recurrence to justify adding a definition
> for them and remove some custom rate constraint code while at it.
> 
> The new definitions are not added to the interval definitions, such as
> SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
> rates to drivers that may or may not support them. For sure the drivers
> have not been tested for these new rates so it is better to leave them out
> of interval definitions.
> 
> That being said, the added rates are multiples of well know rates families,
> it is very likely that a lot of devices out there actually supports them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Almost wonder if a comment with the SNDRV_PCM_RATE_8000_xxx
defines might also be an idea to warn they don't include all the
rates, although it is I guess easily seen from the define itself
so not sure if it might be over kill. But I am happy either way.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

