Return-Path: <linux-arm-msm+bounces-39152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9420D9D905D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 03:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58EAA28A844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 02:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BCA18AFC;
	Tue, 26 Nov 2024 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KhpAb/91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEC38C;
	Tue, 26 Nov 2024 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732587607; cv=none; b=MSuDH8n+2OUiV4Mz1TJKj4jB1QrAwme/0nuOXCC6bsc6ih2vhGhzauf4fSQ/NcQHBjrZRgeezqKyItqV6YTzbssGwYFhU/2acK/3H0Y8SdPWQN9QPd0rJoUFNvzuMkcrnITpZhCiTkSU8V4GmNFNXXR3+dtuaY3tKdiEfbViqmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732587607; c=relaxed/simple;
	bh=KL9TJcUmpBOg2rlO+TduCZLTKF1VTmQPbpThhv0EH74=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jGRjCQ/43QzLVuXtcJkqSVwewXDz68ieG9zyEMUx05Bl7FyjwfQczz4xsVfs/qNCGvSG+roN1C8ljgf9Q2FDsd6QuqlRvKb6xFrbRL1S38aEYSTsc4ENdGo+XHIPfbI1t2r/57nkT2PtZJgstiw4Uw3d+Ha4+Y3zEWEfIgYDUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KhpAb/91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APJcf2a020756;
	Tue, 26 Nov 2024 02:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjaqFVwrTuva/2uiWCYDKlzMl9bZpHcZT+AzDMjzo1k=; b=KhpAb/91ri9rHyrN
	TlS87CtfpgXVbBg3rMe7DTjymsEtCj+AyIfHWMKWeE8m3gzlWxh/QYxm93CSVtJG
	c9GV2olhrTeFG4jWnPCSt7U+9vFvGfY3Q1TnFNqEmf7w65yxXDzUHqQrWKoHhQOU
	16oS3qPr3ICkxFvrOByRCYcHRhtwoI6YXvWKZ100FXd517dUTVNv+I3oK+jQoz6X
	sj7wgxPC+e6IlUSP0pTHjAjctJduN3xDR3N3XIJ6m+mxo93pAd5Hv2RO47s/Cbww
	4GgmjP4tWwUql2SdMi8xUzaAOCyrzcdK1O6s2pRrzkdSrpzmIvRCGsRHcsAzJ/5F
	yWLlQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43374sxjxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:19:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ2Jvx3005644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:19:57 GMT
Received: from [10.110.75.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 18:19:56 -0800
Message-ID: <627d1c8f-5948-4593-836a-faf6d03d8c86@quicinc.com>
Date: Mon, 25 Nov 2024 18:19:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/mdss: use boolean values for
 macrotile_mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Connor Abbott <cwabbott0@gmail.com>, David
 Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
 <20241123-msm-mdss-ubwc-v2-3-41344bc6ef9c@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241123-msm-mdss-ubwc-v2-3-41344bc6ef9c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: niNcOx5G9H4OLRuXTqNfhcHHeMR14kl5
X-Proofpoint-ORIG-GUID: niNcOx5G9H4OLRuXTqNfhcHHeMR14kl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=987 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260017



On 11/22/2024 9:44 PM, Dmitry Baryshkov wrote:
> The macrotile_mode is a flag, not a bit value. Use true/false values to
> set it rather than 1/0.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

