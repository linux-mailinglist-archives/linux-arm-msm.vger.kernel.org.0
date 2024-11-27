Return-Path: <linux-arm-msm+bounces-39357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A89DAD2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 19:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5093164AD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 18:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E5E2010E9;
	Wed, 27 Nov 2024 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kmBv5t3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB712010EA;
	Wed, 27 Nov 2024 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732732407; cv=none; b=K5lDrHfDnMP7LflH0PVOwOZnEuG9PUNOjngCZbFGh561nQyofnO4CRVgoC/Mctv3RjhipswG9W0MO8G5ZbBEajBCtjRKDRgU2UdfYPIXC5y6USfD0t/Eqn+n3rc1DeXTtzLHolprAm1kY0ICmJO/TPGjAxxAErCPnAUw/Qg4DiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732732407; c=relaxed/simple;
	bh=bY432ahfsqy6hYXYp/zWx6EQ69wVlk4r9hvn7DJ35gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AKAeZJbe4HaMDe8/15azsyoTG7+G/d/LpwShE56U8cr7JoqUzUZ0sZTR6p2mXNDdmyQeYsyT27QY5gPTA7WCQpFo4bZmf4mCQwaSz5hx+HERXboiGmQto+iaRSUpNREBJpb4cDEHh2vF5lfs0PEF3ItinSiNTyu0HZKahXsSTaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kmBv5t3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQkQN025440;
	Wed, 27 Nov 2024 18:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3ScfP7I5CJaqQpJ0XOCcSHZmjZZ+ZevPg9kjINMdqY=; b=kmBv5t3EqpWf6ojY
	HoKaIlaBze/eTIwr81USFIl7kgtkcBUmqMpkr26WohpKY+6vgg76kTuieCHT8mH7
	yFbk4DA/jOPBaTK38mmb0sLDP393meY8ZXh7EyPcIKBuH2i/W/9If/6d7JZhD3fo
	3sNvtGW6HaEC3TC11ck08pRPk6vX0AjSco7ziMVEQqoawni4rSAQJY+nkrgpOakX
	qDUm0en53ZEck8dG7eu/ncKbrJQdTE72dabsDX1Se3jfgwloaY3p0R5PmoOEq6ty
	wdC8ed05j1Wbs11gbALliOkwMwLpLgGLXM/hzxBCHG4zTOdoZkMPMwg9oUTku50N
	+VJ/Zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xxr920-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 18:33:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARIXJDB025606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 18:33:19 GMT
Received: from [10.71.110.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 10:33:18 -0800
Message-ID: <ce46249e-3230-4bbc-800c-70ee0a98a999@quicinc.com>
Date: Wed, 27 Nov 2024 10:33:17 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
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
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
 <20241127-msm-mdss-ubwc-v3-2-9782a7c2b023@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241127-msm-mdss-ubwc-v3-2-9782a7c2b023@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wVk7dztl9peavFIcO-K62eTJUIUagc3Y
X-Proofpoint-ORIG-GUID: wVk7dztl9peavFIcO-K62eTJUIUagc3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=664 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411270145



On 11/27/2024 6:04 AM, Dmitry Baryshkov wrote:
> Follow other msm_mdss_setup_ubwc_dec_nn functions and use individual
> bits instead of just specifying the value to be programmed to the
> UBWC_STATIC register.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
>   drivers/gpu/drm/msm/msm_mdss.h |  1 -
>   2 files changed, 13 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

