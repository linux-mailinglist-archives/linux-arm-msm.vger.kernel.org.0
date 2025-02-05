Return-Path: <linux-arm-msm+bounces-46916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0EA28348
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 05:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8241645D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 04:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F98C213224;
	Wed,  5 Feb 2025 04:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KiOTAqLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335025A654;
	Wed,  5 Feb 2025 04:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728856; cv=none; b=DXwIYWPh+Uk9AlDMQOBXdaEJx+8RiCzDAbceYO98fH/y2OLyeuIbRkgSWUob+aQnw/p64LNk3y/SWnSLmmK+CVmpknyO74i3IalXHGh4dZ5cxkv20pDTTiC4xfgFo9qkDC9DptYfEwIvXNJSVZeACTKSf5uovmN0Fv3VB4v5Ab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728856; c=relaxed/simple;
	bh=0JCi2U9g4YMotJdmfi2SFT+xNTPwUapqNSt2NnNhQCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bTyEt2YMF6GjSrd0nLjOMqcOPr+Cv6e0fgb41qZzDwn+mB4oeAvmiiYBt8m9nV63cmmlJyEgyrgMMNsZysC/a++NxJ88rudBXIh6x33GirUWFNnBgN67BRlbfIdlh6QMVl4ruGHYTfj0FNgfcphbFI/qQ9oWxt8zq6tawH6CR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KiOTAqLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514IVN1t000749;
	Wed, 5 Feb 2025 04:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P778zeXPqK8IHeFPldAlNHdfFiUxBHlLXBclxDabM3s=; b=KiOTAqLF33D+9+Ba
	mdVqVGZB3GWgPs2OaQ9Limarbc/Sgg3PUvKv1iIlka+jUjxRDKBnfYxdnlknVtsj
	oCf6ysaehSn+yLnayLUUy6Gg5NvMt5MGmDyEDbd0KaAN9pMWVhGkBwFKyH7MnjmR
	iOIzstScjblqdLFJzLSuMtevC/IAu/DdADBajuVlxp3KVEyy18j05ZstpmNLzvZB
	e/PoqJB8h+u4b3H2x5f0NJgN9Rhvst2dYPgdf1uUoQ8fO2bR/Sf4I8/Cb1URrYJi
	QYCRvqGNjb8Q5sh+tad9smEVgfX3zOzuMVOnO0DiaWaCSJIRpUPxo6smpsUmXEm6
	miW8yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kr8e12cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 04:13:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5154DebO015975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 04:13:40 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 20:13:35 -0800
Message-ID: <33302e34-2e13-4bda-ae44-4c111167dde5@quicinc.com>
Date: Wed, 5 Feb 2025 12:13:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] coresight: Alloc trace ID after building the path
To: James Clark <james.clark@linaro.org>
CC: <quic_tingweiz@quicinc.com>, <quic_jinlmao@quicinc.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <suzuki.poulose@arm.com>,
        <mike.leach@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l58KZdGSygMb5zI0sk4Vd4pcoJhnuKF_
X-Proofpoint-ORIG-GUID: l58KZdGSygMb5zI0sk4Vd4pcoJhnuKF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050029



On 2/1/2025 12:36 AM, James Clark wrote:
> Proof of concept to support CTCU device. Applies to Jie's patchset in
> the parent email. I think this would be a good simplification, it
> removes some code and makes things a bit clearer, and works for both the
> old and new CTCU requirements. It will require merging into the parent
> patchset somehow as it undoes some of those changes.
Hi, James

I tested the patch series and it works well.

Can I combine these patchsets with mine with co-developed tag?
Or are you prefer to submit them independently?

I believe it would be easier to read if we combined the codes together.

Thanks,
Jie

> 
> James Clark (3):
>    coresight: Don't save handle in path
>    coresight: Export coresight_get_sink()
>    coresight: Alloc trace ID after building the path
> 
>   drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
>   drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  84 ++------------
>   .../coresight/coresight-etm3x-sysfs.c         |   3 +-
>   .../coresight/coresight-etm4x-core.c          |  83 ++------------
>   .../coresight/coresight-etm4x-sysfs.c         |   4 +-
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
>   drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
>   .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
>   drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
>   include/linux/coresight.h                     |  25 +++-
>   22 files changed, 159 insertions(+), 258 deletions(-)
> 


