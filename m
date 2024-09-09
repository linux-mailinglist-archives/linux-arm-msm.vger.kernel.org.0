Return-Path: <linux-arm-msm+bounces-31346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BF971D24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56321C2344A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2591BB6B1;
	Mon,  9 Sep 2024 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="baVicP2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB14328EC;
	Mon,  9 Sep 2024 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893478; cv=none; b=cSQ/Ou7incuc6CDDl3N0ZMR5qJQ+Ne2eEHxMSuVh9xJzbX63SNlG9rZttWjg0tvIc/lC4inDpAdK+A5Gcks1h1scUGNkYuS5TFZFBlR7kk4wLJ/w+DkBMGfFrM65NfEnMri9fbYoIc/k4cW5qCSeQ8YgljKSmiNXV+ytstzk334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893478; c=relaxed/simple;
	bh=vfWPLolbvjAOE8YUFh5g7EDszn5aZxFmMhJy6zxlwB8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0kg6ETvc4R7BIxGbsWJLCQ4mb1swi14oG/lQFC8I+rdF5xOu0PjJbKUl7S0pupy0IFnhxVR+dt50JrhOusgz+KS1G7wwOWChN6iKq3EaZL4nGS7aedSVeJMIYCJu83vn9y0VL7LKsfCZNz72JHqwkk63P6eZkvXXXnl8mfcJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=baVicP2Z; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4894jf3p028462;
	Mon, 9 Sep 2024 09:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Qz8uTQ/YT/UmGGDiqK
	zRvw8o3HKTLhX5RFgLVbzHM8Y=; b=baVicP2ZV58uqKjWz5oLwvk7fKPNI1MeiK
	88SudOZPcF5CI48Ve6g8/YzFO7lJ4+Umj1ul5LC+WDXJP6Swaipha97TmumZNPXo
	UgG/GHWwyUpjsRLVAtqVaBvqewj87jIfvtrUvhEyLj1BWdWDs51vBhjiVxM05pk/
	pLZzE7Tp9mp4AnIoY7ZdJdp8ELuvICQfYUhmiGpq/pYp4SDXNhAB5C7ieGmml1UI
	s+nkyzbt4GCXGLlLRPY7KdoTKA8kOkXa2gpXwCB6fGfbnZ/Ra+mTKNDer+fugc5c
	eGix53Lwaim6hmX9dOlUcFuiMJ3UZClTxUa7/4JxISDF7uqcAXzg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hstxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:50:54 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:50:53 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:50:53 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F2679820249;
	Mon,  9 Sep 2024 14:50:52 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:50:51 +0100
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
Subject: Re: [PATCH v1 2/4] soundwire: stream: Add set_master_channel_map()
 to set static channel mapping
Message-ID: <Zt8LS0nyTXggLnkC@opensource.cirrus.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-3-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-3-quic_mohs@quicinc.com>
X-Proofpoint-GUID: CdFgfbFc3Vpyg3QaCjy_WlrTuHJL9kgZ
X-Proofpoint-ORIG-GUID: CdFgfbFc3Vpyg3QaCjy_WlrTuHJL9kgZ
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 09, 2024 at 04:25:45PM +0530, Mohammad Rafi Shaik wrote:
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 5e0dd47a0412..264450763bab 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -857,6 +857,8 @@ struct sdw_master_ops {
>  			(struct sdw_bus *bus);
>  	int (*set_bus_conf)(struct sdw_bus *bus,
>  			struct sdw_bus_params *params);
> +	int (*set_master_channel_map)(struct sdw_bus *bus, int *ch_mask,
> +				      unsigned int port_num);

At the very least this needs some kernel doc to explain what the
new callback is for, I think also the commit message could use
some work to help us understand the purpose here.

Thanks,
Charles

