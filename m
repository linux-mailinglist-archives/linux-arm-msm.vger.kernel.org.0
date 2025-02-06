Return-Path: <linux-arm-msm+bounces-47000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34779A2A02C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 06:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A8207A3245
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 05:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73585223328;
	Thu,  6 Feb 2025 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hhwGI1fI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E4376;
	Thu,  6 Feb 2025 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819790; cv=none; b=ddZ99fDaCuNSsn2k6qnbNK+pTpqh9fLKJIr7Ubz+H9xski7hmAae0qK2lF46ZKOZD8cuFb1f6O9HJL6DWsuqVyuSE30iGgghGlIO8khmVIo0TMfg4+FEDjOWBd3a9EWbHIip0NeYrJfw58HZBt9im3TFTRDM1TCbiOQJfwE4UyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819790; c=relaxed/simple;
	bh=sPkE2H7TRcVJFXCbyejleJMn2GkjiA93cL6WofHY1Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ox9Q5My0n/Ymc4Y03HT8sC7ceEi0lvVaEsSbK+bhAuG0XtSIZnfATcDSOBhl17F/zTFAYdRxueaZT+9gO6tSDugSsZCyFrvoPmfmlcMx5U1E2mONdfqRelrst31UpEy9Ifo3AL6Gis3S56UKTytsf5VH1Be/QeK22y2EaL0F1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hhwGI1fI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515FDYFb030209;
	Thu, 6 Feb 2025 05:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqNZCSPe9MF37Q5T+4kjTCzADjtZNkVnwXEV6pjLaXQ=; b=hhwGI1fIoDV2bgcC
	ZohJGQOsnoLNC7jXo4Kaaj/XrZ5YgALylT+pb1Tlm4HmuC+KWOYESFvxIToXMDMq
	dZFipDm0n86WpqNTxSzVLzti9V4YHfWu4iSVU5ftS/sXLGQnucaPJYFX14eoxDL6
	jxjGoFKoVwUo5veSnjGq9rP0WcKobjeDtdT00L2vSo/uCt4wtGRbBqrlBngwPqJU
	vr2OKXh6YLKlwt1YEvaa5Cqiv81Y00gsJ0yTXuMMsqRQ9XTx6mMcfk0GYm4tnbHX
	/YMjgIjkllB5y8D7xcOTtHPb76j8h45xS+LegOowdPubsvw7eZRpQyeR9FKqHYpb
	1pURLQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44maep9qvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 05:29:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5165TC20020014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 05:29:12 GMT
Received: from [10.216.41.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 21:29:03 -0800
Message-ID: <ffbd8209-116a-a4ad-1b5a-cd61665758fd@quicinc.com>
Date: Thu, 6 Feb 2025 10:59:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND v5 3/4] soundwire: qcom: Add set_channel_map api support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkumpatl@quicinc.com>,
        <kernel@quicinc.com>
References: <20250123042823.2067740-1-quic_mohs@quicinc.com>
 <20250123042823.2067740-4-quic_mohs@quicinc.com>
 <a82a33a8-d27c-45c8-a39a-58e6357e0d99@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <a82a33a8-d27c-45c8-a39a-58e6357e0d99@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k1NjFBqjvvM6nUIMBobsAedehUiWsiQ-
X-Proofpoint-ORIG-GUID: k1NjFBqjvvM6nUIMBobsAedehUiWsiQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060043

On 2/3/2025 6:49 PM, Mark Brown wrote:
> On Thu, Jan 23, 2025 at 09:58:22AM +0530, Mohammad Rafi Shaik wrote:
>> Added qcom_swrm_set_channel_map api to set the master channel mask for
>> TX and RX paths based on the provided slots.
> 
> This breaks an allmodconfig build, and arm64 defconfig:
> 
> /build/stage/linux/drivers/soundwire/qcom.c: In function ‘qcom_swrm_set_channel_map’:
> /build/stage/linux/drivers/soundwire/qcom.c:1283:36: warning: unused variable ‘sruntime’ [-Wunused-variable]
>   1283 |         struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
>        |                                    ^~~~~~~~
> /build/stage/linux/drivers/soundwire/qcom.c: At top level:
> /build/stage/linux/drivers/soundwire/qcom.c:1335:28: error: initialization of ‘int (*)(struct snd_soc_dai *, unsigned int,  const unsigned int *, unsigned int,  const unsigned int *)’ from incompatible pointer type ‘int (*)(struct snd_soc_dai *, unsigned int,  unsigned int *, unsigned int,  unsigned int *)’ [-Werror=incompatible-pointer-types]
>   1335 |         .set_channel_map = qcom_swrm_set_channel_map,
>        |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/soundwire/qcom.c:1335:28: note: (near initialization for ‘qcom_swrm_pdm_dai_ops.set_channel_map’)

ACK,

Thanks for the review and test.

Somehow above build errors not reproduced in my build setup.

I am Using below commands for build:
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- allmodconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j32

Will check and fix in next version.

Thanks & Regards,
Rafi


