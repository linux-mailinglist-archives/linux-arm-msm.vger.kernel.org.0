Return-Path: <linux-arm-msm+bounces-31361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681D971F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B9C1C2333D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F675149E14;
	Mon,  9 Sep 2024 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Fzqwn3mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829312C87A;
	Mon,  9 Sep 2024 16:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899256; cv=none; b=ORjsSneOTbeCFQP7gMEj1JDYBiyGBk/J9gURtuXCkCABdz+cTJisNPkzddMqB2jrM/DPAv86RK5sktVvh0D0VtllJlDGh1zjjZsU/TEcp0r/VIltltOJuvxZcs8xZ2guYk3AveINEnGtPI9Q3x5vJ34i4CBOXXC1nTYzgw+pD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899256; c=relaxed/simple;
	bh=H0jr+SzHPYKBvJPT/gKmwpTLaQo1a/FuWVAfEnVAPxU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujzIjiRZDAlK1dVfIShXPbioOYCADWOZEmSq/7JfeLG/sReLp0PetHfqAh6cz4YekCVe1mWfARPtSsfSkvU/byHvhMacde14X5AXG+2FEZLEPMX/bnE/JwfPoh6X9SmIRgMgMobzqtK/wChSO/nO+nHr2TtEIT8JNiBbF2j50Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Fzqwn3mr; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4894jfAW028462;
	Mon, 9 Sep 2024 11:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=z4rvLQhreBX1tTyXW/
	B2/IXr7T8zpQHCXJ3hUqhaUnk=; b=Fzqwn3mrW1ZSfs46JfVbmeX/952TMhHjL2
	GepVdeGd4v6hqo+5EaXtW9oSYJ8UE7FsTJqw3hrdnbchjcZXkxYrleZr6h4PB7X7
	b+fAKcdvWIifhmyuFncRGHBG6aCWRkzbvK4NFlZzZ9crLnN2akdc2CQ0Ixp2ZoLd
	Jcf/QbXMJ5YLL7hO69p4cNmT/XuP0FobWWSD/AAqP/kkMB4ztvG1fFdbrodKsykM
	6GW8NsoWOAsIx+B8dBvowKqnvocOzbPsa3PDhIMznvBUMjO/etVttOsaadlU4Dkf
	LbcqP2s5onS2SQ0yPvcyXPY6l7aYjkQXGkb8q986fKGhKbSrtwCQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hsxjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:27:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:27:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:27:09 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6439E820249;
	Mon,  9 Sep 2024 16:27:09 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:27:08 +0100
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
Subject: Re: [PATCH 08/13] ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
Message-ID: <Zt8h3PTmASuz4G+H@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-8-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-8-8371948d3921@baylibre.com>
X-Proofpoint-GUID: 8GjYTWpfJsCbPlFYmX7IjUPvN4bERpHt
X-Proofpoint-ORIG-GUID: 8GjYTWpfJsCbPlFYmX7IjUPvN4bERpHt
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 05, 2024 at 04:12:59PM +0200, Jerome Brunet wrote:
> The custom rate constraint list was necessary to support 12kHz and 24kHz.
> These rates are now available through SNDRV_PCM_RATE_12000 and
> SNDRV_PCM_RATE_24000.
> 
> Use them and drop the custom rate constraint rule.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

