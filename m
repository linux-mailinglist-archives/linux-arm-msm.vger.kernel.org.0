Return-Path: <linux-arm-msm+bounces-39151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DB9D9054
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 03:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49400164921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 02:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4751D101DE;
	Tue, 26 Nov 2024 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ds7wLdlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B599E38C;
	Tue, 26 Nov 2024 02:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732587482; cv=none; b=iuu0xp4KNVrqxdQv1u0ZHL7hmSVEX/0Xw0clNbdJ5qlpCTcY10thhTppnS7Pj+TOynJLkPbjHfwp+dQoKi/t105KCfEEUq0T64gzX+AYBfTy2FPUrxiu7mdTIewQoKdAnpba2Pww2EFluoyQ2F7lffn2tP35mWGiFHBoSn+Heks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732587482; c=relaxed/simple;
	bh=8PV8kjckg7JwtfdMD+2xnhCs7hRr9Btc29Anzxn8CDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z57g9dEVUJY5ViM5rVeVrVqW1zJf3j7E9+FXMMGyTFGV1D5zDWvJ+nzht7PBd7D9qLN+l9iEdrctISxyi2w3ELMkGjUqcVmx6Bh/l8ykUODRBDUPV5zUsVA6dVI5E58dRXwiAx3YdAUyBl9Z8YVxVItugIZarekwzHXbJOYAjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ds7wLdlb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APMmOJW030162;
	Tue, 26 Nov 2024 02:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfACuvGnJLv6F/ls4+FWz3jLYO5pOheFkfFrBhyZiOo=; b=ds7wLdlbbFFZpnOD
	JUMYDaPG44Rptb723LHFj/HUCVu2hpENTO16juZkCfRdRUZl1+pJOMkNrPiG27of
	RnySjdY87e70lHRh2UBUbR4xjb6/NfjbMBVRJURhbfFlGkUJ1Uudw8s6/oSGy1TO
	4M8csp54lL3+V5NCeoBqUtA6aFbaG5HfcUcjhLF+ver1uh7K4Mj6QmPYSlHmBqkx
	54A+9gv61xXJ8WIXzbxm52480DCVUxlbNL5lZZyJ3ZUuNO4MIN5X0Msfs7rkPdey
	eSLyYQsdASky8ZCkImqkH+SGWsDNVwb4IdF39AI773BCvfLeTzZTMr1VFaVn+wHV
	SFmFKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg2p3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:17:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ2HqpV005953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:17:52 GMT
Received: from [10.110.75.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 18:17:51 -0800
Message-ID: <ded82fed-3866-40ae-9970-53e238cab125@quicinc.com>
Date: Mon, 25 Nov 2024 18:17:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
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
 <20241123-msm-mdss-ubwc-v2-2-41344bc6ef9c@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241123-msm-mdss-ubwc-v2-2-41344bc6ef9c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o4WFzyBQ0_5mujw8cW2uHpXSjYhX25cF
X-Proofpoint-ORIG-GUID: o4WFzyBQ0_5mujw8cW2uHpXSjYhX25cF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=720 clxscore=1011 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260017



On 11/22/2024 9:44 PM, Dmitry Baryshkov wrote:
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

Same comment as patch 1 but rest LGTM, will ack this one once we decide 
on patch 1.

