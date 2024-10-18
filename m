Return-Path: <linux-arm-msm+bounces-35002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285D9A4640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16261C2162F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22D420494F;
	Fri, 18 Oct 2024 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ou2p3OIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE24205AC6;
	Fri, 18 Oct 2024 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729277210; cv=none; b=H01Ho6D3McHVuVLRvBIZ+4NQQYERViKi9ZjQEZu1esTeGsyEVHUEVPUiE6k4Wby2p3V8Rm9WjD5kqkqy4PTvG4l7Q0BvJuUaqsWsU8+Ng82UqevWamIVB2mWwdfEBPMzqeAxUv5dY98MkruOwHTlgxIVsr47N/85X2h15OMQeEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729277210; c=relaxed/simple;
	bh=pJZhimaZlga74714TTOoVjMzXTzR510paNxcDav98Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hZaqG1p7aJtos2MN6iZpCWUfi0RbY2T+EWCaWN8bFwVhqj47K8epoKRkQJfOHHphKSvVRpnPQHgR3qPt3684Wsf/nMTZcsG/nvlsVlRqshwoiZIGZRNA7tT27LOyshBfctAeyuJVKxW+V2iynq4G0490NRRtta3VIkA6nKGziUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ou2p3OIm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAdojR018281;
	Fri, 18 Oct 2024 18:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCqMn6dxwPR3QuXY00+mo6OSI3nHWGLKFTn+IACrTVA=; b=Ou2p3OIm/p4sco+G
	B/15hdDb1toNs/XCftCr83OnV3kWXe/DhGC436lFMhVow1ZXHOWppdPbGUym5s8P
	UQJvR8/IKfIBZR/sTbhRVUd+q7KJRWbZl/+h0W2rcIItXwA85yfqyvunE0hpTEQq
	DJV7hiB3bCdxgS0/vhOohD9qDXRpPGWw5VEhm+ACk3n/cK1NBb+u4YGnerEtGfmK
	KrgaQF/4u5hmAylZMZi6ii2xqS2WynBsYvuAyAvvUhqh2nqesoQOUlZH5o3xGPDg
	kHrJueFap0303BhtBwSAL2cvjlWKEpVAhcTSp0Jqr1NxxzkYQwGW02nKVgF6q/h9
	0HOWAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx52d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 18:46:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IIkc6C028688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 18:46:38 GMT
Received: from [10.110.77.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 11:46:37 -0700
Message-ID: <f3144d7f-ded4-4d6d-98b5-d1568bf8eb56@quicinc.com>
Date: Fri, 18 Oct 2024 11:46:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/mdss: use register definitions instead of
 hand-coding them
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
 <20240921-msm-mdss-ubwc-v1-2-411dcf309d05@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-2-411dcf309d05@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mjGpolS-sl8BpT2aZNTzl-MPcFO5C1cw
X-Proofpoint-ORIG-GUID: mjGpolS-sl8BpT2aZNTzl-MPcFO5C1cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=692 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180119



On 9/21/2024 1:17 AM, Dmitry Baryshkov wrote:
> Move existing register definitions to mdss.xml and use generated defines
> for registers access instead of hand-coding everything in the source
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c                 | 35 +++++++++++---------------
>   drivers/gpu/drm/msm/registers/display/mdss.xml |  6 +++++
>   2 files changed, 21 insertions(+), 20 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

