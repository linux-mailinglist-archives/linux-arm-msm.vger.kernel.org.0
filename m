Return-Path: <linux-arm-msm+bounces-31360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14852971F18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407591C23542
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038021474D3;
	Mon,  9 Sep 2024 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IZz/xzF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E981494BA;
	Mon,  9 Sep 2024 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899106; cv=none; b=Dkew4s8PmNbBS9mV0EKQFQkcwSAid+NwRWzS1PXhyll+l9PB643YKJGauD9hjaBdPXyZuwCVj1ofLjDimlhq4J2pHbr0Jtl1DQlqmxg0P29g8HkTTWOeYo03JZQi9GIKk0hC/VCt3UAevFY3mQl7/3vZHNilYrqvzbhjGrWuF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899106; c=relaxed/simple;
	bh=M6ZLLQgUBQBQ8banvirqUpHTyzU1q6qqBSJ32VFV1Vk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK7UYOK55j6Nh0aJ/Y7XPOoBUEa2ukUECq7CawCuxiEkS0Fingv6eXb/jLbkaG2TxWO+bzpihYEM4vLF0npEuwIoVsm7ZXe/Msm1lYVQ0wifOup8vgHG1jBQ5SzEMCMRwhQ2ht/7xMztC8Jl+HnZscpPT0GtaY+ugaW5mGcF620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IZz/xzF2; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4896dwsi001006;
	Mon, 9 Sep 2024 11:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=qgXXrB7jZbmm1OASdq
	ea7N1/RcWZU6RDCmcbZWibma4=; b=IZz/xzF2LTag0CbDuRSJi43A0+1aCgTEdx
	OPot8Hthc/a1hbPxbOunSu3PJUO9sjg9bUPatDUjFmmRNv5B0lrWgZtaX0lCox9b
	hRZoZfYwRsVYTSL2Z9cywwNGIq9ZbDJ53Q8O7nrgF/uog2risIoxB7VEosUMUfzY
	sCVsj8v9LG2GZWwz2x26DpphcfrEJocqrfOM/g6QnHi5oZgnTyBH+DYeZZpnDnpZ
	Zdg577erh/mbRiI3aVU3HJCyxUACC1fYXdL3byJv4ZrFmMbg59GWlH5K8nNTwqIJ
	JeeMkn8OSmTdKkt220BO/umyJ0BUezZJqEuUS5J99QNKW1JtyRYQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1upu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:24:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:24:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:24:41 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 802DC820249;
	Mon,  9 Sep 2024 16:24:41 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:24:40 +0100
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
Subject: Re: [PATCH 07/13] ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
Message-ID: <Zt8hSGHIF16NgMX/@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
X-Proofpoint-GUID: 6dixBlqA4RmXx9Gp9C01vdaMDdrQzuFj
X-Proofpoint-ORIG-GUID: 6dixBlqA4RmXx9Gp9C01vdaMDdrQzuFj
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 05, 2024 at 04:12:58PM +0200, Jerome Brunet wrote:
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

