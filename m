Return-Path: <linux-arm-msm+bounces-44067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C5FA03560
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 03:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04691887463
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 02:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A3113AD22;
	Tue,  7 Jan 2025 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XhDFVZJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2361DE3D9;
	Tue,  7 Jan 2025 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736217807; cv=none; b=QBcwmwY3TXDP9Zcb199/0XWMWp+/ef2VSQV0trcVAUMaSgxxQ19zGTwq9u95QcYzxzjzfvv9DCDu4Y0OUVCBZfh+pTeRHpvxq6alLZIGiRgSNEEYbGEMVBgVVOqxgSL4Lqge1KaBebzkDz6QNBftfvQJkdAPYjWT2N5q70hYUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736217807; c=relaxed/simple;
	bh=NiHPqCXhhh9ugBgGdwniOlDXCHGTbbyQk+aN0pSajoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=shxJ7NzNTQdsrt+OuGmM12Y4nsFjTmqRPm0NOQAOClq5avR8bjiO/BXP3GFtXbCooUKG/sFsQNkDrWAxPDfYmHIpYcNxL1aL/TVM//BrGkViDzcbcea8CbjU2DcnoOeH2TD8vhIsWpdmtEHVim9knKJlttu5QxtozWr4ry/gVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XhDFVZJu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506GcNll007480;
	Tue, 7 Jan 2025 02:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l8wQixPvBAV3gOYlcejk79OV25wHMGL+dMnrft/6ypg=; b=XhDFVZJuwWATjc78
	PPxM4hxTta13USFaZJB81ziWiRc9ZK3VvhaGajmJC9Z/iinIftNsDtsDmNzt2KwN
	geWvB6vwkNNTi5IwnQUSaytBxM8hb0JnzbQjC6Vqe9W5lE4RHC6ruHGW84Vyr4zx
	ZPkOzjNSw5uH9DwS/dL7u8xERQuXKyIe8jLi/iLQOzfLoaBJ/TY5tJ0hB5vk0Nmq
	Rs2Opr7eSOMt2gSs6rvbSQDj40mjZnZEjyTdSc/D0bQJ3slaRCrDeXa+Oi9sf7Ow
	FO9Z/kef+Y2VBuq1E7A1J2qRDfok1OUbnc05BERHKgCPy4M/l7ZVeNkEt8UWmHo/
	uz0U1A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440jv394r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:43:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072hGgD018844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:43:16 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 18:43:16 -0800
Message-ID: <78501a1e-cfc6-46d3-9ee3-ce8f86330df4@quicinc.com>
Date: Mon, 6 Jan 2025 18:43:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on
 error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-1-271ff1c00795@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-drm-msm-cleanups-v1-1-271ff1c00795@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SE14YVwHN-99uDHvjPgxlbSjGkxuLvIN
X-Proofpoint-ORIG-GUID: SE14YVwHN-99uDHvjPgxlbSjGkxuLvIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070020



On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
> dsi_clk_init(), which gets the clocks, is called only through platform
> driver probe and its failure is a failure of the probe.  Therefore
> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> value stored there won't be used/dereferenced afterwards.  What's more,
> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> doing this cleanup.  Dropping redundant code allows later to make this a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

