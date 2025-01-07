Return-Path: <linux-arm-msm+bounces-44223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F320A04DA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB1A166353
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712151E5729;
	Tue,  7 Jan 2025 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e+QbSOZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65D273F9;
	Tue,  7 Jan 2025 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293065; cv=none; b=SLczNJDsp+FESHjQz6lj9sLQyOitKwJMnawnYWBMPmZk360vchY9FkWHoPaiqnnTDJN7owKrtCt0kSBXWPV+kFs7AWT2lqd5QCeGs53TaONFSKeECTu76o3DgCvZZU3YRyEdYwz7QKaOVnJ0nr6x9W3BMKEwzlvuWH0zL3cPcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293065; c=relaxed/simple;
	bh=01RNM+G91s04MIbrfgavmiulzjdUCePL+7HdtkLOrW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A1+Q3y7Q7VKvebklMjKMZYoZ9WxMC/jyJMQbz66M5l3SnZB+fu9TMv31TjG7iGDL8/nVHqaK9Tcex22dbDppEPU1+Xv3+sdNQq3ZM9s/HWpfsa/BIUzYhPjYpWZ9qK9rOuDPe9Akelj0CUi+vyQo2CGQEunq//jfrLyMBpa1QFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e+QbSOZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507ELcA3006782;
	Tue, 7 Jan 2025 23:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMP2dWI4Y1YK3C8Y5BxM+1B4lraO2suEANnLyOLK0xM=; b=e+QbSOZEzjgD9gLA
	gZIZRsWzMgnX9jsEznH4TXCwCNOKxUGBalhbTgCq1b3QluKeNZByPcjcb8ZNLhvG
	L9/mZKbBxbu8h9n5mY1iHVeK6VV0e+ItJ693tRRgnfijJipAdXDNsHAo5+1Pcxhd
	HV2nye/U997yU1QUBwWg5o4kSwTE/S0p1oIdg4lWllwf4/6Kqqv/RTDdLuutpKsf
	cbcqSRhw0/psbq7XlEtlwmthRqJoKYK+Ft6pfDtTQKhDzfstDlM/CV470xIbhpRT
	MxPOudlf9TYiZjWvcLY726OCR2hN7+Y6blyxMynPTHTx59HHZ2sETRt0P0TInX12
	pzIf2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4415y9h8ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 23:37:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507NbaAg015397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 23:37:36 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 15:37:36 -0800
Message-ID: <390daf61-c16e-4bb1-af47-da64147ae809@quicinc.com>
Date: Tue, 7 Jan 2025 15:37:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/dpu: enable CDM_0 for X Elite platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <20241224-dpu-add-cdm-v1-4-7aabfcb58246@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241224-dpu-add-cdm-v1-4-7aabfcb58246@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wpRE0-e0M9zUYhCmt0-iKGExnCI-D9ix
X-Proofpoint-ORIG-GUID: wpRE0-e0M9zUYhCmt0-iKGExnCI-D9ix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=798 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070193



On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> Enable CDM on the X Elite platform, allowing RGB to YUV conversion for
> the output.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

