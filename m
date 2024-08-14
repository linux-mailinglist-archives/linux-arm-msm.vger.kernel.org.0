Return-Path: <linux-arm-msm+bounces-28569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA3952643
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 01:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EF41C21625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 23:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCE71448D8;
	Wed, 14 Aug 2024 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dz0945fL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288014F100;
	Wed, 14 Aug 2024 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723678706; cv=none; b=jvAWX/WZjda7yWXuDjD3aEADVLQUzUx/frbDQ4vJ5WcdeenXezbaMAuYW5Dl7a7ErsogAGYOQzPj3jz/OcARUvexvOltTNboHd0Xno+Tt3c/MJ7TnOA3CN1u8aFu3UmMgQJnbE1ZylOGSBaeL/eFGQo1Ibv3L3/lETTBLKU8CRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723678706; c=relaxed/simple;
	bh=X+uNf6QBacK7A1SgElpXUmSHJKVqGuB/zzAeavelho4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BpuGQMSLuiT321MUJIRKwNQpoOjwuQlw4mPQeJrg/Ia/IAYFKQrx7Ct85eeBmIN8v7wpBQsLexJBRinGArLvi3sK+1hwzxBFXp0/f9t2deCbmzvTtL9aJsSZ8OCnWnx3Z1QqwEyQ3h3ART4w0BXI0nnh0SF7++I3+9U75/xyDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dz0945fL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ENX68k026141;
	Wed, 14 Aug 2024 23:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SuX4NbGIm3CicMr0EOOf3ER4u0+E3FHahtNk7oLMLQ=; b=Dz0945fLlkdJpwQg
	kLxizqFIX7tPUX5Z/fqc/Mm6TnsFdiCM8JOs6gAYVzISNIORsqOmfKxvFzyW40C/
	/B3lTs2pc1YZBI3gdT3zE3RIJ8IF7iHgZxZU3m+srMzI+CDEc+m15rT11E6wP3Pp
	WPwbMcXX4kDpqv6q5m97T1s47NeWnaSLHPVA1IBICKos6anHmci8BI8dAEW5HG6H
	l5ylN0L1N6ttsNLi0LOl7/rxc2VEShtQ2UG0dch9JQIflmFtIH0/Fg7cS3PbX7zG
	mAsFNs+AFXnLhUQoISvARMaXslV3xwHX9d7w540zzWeMY8OLk4HRIVSG9kz4VhqE
	kE1gcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18y4uyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 23:38:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47ENcEUX026723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 23:38:14 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 16:38:14 -0700
Message-ID: <524c6799-1056-49da-a888-12b6f8e37e25@quicinc.com>
Date: Wed, 14 Aug 2024 16:38:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: clean up fault injection usage
To: Jani Nikula <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <akinobu.mita@gmail.com>,
        <akpm@linux-foundation.org>, <lucas.demarchi@intel.com>,
        <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
        <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813121237.2382534-2-jani.nikula@intel.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240813121237.2382534-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 57f0nh7_NZ4STpljdyMhwAVDcmwTsuYu
X-Proofpoint-ORIG-GUID: 57f0nh7_NZ4STpljdyMhwAVDcmwTsuYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_19,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=713
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140165



On 8/13/2024 5:12 AM, Jani Nikula wrote:
> With the proper stubs in place in linux/fault-inject.h, we can remove a
> bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 2 --
>   drivers/gpu/drm/msm/msm_drv.c     | 2 --
>   drivers/gpu/drm/msm/msm_drv.h     | 4 ----
>   3 files changed, 8 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

