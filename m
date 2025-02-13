Return-Path: <linux-arm-msm+bounces-47843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12DA33487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 02:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C9B3A61DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 01:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4B280604;
	Thu, 13 Feb 2025 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fya2az38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3D2B2CF;
	Thu, 13 Feb 2025 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739409647; cv=none; b=q3x1ps+4AWdF0aj/hhZ1/sgqjt5yU28df3L69ok4KiQcvlI5f98phu0lKOrlrEHs9o9jvhEftF9Xk2sHiyBIC3jJd8fWS7dGUVSTVE4OOZPGiexMTiYYDTGiciLbpBiRIjCog/fezzbevaHMSB/de5IzjhVddHAahFHUCewYMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739409647; c=relaxed/simple;
	bh=rxEvVCmlC6MPxnMiH9JBv8rF6gOzCBcYoGHTEUfNjXQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=PfjvBRe7qcECFuMhGS7NJQwhcSfmp1sl54hnLobX47IbU5DQwBeT5p55zrBXcrMmt1wTRSKI2mpUQYwflst8Va6YlqfpMxCXwF8KtjipGiG54STTYUADcTivVGKIPdHPehBfkfEatIK/G30fAYn+dDd01hY5RjZ1i78ASp4AkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fya2az38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CL8NZi014045;
	Thu, 13 Feb 2025 01:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ri0W6r4i5tXARi04wYAv3UCDFcI7Ko3HG/Vs83wysM=; b=Fya2az38kbB2EQWK
	nzc6XcCM+EXUr+QdV1K+V0BhkUXHVjulM1pWcD81yNb1V/ijlfbMzlPsdvyInr2Q
	q5s2W/qYYti7aTBtPgnBEO+jcynpJ/XrtcsCzinARHFa+4zXtiXRPekfIalmxKXe
	RO56VtPubZFh+XCQk7Ecv8KKwFtUWubAyDL0MvgO2b1IfBochAPA5BTgsQu/TdGw
	NZjnbCvmAI+04D29MMzKPwAWY3DElMvMX6goZqLT3CH59Kmm+da5Jt6Xo9KMgjVG
	RV0uAE2xWa5uRQyp/jmFBqYlWPxkgfrpzIjz4wUfoRXfBBpIgbcCX+I71pd7zSJG
	euSD2A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7t4jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:20:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1Kb3T006178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:20:37 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 17:20:36 -0800
Message-ID: <82da87d8-70d1-4013-ace7-ec90331d18e5@quicinc.com>
Date: Wed, 12 Feb 2025 17:20:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
References: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
 <3606b749-a476-4c52-9f8b-5e4b465c5e79@quicinc.com>
Content-Language: en-US
In-Reply-To: <3606b749-a476-4c52-9f8b-5e4b465c5e79@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9kpn3MEPN0nfLv44TXmfh8EJ_w127KH0
X-Proofpoint-GUID: 9kpn3MEPN0nfLv44TXmfh8EJ_w127KH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130008



On 2/12/2025 12:23 PM, Abhinav Kumar wrote:
> 
> 
> On 2/11/2025 7:59 PM, Jessica Zhang wrote:
>> Disable pingpong dither in dpu_encoder_helper_phys_cleanup().
>>
>> This avoids the issue where an encoder unknowingly uses dither after
>> reserving a pingpong block that was previously bound to an encoder that
>> had enabled dither.
>>
>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Closes: https://lore.kernel.org/all/ 
>> jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q/
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> This was tested on SC7180 Trogdor by pulling in the concurrent writeback
>> series [1] and running the IGT kms_writeback@writeback_check_output
>> subtest.
>>
>> [1] https://patchwork.freedesktop.org/series/144083/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
> 
> Was an extremely tricky issue to debug.
> 
> Glad this one is resolved,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Also going to add,

Fixes: 3c128638a07d ("drm/msm/dpu: add support for dither block in display")


