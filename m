Return-Path: <linux-arm-msm+bounces-38887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6D9D6662
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905A32824E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 23:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E66189F36;
	Fri, 22 Nov 2024 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ObgRPmYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE418C009;
	Fri, 22 Nov 2024 23:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732318324; cv=none; b=e4tsdZ8ZXaUz1C8i9XgMdpzBNvPV6vCzuA6W+KX7F4p2GAoYI5CJr/9bTd4mzp7hWPWbch89ZDqKaiURwIBsMJ4GUE1/kVNT2zffcTwj3sPtrr9xAPS+I4uBxbXsShn+0IsJeiufSCrQaxaYMcS05O7YTtft+Jx7iwSeLyAUI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732318324; c=relaxed/simple;
	bh=0swNmG/gMkIo8kpZ7UIINRXYNH+QYyHPBum1usiGpmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rg6I0tP1PsFWj4NMmh9+kTdTY6BaGEoI/J0YAek13JdpFLGVRcw7o7ESRpG6L/GwJaInlfpyj44ahiJJqPcZYPqY5uF9BOpLvNjZINI7g9WNL+DDBQaqdrvUxa+Bw03+tmblG5y2RK2eiZENGWFOrmBxqTzACdAOz4IrpO3UxTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ObgRPmYf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMCpFfd025091;
	Fri, 22 Nov 2024 23:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tegoeksb4rOhicj9vqU/v0nsakvpHW2qA4gDGhuS62Q=; b=ObgRPmYfyklGZ/SZ
	BvlOAq3o2TotLfnMY3M2XgU33Rs8ttuEVdpvcDuTJB5BjhhowPrNpAAyHiONKl8O
	2LJE9N0fPSrP+31JwmkTV/pLzELMwl0Hq5dZRupXUZN8umIFj4KuClXFJZruF9tw
	hl5NiNNgL1BnIOfkXAGUy0M+mBGHyY48qXFDlV+palG2ATPGQI3gk5wzcUp6rE8B
	vQ5e3+OfOg4q8DWs26hYxAHdC0WPZ36Zc4sP+I1mPWHfpTlKn8rvPrgBw5lNAq/e
	HpvUiqtf2OEfGavebmGJ/NcLt5fx7nyWB2KYDCuD3QM9qIu3X4JNqFoHPmDpDiAU
	WDmleA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43251nmrdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 23:31:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMNVsT7030236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 23:31:54 GMT
Received: from [10.110.77.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 15:31:53 -0800
Message-ID: <0cf64e39-810b-47bf-9e5d-f610403220f2@quicinc.com>
Date: Fri, 22 Nov 2024 15:31:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SOB9E0bOUJFgMufVQGc89kq6B7co00hO
X-Proofpoint-GUID: SOB9E0bOUJFgMufVQGc89kq6B7co00hO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=776 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220199



On 11/22/2024 3:09 PM, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

