Return-Path: <linux-arm-msm+bounces-31345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63191971D20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C6F283ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0691BBBD9;
	Mon,  9 Sep 2024 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aEb/jlSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4C1B81D8;
	Mon,  9 Sep 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893436; cv=none; b=nz1GwonpPlVq+ADBhGifkeF2Matm1LBnejsSgl9++13k0tkcZKUqCw22kb7SpsRfNNU3434xzfGlRLKPMC0ZjRh6YaQgA47r/v2id1RTWIS57nEur5/IdhjR1E5ZrV63XgZh0w84PWY+uzVZIX33D1P5tzcEsiPC4KF6ETzpfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893436; c=relaxed/simple;
	bh=zYUb39rxLloRBDzZo4+kzlIgM65YSGPIz0TgH8WfP6g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoVZBwTeX6/QhR+SUI+OOJCv8EYuk/ua9wAbn608oSh6cHy1tjgZi7MWcyiLdze5hSVqnFR0KbyYKkfZUbsm2kMMUBlFPOcHFLL8O7W9oDt8l602V+CWXQ2UMiouyNQfQLYEittBJn8B34a2zXC0wghzZP74awgIIBXrqFxGCPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aEb/jlSX; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4894kdKO029438;
	Mon, 9 Sep 2024 09:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7H3hIEPlOVkieGvBf2
	c0DYfFeVzq19u7SSW0qmjXnjY=; b=aEb/jlSXCbHQwhREJ7dfRikrM9wtb0MIQR
	dCpj/YRqATTCq7HNraKv1bdCEN9NkoXzlUg9+0nTzQb4MNv1kXC69nv0AJ7md5jJ
	OaAMvxFIIXS7hcLmWLy3Um2yW6xZcKcdQpwRWqt/lcDmk5xWVAkov9EbUAXSoUft
	wkpyA4aLmufarwAX+WwPPhzlwRkxySUcNtJuO3zwEZ4CCpCRbuSTvH3kPVWd4A2V
	TLXmd2BYYz9bUCKRZgUjoI6JY8jX7WBTlwHT0sLHLK19ZzmK0azR6RtMMaWWbLo7
	0dsJ6jgrQJL31mHGKrBfC6HflOIeP8zeaDWihcVMCryDYz809wEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hstw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:50:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:49:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:49:48 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D332F820249;
	Mon,  9 Sep 2024 14:49:48 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:49:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
Message-ID: <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
X-Proofpoint-GUID: qG5DD1sdYl7BYNL1JLvRQwR3HMwgcMJo
X-Proofpoint-ORIG-GUID: qG5DD1sdYl7BYNL1JLvRQwR3HMwgcMJo
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 09, 2024 at 04:25:43PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> This patch series will resolve channel mask mismatch between master and slave.
> 
> Scenario: wcd937x AMIC2 usecase
> 
>                           Master                 Slave (wcd937x)
>                      +--------------+           +--------------+
>                      |  +--------+  |           |  +--------+  |
>          AMIC1 ----->|  | PORT1  |  |           |  |   TX1  |  |<-----------AMIC1
>          AMIC2 ----->|  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>          AMIC3 ----->|  +--------+  |           |  +--------+  |
>                      |  |  PORT2 |  |           |  |   TX2  |  |<-----------AMIC2
>                      |  |        |  |           |  |        |  |<-----------AMIC3
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  |  |<-----------DMIC0...DMIC3
>                      |  |        |  |           |  |        |  |<-----------MBHC
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      |  +--------+  |           |  +--------+  |
>  DMIC4...DMIC37----->|  |  PORT4 |  |           |  |   TX4  |  |<-----------DMIC4...DMIC7
>                      |  |        |  |           |  |        |  |
>                      |  +--------+  |           |  +--------+  |
>                      |              |           |              |
>                      +------------- +           +--------------+
> 
> For AMIC2 usecase, The Slave need to configure TX2 Port with channel mask 1 and
> for Master required PORT1 with channel mask 2,
> 
> In existing design master and slave configured with same channel mask, it will fail
> AMIC2 usecase.

Apologies but I am not really following what exactly the issue is
here? How do these ports map to DAI links? It looks like you are
attempting to have AMIC2 produced by one DAI link, but consumed
by another?

Thanks,
Charles

