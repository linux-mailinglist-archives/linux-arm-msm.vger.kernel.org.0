Return-Path: <linux-arm-msm+bounces-39356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A99DAD29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 19:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C30164B48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 18:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6BD201017;
	Wed, 27 Nov 2024 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O9WUW5tN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B820101A;
	Wed, 27 Nov 2024 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732732382; cv=none; b=KhHtxE0LLC+HpMkFalY+kWCMAVr0QWR9diHR+OcdlMrIiWP1SoxSfe0LpUMQ7Awbca7QCLsRdDS+Ok65BYZHRv9fBZH9loRNLMOK/+XXuq53+bCH+Mql5g/oc3mfq3EYU8Z3vCoWE0pbGUvfN0/QbBMt+T+4Oz8r3pHsyWrtITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732732382; c=relaxed/simple;
	bh=23g0EdXWEZqMSCc2sE8HJm0+Ql5rC2DhAFBrUix/yyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ki1gHEs6jc24ulXU5mw7HmDxV5h5+HVT16LVNTsUtaNrk9T6aJGzLRuBi7xh6dguk+YqARyrWa7os5Xfof/TqyAZ5vmvsJJzDIOkkGC2sM81o+Z5pjPjvOb8Q8ncDDdfmB+V5SB+zGYAq5tVb7woHyuNuC271YyaSR22oVjkBcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O9WUW5tN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQVmT004458;
	Wed, 27 Nov 2024 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eNP/4sBofXs3uRz3W6TxAmyg+Sto/0t5oIUTlOofGk=; b=O9WUW5tNwM2xo2iq
	LYxXymwgdu8hF2qvfDs2jO5KjZ0yXcMQwfTvpuX9bFErKLvxcNkqEwEhUIdFlN3d
	9mUiaHjQRekaf55opBT6YP2mBU8nnaYwYDvDAelq75KLPzAvA5/SwjK6uO0pMso7
	iM+nABtfz1aZAcYY4BcJmsLfCN7/CglHHD/oQCJvYGjXGABvFBw9dfowLiW0JzT4
	JVaShSR8f8+aYS8Xl8FbCuyn4e2+4Ew8CTyF0vXwj2DfFl1wvIZuhJm8RnqrR1Su
	1hiQBObKmmfY8jOe46zRS5psUH4L4jcGCpeBgaBm0JvkM8g4orC898ZEUSX7Mga9
	6HVglA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvg99b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 18:32:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARIWq9V024042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 18:32:52 GMT
Received: from [10.71.110.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 10:32:51 -0800
Message-ID: <453b1a84-79da-4aef-8078-d9f395e2934a@quicinc.com>
Date: Wed, 27 Nov 2024 10:32:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC
 register
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
 <20241127-msm-mdss-ubwc-v3-1-9782a7c2b023@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241127-msm-mdss-ubwc-v3-1-9782a7c2b023@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BM_hqYMcPmDo4LtOn9VnQMk3_g4uTMVA
X-Proofpoint-ORIG-GUID: BM_hqYMcPmDo4LtOn9VnQMk3_g4uTMVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=895 clxscore=1011 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411270145



On 11/27/2024 6:04 AM, Dmitry Baryshkov wrote:
> Rather than hand-coding UBWC_STATIC value calculation, define
> corresponding bitfields and use them to setup the register value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c                 | 38 +++++++++++++++-----------
>   drivers/gpu/drm/msm/msm_mdss.h                 |  1 +
>   drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
>   3 files changed, 33 insertions(+), 17 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

