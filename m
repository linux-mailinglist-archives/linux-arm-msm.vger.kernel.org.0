Return-Path: <linux-arm-msm+bounces-23151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E090DF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1074F282EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCD51741EE;
	Tue, 18 Jun 2024 22:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xe7Si3AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B416D9A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751388; cv=none; b=LGsq7LTjXdsaruWOOqb2m/BMidD6Y9O6SEgbABAFGK2i9u2UEou9yfN0dHoSHvn87xSbJD0F2YUFT8nvCPZkuuImAjqdH4uSHJMux2r7fmfUaeQSWDB8ev9IXZW3GsD+54AoNdq2aq+nyBPIPgc/+K5YH6f0WPnozJ++CQP8upU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751388; c=relaxed/simple;
	bh=jD3mDBu2WUl/p7LocvvZtrgE8adYDIpNlQ5VzCD4/js=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=JnyaDB8CEUgeJIVwkXAHnTOE09DBfVRNWuszoXmpLcxS5sboat5vWrir+skEdLSLcmbbFTAwgmv5errNfwao2om4FnfBnHx6RVst8vHzi+Zi3ZPm7SzYzR49KaqLX7BpEz8zF8kOj838YttRpmgErM4khapKYJ5FrWUEfOKkaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xe7Si3AW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILZs13006051;
	Tue, 18 Jun 2024 22:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VYm6/w5AjlEC7RwLcnYdJE1Qq8FAWe0aB3BZmQYGHg=; b=Xe7Si3AWYW0FAte6
	mR2ub06XY7XgA7YB62Y6I8xYQCnRg/msQ9ycSY/AsTYQ4JZb044Xl8iKPA+RTXui
	mkYA+adO+5A8DmgFyL84oIQEznbRlysNDzvPibh0Luy5n7t2GeKNfmapGY6zPKp7
	NNPJ0znBjjh4PBhpXOvYTOrNiW0YatUbG5GwHcw0gpsQ+XpEroxwXra2Fm6k0sTZ
	4fBIr9ZOAV6WUzOumiSSncZZYR3z6DDwvRu3sTbs9xEEo5izo5u4N98+GiWulIWU
	I6yyY9NLLT/hzbfX6RloVzWtWToYU5it40SivntsJXrd2K3RjUDfTMFVeW7h8t5L
	4+aS0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9u03yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:56:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMuIn0004302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:56:18 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:56:18 -0700
Message-ID: <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
Date: Tue, 18 Jun 2024 15:56:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com>
In-Reply-To: <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zI4N38CHKQxnRxwfR-5TwgGWyyaWS4Jy
X-Proofpoint-ORIG-GUID: zI4N38CHKQxnRxwfR-5TwgGWyyaWS4Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=781 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180169



On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>> The dpu_crtc_atomic_check() already calls the function
>> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
>> again from dpu_crtc_atomic_begin().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


This change is causing a small regression on sc7280 chromebook.

I have tested and concluded that this is causing the chrome boot 
animation to disappear.

I have tested a couple of times and without this change it works fine.

If this change was meant as an optimization, can we drop this one and 
investigate later why this is causing one? I have not spent time 
investigating why it happened. Rest of the series works well and I dont 
see any dependency as such. Let me know if that works for you. Otherwise 
I will have to spend a little more time on this patch and why chrome 
compositor does not like this for the animation screen.

