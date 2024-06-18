Return-Path: <linux-arm-msm+bounces-23146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA990DF60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0CD1F218F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331B11741EE;
	Tue, 18 Jun 2024 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hEsQKHyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADC28DD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751058; cv=none; b=nec3h9uNsKuxPlaRQirtAz0cKHf8p4l6QYFknYgKjAJH+wCdSYJ3o/7kAfJCSLJPUhEiRUVDzSXlsCRXhSHZQfdqPc1JnVT4I89hFwp3nRqUyu5lXAuA+GIMVT17jdPcEIrYYIUloDJFlBHVhakWLmzB3q4a41Fy0Eo4a16CIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751058; c=relaxed/simple;
	bh=2UzlYlujmRUniskaW0wIGLlqyaYDxasg3EyUMXzSwMY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=bPalAw6du48aqYXRTnB3t4gXLkjjg/tY0BUp/dOo+ztSxZVSiupdABC69ZQcuGjGWan1bBsIfc6/CcnDhePKwxSqpHp9zGOl3TrZZ7ef18M/+Xu0BUTLGJRxI9skHc5rDEGI3wrOklvTFS+uGELFLVy+JyHLOkih7fUicU8LvbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hEsQKHyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaDiV027004;
	Tue, 18 Jun 2024 22:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8CLY4PfpEs+HGF0fWi4ZkABF6W1KtruJojcYatFXk0=; b=hEsQKHyT0hBxjjBa
	liySibIf/4x77WTww/lQGrKnlekiTBDPC1rmNFOlsXraW4K+WHB3JtBxPuFh7Xq2
	Us3hDOzaSRKzbEcUrZIPLdVm3oPIen3lnq7PvigmkSHIhkEOZd3z30W4jLhl+sLC
	QYumrMN6cyUhsMN1r1YqZ2sVcF3h0ea7qw/I6sVjJ5P/8OYXL/3uCPFG8xcVO63N
	9U2KONAc67eOF4qQoV+/s4i2/wx83CxT/QUb/ZSa1MG4IRELbXky/NyljTQ663fP
	dsYV56bTOdKW5YQq1Cfvf59H+3bCr0k60NFDvA4rwtFWsA+UaR66qcI/cemgX3LW
	OwhxDw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9yr3fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:50:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMoj2G000686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:50:45 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:50:45 -0700
Message-ID: <2bc02541-0afb-e6ef-e098-271e96c4dcf7@quicinc.com>
Date: Tue, 18 Jun 2024 15:50:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/9] drm/msm/dpu: drop dpu_format_check_modified_format
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
 <20240614-dpu-mode-config-width-v3-2-29ec4069c99b@linaro.org>
 <ad0e897c-7ecb-79a1-a175-9b37805beaba@quicinc.com>
In-Reply-To: <ad0e897c-7ecb-79a1-a175-9b37805beaba@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6MtJ0KP_AUeKgssOVJBEaAvVti90Pfiz
X-Proofpoint-GUID: 6MtJ0KP_AUeKgssOVJBEaAvVti90Pfiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=865 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 4:14 PM, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>> The msm_kms_funcs::check_modified_format() callback is not used by the
>> driver. Drop it completely.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 
>> -----------------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
>>   drivers/gpu/drm/msm/msm_kms.h               |  6 ----
>>   4 files changed, 66 deletions(-)
>>
> 
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

