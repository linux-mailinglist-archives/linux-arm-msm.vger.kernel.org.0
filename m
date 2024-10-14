Return-Path: <linux-arm-msm+bounces-34374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A180F99D836
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 22:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07A44B20FFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D581C82E2;
	Mon, 14 Oct 2024 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqU6ttWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B04C7C;
	Mon, 14 Oct 2024 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937819; cv=none; b=V5RUfOkjJqEfPTyjMvT64hCL6xBLvF0Xbb2XrQp0C8711Wzr7Qw3s0UCLRCa/qhxPKYA/VNqA02/tb1TCfW33CYzk2MTiKdRJIEiNdsQqgljHbYlKBrlw4rPUDQ/eTOXiznln6tXYJOwOI+Np6bzbc4CuYu5UiiSwMscAz++qdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937819; c=relaxed/simple;
	bh=HeleciIMqC6x6wlIzEfbkvhSEb0BrZ7wAWRUUaNB3yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vAZQTmI+DE8q5RKRnH8DNzbQQUgR7GTPWTXN5/A+W2Yn1lZksro3/mGWtNCT5CdbPO7D12f4jDLGdZS52hUt9bbVeFW84HNDvWk1jbevwjAkL27xczX8zsG+HQLULY7GvMrXPil6sxN3B/7clmprryruG8hMhGBiYrllr9KyuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqU6ttWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBg7k3004277;
	Mon, 14 Oct 2024 20:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Flkc8xdLhw7m3kui7WKGf/UuDHyxIcdWYPZ31ewDcAk=; b=SqU6ttWeOHuOlGPj
	0D14ycFcARRNAPDAfi46rX/D1gNfOa2NoJzHUdF8yMiG1uwOwymG7MFbjBUdzm1v
	JYaL5ubV0r+pLNqWcVdf8UJDLZ3jT61rH1FFFClE3qBxTmzuXBu6KyKSUHxalTmI
	U8VPbbsscaDCbVgkjp/T5yYrm4KbrMvrk2No2by4Uz/MuQdROO77nmR/Jv4IvU6x
	k3s6zvexXc/JTNprtAI6n/pF4JQLbNY5WwMuHQpuyPEbCxsvPHVl1HmskgdS3hHt
	cuhOJZT7Up1e2wAsfvYMZbd/nRHVOo85TSlLofm3xwC/KGj5N6m4mAYRJmJaR7xw
	ZzZHEA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfwc99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:30:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EKU5nE005175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:30:05 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 13:30:05 -0700
Message-ID: <9cfae7b6-f05e-4db6-ac86-9236e786fbf4@quicinc.com>
Date: Mon, 14 Oct 2024 13:30:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't always set merge_3d pending flush
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark
	<robdclark@chromium.org>
References: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
 <5scqahnsr5i26rkumg5eqdiwrg5n7rrnrp5642c6moxucf6w3r@xcgrxtjhj3pz>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <5scqahnsr5i26rkumg5eqdiwrg5n7rrnrp5642c6moxucf6w3r@xcgrxtjhj3pz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UbI4AwVLSzHCdqwk1lPXUGOwXCGgf12l
X-Proofpoint-ORIG-GUID: UbI4AwVLSzHCdqwk1lPXUGOwXCGgf12l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140145



On 10/10/2024 8:20 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 09, 2024 at 08:41:13PM GMT, Jessica Zhang wrote:
>> Don't set the merge_3d pending flush bits if the mode_3d is
>> BLEND_3D_NONE.
>>
>> Always flushing merge_3d can cause timeout issues when there are
>> multiple commits with concurrent writeback enabled.
>>
>> This is because the video phys enc waits for the hw_ctl flush register
>> to be completely cleared [1] in its wait_for_commit_done(), but the WB
>> encoder always sets the merge_3d pending flush during each commit
>> regardless of if the merge_3d is actually active.
>>
>> This means that the hw_ctl flush register will never be 0 when there are
>> multiple CWB commits and the video phys enc will hit vblank timeout
>> errors after the first CWB commit.
> 
>  From this description, wouldn't it be more correct to always set
> intf_cfg.merge_3d in WB code (even if mode_3d is NONE)?

Hi Dmitry,

This discussion should be addressed in [1].

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/series/139824/

> 
>> [1] commit fe9df3f50c39 ("drm/msm/dpu: add real wait_for_commit_done()")
>>
>> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
>> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 5 ++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
> 
> -- 
> With best wishes
> Dmitry


